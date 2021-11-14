<%--后勤人员界面--%>
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
            <a href="#" data-toggle="collapse" data-target="#collapse_eat">
                <span class="glyphicon glyphicon-user" aria-hidden="true"> 用餐人员</span>
            </a>
            <ul class="nav nav-pills nav-stacked click_render" id="collapse_eat">
                <li role="presentation"><a href="#" class="choiceemp" target="iframe_a">选择员工</a></li>
                <li role="presentation"><a href="#" class="selecteatemp" target="iframe_a">今日吃饭人员</a></li>
                <li role="presentation"><a href="#" class="findoldeemp" target="iframe_a">往期用餐记录</a></li>
                <li role="presentation"><a href="#" class="othereemp" target="iframe_a">额外用餐信息</a></li>
                <li role="presentation"><a href="#" class="lmessage" target="iframe_a">留言</a></li>
                <li role="presentation"><a href="#" class="emordert" target="iframe_a">饮食费用记录</a></li>
            </ul>
        </li>
    </ul>

    <ul class="nav nav-pills nav-stacked dept_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#collapse_menu">
                <span class="glyphicon glyphicon-cloud" aria-hidden="true"> 菜单</span>
            </a>
            <ul class="nav nav-pills nav-stacked click_render" id="collapse_menu">
                <li role="presentation"><a href="#" class="weekmenu" target="iframe_a">本周菜单</a></li>
                <li role="presentation"><a href="#" class="oldmenu" target="iframe_a">往期菜单记录</a></li>
            </ul>
        </li>
    </ul>

    <ul class="nav nav-pills nav-stacked dept_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#pcg_dept">
                <span class="glyphicon glyphicon-cloud" aria-hidden="true"> 物料购买</span>
            </a>
            <ul class="nav nav-pills nav-stacked click_render" id="pcg_dept">
                <li role="presentation"><a href="#" class="topcgplan" target="iframe_a">采购计划</a></li>
                <li role="presentation"><a href="#" class="toCAA" target="iframe_a">物品验收</a></li>
            </ul>
        </li>
    </ul>

    <ul class="nav nav-pills nav-stacked dept_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#IVT_dept">
                <span class="glyphicon glyphicon-cloud" aria-hidden="true"> 库存</span>
            </a>
            <ul class="nav nav-pills nav-stacked click_render" id="IVT_dept">
                <li role="presentation"><a href="#" class="Ivtm" target="iframe_a">库存维护</a></li>
                <li role="presentation"><a href="#" class="addIvtm" target="iframe_a">入库记录</a></li>
                <li role="presentation"><a href="#" class="outIvtm" target="iframe_a">出库记录</a></li>
            </ul>
        </li>
    </ul>

    <ul class="nav nav-pills nav-stacked  dept_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#Equipment">
                <span class="glyphicon glyphicon-cloud" aria-hidden="true"> 设备管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked click_render" id="Equipment">
                <li role="presentation"><a href="#" class="tofindequipment" target="iframe_a">查看所有设备</a></li>
                <li role="presentation"><a href="#" class="findeRecord" target="iframe_a">维修记录</a></li>
            </ul>
        </li>
    </ul>

    <ul class="nav nav-pills nav-stacked dept_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#Dormitory">
                <span class="glyphicon glyphicon-cloud" aria-hidden="true"> 员工宿舍管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked click_render" id="Dormitory">
                <li role="presentation"><a href="#" class="toDolist" target="iframe_a">宿舍信息</a></li>
                <li role="presentation"><a href="#" class="findRecord" target="iframe_a">入住离宿记录</a></li>
            </ul>
        </li>
    </ul>

    <ul class="nav nav-pills nav-stacked dept_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#Emp">
                <span class="glyphicon glyphicon-cloud" aria-hidden="true"> 人员管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked click_render" id="Emp">
                <li role="presentation"><a href="#" class="findEmp" target="iframe_a">查看员工信息</a></li>
                <li role="presentation"><a href="#" class="findAW" target="iframe_a">查看排班</a></li>
                <li role="presentation"><a href="#" class="findOAW" target="iframe_a">查看排班记录</a></li>
            </ul>
        </li>
    </ul>


</div>



<script>
    //吃饭人员页面跳转
    $(".choiceemp").click(function () {
        $(this).attr("href", "/eat/choiceemp");
    });
    $(".selecteatemp").click(function () {
        $(this).attr("href", "/eat/empeatlist");
    });
    $(".findoldeemp").click(function () {
        $(this).attr("href", "/eat/findoldeemp");
    });
    $(".othereemp").click(function () {
        $(this).attr("href", "/eat/othereemp");
    });
    $(".lmessage").click(function () {
        $(this).attr("href", "/eat/lmessage");
    });
    $(".emordert").click(function () {
        $(this).attr("href", "/eat/emordert");
    });

    //菜单相关页跳转
    $(".weekmenu").click(function () {
        $(this).attr("href", "/menu/list");
    });
    $(".oldmenu").click(function () {
        $(this).attr("href", "/menu/oldmenu");
    });

    //物品购买相关页跳转
    $(".topcgplan").click(function () {
        $(this).attr("href", "/pcg/topcgplan");
    });
    $(".toCAA").click(function () {
        $(this).attr("href", "/pcg/toCAA");
    });

    //库存相关页跳转
    $(".Ivtm").click(function () {
        $(this).attr("href", "/pcg/toIvtm");
    });
    $(".addIvtm").click(function () {
        $(this).attr("href", "/pcg/findaddIvtm");
    });
    $(".outIvtm").click(function () {
        $(this).attr("href", "/pcg/findoutIvtm");
    });

    //设备维护相关页跳转
    $(".tofindequipment").click(function () {
        $(this).attr("href", "/equipment/tofindequipment");
    });
    $(".findeRecord").click(function () {
        $(this).attr("href", "/equipment/findeRecord");
    });

    //宿舍信息相关页跳转
    $(".toDolist").click(function () {
        $(this).attr("href", "/dormitory/toDolist");
    });
    $(".findRecord").click(function () {
        $(this).attr("href", "/dormitory/findRecord");
    });

    //人员管理相关页跳转
    $(".findEmp").click(function () {
        $(this).attr("href", "/user/findEmp");
    });
    $(".findAW").click(function () {
        $(this).attr("href", "/user/findAW");
    });
    $(".findOAW").click(function () {
        $(this).attr("href", "/user/findOAW");
    });


    for (let i = 0; i <  $(".click_render").length; i++) {
        $(".click_render")[i].click(()=>{
            $(this).css("display","block");
        })
    }


</script>
</body>
</html>