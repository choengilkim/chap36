CREATE TABLE USERS ( 
     ID         varchar2(20) CONSTRAINT USERS_ID_PK PRIMARY KEY,
     PASSWORD   VARCHAR2(100 char) NOT NULL,
     ROLE       VARCHAR2(20  char) default 'USER',
     EMAIL      VARCHAR2(100 char)
);

insert into users (ID, PASSWORD, ROLE, EMAIL)values ('python', '$2a$10$S3.PCaUIwtiJtiQK9TxCTOzsGBHjrC.XPXzlSjTFGuQDgKXw5a5J.', 'USER', 'null');
insert into users (ID, PASSWORD, ROLE, EMAIL)values ('java',   '$2a$10$6HKXUzZZvzmLqHtm8EKFxek.XpzqLNoZHbN4lcIoGFhqDk5.SKjI2', 'ADMIN', 'null');

commit;