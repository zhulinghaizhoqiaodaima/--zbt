<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>新增额外用餐人员页面</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<form id="submitForm">
    <table border="0" align="center">
        <caption>
            <span color="#696969">新增额外人员用餐信息</span>
        </caption>
        <tr>
            <th>身份：</th>
            <td> 请选择
                <select name="empType" id="empType">
                    <option value="领导">领导</option>
                    <option value="工人">工人</option>
                    <option value="其他">其他</option>
                </select>
            <td>
        </tr>
        <tr>
            <th>用餐人员数量：</th>
            <td><input type="number" name="pnum" id="pnum" /></td>
        </tr>
        <tr>
            <th>菜品数量：</th>
            <td><input type="number" name="fnum" id="fnum" /></td>
        </tr>
        <tr>
            <th>菜品：</th>
            <td><textarea name="food" rows="5" cols="30"></textarea></td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <%--合并两列--%>
                <input type="button" class="submit login_button" value="确认"/>
                <input type="reset" class="reset login_button" value="重置"/>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript">
    $(function () {
        $(".submit").click(function () {

            $.ajax({
                url: "<%=ctx%>/eat/addoemp",
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