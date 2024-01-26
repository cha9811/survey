# 개인프로젝트
B2B 기업용 설문조사 페이지
제작기간 2023.10 ~ 2024.01

# 기능
일반 사용자
 - 회원가입/로그인/로그아웃
   -아이디 중복체크, PW 암호화 (BCryptPasswordEncoder)
 - ID/PW찾기(메일발송)
 - 마이페이지
   - 개인정보 확인 및 변경
   - 소지한 기프티콘 조회, 삭제
 - 설문조사 참여 (단답형, 체크박스형, 드롭박스형)
 - 기프티콘 구매
   
기업 관리자
 - 본인의 설문조사 수정 및 삭제
 - 공지사항 생성, 수정, 삭제

사이트 관리자
  - 기프티콘 업로드/수정/삭제
  - 전체 설문조사 생성/수정/삭제

# 개발환경
JAVA 8
Spring 5.0.1
JSP
Sprin Security 6.1.2
SMTP (Google 활용) 1.4.7
Eclipse
MyBatis 3.4
Maven

# 살펴보기
교육과정 종료후 제가 개인적으로 만들고 싶었던 설문조사 페이지를 구현하였습니다 
사이트 괸리자 미팅 -> 설문조사 및 상호 검수 -> 설문시작 -> 고객사의 변경사항 요청 -> 요구사항 반영 -> 종료
상단의 기존 B2B 방식설문조사 방식인 7개의 과정을
관리자 미팅 -> 실제 설문시작(변경사항 직접변경) -> 종료 의 형태로 3단계로 줄였습니다.
이 프로젝트는 사용자들이 설문을 완료하면 리워드를 받고 이를 기프티콘으로 교환할 수 있는 시스템을 가지고 있으며 B2B의 실제 결제방식은 DB를 제공해주는 시점에 산정하도록 하였습니다.

# 기타 링크
참고사이트
 - 서베이링크 : https://www.surveylink.co.kr/
 - 한국리서치 : https://www.hrc-ms.com/main/main.asp
 - 기프티스타 : https://app.giftistar.net/home
 - 오피스콘 : https://www.officecon.co.kr/main?switchMode=E&ACE_REF=adwords_g&ACE_KW=%EC%98%A4%ED%94%BC%EC%8A%A4%EC%BD%98&gclid=EAIaIQobChMI5brGzYD6gwMVNdoWBR1qeA2nEAAYASAAEgJXGvD_BwE#header

ERD
 - 링크 : https://www.erdcloud.com/d/PSH9rz79CteyksJSA
