<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>出库页面</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>

<form id="submitForm">
    <div class="title">
        <h1 color="#696969">欢迎来到出库界面</h1>
    </div>
    <table border="0" align="center">
        <tr>
            <th>物品名：</th>
            <td><input type="text" name="iname" id="iname" value="${ivtm.imessage}"/></td>
        </tr>
        <tr>
            <th>取货人：</th>
            <td><input type="text" name="uname" id="uname" /></td>
        </tr>
        <tr>
            <th>数量：</th>
            <td><input type="number" name="num" id="num" /></td>
        </tr>
        <tr>
            <th>日期：</th>
            <td><input type="text" name="ctime" id="ctime" value="${ctime}">
        </tr>
        <tr>
            <th>出货人</th>
            <td><input type="text" name="cname" id="cname" value="${cname}" readonly="readonly"></td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <%--合并两列--%>
                <input   type="button" class="submit login_button" value="确定"/>
                <input type="reset" class="reset login_button" value="重置"/>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript">
    $(function () {
        $(".submit").click(function () {

            $.ajax({
                url: "<%=ctx%>/pcg/outIvt",
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