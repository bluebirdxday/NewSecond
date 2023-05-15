-- 유저 테이블

INSERT INTO "users"
VALUES(SEQ_USER_NO.NEXTVAL, 'user01@gmail.com', 'pass01!', '김일번', '01011111111', '서울특별시 종로구 자하문로30길', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "users"
VALUES(SEQ_USER_NO.NEXTVAL, 'user02@gmail.com', 'pass02!', '이이번', '01012345678', '전주시 덕진구 효자동 3가', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "users"
VALUES(SEQ_USER_NO.NEXTVAL, 'user03@gmail.com', 'pass03!', '아무개', '01058091723', '대전광역시 유성구 도룡동', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "users"
VALUES(SEQ_USER_NO.NEXTVAL, 'user04@gmail.com', 'pass04!', '박사번', '01077461294', '대전광역시 유성구 교촌동', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "users"
VALUES(SEQ_USER_NO.NEXTVAL, 'user05@gmail.com', 'pass05!', '권오번', '01010847393', '부산광역시 수영구 남천동', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "users"
VALUES(SEQ_USER_NO.NEXTVAL, 'user06@gmail.com', 'pass06!', '최육번', '01099182745', '서울특별시 성동구 성수동1가', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "users"
VALUES(SEQ_USER_NO.NEXTVAL, 'user07@gmail.com', 'pass07!', '장칠번', '01051385324', '서울특별시 강남구 도곡동', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "users"
VALUES(SEQ_USER_NO.NEXTVAL, 'user08@gmail.com', 'pass08!', '구팔번', '01040981389', '서울특별시 강남구 대치동', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "users"
VALUES(SEQ_USER_NO.NEXTVAL, 'user09@gmail.com', 'pass09!', '우구번', '01020560343', '수원시 장안구 정자동', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "users"
VALUES(SEQ_USER_NO.NEXTVAL, 'user10@gmail.com', 'pass10!', '김민지', '01081278491', '수원시 장안구 조원동', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "users"
VALUES(SEQ_USER_NO.NEXTVAL, 'user11@gmail.com', 'pass11!', '이철수', '01049019374', '성남시 분당구 백현동', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO "users"
VALUES(SEQ_USER_NO.NEXTVAL, 'user12@gmail.com', 'pass12!', '문십이', '01028371382', '인천광역시 남동구 만수동', NULL, DEFAULT, DEFAULT, DEFAULT);

SELECT * FROM "users";
COMMIT;



-- 카테고리 테이블
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '신발');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '가방');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '시계/주얼리');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '패션 액세서리');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '디지털/가전');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '스포츠/레저');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '차량/오토바이');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '스타굿즈');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '키덜트');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '예술/희귀/수집품');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '음반/악기');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '도서/티켓/문구');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '뷰티/미용');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '가구/인테리어');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '생활/주방용품');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '공구/산업용품');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '식품');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '유아동/출산');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '반려동물용품');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '기타');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '나눔');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '구인');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '남성의류');
INSERT INTO "categories" VALUES(SEQ_CATEGORY_NO.NEXTVAL, '여성의류');

SELECT * FROM "categories";
COMMIT;


