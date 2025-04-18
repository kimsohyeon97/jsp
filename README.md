# JSP 학습 요약 (02/03 ~ 03/13)

## JSP 개요
- **JSP(JavaServer Pages)**: 자바 기반의 서버 측 스크립트 언어

## 주요 내용
- **지시자(Directives)**: 페이지 설정, 외부 파일 포함 등 JSP 페이지 처리 방식 지시
    - `<%@ page ... %>`
    - `<%@ include ... %>`
    - `<%@ taglib ... %>`
- **내장 객체(Implicit Objects)**: JSP 페이지 내에서 바로 사용 가능한 객체
    - `request`, `response`, `session`, `application`, `out`, `page`, `config`, `exception`, `pageContext`
- **액션 태그(Action Tags)**: JSP 페이지의 흐름 제어, 다른 페이지로의 이동, Bean 사용 등 다양한 액션 수행
    - `<jsp:forward>`, `<jsp:include>`, `<jsp:useBean>`, `<jsp:setProperty>`, `<jsp:getProperty>`
- **세션(Session)**: 웹 브라우저 단위의 사용자 정보 관리
- **쿠키(Cookie)**: 클라이언트 측에 저장되는 작은 데이터 조각을 이용한 정보 관리
- **파일 업로드, 다운로드, 삭제**: 서버 측에서 파일 처리 기능 구현
- **JDBC(Java Database Connectivity)**: 자바 프로그램을 통해 데이터베이스 연동 및 SQL 실행
- **이메일 전송**: 자바 Mail API를 이용한 이메일 발송 기능 구현
- **표현식(Expression)**: JSP 페이지에 Java 변수 또는 연산 결과 출력 (`<%= ... %>`)
- **JSTL(JSP Standard Tag Library)**: JSP 페이지에서 자주 사용되는 기능을 태그 형태로 제공
    - Core, Formatting, SQL, XML, Functions 라이브러리
- **Servlet**: 자바 기반의 웹 애플리케이션 컴포넌트 이해 및 연동
- **필터(Filter)**: 웹 요청 및 응답 과정에서 특정 작업 수행
- **리스너(Listener)**: 웹 애플리케이션 이벤트 발생 시 특정 코드 실행
- **MVC(Model-View-Controller) 패턴**: 웹 애플리케이션 아키텍처 디자인 패턴 학습
- **로거(Logger)**: 애플리케이션 실행 기록 및 오류 추적
- **배포**: 개발 완료된 웹 애플리케이션을 서버에 배포하는 과정 이해

## 게시판 프로젝트
- **JSP**, **Servlet**, **JDBC** 등을 활용한 기본적인 게시판 기능 구현 (목록, 보기, 쓰기, 수정, 삭제)
