<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>设备管理-维修信息填写页面</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<form id="submitForm">
    <table border="0" align="center">
        <div class="title">
            <h1 color="#696969">欢迎来到新增报修信息界面</h1>
        </div>
        <tr>
            <th>设备ID：</th>
            <td><input type="text" name="eqid" id="eqid" value="${eqid}" readonly="readonly"/></td>
        </tr>
        <tr>
            <th>设备名：</th>
            <td><input type="text" name="eqname" id="name" value="${eqname}" readonly="readonly"/></td>
        </tr>
        <tr>
            <th>所属部门：</th>
            <td><input type="text" name="department" id="department" value="${department}" readonly="readonly"/></td>
        </tr>
        <tr>
            <th>设备问题信息：</th>
            <td><textarea name="issue" rows="5" cols="30"></textarea></td>
        </tr>
        <tr>
            <th>报修时间：</th>
            <td><input type="text" name="btime" id="btime" value="${btime}" readonly="readonly" /></td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <%--合并两列--%>
                <input class="login_button"  type="button" class="submit" value="确认"/>
                <input class="login_button"  type="reset" class="reset" value="重置"/>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript">
    $(function () {
        $(".submit").click(function () {

            $.ajax({
                url: "<%=ctx%>/equipment/repairs",
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