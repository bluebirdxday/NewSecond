-- 특정 유저 상점 조회
SELECT USER_NO, SHOP_TITLE, 
		(SELECT COUNT(*)
		FROM "goods_board"
		WHERE GOODS_STATUS = 'E'
		AND USER_NO = 1) SELL_COUNT,
	NVL(SHOP_INFO, SHOP_TITLE||' 상점에 오신 것을 환영합니다!') SHOP_INFO, 
	NVL(SHOP_PROFILE, '/resources/src/img/basic_profile.png') SHOP_PROFILE
FROM "shop"
WHERE USER_NO = 5;


-- 특정 유저 게시글 목록 조회
SELECT USER_NO, CATEGORY_NO, GOODS_TITLE, GOODS_DESCR, GOODS_PRICE, 
		VIEW_COUNT, WISH_COUNT, SELL_ENROLL_DT, GOODS_STATUS
FROM "goods_board"
WHERE USER_NO = 1;

-- 날짜 계산
SELECT TRUNC(SYSDATE-ENROLL_DT) OPEN_DAY
FROM "users"
WHERE USER_NO = 1;



-- 특정 유저(상점) 거래 후기 조회 (받은 후기)
SELECT REVIEW_NO, SHOP_TITLE, GOODS_TITLE, REVIEW_MESSAGE,
		REVIEW_DT, REVIEW_STARS, NVL(SHOP_PROFILE, '/resources/src/img/basic_profile.png') SHOP_PROFILE
FROM "reviews" R
JOIN "shop" USING(USER_NO)
JOIN "goods_board" B USING(GOODS_NO)
WHERE REVIEW_DEL_FL = 'N'
AND B.USER_NO = 1;


-- 특정 유저(상점) 거래 후기 조회 (쓴 후기)
SELECT REVIEW_NO, GOODS_TITLE, REVIEW_MESSAGE, REVIEW_DT, REVIEW_STARS
FROM "reviews" R
JOIN "goods_board" GB USING(GOODS_NO)
WHERE REVIEW_DEL_FL = 'N'
AND R.USER_NO = 6;


-- 판매 완료 상품 조회
SELECT COUNT(*)
FROM "goods_board"
WHERE GOODS_STATUS = 'E'
AND USER_NO = 1;


-- 구매 확정 시 판매 후기 작성 가능 게시글로 추가
INSERT INTO "transaction_list" VALUES(7, 8);
INSERT INTO "transaction_list" VALUES(11, 9);
INSERT INTO "transaction_list" VALUES(6, 10);
INSERT INTO "transaction_list" VALUES(11, 14);


-- 후기 작성 가능 목록 조회
SELECT GOODS_TITLE, tl.USER_NO
FROM "transaction_list" tl
JOIN "goods_board" gb ON(tl.GOODS_NO=gb.GOODS_NO)
WHERE tl.USER_NO = 11
AND gb.GOODS_NO NOT IN(SELECT GOODS_NO FROM "reviews" WHERE USER_NO=11 AND REVIEW_DEL_FL='N');



-- 후기 삭제
UPDATE "reviews"
SET REVIEW_DEL_FL = 'Y'
WHERE REVIEW_NO = #{reviewNo};


-- 특정 후기 조회
SELECT REVIEW_NO, r.USER_NO USER_NO, GOODS_TITLE, GOODS_NO, REVIEW_MESSAGE, REVIEW_DT, REVIEW_STARS
FROM "reviews" r
JOIN "goods_board" gb USING(GOODS_NO)
WHERE REVIEW_NO = 8;




--회원 조회
SELECT USER_NO,USER_EMAIL,
  CASE 
    WHEN USER_STATUS = 'A' THEN '정상'
    WHEN USER_STATUS = 'B' THEN '블락'
    WHEN USER_STATUS = 'C' THEN '탈퇴'
  END AS USER_STATUS
  ,ENROLL_DT
FROM "users" ;

SELECT GOODS_NO,USER_NO,GOODS_TITLE
	,TO_CHAR(SELL_ENROLL_DT, 'YYYY-MM-DD') SELL_ENROLL_DT,VIEW_COUNT
	,CASE
		WHEN GOODS_STATUS = 'A' THEN '정상'
		WHEN GOODS_STATUS = 'B' THEN '블라인드'
		WHEN GOODS_STATUS = 'D' THEN '삭제'
		WHEN GOODS_STATUS = 'E' THEN '판매완료'
		WHEN GOODS_STATUS = 'R' THEN '예약중'
	END
