<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>新增库存页面</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
<form id="submitForm">
    <table border="0" align="center">
        <tr>
            <th>物品种类：</th>
            <td> 请选择
                <select name="kind" id="kind">
                    <option value="食品类">食品类</option>
                    <option value="生活类">生活类</option>
                    <option value="其他">其他</option>
                </select>
            <td>
        </tr>
        <tr>
            <th>名称：</th>
            <td><input type="text" name="imessage" id="imessage" /></td>
        </tr>
        <tr>
            <th>数量：</th>
            <td><input type="number" name="inum" id="inum" /></td>
        </tr>
        <tr>
            <th>单位：</th>
            <td><input type="text" name="unit" id="unit" /></td>
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
            var imessage=$("#imessage").val();
            var inum=$("#inum").val();
            if (imessage==undefined||imessage==null||imessage==''){
                alert("名称不能为空");
                return;
            }
            if (inum==undefined||inum==null||inum==''){
                alert("数量不能为空");
                return;
            }

            $.ajax({
                url: "<%=ctx%>/pcg/addIvt",
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