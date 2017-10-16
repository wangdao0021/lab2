<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>图书信息</title>
</head>
<body>
<body background="bg.jpg">
<h1 style="text-align: center;margin-top: 5%;font-size: 50px">图书信息</h1>
<div style="color: #0088FF;text-align: center;margin-top: 8%;font-size:30px;">
<%@ include file="Mysql.jsp"%>
<%
Mysql m=new Mysql();
m.connect("127.0.0.1",3306,"4dMY31Q7","4dMY31Q7","xHG9tYI9xOJE");
ResultSet rs=m.query("select * from `book` where isbn = \'"+request.getParameter("isbn")+"\'",true);
while(rs.next())
{
    Mysql m2=new Mysql();
    m2.connect("127.0.0.1",3306,"4dMY31Q7","4dMY31Q7","xHG9tYI9xOJE");
    ResultSet ss=m2.query("select * from `author` where `authorid` = "+rs.getInt("authorid"),true);
    ss.next();
%>
	<table border="1">
    <tr>
        <th>name</th>
        <th>age</th>
        <th>country</th>
        <th>isbn</th>
        <th>title</th>
        <th>authorid</th>
        <th>publisher</th>
        <th>publishdate</th>
        <th>price</th>
    </tr>
    <tr>
        <td><%out.println(ss.getString("name"));%></td>
        <td><%out.println(ss.getInt("age"));%></td>
        <td><%out.println(ss.getString("country"));%></td>
        <td><%out.println(rs.getString("isbn"));%></td>
        <td><%out.println(rs.getString("title"));%></td>
        <td><%out.println(rs.getInt("authorid"));%></td>
        <td><%out.println(rs.getString("publisher"));%></td>
        <td><%out.println(rs.getString("publishdate"));%></td>
        <td><%out.println(rs.getInt("price"));%></td>
    </tr>
    </table>
<%
    m2.disconnect();
}
m.disconnect();
%>
<a style="font-size: 20px" href="index.jsp" target="_blank">返回</a>
</div>
</body>
</html>
