 SELECT COLUMN_NAME, DATA_TYPE FROM all_tab_columns where table_name='FESTI';


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



SELECT * FROM 
(SELECT N.* FROM 
(SELECT NUM, TITLE, contents FROM NOTICE WHERE
CONTENTSLIKE '%'||'20'||'%' || TITLE LIKE '%'||'20'||'%'
ORDER BY NUM DESC) N)

SELECT * FROM NOTICE FULL JOIN FILES USING(NUM) WHERE NUM = 129

