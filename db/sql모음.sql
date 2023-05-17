-- 특정 유저 상점 조회
SELECT USER_NO, SHOP_TITLE, SHOP_INFO
FROM "shop"
JOIN "users" USING(USER_NO)
WHERE USER_NO = 1;


-- 특정 유저 게시글 목록 조회
SELECT USER_NO, CATEGORY_NO, GOODS_TITLE, GOODS_DESCR, GOODS_PRICE, 
		VIEW_COUNT, WISH_COUNT, SELL_ENROLL_DT, GOODS_STATUS
FROM "goods_board"
WHERE USER_NO = 1;

-- 날짜 계산
SELECT TRUNC(SYSDATE-ENROLL_DT) OPEN_DAY
FROM "users"
WHERE USER_NO = 1;


-- 특정 회원 팔로워 리스트
SELECT FOLLOWING_USER_NO, SHOP_TITLE, SHOP_INFO, U.USER_IMG 
FROM "follow" F
JOIN "users" U ON(U.USER_NO = F.USER_NO)
JOIN "shop" S ON(FOLLOWING_USER_NO = S.USER_NO)
WHERE F.USER_NO = 1;


-- 특정 상점 팔로잉 리스트
SELECT F.USER_NO USER_NO, SHOP_TITLE, SHOP_INFO, U.USER_IMG
FROM "follow" F
JOIN "users" U ON(U.USER_NO = F.USER_NO)
JOIN "shop" S ON(U.USER_NO = S.USER_NO) 
WHERE FOLLOWING_USER_NO = 6;


-- 특정 유저(상점) 거래 후기 조회 (받은 후기)
SELECT REVIEW_NO, SHOP_TITLE, GOODS_TITLE, REVIEW_MESSAGE,
		REVIEW_DT, REVIEW_STARS
FROM "reviews" R
JOIN "users" USING(USER_NO)
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
SELECT *
FROM "goods_board"
WHERE GOODS_STATUS = 'E';


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





