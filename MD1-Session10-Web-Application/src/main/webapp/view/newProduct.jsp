<%--
  Created by IntelliJ IDEA.
  User: hung1
  Date: 8/1/2023
  Time: 4:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Add new Product</h1>
<form action="/home-servlet" method="post">
  <label for="name">Name</label>
  <input type="text" id="name" name="name">
  <label for="price">Price</label>
  <input type="number" min="0" id="price" name="price">
  <label for="status">status</label>
  <select id="status" name="status">
    <option value="true">True</option>
    <option value="false">False</option>
  </select>
  <input type="submit" value="ADD" name="action"/>
</form>
</body>
</html>
