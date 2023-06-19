package com.example;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.DispatcherType;

//@Configuration
public class SecurityConfig3 {

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
			
			request.requestMatchers("/dept/list", "dept/detail/{key}").permitAll();
			request.requestMatchers("/emp/list", "emp/detail/{key}").permitAll();
			request.requestMatchers("/salgrade/list", "salgrade/detail/{key}").permitAll();
			
			request.anyRequest().authenticated(); //모든기능이 로그인하게만듬
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
		
		return http.build();
	}
	
}
