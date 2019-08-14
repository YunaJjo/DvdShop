drop table dvd_Info;
drop table rental;
drop table membership;
drop table tempo;

/* DVD정보 */
CREATE TABLE dvd_Info (
	dvd_num VARCHAR2(30) NOT NULL, /* DVD번호 */
	dvd_title VARCHAR2(50 BYTE) NOT NULL, /* DVD제목 */
	dvd_director VARCHAR2(50) NOT NULL, /* DVD감독 */
	dvd_actor VARCHAR2(60) NOT NULL, /* DVD배우 */
	dvd_year DATE, /* 제작년도 */
	dvd_country VARCHAR2(40), /* 제작국가 */
	dvd_grade VARCHAR2(20), /* 등급 */
	dvd_story VARCHAR2(1000), /* 줄거리 */
	dvd_genre VARCHAR2(30) NOT NULL, /* 장르 */
	dvd_stock NUMBER NOT NULL, /* 재고 */
	dvd_photo VARCHAR2(60)  /* 포스터 */
);

ALTER TABLE dvd_Info
	ADD
		CONSTRAINT PK_dvd_Info
		PRIMARY KEY (
			dvd_num
		);

/* 회원 */
CREATE TABLE membership (
	member_id VARCHAR2(50) NOT NULL, /* 회원아이디 */
	member_pass VARCHAR2(30) NOT NULL, /* 비밀번호 */
	member_birth VARCHAR2(30) NULL, /* 생년월일 */
	member_phone VARCHAR2(30) NOT NULL, /* 전화번호 */
	member_email VARCHAR2(30) NOT NULL /* 이메일 */
);

ALTER TABLE membership
	ADD
		CONSTRAINT PK_membership
		PRIMARY KEY (
			member_id
		);

/* 대여정보 */
CREATE TABLE rental (
	rental_num NUMBER NOT NULL, /* 대여번호 */
	member_id VARCHAR2(50), /* 회원아이디 */
	dvd_num VARCHAR2(30), /* DVD번호 */
	rental_date DATE NOT NULL, /* 대여날짜 */
	return_date DATE  /* 반납날짜 */
);

ALTER TABLE rental
	ADD
		CONSTRAINT PK_rental
		PRIMARY KEY (
			rental_num
		);

ALTER TABLE rental
	ADD
		CONSTRAINT FK_dvd_Info_TO_rental
		FOREIGN KEY (
			dvd_num
		)
		REFERENCES dvd_Info (
			dvd_num
		);

ALTER TABLE rental
	ADD
		CONSTRAINT FK_membership_TO_rental
		FOREIGN KEY (
			member_id
		)
		REFERENCES membership (
			member_id
		) on delete set null;
		
		
/* 히스토리 */
CREATE TABLE history (
	member_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	dvd_title VARCHAR2(50) NOT NULL, /* dvd이름 */
	dvd_rental DATE NOT NULL /* 대여날짜 */
);



create sequence dvd_seq
	start with 1 
	increment by 1
	nocycle
	nocache;
	
create or replace trigger stock_delete
after insert on rental
for each row
begin
	update dvd_info set dvd_stock = (:old.dvd_stock-1)
	where dvd_info.dvd_num=:new.dvd_num
end;


drop trigger stock_delete;
drop trigger stock_plus;
insert into dvd_info values ('cm1', '놈놈놈', '조윤아','조윤아',sysdate, '한국', '19금','멜로임','코믹',3,null);
insert into membership values ('rockeedan','1234',sysdate,'010-1234-5678','rockeedan@naver.com');
insert into rental values (dvd_seq.nextval,'rockeedan','cm1',sysdate,sysdate);

insert into dvd_info values ('ac1', '봉오동전투', '원신연','유해진,류준열','2019-08-07', '한국', '15','임무는 단 하나! 달리고 달려, 일본군을 죽음의 골짜기로 유인하라!
1919년 3.1운동 이후 봉오동 일대에서 독립군의 무장항쟁이 활발해진다.','액션',2,'<img src="../image/bongodong.jpg">');



insert into dvd_info values ('cm2', '엑시트', '이상근','조정석,윤아','2019-07-31', '한국', '12','짠내 폭발 청년백수, 전대미문의 진짜 재난을 만나다!','코미디',3,'<img src="../image/exit.jpg">');
insert into dvd_info values ('my1', '사자', '김주환','박서준,안성기','2019-07-31', '한국', '15','어릴 적 아버지를 잃은 뒤 세상에 대한 불신만 남은 격투기 챔피언 ‘용후’(박서준). 
 어느 날 원인을 알 수 없는 깊은 상처가 손바닥에 생긴 것을 발견하고,
 도움을 줄 누군가가 있다는 장소로 향한다.','미스테리',2,'<img src="../image/saja.jpg">');

delete from dvd_info where dvd_num='ac1';
delete from dvd_info where dvd_num='cm1';
delete from rental where dvd_num='cm1';

insert into dvd_info values ('cm1', '놈놈놈', '조윤아','조윤아',sysdate, '한국', '19금','멜로임','코믹',3,null);
insert into dvd_info values ('cm1', '놈놈놈', '조윤아','조윤아',sysdate, '한국', '19금','멜로임','코믹',3,null);

insert into rental values(dvd_seq.nextval, 'gildong', 'cm2', sysdate, null);
insert into rental values(dvd_seq.nextval, 'gildong', 'my1', sysdate, null);
insert into rental values(dvd_seq.nextval, 'gildong', 'ac1', sysdate, null);


delete from membership where member_id = 'rockeedan';

select dvd_title, dvd_photo from dvd_Info where dvd_num like 'ac%';

update DVD_INFO set dvd_stock=5 where dvd_num='cm2';

delete from dvd_info;
delete from rental where member_id is null;
select * from MEMBERSHIP;
select * from Dvd_info;
delete from membership;
select dvd_title from dvd_Info where dvd_num like 'cm%';
select * from rental;

select dvd_num from rental group by dvd_num order by count(dvd_num) desc;

select dvd_title, dvd_photo, dvd_num
from dvd_info
where dvd_num in (select dvd_num
                  from (select dvd_num 
                        from rental 
                        group by dvd_num 
                        order by count(dvd_num) desc)
                  );
                  
select dvd_title, dvd_photo, DVD_INFO.dvd_num
from dvd_info join (select dvd_num 
                        from rental 
                        group by dvd_num 
                        order by count(dvd_num) desc) RENTAL
on DVD_INFO.dvd_num =   RENTAL.dvd_num
where rownum < 4 ;

where dvd_num in (select dvd_num
                  from (select dvd_num 
                        from rental 
                        group by dvd_num 
                        order by count(dvd_num) desc)
                  );
                  
                  

                  select dvd_title, dvd_photo, dvd_num
                  from (select dvd_title, dvd_photo, dvd_num
                         from (select dvd_title, dvd_photo, dvd_num
                             from dvd_info join rental
                             using (dvd_num)) 
                             )
                  group by dvd_num;
order by count(dvd_num) desc;

where dvd_num in (select dvd_num
                  from (select dvd_num 
                        from rental 
                        group by dvd_num 
                        order by count(dvd_num) desc)
                  );



