<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后勤-额外用餐信息修改</title>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<form action="/eat/doupdate?oEid=${oemp.oEid}" method="post">
    <table border="0" align="center">
        <div class="title">
            <h1 color="#696969">欢迎来到额外用餐信息修改界面</h1>
        </div>
        <tr>
            <td>年:</td>
            <td><input type="number" name="year"  value="${oemp.year}" /></td>
        </tr>
        <tr>
            <td>月:</td>
            <td><input type="number" name="month" value="${oemp.month}" /></td>
        </tr>
        <tr>
            <td>该月第几周:</td>
            <td><input type="number" name="week" value="${oemp.week}" /></td>
        </tr>
        <tr>
            <td>周几:</td>
            <td><input type="number" name="weekday" value="${oemp.weekday}" /></td>
        </tr>
        <tr>
            <td>身份：</td>
            <td> 请选择
                <select name="empType">
                    <option value="领导">领导</option>
                    <option value="工人">工人</option>
                    <option value="其他">其他</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>用餐人数:</td>
            <td><input type="number" name="pnum" value="${oemp.pnum}" /></td>
        </tr>
        <tr>
            <td>菜品数量:</td>
            <td><input type="number" name="fnum" value="${oemp.fnum}" /></td>
        </tr>
        <tr>
            <td>菜品信息:</td>
            <td><textarea name="food"  rows="5" cols="30">${oemp.food}</textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input class="login_button"  type="submit" value="提交"/>
                <input class="login_button"  type="reset" value="重置"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
