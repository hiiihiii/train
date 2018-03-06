<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/4/18
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<%
    String teaName = request.getParameter("teaName");
    //处理中文乱码问题
    try {
        teaName = new String(teaName.getBytes("ISO-8859-1"),"UTF-8");
    }
    catch (Exception e)
    {
        e.printStackTrace();
    }
%>
<html>
<head>
    <meta content="utf-8" />
    <title>企业员工管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <style type="text/CSS">
        .top{width: 100%;height: 8%}
        #welname{float: left;padding: 10px; margin-left: 10px}
        #btlogout{height: 40px; width: 50px; float: right; border-style: none none solid; margin-right: 20px;margin-left: 20px}
        #date{float: right;padding: 10px;}
        #blueline{position:absolute;top: 20px; left:0px;width:3px;height:48px;background:#41c7db;overflow:hidden;}
        .tabs{width: 100%; height: 100%;}
        .tab_con {position: absolute;border: 1px solid;width:200px;height: 100%;}
        .tab_con ul {list-style: none outside none; padding: .2em .1em .2em .2em; float: left; width: 190px; background-color: #e9e9e9; margin: 20px auto;}
        .tab_con ul li{padding: 10px 0 10px 10px;border-style: ridge; border-bottom-width: 1px !important; border-right-width: 0 !important;   margin: 0 -1px .2em 0;background-color: #f6f6f6}
        .tab_con ul li a{text-decoration: none;display: block;font-size: 18px; font-family: Arial, serif; color: #2b2b2b;}
        .tab-nav{cursor:pointer;}
        .right_con{height:100%; margin: auto auto auto 200px; border: 5px outset lightblue;}
        #if_con{height: 100%;width: 100%;right: 10px;}

    </style>
    <script type="text/javascript">
        function changeFrameHeight(){
            var ifm= document.getElementById("if_con");
            var h=document.body.clientHeight-document.getElementById("top").offsetHeight;
            ifm.height = h-100;
            var ifw = document.getElementById("if_con");
            ifw.width= document.body.clientWidth;
        }
        window.onresize=function(){
            changeFrameHeight();
        }

        function time()
        {
            var now= new Date();
            var year=now.getFullYear();
            var month=now.getMonth();
            var date=now.getDate();
            var week=now.getDay();
            var ww=""
            switch (week)
            {
                case 0:ww="星期日";break;
                case 1:ww="星期一";break;
                case 2:ww="星期二";break;
                case 3:ww="星期三";break;
                case 4:ww="星期四";break;
                case 5:ww="星期五";break;
                case 6:ww="星期六";break;
                default:break;
            }
            document.getElementById("spandate").innerHTML=year+"年"+(month+1)+"月"+date+"日"+"    "+ww;
        }

        $(function (){
            $("li").on("click",function () {
                var index = $(this).index();
                $("li").css("background-color","#f6f6f6");
                $("li").children().css("color","#2b2b2b");
                $(this).css("background","#41c7db");
                $(this).children().css("color","#cccccc");
                var height = $("#blueline").height();
                var topline = 20+index*height+"px";
                $("#blueline").css("top",topline);
            });

            $("li").eq(0).click();
            $("li").eq(0).children()[0].click();
        })



    </script>
</head>

<body  onload="time()">
<div class="tabs" >
    <div class="top" id="top">
        <div id="welname" ><span id ="spanwelname">欢迎您，<%=teaName%></span><span>老师</span></div>
        <div id="logout"><button id="btlogout" value="注销"><img width="100%" height="100%" src="${ctxStatic}/images/logout.ico"/></button></div>
        <div id="date"><span id="spandate"></span></div>
    </div><hr>
    <div class="tab_con">
        <div class="blueline" id="blueline" ></div>
        <ul class="left_tabs">
            <li class="tab-nav"><a href="../teacher/info?teaId=${param.teaId}" target="if_con">查看个人信息</a></li>
            <li class="tab-nav"><a href="../teacher/course?teaId=${param.teaId}" target="if_con">查看课程</a></li>
            <li class="tab-nav"><a href="../teacher/setscoreindex?teaId=${param.teaId}" target="if_con">提交成绩</a></li>
        </ul>
    </div>
    <div class="right_con">
            <iframe id="if_con" name="if_con" frameborder="0"  noresize="noresize" marginwidth="5dp" marginheight="5dp" scrolling="no" onload="changeFrameHeight()" ></iframe>
    </div>
</div>
</body>

</html>