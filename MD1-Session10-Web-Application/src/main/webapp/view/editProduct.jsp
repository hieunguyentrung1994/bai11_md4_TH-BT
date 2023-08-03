<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: test
  Date: 02/08/2023
  Time: 10:47 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<h1>Edit new Product</h1>
<form action="/home-servlet" method="post">
  <input type = "hidden" name = "action" value="EDIT">
  <input type = "hidden" name="id" value = "${data.id}">id = "${data.id}"  >
  <label for="name">Name </label>
  <input type="text" id="name" name="name" value= "${data.name}">
  <label for="price">Age</label>
  <input type="number" min="0" id="price" name="price"value= "${data.price}">
  <label for="status">status</label>
  <c:choose>
    <c:when test="${data.status}">
      <select id="status" name="status">
        <option value="true" selected>True</option>
        <option value="false">False</option>
      </select>
    </c:when>
    <c:otherwise>
      <select id="status" name="status">
        <option value="true">True</option>
        <option value="false" selected>False</option>
      </select>
    </c:otherwise>
  </c:choose>

  <input type="submit" value="EDIT" name="action"/>
</form>
</body>
</html>
