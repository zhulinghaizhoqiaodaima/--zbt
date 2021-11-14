<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>员工入住信息填写</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<form action="/dormitory/empIn?did=${dormitory.did}" method="post" >
    <table border="0" align="center">
        <div class="title">
            <h1 color="#696969">员工入住信息填写</h1>
        </div>
        <tr>
            <th>宿舍编号：</th>
            <td><input type="text" name="dcoding"  value="${dormitory.dcoding}" readonly="readonly" /></td>
        </tr>
        <tr>
            <th>入住人：</th>
            <td><input type="text" name="rname"  value="${dormitory.rname}" /></td>
        </tr>
        <tr>
            <th>入住日期：</th>
            <td><input type="text" name="rdate"  value="${dormitory.rdate}" /></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input class="login_button" type="submit" value="提交"/>
            </td>
        </tr>
    </table>
</form>
<script type="text/javascript">
    $(function () {
        $(".submit").click(function () {
            var rname=$("#rname").val();
            if (rname==undefined||rname==null||rname==''){
                alert("入住人不能为空");
                return;
            }
        })

    })
</script>
</body>
</html>