<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>宿舍管理->修改排班信息</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="../css/asset.css">
</head>

<body>
<div class="title">
    <h1 color="#696969">欢迎来到修改排班信息界面</h1>
</div>
<form action="/user/updateDaw?DAid=${daw.DAid}" >
    <table border="0" align="center">

        <tr>
            <th>日期：</th>
            <td><input type="text" name="ddate" value="${daw.ddate}"  /></td>
        </tr>
        <tr>
            <th>岗位：</th>
            <td> 请选择
                <select name="post" >
                    <option value="食堂">食堂</option>
                    <option value="维修">维修</option>
                    <option value="采购">采购</option>
                    <option value="其他">其他</option>
                </select>
            <td>
        </tr>
        <tr>
            <th>姓名：</th>
            <td><input type="text" name="dname" value="${daw.dname}" /></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <input class="login_button" type="submit" value="提交"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>