package com.example.imple.user.mapper;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class idCheck {

	@Autowired
	private UserMapper userMapper;
	
	@Test
	public void checkId() throws Exception {
		String id = "naver";
		/* String id2 = "google"; */
		//userMapper.selectById(id);
		//userMapper.selectById(id2);
		Integer exists = userMapper.existsById(id);
	    assertThat(exists);
	    
	    var user = userMapper.existsById("naver");
		System.out.println(user);
		assertThat(user).isNotNull();
	}
	
}
