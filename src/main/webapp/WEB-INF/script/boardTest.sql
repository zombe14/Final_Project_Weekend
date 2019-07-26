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

-- noticeServiceImpl.serWrite.fileDTO.setNum. boardDTO의 num 가져오는법 ?
select notice_seq.currval from dual
SELECT NOTICE_SEQ.nextval FROM DUAL 

select notice_seq.nextval, notice_seq.currval from dual

select * from notice FULL join files using(num) where num = 40
SELECT * FROM NOTICE FULL JOIN FILES USING(NUM) WHERE NUM = 118
