<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>新增设备界面</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
<form id="submitForm">
    <table border="0" align="center">
        <caption>
            <span color="#696969">新增设备</span>
        </caption>
        <tr>
            <th>部门：</th>
            <td> 请选择
                <select name="department" id="department">
                    <option value="前台">前台</option>
                    <option value="宿舍">宿舍</option>
                    <option value="食堂">食堂</option>
                    <option value="其他">其他</option>
                </select>
            <td>
        </tr>
        <tr>
            <th>设备名：</th>
            <td><input type="text" name="eqname" id="eqname" /></td>
        </tr>
        <tr>
            <th>设备信息：</th>
            <td><textarea name="eqmessage" rows="5" cols="30"></textarea></td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <%--合并两列--%>
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
                url: "<%=ctx%>/equipment/addEq",
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