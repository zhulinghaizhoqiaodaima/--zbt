<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎来到设备信息修改界面</title>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<form action="/equipment/doupdateEq?eqid=${equipment.eqid}" method="post" >
    <table border="0" align="center">
        <div class="title">
            <h1 color="#696969">欢迎来到设备信息修改界面</h1>
        </div>
        <tr>
            <td style="text-align: center">设备名:</td>
            <td><input type="text" name="eqname" value="${equipment.eqname}" /></td>
        </tr>
        <tr>
            <td style="text-align: center">所属部门:</td>
            <td><input type="text" name="department" value="${equipment.department}" /></td>
        </tr>
        <tr>
            <th>设备信息：</th>
            <td><textarea name="eqmessage" rows="5" cols="30">${equipment.eqmessage}</textarea></td>
        </tr>
        <tr>
            <td style="text-align: center">入库时间:</td>
            <td><input type="text" name="rtime" value="${equipment.rtime}" /></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input class="login_button" type="submit" value="提交"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
