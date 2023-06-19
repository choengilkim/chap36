package com.example.imple.salgrade.mapper;

import java.io.IOException;
import java.time.LocalDate;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.junit.jupiter.api.Assertions.*;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.example.imple.dept.mapper.DeptMapper;
import com.example.imple.dept.model.Dept;
import com.example.imple.emp.model.Emp;
import com.example.imple.emp.mapper.EmpMapper;
import com.example.standard.util.Gender;
import com.fasterxml.jackson.databind.ObjectMapper;

@SpringBootTest
public class SalgradeMapperTest {
	
	@Autowired
	SalgradeMapper salgradeMapper;
	
	@Autowired
	ObjectMapper objectMapper; 
	
	@Test
	void countAll() {
		int cnt = salgradeMapper.countAll();
		System.out.println("cnt=" + cnt);
		assertThat(cnt).isSameAs(14);
	}
	
//	@Test
//	@Transactional
//	void deleteSalgrade() {
//		var cnt = salgrageMapper.delete(2331);
//		assertThat(cnt).isEqualTo(1);
//		
//		var city = cityMapper.selectById(2331);
//		assertThat(city).isNull();
//		
//		cnt = cityMapper.delete(900000);
//		assertThat(cnt).isEqualTo(0);
//	}
	
		
	
}
