<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <style>
        * {
    margin: 0;
    padding: 0;
    font-family: 'Inter' sans-serif;
    font-size: 12px;
    font-weight: 400;
}
ul, ol {list-style: none;}
a {text-decoration: none; color: #111;}

html ,body {
    height: 100%;
    margin : 0;
    display: flex;
    flex-direction: column;
}

#wrapper{
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: 980px;
    height: 100vh;
    margin: 0px auto;
}

header {
    position: relative;
    width: 100%;
    height: 142px;
    flex-shrink: 0; /*헤더 크기 유지 */
}

header .header_logo{
    position: absolute;
    top: 20px;
    left: 395px;
}

header > img:nth-of-type(2) {
    position: absolute;
    top: 59px;
    left: 751px;
}

header > .menu {
    position: absolute;
    width: 100%;
    height: 50px;
    top: 92px;
    display: flex;
}

header > .menu .line {
    display: block;
    margin-top: -3px;
}

header > .menu div {
    position: relative;
}

.menu div img[alt="30%"] {
    position: absolute;
    top: -15px;
    left: 55%;
}

header > .home {
    position: absolute;
    top: 17px;
    right: 5px;

}


main {
    flex-grow: 1;
    display: flex;
    width: 359px;
    height: 520px;
    align-items: center;
    justify-content: center;
    background-color: white;

}


/* user 공통 */
#user h2.tit {
    margin-top: 16px;
    margin-bottom: 6px;
}


/* 로그인 */
#user > .login {
    position: relative;
    width: 360px;
    height: auto;
    border: 1px solid #cfded8;
    box-sizing: border-box;
    margin: 100px auto;
}
#user > .login > form {}
#user > .login > form > table {
    margin-left: 52px;
    margin-top: 30px;
    margin-bottom: 30px;
    border-collapse: collapse;
    border-spacing: 0;
}
#user > .login > form > table tr {}
#user > .login > form > table tr > td {}
#user > .login > form > table img {width: 20px;}
#user > .login > form > table input {
    width: 162px;
    height: 22px;
    margin-left: 6px;
    margin-bottom: 4px;
    border: 1px solid #e4eaec;
    background: #f7f7f7;
}
#user > .login > form > .btnLogin {
    position: absolute;
    right: 50px;
    top: 30px;
    width: 60px;
    height: 52px;
    background-color: #fdfdfd;
    border: 1px solid #bebebe;
}


 .icons {
    position: relative;
    width: 107px;
    height: 36px;
    display: flex;
    margin-left: 72px;
    justify-content: space-between;
    align-items: center;
    overflow: hidden;
   
}

 .icons > .login_icon {
    
    width: 32px;
    height: 32px;
    object-fit: contain;
}


#user > .login > form > label {
    position: absolute;
    left: 78px;
    top: 90px;
}

#user > .login > form > label input {
    vertical-align: text-bottom;
    margin-right: 2px;
}

#user > .login > div {
    width: 100%;
    height: 104px;
    background: #f5f6fa;
    border-top: 1px solid #cfded8;
    margin-top: 20px;
    padding: 20px;
    box-sizing: border-box;
}
#user > .login > div > h3 {}
#user > .login > div > p {
    margin: 10px 0;
}
#user > .login > div > a {
    float: right;
}

/* 약관 */
#user > .terms {
    width: 600px;
    height: auto;            
    margin: 60px auto;
    overflow: hidden;
}
#user > .terms > h2 {
    margin-top: 10px;
    margin-bottom: 6px;
}
#user > .terms > table {
    width: 100%;
    height: auto;
    border-collapse: collapse;
    border-spacing: 0;
    border-top: 2px solid #111;
}
#user > .terms > table > caption {
    text-align: left;
    font-weight: bold;
    padding: 10px 0;
    box-sizing: border-box;
}
#user > .terms > table tr {}
#user > .terms > table tr > td {
    padding: 6px;
    border: 1px solid #e9e9e9;
    box-sizing: border-box;
}
#user > .terms > table tr > td > textarea {
    width: 100%;
    height: 200px;
    resize: none;
    background: #f7f7f7;
    border: 1px solid #e4eaec;
    padding: 2px;
    box-sizing: border-box;
}
#user > .terms > table tr > td > label {float: right;}
#user > .terms > table tr > td > label > input[type=checkbox] {}

#user > .terms > div {
    float: right;
    margin-top: 10px;
}


footer {
    position: relative;
    width: 100%;
    height: 120px;
    flex-shrink: 0;
}

footer > img:nth-of-type(1) {
    position: absolute;
    top: 0px;
    margin-top: -2px;
}

footer > .paragraph {
    position: absolute;
    top: 27px;
    left: 254.52px;
    font-size: 10.31px;
    color: #585858;
    line-height: 18px;
}

