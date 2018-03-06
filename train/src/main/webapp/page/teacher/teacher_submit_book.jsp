<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2017/4/26
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"></c:set>
<html>
<head>
    <title>企业员工培训管理系统</title>
    <script type="text/javascript" src="${ctxStatic}/jquery/jquery-3.2.1.min.js"></script>
    <style type="text/css">
        .div_con {
            margin-left: 300px
        }

        .title_label {
            float: left
        }

        #bookname_label {
            font-family: "Fira Code Medium",serif;
            font-size: 35px;
            margin-left: 70px;
            color: black
        }

        .div_bookname, .div_author, .div_publisher, .div_publish_num, .div_publish_date, .div_price {
            margin: 20px
        }

        #bookname, #author, #publisher, #publish_num, #publish_date, #price {
            width: 300px;
            height: 40px;
            margin: 3px auto;
        }

        #bt_submit_book, #reset {
            height: 30px;
            width: 80px;
            margin: 20px;
            border-right: solid;
            text-align: center
        }

        #bt_submit_book {
            background-color: lightblue;
            color: #fff;
        }

        #reset {
            background-color: #aaaaaa;
            color: lightblue;
        }

        .txt {
            color: #ccc
        }

        .focus {
            color: #000
        }

        span {
            font-size: 0.1px;
            color: red
        }
    </style>
    <script type="text/javascript">
        function check() {
            if ($("#bookname").val()=="" || $("#bookname").val()=="书名" || $("#author").val()=="" || $("#author").val()=="作者"
            || $("#publisher").val()=="" || $("#publisher").val()=="出版社" || $("#publish_num").val()=="" || $("#publish_num").val()=="出版号"
                || $("#price").val()=="" || $("#price").val()=="价格")
            {     alert("请输入完整信息!");
                return false;
            }
            return true;

        };
        $(function () {
            $("#bookname,#author,#publisher,#publish_num,#price").focus(function () {
                if ($(this).val() == this.defaultValue) {
                    $(this).val("");
                    $(this).addClass("focus");
                }
            }).blur(function () {
                if ($(this).val() == "") {
                    $(this).val(this.defaultValue).removeClass("focus");
                }
                if ($(this).val()=="" || $(this).val()==this.defaultValue){
                    var text = "请输入"+this.defaultValue;
                    $(this).siblings("span").text(text);
                }
                else {
                    $(this).siblings("span").text("");
                }
            });
            var publish_time = new Date();
            var year = publish_time.getFullYear();
            var month = publish_time.getMonth();
            if (month < 10) {
                $("#publish_date").attr("value", year + "-0" + month);
            } else {
                $("#publish_date").attr("value", year + "-" + month);
            }

            $("#reset").click(function () {
                $("#bookname,#author,#publisher,#publish_num,#price").val(this.defaultValue);
                $("#bookname,#author,#publisher,#publish_num,#price").removeClass("focus");
            });
        })
    </script>

    <script type="text/javascript">
        //返回信息
        $('#form_personinfo').ajaxForm({
            success: showResponse //成功返回
        });
        function showResponse(responseText, statusText, xhr, $form){
            console.log(statusText);
            console.log(responseText);
            if(statusText=="success"){
                if(responseText.success==true){
                    alert(responseText.msg);
                }else{
                    alert(responseText.msg);
                }
            }else{
                alert(statusText);
            }
        }
    </script>

</head>
<body>
<form action="textbook/addbook" id="form_submit_book" method="post" onsubmit="return check()">
    <div class="title_label"><span id="bookname_label">${course.getCourseName()}</span></div>
    <input style="display: none" name="courseid" value="${course.getCourseId()}"/>
    <div class="div_con">
        <div class="div_bookname">
            <input type="text" id="bookname" name="bookname" value="书名" class="txt"/><span></span>
        </div>
        <div class="div_author">
            <input type="text" id="author" name="author" value="作者" class="txt"/><span></span>
        </div>
        <div class="div_publisher">
            <input type="text" id="publisher" name="publisher" value="出版社" class="txt"/><span></span>
        </div>
        <div class="div_publish_num">
            <input type="text" id="publish_num" name="version" value="版本号"
                                            class="txt"/><span></span>
        </div>
        <div class="div_publish_date">
            <input type="month" id="publish_date" name="publish_date" title="出版日期" />
        </div>
        <div class="div_price">
            <input type="text" id="price" name="price" value="价格" class="txt"/><span></span>
        </div>
        <div class="bt">
            <input type="submit" id="bt_submit_book" value="提交"/>
            <input type="reset" id="reset" value="重置"/>
        </div>
    </div>
</form>
</body>
<script src="Jscript/jquery.js"></script>
<script src="Jscript/build/jquery.datetimepicker.full.min.js"></script>
<script type="text/javascript">
    jQuery(function() {
        jQuery('#datetimepicker_mask').datetimepicker({
            mask: '9999/19/39 29:59',
        });
    });
</script>
</html>