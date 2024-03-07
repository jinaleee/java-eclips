<h2>🚩 미니 프로젝트 ① - 고객관리시스템 개발</h2>
- 첫번째 미니 프로젝트 자바로 개발한 호텔 예약 서비스가 있는 홈페이지 입니다.
<br>
- 고객은 회원 가입, 탈퇴, 회원 정보와 예약 정보 확인, 예약과 예약 취소 등의 기능 사용 가능, 관리자는 회원과 예약, 객실 관리 기능을 사용할 수 있습니다.
<br>
<br>
<h2>🔎 프로젝트 개요</h2>
- 호텔의 정보 제공과 예약 서비스를 제공하는 홈페이지 구현.<br>
- 2023.07.14. ~ 2023.07.20. (총 7일, 1인)<br>
<br>
<h2>⚙ 개발환경 & 🛠 Stacks</h2>
- 툴 : 이클립스, 오라클 데이터베이스<br>
- 언어 : html, java, jquery, css, javaScript, sql
<br>
<br>
<h2>🖥 구현 이미지와 설명</h2>
<h4>📌 메인 페이지</h4>
<img src = "https://github.com/jinaleee/jinaleee/assets/137017258/a9ad7105-b222-430d-9ad0-97f2b9ab1cac" width="100%"></img><br>
- 회원 가입과 로그인 페이지로 이동 가능, 로그인 후엔 마이페이지 이용 가능.<br>
- 관리자 로그인시 관리자 페이지로 이동 가능(버튼 생성).<br>
- 메인 페이지 이미지는 슬라이드 기능 사용으로 여러장의 사진 노출.<br>
- 각 탭으로 이동 가능.<br>
<br>
<h4>📌 로그인 페이지</h4>
<img src = "https://github.com/jinaleee/jinaleee/assets/137017258/cca2d30f-2aaf-4554-b737-612d1b784b49" width="100%"></img><br>
<img src = "https://github.com/jinaleee/jinaleee/assets/137017258/8b9a4a72-894d-45db-9269-acb412e0f8e9" width="100%"></img><br>
- 회원 가입 후 로그인 가능.<br>
- 비밀번호 오류시 오류 화면. 5회 이상 오류시 로그인 불가 안내. 관리자가 초기화 가능.<br>
<br>
<h3>👨‍👨‍👧‍👦 고객 기능</h3>
<h4>📌 회원가입 페이지</h4>
<img src = "https://github.com/jinaleee/jinaleee/assets/137017258/20a3de12-0ba7-41f4-bb65-f365f483afda" width="100%"></img><br>
- 데이터 조회하여 중복 확인 가능. <br>
- 입력 정보에 정규식 적용. <br>
- 핸드폰 번호, 이메일 등 각 정보 개별로 입력 받아 DB에 하나의 정보로 저장. <br>
<br>
<h4>📌 예약 페이지</h4>
<img src = "https://github.com/jinaleee/jinaleee/assets/137017258/97e6b1cf-8fcc-454f-9a2a-4b33ad3a6632" width="100%"></img><br>
- 오늘 날짜 이후로 예약 날짜 선택 가능. DB 조회 후 이미 예약된 날짜일 경우 예약 불가. <br>
- 5회 이상 이용한 VIP일 경우 인피니티풀 무료, 아닐 경우 선택 여부로 표시. <br>
<br>
<h4>📌 마이페이지</h4>
<img src = "https://github.com/jinaleee/jinaleee/assets/137017258/9704576d-84f2-4c85-80ec-17fdb788dedd" width="100%"></img><br>
<img src = "https://github.com/jinaleee/jinaleee/assets/137017258/13e272b3-5db2-4739-bf2e-0d5cef02d2e7" width="100%"></img><br>
- 마이페이지에서 회원 정보와 예약 내역 및 예약 상태 확인 가능.<br>
- 회원 정보, 예약 정보 수정 및 취소 요청 가능.<br>
<br>

<h3>👨‍🔧 관리자 기능</h3>
<h4>📌 회원 관리</h4>
<img src = "https://github.com/jinaleee/jinaleee/assets/137017258/6fa503b4-6339-4acc-8c1a-5b294efb3b6d" width="100%"></img><br>
- 회원 정보 조회와 삭제, 정지 여부 전환 기능, 비밀번호 오류 횟수 초기화 기능, VIP 전환 기능. <br>
- 회원 정보 일부 수정 기능.<br>
<br>
<h4>📌 예약 관리</h4>
<img src = "https://github.com/jinaleee/jinaleee/assets/137017258/27d6f86a-7b6a-4941-a904-de48ca0a6629" width="100%"></img><br>
- 예약 내역 확인 가능. 예약 승인과 취소 요청 승인, 정보 수정 기능. 체크인 기록 기능.<br>
- 취소 건 크로스 라인 표시.<br>
<br>
<h3>🙌 그 외 페이지</h3>
<h4>📌 오시는 길</h4>
<img src = "https://github.com/jinaleee/jinaleee/assets/137017258/054a36f4-1a83-44ac-9355-6c6056e0bfbe" width="100%"></img><br>
- 구글 지도로 주소 표시.<br>
- 네이버, 카카오 맵 페이지로 이동 가능. (새창)<br>
<br>
<h4>📌 호텔 정보</h4>
<img src = "https://github.com/jinaleee/jinaleee/assets/137017258/c5759334-06a2-4703-8598-bfea3b020a27" width="100%"></img><br>
<img src = "https://github.com/jinaleee/jinaleee/assets/137017258/d366b7f0-ed77-4742-868b-bd5241a35096" width="100%"></img><br>
- 기타 호텔 정보 표시<br>
<br>
<br>
