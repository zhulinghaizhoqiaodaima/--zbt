<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎来到菜品修改界面</title>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<form action="/menu/doupdate?mid=${menu.mid}" method="post" >
    <table border="0" align="center">
        <div class="title">
            <h1 color="#696969">欢迎来到菜品修改界面</h1>
        </div>
        <tr>
            <td style="text-align: center">荤菜1:</td>
            <td><input type="text" name="meatone" value="${menu.meatone}" /></td>
        </tr>
        <tr>
            <td style="text-align: center">荤菜2:</td>
            <td><input type="text" name="meattwo" value="${menu.meattwo}" /></td>
        </tr>
        <tr>
            <td style="text-align: center">素菜:</td>
            <td><input type="text" name="vegetable" value="${menu.vegetable}" /></td>
        </tr>
        <tr>
            <td style="text-align: center">汤:</td>
            <td><input type="text" name="soup" value="${menu.soup}" /></td>
        </tr>
        <tr>
            <td style="text-align: center">月份:</td>
            <td><input type="number" name="month" value="${menu.month}" readonly="readonly" /></td>
        </tr>
        <tr>
            <td style="text-align: center">周数:</td>
            <td><input type="number" name="week" value="${menu.week}" readonly="readonly" /></td>
        </tr>
        <tr>
            <td style="text-align: center">周几:</td>
            <td><input type="number" name="weekday" value="${menu.weekday}" readonly="readonly" /></td>
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
