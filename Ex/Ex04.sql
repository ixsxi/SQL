create table book(
    book_id number(5),
    title varchar2(50),
    author varchar2(10),
    pub_date date
);

alter table book add(pubs VARCHAR2(50));


alter table book MODIFY(title VARCHAR2(100));

alter table book rename COLUMN title to subject;

alter table book drop (author);

rename book to article;



create table author (
    author_id number(10),
    author_name VARCHAR2(100) not null, -- 꼭 필요한 값
    author_desc VARCHAR(500),
    PRIMARY key (author_id)
    );
    
    
    
    
    create table book(
        book_id number(10),
        title VARCHAR2(100) not null,
        pubs VARCHAR2(100),
        pub_date date,
        author_id number(10),
        PRIMARY key (book_id),
        CONSTRAINT book_fk  foreign key(author_id)
        references author(author_id)
    );

 insert into author VALUES(1, '박경리', '토지 작가');

select *
from author;


insert into author(author_id, author_name)
VALUES(2,'이문열');




update author
set author_name = '기안84',
    author_desc = '웹툰작가'
where author_id = 1 ;


update author
set author_name = '주형준'
where author_id = 2 ;


update author
set author_name = '강풀',
    author_desc = '인기작가';
    
    
    
DELETE from author
where author_id = 1;
    
    
DELETE from author;

insert into author VALUES(1, '박경리', '토지 작가');


insert into author VALUES(2, '기안84', '웹툰 작가');

insert into author VALUES(3, '이문열', '인기 작가');

insert into author VALUES(4, '이기열', '미기 작가');

select *
from author;

rollback;

update author
set author_desc = '나혼자산다 출연'
where author_id =2;

delete from author
where author_id = 1;

COMMIT;


create SEQUENCE seq_author_id
INCREMENT by 1
START with 1
NOCACHE;



insert into author VALUES(seq_author_id.nextval, '기안84', '웹툰 작가');
insert into author VALUES(seq_author_id.nextval, '이문열', '소설 작가');
insert into author VALUES(seq_author_id.nextval, '박경림', '미친 작가');

select *
from author;

select *
from user_sequences;

select seq_author_id.currval from dual;

select seq_author_id.nextval from dual;

drop SEQUENCE seq_author_id;