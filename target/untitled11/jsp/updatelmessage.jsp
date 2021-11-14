<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言信息修改界面</title>
</head>
<style>
    h1 {
        display: inline-block;
        align-content: center;
    }

    .title {
        text-align: center;
    }
    input {
        outline-style: none;
        border: 1px solid #ccc;
        font-family: "Microsoft soft";
        padding: 2px 2px;
        width: 200px;
    }
    input:focus,select:focus{
        border-color: #66afe9;
        outline: 0;
        -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
        box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
    }

    .login_button { /* 按钮美化 */
        margin-top: 10px;
        width: 60px;
        height: 26px;
        border-width: 0px; /* 边框宽度 */
        border-radius: 3px; /* 边框半径 */
        background: #1E90FF; /* 背景颜色 */
        cursor: pointer; /* 鼠标移入按钮范围时出现手势 */
        outline: none; /* 不显示轮廓线 */
        font-family: Microsoft YaHei; /* 设置字体 */
        color: white; /* 字体颜色 */
        font-size: 17px; /* 字体大小 */
    }
    .login_button:hover { /* 鼠标移入按钮范围时改变颜色 */
        background: #5599FF;
    }
    form {
        color: #666666
    }
</style>
<body>
<div class="title">
    <h1 color="#696969">欢迎来到留言信息修改界面</h1>
</div>
<form action="/emp/doupdatelm?lMid=${lmessage.lMid}" method="post">
    <table border="0" align="center">
        <tr>
            <td>姓名:</td>
            <td><input type="text" name="name"  value="${lmessage.name}" /></td>
        </tr>
        <tr>
            <td>留言:</td>
            <td><textarea name="message"  rows="5" cols="30">${lmessage.message}</textarea></td>
        </tr>
        <tr>
            <td>留言时间:</td>
            <td><input type="text" name="ltime" value="${lmessage.ltime}" /></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input class="login_button"  type="submit" value="确定"/>
                <input class="login_button"  type="reset" value="重置"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
