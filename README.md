## STDPICK
**스터디카페 실시간 예약과 스터디모임 개설 및 모집을 중계해주는 모임 플랫폼 웹 어플리케이션**  
2019년 비트캠프 자바개발자 양성과정 팀 프로젝트로 진행되었으며 개발기간은 2019.10.20 ~ 11.20 입니다.  

<img src="./main.JPG">

<img src="./dining.JPG">

## 개발환경  
- Java
- Apache Tomcat 9.0
- JDBC - Oracle
- JSP / CSS / Servlet
- JQuery, Ajax, JSON, JSTL
- Bootstrap
- Eclipse, SpringTooSuite(STS), Bracket

## 어플리케이션 기능
 - 스터디카페 실시간 예약과 스터디모임 개설 및 모집, 신청할 수 있는 시스템 구현
 - 사용자위치기반 주변 맛집추천 및 검색 기능
 - 추천맛집에 대한 정보를 열람하기 위한 블로그 웹크롤링 기능
 - 웹사이트 이용자를 위한 SNS 기능(팔로잉, 팔로워, 게시글 등록 및 검색)

## 담당 파트(*자세한 사항은 ppt 참고*)
- 맛집페이지 [jsp](https://github.com/soyeondev/stdpick_project/blob/master/src/main/webapp/WEB-INF/views/diningSch.jsp), [Controller](https://github.com/soyeondev/stdpick_project/blob/master/src/main/java/com/bit/std_1st/controller/DiningController.java)
- 개인마이페이지 [jsp](https://github.com/soyeondev/stdpick_project/blob/master/src/main/webapp/WEB-INF/views/custMyPage.jsp),  [Controller](https://github.com/soyeondev/stdpick_project/blob/master/src/main/java/com/bit/std_1st/controller/MPController.java)
- 스터디모임 개설페이지 [jsp](https://github.com/soyeondev/stdpick_project/blob/master/src/main/webapp/WEB-INF/views/insertStd.jsp),  [Controller]https://github.com/soyeondev/stdpick_project/blob/master/src/main/java/com/bit/std_1st/controller/StdController.java
- 스터디모임 수정페이지 [jsp](https://github.com/soyeondev/stdpick_project/blob/master/src/main/webapp/WEB-INF/views/updateStd.jsp),  [Controller](https://github.com/soyeondev/stdpick_project/blob/master/src/main/java/com/bit/std_1st/controller/StdController.java)
- 스터디모임 관리페이지 [jsp](https://github.com/soyeondev/stdpick_project/blob/master/src/main/webapp/WEB-INF/views/manageStd.jsp),  [Controller](https://github.com/soyeondev/stdpick_project/blob/master/src/main/java/com/bit/std_1st/controller/StdController.java)
- SNS 전체목록페이지 [jsp](https://github.com/soyeondev/stdpick_project/blob/master/src/main/webapp/WEB-INF/views/snsSch.jsp), 
[Controller](https://github.com/soyeondev/stdpick_project/blob/master/src/main/java/com/bit/std_1st/controller/SNSController.java)


               
