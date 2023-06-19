package com.example.imple.city.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.imple.city.model.City;
import com.example.imple.country.model.Country;
import com.github.pagehelper.Page;

@Mapper
public interface CityMapper {
	
	int countAll();
	Country	   selectCountry();
	List<City> selectAll();
	List<City> selectAllWithCountry();
	Page<City> selectPage();
	Page<City> selectPagewithCountry();
	City 	   selectById(int id);
	City 	   selectByIdWithCountry(int id);
	List<City> selectByCountryCode(String countryCode);
	
	int insertCity(City city);
	int updateCity(City city);
	int delete(long id);

}
