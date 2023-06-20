package com.example.imple.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.imple.board.model.Board;
import com.github.pagehelper.Page;

@Mapper
public interface BoardMapper {
	
	int countAll();
	List<Board> selectAll();
	Page<Board> selectPage();
	Board 	   selectByBno(long bno);
	Board 	   selectByWriter(String writer);
	
	int insertBoard(Board board);
	int updateBoard(Board board);
	int delete(long bno);

}
