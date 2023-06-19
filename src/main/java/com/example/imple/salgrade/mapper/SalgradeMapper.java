package com.example.imple.salgrade.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.imple.salgrade.model.Salgrade;

@Mapper
public interface SalgradeMapper {
	
	int countAll();
	List<Salgrade> selectAll();
	Salgrade 	   selectByGrade(int grade);
	int 		   insertSalgrade(Salgrade salgrade);
	int 		   updateSalgrade(Salgrade salgrade);
	int 		   deleteSalgrade(int grade);
	
}
