package com.example.imple.user.mapper;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptPasswordEncoderTest {
	
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	@Test
	void encode() {
		var encodeStr = encoder.encode("1234");
		System.out.println(encodeStr);
	}
	//$2a$10$kTZfs8vCa.FXE4fJ3vLYXu3KWcIvEK2Sr0jOOqI0rKZdyMpmOuzMK
	//$2a$10$7FyLG5BZdSgFThnpGag1Z.xZl8MQymP.P8QfAZIcO3Eu3Arulf.Re
	
	//$2a$10$S3.PCaUIwtiJtiQK9TxCTOzsGBHjrC.XPXzlSjTFGuQDgKXw5a5J.
	//$2a$10$6HKXUzZZvzmLqHtm8EKFxek.XpzqLNoZHbN4lcIoGFhqDk5.SKjI2
	
	@Test
	void matches() {
		var success = encoder.matches("1234", "$2a$10$S3.PCaUIwtiJtiQK9TxCTOzsGBHjrC.XPXzlSjTFGuQDgKXw5a5J.");
		System.out.println(success);
		assertThat(success).isEqualTo(true);
		
		success = encoder.matches("1234", "$2a$10$6HKXUzZZvzmLqHtm8EKFxek.XpzqLNoZHbN4lcIoGFhqDk5.SKjI2");
		System.out.println(success);
		assertThat(success).isEqualTo(true);
		
		success = encoder.matches("1234", "1234");
		System.out.println(success);
		assertThat(success).isEqualTo(false);
	}
	
}
