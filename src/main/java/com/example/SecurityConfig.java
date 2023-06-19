package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.DispatcherType;

@Configuration
public class SecurityConfig {
	
	@Autowired
	UserDetailsService userDetailsService;
	
	@Bean
	PasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.csrf(csrf -> {
			csrf.disable();
		});
		
		http.cors(cors -> {
			cors.disable();
		});
		
		http.authorizeHttpRequests(request -> {
			request.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll();
			request.requestMatchers("/", "/error").permitAll(); // 홈, 에러페이지는 로그인안해도되게함(에러안해주면 계속 리다이렉트뜸)
			request.requestMatchers("/webjars/**").permitAll();
			request.requestMatchers("/img/**")	  .permitAll();
			request.requestMatchers("/user/register").permitAll();
			request.requestMatchers("/user/success/**").permitAll();
			
			request.requestMatchers("/dept/list", 	    "dept/detail/{key}")    .permitAll();
			request.requestMatchers("/emp/list", 	    "emp/detail/{key}") 	.permitAll();
			request.requestMatchers("/salgrade/list",   "salgrade/detail/{key}").permitAll();
			
			request.requestMatchers("/city/page/**",    "city/detail/{key}")       .permitAll();
			request.requestMatchers("/country/page/**", "country/detail/{key}")    .permitAll();
			request.requestMatchers("/language/page/**","language/detail/{key}/**").permitAll();
			
			request.requestMatchers("/dept/create",
									"/dept/update",
									"/dept/delete").hasAnyRole("ADMIN");
			request.requestMatchers("/emp/create",
									"/emp/update",
									"/emp/delete").hasAnyRole("ADMIN");
			request.requestMatchers("/salgrade/create",
									"/salgrade/update",
									"/salgrade/delete").hasAnyRole("ADMIN");
				   
			
			request.anyRequest().authenticated(); //모든기능이 로그인하여야접근가능
//			request.anyRequest().permitAll();
		});
		
		http.formLogin(login -> {
			login.loginPage("/user/login");
			login.defaultSuccessUrl("/", true); //로그인하면 무조건 홈으로가게함
			login.failureHandler((request, response, e) -> {
				request.setAttribute("exception", e);
				request.getRequestDispatcher("/user/login-fail").forward(request, response); //실패시 forward
			});
			
			login.permitAll();
		});
		
		
		http.logout(logout -> {
			logout.logoutUrl("/user/logout");
		});
		
		http.rememberMe(remember -> {
			remember.alwaysRemember(false); //옵션
			remember.tokenValiditySeconds(60*60*24); //옵션
			remember.userDetailsService(userDetailsService); //필수
		});
		
		return http.build();
	}
	
}
