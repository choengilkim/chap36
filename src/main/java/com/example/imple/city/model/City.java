package com.example.imple.city.model;

import com.example.imple.country.model.Country;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class City {
			 Long 		id;
	@NonNull String 	name;
			 String 	countryCode; //DB에서는 country_code 인데 자바에서는 낙타표기법이라 이렇게해줌 mapper에서 어노테이션Results로 바꿔줌
			 String 	district;
			 Long 		population;
			 Country	country;
}
