<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hung1
  Date: 8/1/2023
  Time: 4:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        h1,table,input{
            width: 60%;
            text-align: center;
            margin: 0 auto 50px;
        }
    </style>
</head>
<body>
    <h1>Danh sách sản phẩm</h1>
    <form action="/home-servlet">
    <input type="text" id="search" name="search" width="200px" />
    <input type="submit" value="SEARCH" name="action" />
    </form>
    </br>
    <a href="./view/newProduct.jsp">Add</a>
<table border="10" cellspacing="10" cellpadding="20" style="text-align: center">
<thead>
<tr>
  <th>ID</th>
  <th>Name</th>
  <th>price</th>
  <th>Status</th>
  <th colspan="2">Action</th>
</tr>
</thead>
  <tbody>
        <c:forEach items="${products}" var="s">
            <tr>
                <td>${s.getId()}</td>
                <td>${s.name}</td>
                <td>${s.price}</td>
                <td>${(s.status) ? "đang bàn" : "ngừng bán"}</td>
                <td><a href="/home-servlet?action=EDIT&id=${s.id}">Edit</a></td>
                <td><a onclick="return confirm('Do you want to delete this student ?')" href="/home-servlet?action=DELETE&id=${s.id}">Delete</a></td>
            </tr>
        </c:forEach>
  </tbody>

</table>
</body>
</html>