FROM "goods_board"
ORDER BY GOODS_NO DESC;
-- 키워드 조회
SELECT KEYWORD_NO, USER_NO, KEYWORD_TITLE, CREATE_DT  
FROM "notification_keywords"
WHERE USER_NO = 1;


-- 키워드 삭제 
DELETE FROM "notification_keywords" 
WHERE USER_NO = 1
AND KEYWORD_NO = 1;

SELECT * FROM "goods_board"
ORDER BY GOODS_NO;



-- 팔로우 기능
INSERT INTO "follow" VALUES(1, 3);

-- 언팔로우 기능
DELETE FROM "follow" 
WHERE ACTIVE_USER_NO = 1
AND PASSIVE_USER_NO = 5;

-- 팔로우 유무 조회
SELECT COUNT(*) FROM "follow" 
WHERE ACTIVE_USER_NO = 4
AND PASSIVE_USER_NO = 1;

-- 팔로우 리스트 조회
SELECT ACTIVE_USER_NO, PASSIVE_USER_NO, SHOP_TITLE, SHOP_INFO, NVL(SHOP_PROFILE, '/resources/src/img/basic_profile.png') SHOP_PROFILE
FROM "follow" 
JOIN "shop" s ON(s.USER_NO = PASSIVE_USER_NO)
WHERE ACTIVE_USER_NO = 3;

-- 팔로우 리스트 조회
SELECT ACTIVE_USER_NO, PASSIVE_USER_NO, SHOP_TITLE, SHOP_INFO, NVL(SHOP_PROFILE, '/resources/src/img/basic_profile.png') SHOP_PROFILE, 
	(SELECT COUNT(*) FROM "follow" 
	WHERE ACTIVE_USER_NO = 1
	AND PASSIVE_USER_NO = f.PASSIVE_USER_NO) FOLLOW_YOU
FROM "follow" f
JOIN "shop" s ON(s.USER_NO = PASSIVE_USER_NO)
WHERE ACTIVE_USER_NO = 3;


