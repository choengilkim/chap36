package com.example.imple.board.model;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@AllArgsConstructor(staticName = "of")
@NoArgsConstructor
@Builder
public class Board {
			 Long  		bno;
	@NonNull String 	title;
			 String 	content;
	@NonNull String 	writer;
			 LocalDate 	regdate;
			 Integer	viewcnt;
}
