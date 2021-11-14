<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>登录页面</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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
        }

        #name_trip {
            margin-left: 50px;
            color: red;
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
        .personId{
            margin-left: 68px;
            width: 260px;
            margin-top: 33px;
        }
        .choose{
            color: #fff;
            display: inline-block;
            color: #FFA500;
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
        }
        .login-button:hover { /* 鼠标移入按钮范围时改变颜色 */
            background: #5599FF;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div id="loginDiv" >
<form action="<%=ctx%>/user/login" method="post" id="form">
        <h1 style="text-align: center;color: aliceblue;">南充市工商银行后勤管理系统</h1>

                <p style="float: left;">身&nbsp&nbsp&nbsp份:</p>
                <div class="personId">
                    <span class="choose" > <input style="width: 15px;height: 14px;margin-right: 4px;"  type="radio" name="UserType" value="管理员" />管理员</span>
                    <span class="choose" > <input style="width: 15px;height: 14px;margin-right: 4px;" type="radio" name="UserType" value="后勤人员" />后勤人员</span>
                    <span class="choose" ><input style="width: 15px;height: 14px;margin-right: 4px;" type="radio" name="UserType" value="员工" checked="checked"/>员工</span>
                </div>


            <p>用 户:<input  name="username"  type="text"><label id="name_trip"></label></p>

            <p>密码:  <input id="password" name="password" type="password"><label id="password_trip"></label></p>

            <div style="text-align: center;margin-top: 30px;">
                <input type="submit" class="login-button" value="登录">
                <button class="login-button">
                    <a href="/user/toregister">注册</a>
                </button>
                <button class="login-button" >
                    <a href="/user/toupdatepass">修改密码</a>
                </button>
            </div>
</form>
</div>
</body>
</html>
