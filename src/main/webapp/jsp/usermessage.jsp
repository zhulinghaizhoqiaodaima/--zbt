
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后勤人员管理详细页</title>
</head>

<style>
    h1 {
        display: inline-block;
        align-content: center;
    }

    .title {
        text-align: center;
    }

    button:focus {
        border: 0 none;
        outline: none;
    }

    button {
        width: 60px;
        height: 25px;
        background-color: #5599FF;
        color: #FFFFCC;
        border-radius: 5px;
        border: none;
    }

    button:hover {
        background: #2ae;
        cursor: pointer;
    }

    a {
        text-decoration: none;

    }

    .look_detail {
        width: 80px;
        height: 40px;
        background-color: #7F99DA;
        color: #fff;
        border-radius: 15px;
        line-height: 30px;
    }

    input {
        outline-style: none;
        border: 1px solid #ccc;
        font-family: "Microsoft soft";
        padding: 2px 2px;
    }
    .page_change{
        display: inline-block;
        width: 60px;
        height: 25px;
        background-color: #7F99DA;
        color: #fff;
        border-radius: 5px;
        border: none;
        line-height: 25px;
    }
    .page_change:hover {
        background: #2ae;
        cursor: pointer;
    }
    .bottom_page {
        margin-top: 10px;
        text-align: center;
        letter-spacing: 3px;
    }
    .bottom_page > span {
        color: #7F99DA;

    }
</style>

<body>

<table border="1" width="60%" align="center">
    <tr style="text-align:center; font-size: 20px">
        <td><span size="5">
            用户名：
        </span></td>
        <td><span size="4" >
            ${user.username}
        </span></td>
    </tr>
    <tr style="font-size: 20px; text-align: center">
        <td><span size="5">
            身份：
        </span></td>
        <td><span size="4">
            ${user.userType}
        </span></td>
    </tr>
    <tr style="font-size: 20px; text-align: center">
        <td><span size="5">
            性别：
        </span></td>
        <td><span size="4" >
            ${user.sex}
        </span></td>
    </tr>
    <tr style="font-size: 20px; text-align: center">
        <td><span size="5">
            年龄：
        </span></td>
        <td><span size="4" >
            ${user.age}
        </span></td>
    </tr>
    <tr style="font-size: 20px; text-align: center">
        <td><span size="5">
            部门：
        </span></td>
        <td><span size="4" >
            ${user.department}
        </span></td>
    </tr>
    <tr style="font-size: 20px; text-align: center">
        <td><font size="5">
            电话：
        </font></td>
        <td><font size="4" >
            ${user.phone}
        </font></td>
    </tr>
    <tr style="font-size: 20px; text-align: center">
        <td><font size="5">
            住址：
        </font></td>
        <td><font size="4" >
            ${user.address}
        </font></td>
    </tr>
</table>


<div class="bottom_page">
    <a class="page_change" href="/user/backuserlist" >返回</a>
</div>

</body>
</html>
