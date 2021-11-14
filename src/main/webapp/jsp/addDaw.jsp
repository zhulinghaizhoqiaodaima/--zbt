<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>添加每日排班页面</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
<form id="submitForm">
    <table border="0" align="center">
        <caption>
            <span color="#696969">添加排班信息</span>
        </caption>
        <tr>
            <th>日期：</th>
            <td><input type="text" name="ddate"  value="${ddate}" /></td>
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
            <th>人员：</th>
            <td><input type="text" name="dname"   /></td>
        </tr>

        <tr>
            <td align="center" colspan="2">
                <%--合并两列--%>
                <input type="button" class="submit login_button" value="确定"/>
                <input type="reset" class="reset login_buttons" value="重置"/>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript">
    $(function () {
        $(".submit").click(function () {
            $.ajax({
                url: "<%=ctx%>/user/addDaw",
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