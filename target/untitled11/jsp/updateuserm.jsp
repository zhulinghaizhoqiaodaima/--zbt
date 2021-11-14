<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>人员管理-修改信息</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<div class="title">
    <h1 color="#696969">欢迎来到修改信息界面</h1>
</div>

<form action="/user/doupdatem?username=${user.username}" >
    <table border="0" align="center">
        <tr>
            <th>用户名：</th>
            <td><input type="text" name="username" value="${user.username}" readonly="readonly" /></td>
        </tr>
        <tr>
            <th>身份：</th>
            <td> 请选择
                <select name="UserType" >
                    <option value="员工">前台员工</option>
                    <option value="后勤人员">后勤人员</option>
                </select>
            <td>
        </tr>
        <tr>
            <th>姓名：</th>
            <td><input type="text" name="name" value="${user.name}" /></td>
        </tr>
        <tr>
            <th>性别：</th>
            <td><input type="text" name="sex" value="${user.sex}" /></td>
        </tr>
        <tr>
            <th>年龄：</th>
            <td><input type="number" name="age" value="${user.age}" /></td>
        </tr>
        <tr>
            <th>部门：</th>
            <td><input type="text" name="department" value="${user.department}" /></td>
        </tr>
        <tr>
            <th>电话：</th>
            <td><input type="number" name="phone" value="${user.phone}" /></td>
        </tr>
        <tr>
            <th>住址：</th>
            <td><input type="text" name="address" value="${user.address}" /></td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <input class="login_button" type="submit" value="提交"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>