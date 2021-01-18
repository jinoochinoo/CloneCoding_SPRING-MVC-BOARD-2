# Spring 게시판 만들기
- MVC 방식으로 Model, View, Controller 분리해서 코딩
- CRUD 기능 충실히 구현. 기본에 초점을 맞춘 게시판이니까
- 댓글, 첨부파일, 스프링 시큐리티 등 부가적인 기능도 함께 구현

# 기술 스택
- Oracle DB 연동, Mybatis 사용해 Mapper.xml 파일에서 SQL 처리
- JQuery, Javascript 이용해 아이디 중복 검사, 댓글, 첨부파일 기능 코딩
- Spring-MVC API 통해 @Controller, @Service, @Repository 등 어노테이션 활용

# Front-End
- 부트스트랩 기반으로 한 디자인
- JSP 게시판과 동일하므로 JSP-MVC-BOARD readme 참고바람

# 개발 과정에서 발생한 에러, 그리고 디버깅
---
![메이븐 에러](https://user-images.githubusercontent.com/73393147/104878063-8ec65700-599e-11eb-9677-33a3662be20f.PNG)
## 메이븐 에러
- 클론코딩 하다가 막힘. 분명 똑같이 했는데 Test.java 파일에서 빨간 줄 막 나옴. 뭐가 문제인지 도통 모르다가 메이븐 라이브러리에서 뭔가 평소랑 다른 것 발견. 바로 음영 처리되면서 제대로 불이 들어오지 않는 게 보임.

예감 적중! pom.xml 파일에서dependency 부분을 복사, 붙여넣기 했던 게 제대로 이뤄지지 않음. 분명 namespace 설정까지 완벽했지만 라이브러리 위치를 제대로 찾지 못해서 저렇게 음영 표시로 어둡게 나왔던 거.

혹시나? 싶어서 일일이 다시 dependency 검색 후 add 설정하니 그제야 제대로 불빛 들어오기 시작. spring-test 이놈은 아예 maven 라이브러리에 추가 자체가 안 되다<version>${org.springframework-version}</version>
버전 부분을 이렇게 하니 그제야 정신차리고 됨. 저렇게 버전을 따로 해줘야 이엘 태그로 해줘야 하다니…

---
![에러_1](https://user-images.githubusercontent.com/73393147/104878066-8f5eed80-599e-11eb-9b90-f62179dcce0e.PNG)
## DAO <-> Mapper.xml 간 통신 에러
- DAO 클래스에서 호출한 query 명령문이 boardMapper.xml 파일에 등록되지 않았을 때 발생. 페이징 기능 추가하면서 Query 명령문 ID 값을 변경했지만 DAO 클래스에 반영해주지 않자 위와 같은 에러 등장.
---
![에러_2](https://user-images.githubusercontent.com/73393147/104878067-8ff78400-599e-11eb-8234-c2e6c68c329b.PNG)
## 파라미터 null 에러
- https://haenny.tistory.com/22
블로그 참고해 해결. 파라미터로 넘긴 값 일부가 null 값일 때 발생. DAO 부분에서 mapper.xml 쪽으로 sqlSession 명령 실행할 때 mapper 주소만 적고, 정작 넘길 값과 객체 기재하지 않아서 발생한 사소한 오류였다.

디버깅 중 발견한 놀라운 발견. 페이징 때 스프링이 알아서 get 함수를 호출한다. Mapper.xml 부분에서 이름이 같으면 자동으로 찾는다고 했는데 아무래도 이 과정에서 getter 통해 값 호출하는 것 같다.

---
![임포트 에러](https://user-images.githubusercontent.com/73393147/104878068-8ff78400-599e-11eb-890f-31f8b6393e44.PNG)
## 첨부파일 다운로드 에러
다운로드 에러를 찾아내기 위한 흔적. 분명히 데이터 흐름, 파라미터 값 모두 정상적으로 전달됐지만 다운로드 경로에 null 값 뜨면서 에러 발생. 결론은 소문자, 대문자 구분 때문에 발생한 것!!

오라클 sql 명령문 소문자, 대문자 구분 없음. 그래서 mybatis 쓸 때 그냥 막 입력. 하지만 DB 통해 꺼낸 값은 대문자로 전달됨. 첨부파일처럼 map<String, Object> 이용하면 String 값이 전부 대문자 형식. 그래서 Object 호출할 때 대문자로 String 입력해줘야 값이 나옴…
