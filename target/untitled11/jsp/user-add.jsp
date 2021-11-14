<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>未解决</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
  <div>
    <caption>
        <font color="#696969">用户新增</font>
    </caption>
  </div>
<form id="submitForm">
    <table border="0" align="center">
        <tr><td>注&nbsp&nbsp册&nbsp&nbsp身&nbsp&nbsp份:</td>
            <td><input  type="radio" name="UserType" value="员工" checked />员工<td>
        </tr>
        <tr>
            <th>状态：</th>
            <td><input  type="radio" name="state" value="离线" checked />离线</td>
        </tr>
        <tr>
            <th>用户名：</th>
            <td><input type="number" name="username" id="username" placeholder="请输入数字用户名"/></td>
        </tr>
        <tr>
            <th>密码：</th>
            <td><input type="password" name="password" id="password" /></td>
        </tr>
        <tr>
            <th>姓名：</th>
            <td><input type="text" name="name" id="name" /></td>
        </tr>
        <tr>
            <th>姓别：</th>
            <td><input type="text" name="sex" id="sex" /></td>
        </tr>
        <tr>
            <th>年龄：</th>
            <td><input type="number" name="age" id="age" /></td>
        </tr>
        <tr>
            <th>电话：</th>
            <td><input type="number" name="phone" id="phone" /></td>
        </tr>
        <tr>
            <th>住址：</th>
            <td><input type="text" name="address" id="address" /></td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <%--合并两列--%>
                <input type="button" class="submit" value="注册"/>
                <input type="reset" class="reset" value="重置"/>
            </td>
        </tr>
    </table>
</form>
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
                url: "<%=ctx%>/aduser/adduser",
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