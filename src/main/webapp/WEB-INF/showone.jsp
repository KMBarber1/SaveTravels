<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Details Page</title>

</head>
<body>

	<a href="/">Go back</a>

	<h2>Expense Details</h2>
	
	<div>
		<p>Expense Name: <c:out value="${expense.expenseName}"/><p>
		<p>Expense Description: <c:out value="${expense.description}"/></p>
		<p>Vendor: <c:out value="${expense.vendor}"/></p>
		<p>Amount Spent: <c:out value="${expense.amount}"/></p>
	</div>

</body>
</html>