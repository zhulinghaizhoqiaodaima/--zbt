<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>物料购买->修改验收物品页面</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<form action="/pcg/doupdateCAAm?pgid=${pcgm.pgid}" method="post">
    <table border="0" align="center">
        <div class="title">
            <h1 color="#696969">欢迎来到修改购物界面</h1>
        </div>
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
            <td><input type="text" name="kmessage" id="kmessage" value="${pcgm.kmessage}" /></td>
        </tr>
        <tr>
            <th>数量：</th>
            <td><input type="number" name="num" id="num" value="${pcgm.num}" /></td>
        </tr>
        <tr>
            <th>单位：</th>
            <td><input type="text" name="unit" id="unit" value="${pcgm.unit}" /></td>
        </tr>
        <tr>
            <th>价格：</th>
            <td><input type="number" name="ksum" id="ksum" value="${pcgm.ksum}" /></td>
        </tr>
        <tr>
            <th>购买地：</th>
            <td><input type="text" name="buyaddrs" id="buyaddrs" value="${pcgm.buyaddrs}" /></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input class="login_button" type="submit" value="提交"/>
                <input class="login_button"   type="reset" value="重置"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>