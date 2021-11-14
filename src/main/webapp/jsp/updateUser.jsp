<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>修改密码页面</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>

<div id="loginDiv">
    <form id="submitForm">
        <h1 style="text-align: center;color: aliceblue;">修改密码</h1>

        <p>用 户:<input style="margin-left: 31px;" type="text" name="username" id="username" required placeholder="请输入您的用户名"/><label id="name_trip"></label></p>

        <p>新密码:  <input  type="password" name="password" id="password" required placeholder="请输入您的新密码"/><label id="password_trip"></label></p>

            <div style="text-align: center;margin-top: 30px;">
                <input type="button" class="submit login-button" value="修改"/>
                <input type="reset" class="reset login-button" value="重置"/>
                <button class="login-button" >
                    <a href="/user/tologin">返回首页</a>
                </button>
            </div>

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
                url: "<%=ctx%>/user/update",
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