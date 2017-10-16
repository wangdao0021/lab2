<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>删除操作</title>
</head>
<body>
<body background="bg.jpg">
<%@ include file="Mysql.jsp"%>
<%
Mysql m=new Mysql();
m.connect("127.0.0.1",3306,"4dMY31Q7","4dMY31Q7","xHG9tYI9xOJE");
m.query("delete from `book` where `isbn` = \'"+request.getParameter("isbn")+"\'",false);
m.disconnect();
%>
<p style="font-size: 40px">删除成功!</p>
<a style="font-size: 20px" href="index.jsp" target="_blank">返回</a>
</div>

</body>
</html>