-- 팔로우 리스트 조회
SELECT ACTIVE_USER_NO, PASSIVE_USER_NO, SHOP_TITLE, SHOP_INFO, NVL(SHOP_PROFILE, '/resources/src/img/basic_profile.png') SHOP_PROFILE, 
	(SELECT COUNT(*) FROM "follow" 
	WHERE ACTIVE_USER_NO = #{loginUserNo}
	AND PASSIVE_USER_NO = #{passiveUserNo}) FOLLOW_YOU
FROM "follow" 
JOIN "shop" s ON(s.USER_NO = PASSIVE_USER_NO)
JOIN "users" u ON(u.USER_NO = PASSIVE_USER_NO)
WHERE ACTIVE_USER_NO = #{shopUserNo};


-- 팔로워 리스트 조회
SELECT ACTIVE_USER_NO, PASSIVE_USER_NO, SHOP_TITLE, SHOP_INFO, SHOP_PROFILE
FROM "follow" 
JOIN "shop" s ON(s.USER_NO = ACTIVE_USER_NO)
JOIN "users" u ON(u.USER_NO = ACTIVE_USER_NO)
WHERE PASSIVE_USER_NO = 3;

-- 팔로워 리스트 조회
SELECT ACTIVE_USER_NO, PASSIVE_USER_NO, SHOP_TITLE, SHOP_INFO, USER_IMG,
	(SELECT COUNT(*) FROM "follow" 
	WHERE ACTIVE_USER_NO = 1
	AND PASSIVE_USER_NO = f.ACTIVE_USER_NO) FOLLOW_YOU
FROM "follow" f
JOIN "shop" s ON(s.USER_NO = ACTIVE_USER_NO)
JOIN "users" u ON(u.USER_NO = ACTIVE_USER_NO)
WHERE PASSIVE_USER_NO = 3;


-- 탈퇴 시 팔로우 리스트 삭제
DELETE FROM "follow"
WHERE ACTIVE_USER_NO = 10;


SELECT * FROM "follow";
--관리자 문의사항 글 읽어오기
	SELECT QNA_TITLE,QNA_TYPE,USER_NO,
		TO_CHAR(QNA_ENROLL_DATE,'YYYY-MM-DD') QNA_ENROLL_DATE, QNA_CONTENT 
	FROM "qna"
	WHERE QNA_NO = 1;

SELECT * FROM "notice";

INSERT INTO "notice"
VALUES (SEQ_NOTICE_NO.NEXTVAL,'뉴세컨마켓 공지입니다.',
		'안녕하세요. 관리자입니다.새 공지 올려요.',DEFAULT,10);

COMMIT;



SELECT * FROM "files";


COMMIT;

SELECT USER_NO, SHOP_TITLE, SHOP_PROFILE FROM "shop"
JOIN "users" USING(USER_NO);


--users 이미지열 삭제
ALTER TABLE "users" DROP COLUMN USER_IMG;


-- 오라클 세션 관련 명령어 

-- 오라클 현재 세션 접속 상태 확인
SELECT STATUS FROM V$SESSION;	

-- 오라클 세션 아이들 타임 확인
SELECT PROFILE, LIMIT FROM DBA_PROFILES WHERE RESOURCE_NAME = 'IDLE_TIME';

-- 오라클 세션 아이들 타임 30분 제한
ALTER PROFILE DEFAULT LIMIT IDLE_TIME 30;


SELECT * FROM "users";

ALTER TABLE "shop" ADD SHOP_PROFILE VARCHAR2(400);
COMMENT ON COLUMN "shop"."SHOP_PROFILE" IS '상점 프로필';

SELECT * FROM "shop";
COMMIT;

UPDATE "shop" SET SHOP_PROFILE = NULL;

/* 리뷰 수정 */
UPDATE "reviews" SET REVIEW_MESSAGE = #{reviewMessage}, REVIEW_STARS = #{reviewStars}
WHERE REVIEW_NO = #{reviewNo};



SELECT * FROM "notice";

--공지사항 수정
UPDATE "notice"SET 
NOTICE_TITLE = '공지사항1'
NOTICE_CONTENT = '공지사항1' 
WHERE NOTICE_NO =23;

--공지사항 삭제

DELETE FROM "notice"
WHERE NOTICE_NO = '31';

ROLLBACK;



COMMIT;


--문의사항 접수

SELECT * FROM "qna";

INSERT INTO "qna"
VALUES (SEQ_QNA_NO.NEXTVAL,USER_NO,QNA_TITLE,QNA_CONTENT,QNA_ENROLL_DATE,DEFAULT,DEFAULT,'T','거래신고');

INSERT INTO "qna"
VALUES (SEQ_QNA_NO.NEXTVAL,'1','사기당한듯','사기당한듯..신고할게요',SYSDATE,DEFAULT,DEFAULT,'T','거래신고');


--위시
SELECT * FROM "wish_lists";

  SELECT * FROM "wish_lists"
   WHERE USER_NO = '1';
   
  
  SELECT ROW_NUMBER() OVER (ORDER BY SELL_ENROLL_DT DESC) AS NUM,GOODS_NO , GOODS_TITLE ,
			(SELECT FILE_PATH||USER_NO||'/'||FILE_NAME FROM "files" F
			WHERE F.GOODS_NO = G.GOODS_NO
			AND FILE_ORDER = 1) THUMBNAIL
		FROM "goods_board" G
		JOIN "shop" USING (USER_NO);
		



SELECT ROW_NUMBER() OVER (ORDER BY WISH_NO DESC) AS NUM,WISH_NO,W.GOODS_NO,USER_NO,
    (SELECT FILE_PATH||USER_NO||'/'||FILE_NAME FROM "files" F
     WHERE F.GOODS_NO = W.GOODS_NO
     AND FILE_ORDER = 1) THUMBNAIL
FROM "wish_lists" W
WHERE USER_NO = '14';
		
SELECT *
FROM "users"
WHERE "USER_EMAIL" LIKE '%dd%'
   OR "USER_NO" LIKE '%dd%'
   OR "USER_NICKNAME" LIKE '%dd%';


SELECT *
FROM "files" 
WHERE GOODS_NO = '222';

SELECT *
FROM "users";

UPDATE "users"
SET USER_STATUS ='A'
WHERE USER_NO='36';