footer .copyright {
    font-size: 11.06px;
    color: #888;
    line-height: 13.39px;
}

footer > .version {
    position: absolute;
    right: 20px;
    bottom: 15px;
    font-size: 10.69px;
    color: #888;
}
    </style>
</head>
<body>
    <body>
        <div id="wrapper">
            <header>
                <img src="../images/head_top_line.png" alt="헤더 선">
                <a href="../main/main.html"><img src="../images/logo.png" class="header_logo" alt="로고사진"></a>
                <img src="../images/head_txt_img.png" alt="무료배송">
                <span class="home">
                    <a href="../main/main.html">HOME</a>&thinsp;|&thinsp;
                    <a href="../users/login.html">로그인</a>&thinsp;|&thinsp;
                    <a href="../users/singup.html">회원가입</a>&thinsp;|&thinsp;
                    <a href="../profile/cart.html">나의정보</a>&thinsp;|&thinsp;
                    <a href="../main/main.html">로그아웃</a>&thinsp;|&thinsp;
                    <a href="../admin-dashboard/dashboard.html">관리자</a>&thinsp;|&thinsp;
                    <a href="#">고객센터</a>&thinsp;
                </span>
                <nav class="menu">
                    <div>
                        <img src="../images/head_menu_line.png" class="line" alt="메뉴 선">
                        <a href="../home/greeting.html"><img src="../images/head_menu1.png" alt="팜스토리 소개"></a>
                    </div>
                    <div>
                        <img src="../images/head_menu_line.png" class="line" alt="메뉴 선">
                        <img src="../images/head_menu_badge.png" alt="30%">
                        <a href="../shop/product-list.html"><img src="../images/head_menu2.png" alt="장보기"></a>
                    </div>
                    <div>
                        <img src="../images/head_menu_line.png" class="line" alt="메뉴 선">
                        <a href="../stories/farm-stories.html"><img src="../images/head_menu3.png" alt="농작물이야기"></a>
                    </div>
                    <div>
                        <img src="../images/head_menu_line.png" class="line" alt="메뉴 선">
                        <a href="../events/event-calendar.html"><img src="../images/head_menu4.png" alt="이벤트"></a>
                    </div>
                    <div>
                        <img src="../images/head_menu_line.png" class="line" alt="메뉴 선">
                        <a href="../community/notices.html"><img src="../images/head_menu5.png" alt="커뮤니티"></a>
                    </div>
                </nav>
            </header>

            <main id="user">
                <section class="login">
                    <form action="/jboard/user/login.do" method="post">                    
                        <table border="0">
                            <tr>
                                <td><img src="../images/user/login_ico_id.png" alt="아이디"/></td>
                                <td><input type="text" name="uid" placeholder="아이디 입력"/></td>
                            </tr>
                            <tr>
                                <td><img src="../images/user/login_ico_pw.png" alt="비밀번호"/></td>
                                <td><input type="password" name="pass" placeholder="비밀번호 입력"/></td>
                            </tr>
                        </table>
                        <input type="submit" value="로그인" class="btnLogin"/>
                        <div class="icons">
                            <img src="../images/login_icons/naver_icon.png" class="login_icon">
                            <img src="../images/login_icons/kakao_icon.png" class="login_icon">
                            <img src="../images/login_icons/google_icon.png" class="login_icon">

                        </div>
                    </form>
                    <div>
                        <h3>회원 로그인 안내</h3>
                        <p>
                            아직 회원이 아니시면 회원으로 가입하세요.
                        </p>
                        <div style="text-align: right;">
                            <a href="/jboard/find/userId.do">아이디 |</a>
                            <a href="/jboard/find/password.do">비밀번호찾기 |</a>
                            <a href="/jboard/user/terms.do">회원가입</a>
                        </div>                    
                    </div>
                </section>
            </main>
            <footer>
                <img src="../images/footer_top_line.png" alt="footer_line">
                <img src="../images/footer_logo.png" alt="footer_logo">
                <p class="paragraph">
                    (주)팜스토리 / 사업자등록번호 123-45-67890 / 통신판매업신고 제 2013-부산진구-123호 / 벤처기업확인 서울지방중소기업청 제 012345678-9-01234호</br>
                    등록번호 팜스토리01234 (2013.04.01) / 발행인 : 홍길동</br>
                    대표 : 김철학 / 이메일 : chhak0503@gmail.com / 전화 : 01) 234-5678 / 부산광역시 부산진구 부전동 123<br>
                    <span class="copyright">김철학(개발에반하다) All rights reserved.</span> 
                </p>
                <p class="version">farmstory ver1.0.1</p>
            </footer>
        </div>
</body>
</html>