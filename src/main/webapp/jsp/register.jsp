<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>注册页面</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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
        background-repeat: no-repeat;
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
        height: 650px;
        background-color: rgba(75, 81, 95, 0.3);
        box-shadow: 7px 7px 17px rgba(52, 56, 66, 0.5);
        border-radius: 5px;
    }

    #name_trip {
        margin-left: 50px;
        color: red;
    }

    p,
    .sexDiv {
        margin-top: 10px;
        margin-left: 20px;
        color: azure;
    }

    .sexDiv>input,
    .hobby>input {
        width: 30px;
        height: 17px;
    }

    input,
    select {
        margin-left: 15px;
        border-radius: 5px;
        border-style: hidden;
        height: 30px;
        width: 140px;
        background-color: rgba(216, 191, 216, 0.5);
        outline: none;
        color: #f0edf3;
        padding-left: 10px;
    }

    .button {
        border-color: cornsilk;
        background-color: rgba(100, 149, 237, .7);
        color: aliceblue;
        border-style: hidden;
        border-radius: 5px;
        width: 100px;
        height: 31px;
        font-size: 16px;
    }

    .introduce {
        margin-left: 110px;
    }

    .introduce>textarea {
        background-color: rgba(216, 191, 216, 0.5);
        border-style: hidden;
        outline: none;
        border-radius: 5px;
    }

    h1 {
        text-align: center;
        margin-bottom: 20px;
        margin-top: 20px;
        color: #f0edf3;
    }

    b {
        margin-left: 50px;
        color: #FFEB3B;
        font-size: 10px;
        font-weight: initial;
    }
    .button_register{
        background-color: rgba(100, 149, 237, .7);
        padding-left: 0;
        font-size: 15px;
        font-weight: bolder;
    }
    .button_register:hover { /* 鼠标移入按钮范围时改变颜色 */
        background: #5599FF;
    }
</style>
<body>
<div id="loginDiv">
    <form id="submitForm">
        <h1>用户注册</h1>

        <p>
            部门:
            <select name="department" id="department" style="color: #999">
<%--                <option value="0" style="color: #999">请选择</option>--%>
                <option value="1" style="color: #f0edf3">西街本行</option>
                <option value="2" style="color: #f0edf3">东风路分行</option>
                <option value="3" style="color: #f0edf3" >车站分行</option>
            </select>
            <label id="type_trip"></label>
        </p>
        <p>用户:<input id="username"type="number" name="username"  required placeholder="请输数字注册用户名"/><label id="name_trip"></label></p>
        <p>密码:<input type="password" name="password" id="password" required  placeholder="请输入您的密码"/><label id="password_trip"></p>
        <p>姓名:<input type="text" name="name" id="name"   required placeholder="请输入您的真实姓名"/></p>
        <p>姓别:<input type="text" name="sex" id="sex"   required placeholder="请输入您的性别"/></p>
        <p>年龄:<input type="number" name="age" id="age"   placeholder="请输入您的年龄"/></p>
        <p>电话:<input type="number" name="phone" id="phone"   placeholder="请输入您的号码"/></p>
        <p>住址:<input  type="text" name="address" id="address"   placeholder="请输入您的住址"/></p>

        <p style="text-align: center;margin-top: 30px;margin-left: -30px; ">
            <input  type="button" class="submit button_register" value="注册"/>
            <input type="reset" class="reset button_register" value="重置"/>
        </p>

    </form>

</div>







<script type="text/javascript">
    $(function () {
        $(".submit").click(function () {
            var username=$("#username").val();
            var password=$("#password").val();
            if (username==undefined||username==null||username==''){
                alert("用户名不能为空");
                return;
            }
            if (password==undefined||password==null||password==''){
                alert("密码不能为空");
                return;
            }

            $.ajax({
                url: "<%=ctx%>/user/register",
                data: $('#submitForm').serialize(), // 从表单中获取数据
                type: "post",
                success: function(data) {
                    alert(data.message);
                    $('#submitForm')[0].reset();
                }
            })
        })

    })
</script>
</body>
</html>