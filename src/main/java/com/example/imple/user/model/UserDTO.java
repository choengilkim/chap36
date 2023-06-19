package com.example.imple.user.model;

import org.hibernate.validator.constraints.Length;

import com.example.standard.model.Modelable;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class UserDTO implements Modelable<User>{
	@NotBlank // jakarta.validation.constraints.NotNull
	@Length(min = 1, max = 20) //포함임 10이상 99이하
	String id;
	
	@NotBlank // notnull,tab,스페이스 안된다 String에서는 NotBlank사용
	@Length(min = 1, max = 100)
	String password;
	
	@Length(max = 20)
	String role;
	
	@Length(min = 0, max = 100)
	String email;
	
	@Override
	public User getModel() {
		return User.builder()
				   .id(id.trim())
				   .password(password.trim()) //String은 trim으로 스페이스 제거해주는게 좋음 
				   .role(role != null ? role.trim() : null)
				   .email(email.trim())
				   .build();
				   
	}
}
