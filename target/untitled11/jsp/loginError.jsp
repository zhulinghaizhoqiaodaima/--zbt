
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>登录错误提示</title>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    html {
        height: 100%;
        width: 100%;
        overflow: hidden;
        margin: 0;
        padding: 0;
        background: url(../imgs/bg.png) no-repeat 0px 0px;
        background-size: 100% 100%;
        -moz-background-size: 100% 100%;
    }

    body {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100%;
    }

    #loginDiv {
        width: 37%;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 300px;
        background-color: rgba(75, 81, 95, 0.3);
        box-shadow: 7px 7px 17px rgba(52, 56, 66, 0.5);
        border-radius: 5px;
        position: relative;
    }

    p {
        margin-top: 30px;
        margin-left: 20px;
        color: azure;
    }

    input {
        margin-left: 15px;
        border-radius: 5px;
        border-style: hidden;
        height: 30px;
        width: 260px;
        background-color: rgba(216, 191, 216, 0.5);
        outline: none;
        color: #f0edf3;
        padding-left: 10px;
    }

    a {
        text-decoration: none;
        display: block;
        width: 100%;
        color: #fff;
    }

    .login-button { /* 按钮美化 */
        border-color: cornsilk;
        background-color: rgba(100, 149, 237, .7);
        color: aliceblue;
        border-style: hidden;
        border-radius: 5px;
        width: 100px;
        height: 31px;
        font-size: 16px;
        margin-left: 20px;
        padding-left:0px;
        margin-top: 40px;
    }
    .login-button:hover { /* 鼠标移入按钮范围时改变颜色 */
        background: #5599FF;
    }
    .title {
        text-align: center;
        color: aliceblue;
        display: inline-block;
        position: absolute;
        top: 20px;
    }
</style>
<body>
<div id="loginDiv">
    <h1 class="title" >登录失败界面</h1>

    <div style="text-align: center;margin-top: 30px; font-size: 25px;">
        <p>原因1:${failure1}</p>
        <p>原因2:${failure2}</p>
        <button class="login-button" >
            <a href="/user/logout">返回登录</a>
        </button>
    </div>
</div>

</body>
</html>