-- 상품 게시글
INSERT INTO "goods_board" VALUES(SEQ_GOODS_NO.NEXTVAL, 1, 1, '뉴발란스 574 클래식리이매진드 블랙', '뉴발란스 574 클래식리이매진드 블랙 새상품 판매합니다 박스채로 놔둬서 상태는 좋아요!! 연락 주시고 잠수타시는 분 사양합니다',
118000, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO "goods_board" VALUES(SEQ_GOODS_NO.NEXTVAL, 8, 2, '에메모가든 mmo 나일론 백팩 네이비 075', '같은 색상으로 선물이 들어와서 어쩔 수 없이 팔아요ㅜㅜ 블랙에 가까운 네이비인데 실물이 훨 예뻐요 쿨거시 에눌 가능합니다',
76000, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO "goods_board" VALUES(SEQ_GOODS_NO.NEXTVAL, 3, 9, '방가방가 햄토리 인형', '구매한지 1년? 정도 된 것 같아요 귀여우니까 꼭 사가주세요', 
28000, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO "goods_board" VALUES(SEQ_GOODS_NO.NEXTVAL, 1, 13, '딥티크 오데썽 50ml', '2년 전에 사서 몇 번 사용했는데 향이 제 취향이 아니라서 판매합니다! 잔량은 사진으로 확인 부탁드려요 ㅎㅎ 유통기한은 2023.10.07까지니까 참고해주세요', 
95000, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO "goods_board" VALUES(SEQ_GOODS_NO.NEXTVAL, 2, 5, '보스 BOSE QC45 노이즈캔슬링 헤드셋 블랙 팝니다', '총 5번 정도 착용했던 정품 보스 qc45 노이즈캔슬링 헤드셋 블랙 색상 제품 팝니다. 사진에서처럼 약간의 생활 기스는 있습니다. 사용감에 전혀 이상 없고 무게는 타사 제품들에 비해 가볍습니다. 기본옵션 그대로 보내드려요.', 
300000, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO "goods_board" VALUES(SEQ_GOODS_NO.NEXTVAL, 3, 5, '아이폰 14 프로 퍼플 256', '아이폰 12프로 256 블루 색상 배터리 83프로 액정도 기스 없고 깨끗한데 외관 테두리에 기스 살짝 있어요 모든 기능 정상적으로 작동합니다', 
540000, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO "goods_board" VALUES(SEQ_GOODS_NO.NEXTVAL, 2, 1, '헌터 오리지널 톨 레인부츠-블랙(새상품)', '정가 209,000원 사이즈 220 언박싱만 한 제품입니다. 택,박스 O 새상품이라 네고 없습니다 입금 시 당일 저녁 편의점 택배로 접수 가능합니다!', 
209000, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO "goods_board" VALUES(SEQ_GOODS_NO.NEXTVAL, 1, 12, '백예린 콘서트 일요일(21일) VIP석 실물 티켓 팝니다', '5월 21일 일요일 실물 티켓 팝니다! VIP석 B구역 10열입니다 연락주세요', 
200000, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO "goods_board" VALUES(SEQ_GOODS_NO.NEXTVAL, 1, 11, '더 발룬티어스 LP', '안에 속지 한장 빼고 본품 그대로 있어요~ LP 재생한 적 없습니다~ 보관만 했어요', 
49000, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO "goods_board" VALUES(SEQ_GOODS_NO.NEXTVAL, 1, 9, '산리오 마이멜로디 마이스위트피아노 피낫토 S', '피낫토 마이 스위트 피아노 인형 판매합니다! 미개봉 새상품이며, 평일 기준 빠른 배송 가능합니다!', 
34900, DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO "goods_board" VALUES(SEQ_GOODS_NO.NEXTVAL, 3, 2, '프루아 에버백 스몰 꼬냑컬러', '어베백 실착 주번 저한테는 안 어룰려서 판매합니다 얼룩, 이염 있어서 저렴하게 내놓습니다 끈 종류 두가지 모두 같이 판매하고요 더스트백도 같이 드립니다 택배비 미포함', 
65000, DEFAULT, DEFAULT, DEFAULT, DEFAULT);


SELECT * FROM "goods_board";
COMMIT;

-- follow, shop, reviews



INSERT INTO "shop" VALUES(1, '윤슬상점', '윤슬 상점에 오신 것을 환영합니다!');
INSERT INTO "shop" VALUES(2, '몽이아빠', '연락 가능 시간 6PM~11PM 답장이 조금 느릴 수도 있음');
INSERT INTO "shop" VALUES(3, '연락주세요', '제발 사가주세요......');
INSERT INTO "shop" VALUES(4, 'USER#000004', NULL);
INSERT INTO "shop" VALUES(5, 'USER#000005', NULL);
INSERT INTO "shop" VALUES(6, '뜨아메', NULL);
INSERT INTO "shop" VALUES(7, '마음여행안내자', NULL);
INSERT INTO "shop" VALUES(8, 'USER#000008', '좋은 것만 취급합니다 네고 사절 찔러보기 금지');
INSERT INTO "shop" VALUES(9, '으랏챠챠챠챠', NULL);
INSERT INTO "shop" VALUES(10, '떡볶이먹고싶다', '쿨거래 환영!!!!!');
INSERT INTO "shop" VALUES(11, '비오는날싫어', NULL);
INSERT INTO "shop" VALUES(12, 'USER#000012', NULL);


SELECT * FROM "shop";
COMMIT;


INSERT INTO "follow" VALUES(1, 3);
INSERT INTO "follow" VALUES(5, 1);
INSERT INTO "follow" VALUES(3, 1);
INSERT INTO "follow" VALUES(4, 1);
INSERT INTO "follow" VALUES(8, 1);
INSERT INTO "follow" VALUES(10, 1);
INSERT INTO "follow" VALUES(3, 6);
INSERT INTO "follow" VALUES(2, 4);
INSERT INTO "follow" VALUES(4, 3);
INSERT INTO "follow" VALUES(6, 11);
INSERT INTO "follow" VALUES(6, 12);
INSERT INTO "follow" VALUES(8, 9);
INSERT INTO "follow" VALUES(10, 11);


SELECT * FROM "follow";
COMMIT;


-- 후기번호, 회원번호, 게시글번호, 후기 메세지, 생성일자, 별점, 후기삭제
INSERT INTO "reviews" VALUES(SEQ_REVIEWS_NO.NEXTVAL, 6, 10, '배송도 빠르고 판매자님께서 너무 친절하세요 상품 상태가 좋네요! 감사합니다' , DEFAULT, 10, DEFAULT);
INSERT INTO "reviews" VALUES(SEQ_REVIEWS_NO.NEXTVAL, 11, 9, '제가 요구한 것들이 정말 많았는데 자세하게 설명해주시고 인증사진도 다 찍어주셔서 감동 받았어요' , DEFAULT, 9, DEFAULT);
INSERT INTO "reviews" VALUES(SEQ_REVIEWS_NO.NEXTVAL, 7, 8, '깔끔한 거래 좋아요~~~ 비록 답장은 조금 느리셨지만' , DEFAULT, 7, DEFAULT);

SELECT * FROM "reviews";


UPDATE "goods_board" 
SET GOODS_STATUS = 'E'
WHERE GOODS_NO = 8;

UPDATE "goods_board" 
SET GOODS_STATUS = 'E'
WHERE GOODS_NO = 9;

UPDATE "goods_board" 
SET GOODS_STATUS = 'E'
WHERE GOODS_NO = 10;

UPDATE "goods_board" 
SET GOODS_STATUS = 'E'
WHERE GOODS_NO = 14;

SELECT * FROM "goods_board";



