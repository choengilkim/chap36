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
	
	//$2a$10$S3.PCaUIwtiJtiQK9TxCTOzsGBHjrC.XPXzlSjTFGuQDgKXw5a5J.
	//$2a$10$6HKXUzZZvzmLqHtm8EKFxek.XpzqLNoZHbN4lcIoGFhqDk5.SKjI2
	
	//$2a$10$7qdmSxR.MVgouKe0JTyeqON1xBLpN0PlQk2RlnsBePdoBuyfYHWqG
	//$2a$10$ZmcAimJXXvGhgeJpiZrdT.IgztCfj9.DuN6jE27MKbU7iyp/mX1Nu
	
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
