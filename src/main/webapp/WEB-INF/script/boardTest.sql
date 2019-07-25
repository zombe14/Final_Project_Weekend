select * from notice order by num desc

delete notice
update notice set top=1 where num=42

SELECT * FROM NOTICE WHERE TOP = '1'

SELECT * FROM FILES

SELECT * FROM USER_SEQUENCES;

select files_seq.nextval from dual

select * from files

SELECT * FROM NOTICE 
full JOIN files on(notice.num=files.num)
WHERE NUM = 96

select * from files order by fnum desc

-- notice/file 따로 받아서 셀렉트 할때 조인으로 받아서 boardDTO? 로 넘기기