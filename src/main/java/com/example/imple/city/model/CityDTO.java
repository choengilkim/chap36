package com.example.imple.city.model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import com.example.standard.model.Modelable;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class CityDTO implements Modelable<City>{
	
	@Range(min = 1, max = 99999999999L)
    Long 		id;
	
	@NotBlank
	@Length
    String 		name;
	
	@Length(max = 3)
    String 		countryCode; //DB에서는 country_code 인데 자바에서는 낙타표기법이라 이렇게해줌 mapper에서 어노테이션Results로 바꿔줌
    
	@Length(max = 20)
	String 		district;
	
	@Range(min = 1, max = 99999999999L)
    Long 		population;

	@Override
	public City getModel() {
		
		return City.builder()
				   .id(id)
				   .name(name)
				   .countryCode(countryCode)
				   .district(district)
				   .population(population)
				   .build();
	}
}
