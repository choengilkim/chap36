package com.example.imple.dept.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.imple.dept.model.Dept;
import com.example.imple.emp.model.Emp;

@Mapper
public interface DeptMapper {
	
	@Select("select count(*) from dept")
	int countAll();
	

	@Select("""
			select *
			  from emp
			 where deptno = #{deptno}
			""")
	List<Emp> selectEmps(int deptno);
	
	@Select("select * from dept")
	List<Dept> selectAll();
	
	@Select("select * from dept")
	@Results({
		@Result(property = "deptno", column = "deptno"),
		@Result(property = "emps", 
				column = "deptno", 
				many = @Many(select = "selectEmps")) //10번 부서면 selectEmps에 10번부서넣어서 조회한다
	})
	List<Dept> selectAllwithEmps();
	
	@Select("""
			select *
				from dept
				where deptno = #{deptno}
			""")
	Dept selectByDeptno(int deptno);  //Param 한개이면 안줘도되는데 아래처럼 2개이상이면 줘야함
	
	@Select("""
			select *
				from dept
				where deptno = #{deptno}
			""")
	@Results({
		@Result(property = "deptno", column = "deptno"),
		@Result(property = "emps", 
				column = "deptno", 
				many = @Many(select = "selectEmps")) //10번 부서면 selectEmps에 10번부서넣어서 조회한다
	})
	Dept selectByDeptnoWithEmp(int deptno);
	
	@Insert("""
			insert into dept
			values
			(#{deptno}, #{dname, jdbcType=VARCHAR}, #{loc, jdbcType=VARCHAR})
			""")
	int insert(@Param("deptno") int deptno,
			   @Param("dname")  String dname,
			   @Param("loc") 	String loc);
	
	@Insert("""
			insert into dept
			values(
				#{d.deptno}, 
				#{d.dname,  jdbcType=VARCHAR}, 
				#{d.loc, 	jdbcType=VARCHAR}
			)
			""")
	int insertDept(@Param("d") Dept dept);
	
	@Update("""
			update dept
				set dname 	= #{dname,  jdbcType=VARCHAR},
					loc	  	= #{loc, 	jdbcType=VARCHAR}
				where deptno= #{deptno}		
			""")
	
	int update(@Param("deptno") int deptno,
			   @Param("dname")  String dname,
			   @Param("loc") 	String loc);
	
	@Update("""
			update dept
				set dname 	= #{d.dname,  jdbcType=VARCHAR},
					loc	  	= #{d.loc, 	  jdbcType=VARCHAR}
				where deptno= #{d.deptno}		
			""")
	int updateDept(@Param("d") Dept dept);
	
	@Delete("delete from dept where deptno=#{deptno}")
	int delete(int deptno);
	
}
