package com.example.imple.language.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.imple.language.model.Language;
import com.github.pagehelper.Page;

@Mapper
public interface LanguageMapper {

	@Select("select count(*) from country_language")
	int countAll();
	
	@Select("select * from country_language")
	List<Language> selectAll();
	
	@Select("""
			select *
				from country_language
				where country_code = #{countryCode} AND language = #{language}
			""")
	Language selectByPrimaryKey(@Param("countryCode") String countryCode, @Param("language") String language);
	
	@Select("select * from country_language")
	Page<Language> selectPage();
	
	@Insert("""
			insert into country_language (country_code, language, is_official, percentage)
			values		
				(UPPER(#{countryCode, jdbcType=VARCHAR}), 
			 	   	   #{language, 	  jdbcType=VARCHAR}, 
			  coalesce(#{isOfficial,  jdbcType=VARCHAR}, 'F'), 
 			  coalesce(#{percentage,  jdbcType=DOUBLE}, 0.0))
			""")
	int insertLanguage(Language language);
	
	@Update("""
			update country_language
			   set is_official 	= #{l.isOfficial,  jdbcType=VARCHAR},
					percentage	= #{l.percentage,  jdbcType=DOUBLE}
				where country_code = #{l.countryCode} AND language = #{l.language}		
			""")
	int updateLanguage(@Param("l") Language language);
	
	@Delete("""
			delete from country_language 
			 where country_code = #{l.countryCode} AND language = #{l.language}
			""")
//	int deleteLanguage(@Param("countryCode") String countryCode, @Param("language") String language);
	int deleteLanguage(@Param("l") Language language);
			   		   
}
