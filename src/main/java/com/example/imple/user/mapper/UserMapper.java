package com.example.imple.user.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.imple.user.model.User;

@Mapper
public interface UserMapper {
	
	@Select("""
			select *
			  from users
			 where id = #{id}
			""")
	User selectById(String id);
	
	@Insert("""
			insert into users (id, password, role, email)
			values(
				#{user.id, 				jdbcType=VARCHAR}, 
				#{user.password,  		jdbcType=VARCHAR}, 
				coalesce(#{user.role, 	jdbcType=VARCHAR}, 'USER'),
				#{user.email, 			jdbcType=VARCHAR}
			)
			""")
	int insertUser(@Param("user") User user);
	
}
