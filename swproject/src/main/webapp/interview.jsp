<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>면접 보기</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .section {
            display: none;
            text-align: center;
            padding: 30px;
            width: 100%;
        }
        .section input {
            display: block;
            margin: 10px auto;
            width: 80%;
        }

        /* 메인 레이아웃 설정 */
        .container {
            display: flex;
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 20px;
        }

        /* 메인 컨텐츠 */
        .content {
            flex-grow: 1;
            padding-left: 20px;
        }
        .content input {
            flex-grow: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        /* 왼쪽 사이드바 스타일 */
        .sidebar {
            width: 200px;
            padding: 20px;
            background-color: white;
            border-right: 1px solid #ddd;
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }
        .sidebar ul li {
            margin-bottom: 10px;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: #333;
            font-size: 16px;
            cursor: pointer;
        }
        .sidebar li:hover {
            background-color: #e0e0e0;
        }


        /*오른쪽 컨텐츠 스타일*/
        h2 {
            color: #333;
            margin-bottom: 10px;
        }
        .interviewTable {
            color: black;
            width: 100%;
            text-align: center;
            border: 1px solid #333;
            border-collapse: collapse;
        }
        .interviewTable th {
            color:white;
            background-color: #333;
            padding: 5px;
        }
        .interviewTable td {
            padding: 5px;
            border: 1px solid #333;
            border-collapse: collapse;
        }
        .interviewTable tbody tr:hover td {
            background-color: #c6c6c6;
        }
        .interviewTable tr {
            height: 50px;
            cursor: pointer;
        }
        .video-section-container {
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }
        .video-section {
            width: 48%;
            text-align: center;
            justify-content: space-between; /* 세로 공간 분할 */
            height: 100%; /* 부모 컨테이너와 동일한 높이 */
        }

        video, img {
            width: 100%;
            max-height: 350px;
            border: 2px solid #333;
            border-radius: 8px;
            box-sizing: border-box;
        }
        .text-output{
            width: 100%;
            max-height: 350px;
            border: 2px solid #333;
            border-radius: 8px;
            box-sizing: border-box;

            max-height: 400px;
            padding: 10px;
            overflow-y: auto;
            text-align: left;
            font-size: 15px;
            color: #333;
        }

        .button-controls {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-top: 20px;
        }
        .button-controls button {
            padding: 10px 15px;
            background-color: #333;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .button-controls button:hover {
            background-color: #555;
        }

    </style>
    <script>
        // header.html 파일을 불러오는 함수
        function loadHeader() {
            fetch("header.jsp")
                .then(response => response.text())
                .then(data => {
                    document.getElementById("header-container").innerHTML = data;
                })
                .catch(error => console.error("Error loading header:", error));
        }

        window.onload = loadHeader; // 페이지가 로드될 때 헤더를 불러옴
    </script>
</head>

<body>

<!-- 헤더가 로드될 위치 -->
<div id="header-container"></div>

    <div class="container">
        <div class="sidebar">
            <ul>
                <li><a href="interview.jsp">면접 보기</a></li>
                <li><a href="interview_view.jsp">면접 기록 조회</a></li>
            </ul>
        </div>

        <!-- 메인 컨텐츠 -->
        <div class="content">
            <div class="video-section-container">
                <div class="video-section">
                    <h2>면접관 화면</h2>
                    <img id="interviewer-video" src="ai-character.png" alt="가상 면접관 AI 캐릭터">

                    <h2>면접관 텍스트 창</h2>
                    <div class="text-output" id="interviewer-text-output">
                    </div>
                </div>

                <div class="video-section">
                    <h2>면접자 화면</h2>
                    <video id="user-webcam" autoplay playsinline muted></video>
                </div>
            </div>

            <div class="button-controls">
                <button id="start-interview">면접 시작</button>
                <button id="next-question">다음 질문</button>
                <button id="stop-recording">녹화 종료</button>
            </div>
        </div>
    </div>

    <script src="script.js"></script>

</body>

</html>
