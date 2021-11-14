<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>宿舍信息修改页面</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<form action="/dormitory/domupdate?did=${dormitory.did}" method="post">
    <table border="0" align="center">
        <div class="title">
            <h1 color="#696969">欢迎来到修改宿舍信息界面</h1>
        </div>
        <tr>
            <th>宿舍编号：</th>
            <td><input type="text" name="dcoding"  value="${dormitory.dcoding}" /></td>
        </tr>
        <tr>
            <th>宿舍信息：</th>
            <td><input type="text" name="dmessage"  value="${dormitory.dmessage}" /></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input class="login_button" type="submit" value="提交"/>
                <input class="login_button" type="reset" value="重置"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>