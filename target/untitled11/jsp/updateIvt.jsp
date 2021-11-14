<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ctx=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+ request.getContextPath();
%>
<html>
<head>
    <title>修改库存物品页面</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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


<form action="/pcg/doupdateIvt?Ivid=${ivtm.ivid}" method="post">
    <table border="0" align="center">
        <div class="title">
            <h1 color="#696969">欢迎来到修改库存界面</h1>
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
            <td><input type="text" name="imessage" id="imessage" value="${ivtm.imessage}" /></td>
        </tr>
        <tr>
            <th>数量：</th>
            <td><input type="number" name="inum" id="inum" value="${ivtm.inum}" /></td>
        </tr>
        <tr>
            <th>单位：</th>
            <td><input type="text" name="unit" id="unit" value="${ivtm.unit}" /></td>
        </tr>
        <tr>
            <th>入库时间：</th>
            <td><input type="text" name="rtime" id="rtime" value="${ivtm.rtime}" readonly="readonly" /></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input class="login_button" type="submit" value="提交"/>
                <input class="login_button" type="reset" value="重置"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>