<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/4/20
  Time: 21:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <style type="text/css">
        .div_eva{margin-left: 200px;width: 80%}
        .txt{color: #ccc}
        .focus{color: #000}
        .start_level,.submit{padding: 20px;}
        .evaluate_con{padding: 0px 20px;}
        #txtarea_con{
            border: thin solid lightblue;
        }
        #tb_con{border: none}
        #bt_submit{
            height: 30px;
            width: 80px;
            margin: 20px;
            border-right: solid;
            text-align: center;
            background-color: lightblue;
            color: #fff;
        }
        .starts{margin-top: 10px;}
        .starts i{margin-right:20px; color: #cccccc;cursor: default;font-style: inherit;font-size: 30px }
        .starts .on{color: #f1a899}
    </style>
    <script type="text/javascript">
        $(function () {
            $("#txtarea_con").focus(function () {
                if ($(this).val()=="评价内容")
                {
                    $(this).val("");
                    $(this).addClass("focus");
                }
            }).blur(function () {
                if ($(this).val()=="")
                {
                    $(this).val("评价内容");
                    $(this).removeClass("focus");
                }
            })

            $("#txtarea_con").keyup(function () {
                var len = $(this).val().length;
                if (len>500) {
                    $(this).val($(this).val().substring(0, 500));
                    return;
                }
                var num = 500-len;
                $("#remain_words").text(num).css("color","red");

            });

            function clearall() {
                $("i").removeClass("on");
            }
            var click_num=-1;
            $("i").hover(function () {
               clearall();
               $(this).prevAll("i").addClass("on");
               $(this).addClass("on")

            },function(){
                if(click_num==-1){
                    clearall();
                }else {
                    clearall();
                    for(var i=0;i<=click_num;i++)
                    {
                        $("i").eq(i).addClass("on");
                    }
                }

            }).click(function () {
                click_num = $(this).index();
                $("#level").attr("value",click_num+1);
                clearall();
                for(var i=0;i<=click_num;i++)
                {
                    $("i").eq(i).addClass("on");
                }
            });
        })
    </script>
</head>
<body>
    <form id="form_evaluate" action="addContent" method="post">
        <input name="empid" value="${empid}" style="display: none"/>
        <input name="courseid" value="${courseid}" style="display: none"/>
        <div class="div_eva">
            <div class="start_level"><span>给课程打个星吧</span>
                <input name="level" id="level" value="0" style="display: none"/>
                <div class="starts">
                    <i>★</i>
                    <i>★</i>
                    <i>★</i>
                    <i>★</i>
                    <i>★</i>
                </div>
            </div>
            <div class="evaluate_con">
                <table id="tb_con">
                    <tr>
                        <td style="border: none">
                            <textarea id="txtarea_con" rows="10" cols="40" class="txt" name="content">评价内容</textarea>
                        </td>
                        <td valign="bottom" style="border: none">
                            <span id="remain_words">500</span><span>/500</span>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="submit"><input type="submit" id="bt_submit" value="提交"/></div>
        </div>
    </form>
</body>
</html>
