
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>宿舍信息</title>
</head>
<link rel="stylesheet" href="../css/asset.css">
<body>
<table border="1" width="60%" align="center">
    <tr class="header_size">
        <td><span size="5">
            编号：
        </span></td>
        <td><span size="4" >
            ${dormitory.dcoding}
        </span></td>
    </tr>
    <tr class="header_size">
        <td><span size="5">
            信息：
        </span></td>
        <td><span size="4">
            ${dormitory.dmessage}
        </span></td>
    </tr>
    <tr class="header_size">
        <td><span size="5">
            入住时间：
        </span></td>
        <td><span size="4" >
            ${dormitory.rdate}
        </span></td>
    </tr>

</table>
</body>
</html>
