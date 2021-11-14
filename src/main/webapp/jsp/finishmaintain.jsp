<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>欢迎来到设备维修详情页面界面</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<form action="/equipment/finish?rid=${repairs.rid}" method="post">
    <table border="0" align="center">
        <div class="title">
            <h1 color="#696969">欢迎来到设备维修详情页面界面</h1>
        </div>
        <tr>
            <th>设备名：</th>
            <td><input type="text" name="eqname" id="name" value="${repairs.eqname}" readonly="readonly"/></td>
        </tr>
        <tr>
            <th>所属部门：</th>
            <td><input type="text" name="department" id="department" value="${repairs.department}" readonly="readonly" ></td>
        </tr>

        <tr>
            <th>设备问题信息：</th>
            <td><textarea name="issue" rows="5" cols="30" >${repairs.issue}</textarea></td>
        </tr>
        <tr>
            <th>维修人：</th>
            <td><input type="text" name="wname" id="wname" value="${repairs.wname}"></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <input class="login_button" style="width: 85px;" type="submit" value="完成维修"/>
            </td>
        </tr>
    </table>
</form>

</body>
</html>