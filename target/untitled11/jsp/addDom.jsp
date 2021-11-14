<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>添加宿舍页面界面</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">

<body>
<form id="submitForm">
    <table border="0" align="center">
        <caption>
            <span color="#696969">添加宿舍信息</>
        </caption>
        <tr>
            <th>宿舍编号：</th>
            <td><input type="text" name="dcoding"  placeholder="宿舍编号为楼号-层数-房间号"/></td>
        </tr>
        <tr>
            <th>宿舍信息：</th>
            <td><input type="text" name="dmessage"  /></td>
        </tr>
        <tr>
            <th>入住状态：</th>
            <td>未入住</td>
        </tr>

        <tr>
            <td align="center" colspan="2">
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
                url: "<%=ctx%>/dormitory/addDo",
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