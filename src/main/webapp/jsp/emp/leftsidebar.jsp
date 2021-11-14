<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<style>
    body{
        color: rgba(0, 0, 0, 0.65);
        font-size: 14px;
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'PingFang SC', 'Hiragino Sans GB', 'Microsoft YaHei', 'Helvetica Neue', Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol';
        font-variant: tabular-nums;
        line-height: 1.5;
        background-color: #fff;
        font-feature-settings: 'tnum';
    }
    .nav{
        margin-top: 5px;
        /*background-color: #5599FF;*/
    }
    .nav > li{
        line-height: 2;

    }
    .glyphicon{
        line-height: 2;
        white-space: pre;
    }

    .nav-pills>li.active>a:hover {
        background-color: #001529;
    }
    .nav-pills>li.active>a:after {
        background-color: #001529;
    }
    .nav-pills>li.active>a{
        background-color:#001529;
    }
    #hrms_sidebar_left{
        color: rgba(255, 255, 255, 0.65);
        background: #001529;
        margin-top: -20px;
        height: 100vw;
        border-radius: 0 1px 0 0;

    }
    .nav-pills>li.active>a {
        background-color:#001529;
    }
    .click_render{
        display: none;
    }
</style>
<body>
<div class="panel-group col-sm-2" id="hrms_sidebar_left" role="tablist" aria-multiselectable="true">
    <ul class="nav nav-pills nav-stacked emp_sidebar">
        <li role="presentation" class="active">
            <a href="#" data-toggle="collapse" data-target="#collapse_emp">
                <span class="glyphicon glyphicon-user" aria-hidden="true"> 饮食</span>
            </a>
            <ul class="nav nav-pills nav-stacked click_render" id="collapse_emp">
                <li role="presentation"><a href="#" class="weekmenu" target="iframe_a">查看本周菜单</a></li>
                <li role="presentation"><a href="#" class="emordert" target="iframe_a">查看饮食记录</a></li>
                <li role="presentation"><a href="#" class="lMessage" target="iframe_a">留言</a></li>
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked dept_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#collapse_do">
                <span class="glyphicon glyphicon-cloud" aria-hidden="true"> 费用</span>
            </a>
            <ul class="nav nav-pills nav-stacked click_render" id="collapse_do">
                <li role="presentation"><a href="#" class="findDoM" target="iframe_a">宿舍信息</a></li>
                <li role="presentation"><a href="#" class="findDoR" target="iframe_a">住宿记录</a></li>
            </ul>
        </li>
    </ul>


</div><!-- /.panel-group，#hrms_sidebar_left -->
<script>

    //用餐跳转
    $(".weekmenu").click(function () {
        $(this).attr("href", "/emp/menulist");
    });
    $(".emordert").click(function () {
        $(this).attr("href", "/emp/emolist");
    });
    $(".lMessage").click(function () {
        $(this).attr("href", "/emp/lMessage");
    });

    //宿舍信息跳转
    $(".findDoM").click(function () {
        $(this).attr("href", "/emp/findDoM");
    });
    $(".findDoR").click(function () {
        $(this).attr("href", "/emp/findDor");
    });
    for (let i = 0; i <  $(".click_render").length; i++) {
        $(".click_render")[i].click(()=>{
            $(this).css("display","block");

        })
    }

</script>
</body>
</html>