<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>新增留言页面</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">

<body>
<form id="submitForm">
    <table border="0" align="center">
        <caption>
            <span style=" color:#696969">新增留言信息</span>
        </caption>
        <tr>
            <th>姓名：</th>
            <td><input type="text" name="name" id="name" value="${name}" readonly="readonly"/></td>
        </tr>
        <tr>
            <th>留言：</th>
            <td><textarea name="message" rows="5" cols="30"></textarea></td>
        </tr>
        <tr>
            <th>留言时间：</th>
            <td><input type="text" name="ltime" id="ltime" value="${ltime}" readonly="readonly" /></td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <%--合并两列--%>
                <input type="button" class="submit" value="确认"/>
                <input type="reset" class="reset" value="重置"/>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript">
    $(function () {
        $(".submit").click(function () {

            $.ajax({
                url: "<%=ctx%>/emp/addlm",
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