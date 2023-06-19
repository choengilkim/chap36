package com.example.imple.language.model;

import org.hibernate.validator.constraints.Length;

import com.example.standard.model.Modelable;
import com.example.standard.util.IsOfficial;

import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class LanguageDTO implements Modelable<Language> {
	@NotBlank
	@Length(max = 3)
	String 			countryCode;
	
	@NotBlank
	@Length(max = 30)
	String 			language;
	
	@Pattern(regexp = "T|F|{0}", message = " T | F | null 만 허용됩니다.")
	String 			isOfficial;
	
	@Digits(integer = 3, fraction = 1)
	Double 			percentage;
	
	@Override
	public Language getModel() {
		IsOfficial isOfficial = null;
		if (!this.isOfficial.equals(""))
			isOfficial = IsOfficial.valueOf(this.isOfficial);
		
		return Language.builder()
					   .countryCode(countryCode)
					   .language(language)
					   .isOfficial(isOfficial)
					   .percentage(percentage)
					   .build();
				
	}
}
