<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>添加购物页面</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<form id="submitForm">
    <table border="0" align="center">
        <caption>
            <span color="#696969">添加购物</span>
        </caption>
        <tr>
            <th>所属购物单ID：</th>
            <td><input type="number" name="ppid" value="${ppid}" readonly="readonly"/></td>
        </tr>
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
            <th>物品名：</th>
            <td><input type="text" name="kmessage" id="kmessage" /></td>
        </tr>
        <tr>
            <th>数量：</th>
            <td><input type="number" name="num" id="num" /></td>
        </tr>
        <tr>
            <th>单位：</th>
            <td><input type="text" name="unit" id="unit" /></td>
        </tr>
        <tr>
            <th>价格：</th>
            <td><input type="number" name="ksum" id="ksum" /></td>
        </tr>
        <tr>
            <th>购买地：</th>
            <td><input type="text" name="buyaddrs" id="buyaddrs" /></td>
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
                url: "<%=ctx%>/pcg/intopcggo",
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