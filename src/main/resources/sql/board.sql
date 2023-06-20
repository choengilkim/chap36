/*
 * board_bno_seq sequence
 */
drop sequence board_bno_seq;
create sequence board_bno_seq start with 1;

drop table board cascade constraints;

select * from board;

create table board (           /*테이블 생성*/
	bno number not null,           /*게시물 번호*/
	title varchar2(200) not null,  /*제목*/
	content varchar2(4000),        /*내용*/
	writer varchar2(50) not null,  /*작성자 아이디 (member테이블과 join할 예정)*/
	regdate date default sysdate,  /*작성 날짜 (기본값으로 현재 시간이 들어가게됨)*/
	viewcnt number default 0,      /*조회수 (기본값이 0이기 때문에 0부터 시작)*/
	primary key(bno)               /*기본키는 게시물 번호로 설정함*/
	);

insert into board (bno,title,content,writer) values
	((select nvl(max(bno)+1,1)from board),'제목','내용','pard');

commit;