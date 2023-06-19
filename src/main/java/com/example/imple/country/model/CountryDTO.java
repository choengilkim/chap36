package com.example.imple.country.model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import com.example.standard.model.Modelable;
import com.example.standard.util.Continent;

import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
@Slf4j
public class CountryDTO implements Modelable<Country> {
	@NotBlank
	@Length(max = 3)
	String 		code;						
	
	@NotBlank
	@Length(max = 52)
	String 		name;
	
	@Pattern(regexp = "Asia|Europe|NorthAmerica|Africa|Oceania|Antarctica|SouthAmerica|{0}",
			 message = "Asia|Europe|NorthAmerica|Africa|Oceania|Antarctica|SouthAmerica|null 만 허용됩니다.")
	String 	continent;
	
	@Length(max = 26)
	String 		region;				
				
	@Digits(integer = 8, fraction = 2)
	Double 		surfaceArea;		
	
	@Range(max = 999999)
	Integer 	indepYear;							
				
	@Range(max = 99999999999L)
	Long 		population;			
				
	@Digits(integer = 2, fraction = 1)
	Double 		lifeExpectancy;				
				
	@Digits(integer = 8, fraction = 2)
	Double 		gnp;
				
	@Digits(integer = 8, fraction = 2)
	Double 		gnpOld;
				
	@Length(max = 45)
	String 		localName;						
				
	@Length(max = 45)
	String 		governmentForm;
				
	@Length(max = 60)
	String 		headOfState;
	
	@Range(max = 99999999999L)
	Long 		capital;
				
	@Length(max = 2)
	String 		code2;
	
	@Override
	public Country getModel() {

		Continent continent = null;
		
		if (!this.continent.equals("")) {
			continent = Continent.valueOf(this.continent.replace(" ", ""));
		}
		return Country.builder()
				   .code(code)
				   .name(name)
				   .continent(continent)
				   .region(region)
				   .surfaceArea(surfaceArea)
				   .indepYear(indepYear)
				   .population(population)
				   .lifeExpectancy(lifeExpectancy)
				   .gnp(gnp)
				   .gnpOld(gnpOld)
				   .localName(localName)
				   .governmentForm(governmentForm)
				   .headOfState(headOfState)
				   .capital(capital)
				   .code2(code2)
				   .build();
	}
}
