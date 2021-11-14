<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>欢迎来到新增菜单界面</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<div>
    <div class="title">
        <h1 color="#696969">欢迎来到新增菜单界面</h1>
    </div>
</div>
<form id="submitForm">
    <table border="0" align="center">
        <tr>
            <th>选择年份：</th>
            <td><input type="number" name="year"  value="${year}"/></td>
        </tr>
        <tr>
            <th>月份：</th>
            <td><input type="number" name="month"  value="${month}"/></td>
        </tr>
        <tr>
            <th>本月第几周：</th>
            <td><input type="number" name="week"  value="${week}"/></td>
        </tr>
        <tr>
            <th>周几：</th>
            <td> 请选择
                <select name="weekday" id="weekday">
                    <option value="1">星期一</option>
                    <option value="2">星期二</option>
                    <option value="3">星期三</option>
                    <option value="4">星期四</option>
                    <option value="5">星期五</option>
                    <option value="6">星期六</option>
                    <option value="7">星期天</option>
                </select>
            <td>
        </tr>
        <tr>
            <th>荤菜1：</th>
            <td><input type="text" name="meatone" /></td>
        </tr>
        <tr>
            <th>荤菜2：</th>
            <td><input type="text" name="meattwo" /></td>
        </tr>
        <tr>
            <th>素菜：</th>
            <td><input type="text" name="vegetable" /></td>
        </tr>
        <tr>
            <th>汤：</th>
            <td><input type="text" name="soup" /></td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <input type="button" class="submit login_button" value="确定"/>
                <input type="reset" class="reset login_button" value="重置"/>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript">
    $(function () {
        $(".submit").click(function () {

            $.ajax({
                url: "<%=ctx%>/menu/addmenu",
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