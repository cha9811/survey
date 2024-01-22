# 개인프로젝트
B2B 기업용 설문조사 페이지
제작기간 2023.10 ~ 2024.01

# 개발환경
JAVA 8
Spring 5.0.1
JSP
Sprin Security 6.1.2
SMTP (Google 활용) 1.4.7
Eclipse
MyBatis 3.4
Maven

교육과정 종료후 제가 개인적으로 만들고 싶었던 설문조사 페이지를 구현하였습니다 
사이트 괸리자 미팅 -> 설문조사 및 상호 검수 -> 설문시작 -> 고객사의 변경사항 요청 -> 요구사항 반영 -> 종료
기존 B2B 방식설문조사 방식인 7개의 과정을
관리자 미팅 -> 실제 설문시작(변경사항 직접변경) -> 종료 의 형태로 3단계로 줄였습니다.
이 프로젝트는 사용자들이 설문을 완료하면 리워드를 받고 이를 기프티콘으로 교환할 수 있는 시스템을 가지고 있으며 B2B의 실제 결제방식은 DB를 제공해주는 시점에 산정하도록 하였습니다.