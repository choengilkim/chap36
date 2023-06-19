package com.example.imple.salgrade.model;

import com.example.standard.model.Modelable;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class SalgradeDTO implements Modelable<Salgrade>{
	@NotNull // jakarta.validation.constraints.NotNull
	Integer grade;
	
	Integer losal;
	
	Integer hisal;
	
	@Override
	public Salgrade getModel() {
		return Salgrade.builder()
				   .grade(grade)
				   .losal(losal)
				   .hisal(hisal)
				   .build();
				   
	}
}
