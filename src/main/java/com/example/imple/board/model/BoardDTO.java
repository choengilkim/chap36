package com.example.imple.board.model;

import java.time.LocalDate;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import com.example.standard.model.Modelable;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PastOrPresent;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class BoardDTO implements Modelable<Board>{
	
	@Range(min = 1)
	Long 		bno;
	
	@NotBlank
	@Length(max = 200)
    String 		title;
	
	@Length(max = 4000)
    String 		content;
    
	@NotBlank
	@Length(max = 50)
	String 		writer;
	
	@PastOrPresent
    LocalDate 	regdate;
	
	@NotNull
	Integer		viewcnt = 0;

	@Override
	public Board getModel() {
		
		return Board.builder()
				   .bno(bno)
				   .title(title)
				   .content(content)
				   .writer(writer)
				   .regdate(regdate)
				   .viewcnt(viewcnt)
				   .build();
	}
}
