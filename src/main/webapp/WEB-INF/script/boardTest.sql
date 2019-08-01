SELECT * FROM AFTER WHERE ANUM = 'a'

INSERT INTO AFTER(ANUM, NUM, WRITER, TITLE, CONTENTS, REG_DATE, HIT, POINT, CATEGORY, REF, STEP, DEPTH)
		VALUES('a0', 'f11', 'afterW0', 'afterT1', 'afterC1', sysdate, 0, 3, 1, 0, 0, 0)

select * from AFTER


select * from files
drop table files
create table files(
	fnum number(8) not null,
	num varchar2(400) null,
	fname varchar2(400) null,
	oname varchar2(400) null,
	constraint files_fnum_pk primary key(fnum)
)
select * from NOTICE
select * from files order by fnum desc
select * from FESTI join files using(num)
delete festi where num=1

select * from user_sequences

SELECT * FROM    ALL_CONSTRAINTS
WHERE    TABLE_NAME = 'CART'


-- 1. 시퀀스 삭제
files_seq

-- 2. 각각 테이블 pk 타입 변경

alter table cart drop constraint cart_num_fk

select * from festiqna
drop table festi
delete FESTI
alter table festi modify (num varchar2(400))
CREATE TABLE festi
(
    num          varchar2(400)        NOT NULL, 
    title        VARCHAR2(400)    NULL, 
    writer       VARCHAR2(400)    NULL, 
    contents     CLOB             NULL, 
    reg_date     DATE             NULL, 
    hit          NUMBER(8)        NULL,
    top			number(1)		null,
    category     NUMBER(1)        NULL, 
    price        NUMBER(8)        NULL, 
    total        NUMBER(8)        NULL, 
    startDate    DATE             NULL, 
    endDate      DATE             NULL,
    local	varchar2(400)	null,
    CONSTRAINT FESTI_PK PRIMARY KEY (num)
)

drop table notice
CREATE TABLE notice
(
    num         varchar2(400)        NOT NULL, 
    title       VARCHAR2(400)    NULL, 
    writer      VARCHAR2(400)    NULL, 
    contents    CLOB             NULL, 
    hit         NUMBER(8)        NULL, 
    reg_date    DATE             NULL, 
    top         NUMBER(1)        NULL, 
    CONSTRAINT NOTICE_PK PRIMARY KEY (num)
)



-- 3. 테이블 varchar2로 다시 만들기

-- 4. getNum후 setNum 할 때 앞에 구분 붙이기, mapper변경

-- 5. 테이블 다 지우고 테스트용 만들기


SELECT COUNT(ANUM) FROM AFTER WHERE 
		
				TITLE
			
		LIKE '%'||'%' 
		AND NUM = 'f11'

delete after where num = 'f12'
SELECT COLUMN_NAME, DATA_TYPE FROM all_tab_columns where table_name='AFTER';
select * from after
alter table after modify(num varchar2(400))
alter table after drop column category
 select * from festi
 select * from member
 select * from user_sequences


select * from tab
alter table festi add top number(1)

select * from files order by fnum desc
SELECT * FROM 
		(SELECT ROWNUM R, N.* FROM 
		(SELECT NUM, TITLE, WRITER, HIT, REG_DATE FROM NOTICE WHERE 

				CONTENTS LIKE '%search%'

		ORDER BY NUM DESC) N)
		WHERE R BETWEEN 1 and 10

select * from notice order by num desc
select notice_seq.nextval from dual

delete notice
update notice set top=1 where num=42

SELECT * FROM NOTICE WHERE TOP = '1'

SELECT * FROM FILES order by fnum desc

SELECT * FROM USER_SEQUENCES;

select files_seq.nextval from dual

select * from files

SELECT * FROM NOTICE 
full JOIN files on(notice.num=files.num)
WHERE NUM = 96

select * from files order by fnum desc


select notice_seq.currval from dual
SELECT NOTICE_SEQ.nextval FROM DUAL 

select notice_seq.nextval, notice_seq.currval from dual

select * from notice FULL join files using(num) where num = 40
SELECT * FROM NOTICE FULL JOIN FILES USING(NUM) WHERE NUM = 118

select * from festi

SELECT * FROM 
(SELECT N.* FROM 
(SELECT NUM, TITLE, contents FROM NOTICE WHERE
CONTENTSLIKE '%'||'20'||'%' || TITLE LIKE '%'||'20'||'%'
ORDER BY NUM DESC) N)

SELECT * FROM NOTICE FULL JOIN FILES USING(NUM) WHERE NUM = 129

