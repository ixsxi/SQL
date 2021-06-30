--book 테이블 삭제
drop table book;

--author 테이블 삭제
drop table author;

--book 시퀸스 삭제
drop sequence seq_book_id;

--author 시퀸스 삭제
drop sequence seq_author_id;

---author테이블 만들기 
create table author(
    author_id number(10),
    author_name VARCHAR2(100) not null,
    author_desc VARCHAR2(500),
    PRIMARY key (author_id)
    );
    
    
---시퀀스 author만들기    
create SEQUENCE seq_author_id
INCREMENT by 1
START with 1;


--author 테이블 데이터 저장 (시퀀스로)
INSERT INTO author VALUES(seq_author_id.nextval,'김문열','경북 영양');
INSERT INTO author VALUES(seq_author_id.nextval,'박경리','경상남도 통영');
INSERT INTO author VALUES(seq_author_id.nextval,'유시민','17대 국회의원');
INSERT INTO author VALUES(seq_author_id.nextval,'기안84','기안동에서 산 84년생');
INSERT INTO author VALUES(seq_author_id.nextval,'강풀','온라인 만화가 1세대');
INSERT INTO author VALUES(seq_author_id.nextval,'김영하','알쓸신잡');
---author 확인--
select *
from author;

ROLLBACK;
---book 테이블 만들기
create table book(
    book_id number(10),
    title VARCHAR2(100) not null,
    pubs VARCHAR2(100),
    pub_date date,
    author_id number (10),
    PRIMARY key (book_id),
    CONSTRAINT book_fk FOREIGN key (author_id)
    REFERENCES author (author_id)
);

---book 관련 시퀀스 만들기
create SEQUENCE seq_book_id
INCREMENT by 1
START with 1;


--book 관련 시퀸스 삭제
drop sequence seq_book_id;

--book 테이블 데이터 입력(시퀸스로)
INSERT INTO book VALUES(seq_book_id.nextval,'우리들의 일그러진 영웅','다림','1998-02-22','1');
INSERT INTO book VALUES(seq_book_id.nextval,'삼국지','민음사','2002-03-01','1');
INSERT INTO book VALUES(seq_book_id.nextval,'토지','마로니에북스','2012-08-15','2');
INSERT INTO book VALUES(seq_book_id.nextval,'유시민의 글쓰기 특강','생각의길','2015-04-01','3');
INSERT INTO book VALUES(seq_book_id.nextval,'패션왕','중앙북스(books)','2012-02-22','4');
INSERT INTO book VALUES(seq_book_id.nextval,'순정만화','재미주의','2011-08-03','5');
INSERT INTO book VALUES(seq_book_id.nextval,'오직두사람','문학동네','2017-05-04','6');
INSERT INTO book VALUES(seq_book_id.nextval,'26년','재미주의','2012-02-04','5');

--book 확인
select *
from book;


commit;
ROLLBACK;

--join
select *
from  book bo , author au
where bo.author_id = au.author_id;

update author
set author_desc ='서울특별시'
where author_name ='강풀';


DELETE from author
where author_name = '기안84';