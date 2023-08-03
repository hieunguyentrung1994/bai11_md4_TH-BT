<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>\
<%--<%!--%>
<%--int count;--%>
<%--public void jspInit(){--%>
<%--  count = 0;--%>
<%--  System.out.println("khoiwr taoj jsp");--%>
<%--}--%>
<%--%>--%>
<!DOCTYPE html>
<html>
<head>
  <title>JSP life cycle</title>
</head>
<body>

<c:out value="hoa hậu ý nhi free hugk"></c:out>
<c:set var="count" value="${1}" ></c:set>
<c:out value="${count+12}"></c:out>
</body>
</html>