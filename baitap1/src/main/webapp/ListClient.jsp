<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 03/08/2023
  Time: 9:30 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        h1 {
            text-align: center;
        }
    </style>
</head>
<body>
<h1><%= "Danh sách khách hàng" %>
</h1>
<table border="1" width="100%">
    <thead>
    <tr>
        <th>Tên</th>
        <th>Ngày Sinh</th>
        <th>Dịa Chỉ</th>
        <th>Ảnh</th>
    </tr>
    </thead>
    <c:forEach items="${Clients}" var="s">
        <tr>
            <td>${s.getName()}</td>
            <td>${s.birthDay}</td>
            <td>${s.address}</td>
            <td style="width: 100px"><img width="30%" , height="30%" src="${s.img}"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
