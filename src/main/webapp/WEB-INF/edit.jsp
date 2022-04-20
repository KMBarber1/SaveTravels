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
<title>Edit Page</title>

</head>
<body>

	<a href="/">Go back</a>

	<h2>Edit Expense:</h2>

	<div>
		<form:form action="/${expense.id}/edit" method="post" modelAttribute="expense">
		   <input type="hidden" name="_method" value="put">
		   	<p>
		        <form:label path="expenseName">Expense Name:</form:label>
		        <form:errors path="expenseName"/>
		        <form:input path="expenseName"/>
	    	</p>
		    <p>
		        <form:label path="vendor">Vendor:</form:label>
		        <form:errors path="vendor"/>
		        <form:input path="vendor"/>
		    </p>
		   	<p>
		        <form:label path="amount">Amount:</form:label>
		        <form:errors path="amount"/>     
		        <form:input type="amount" path="amount"/>
		    </p> 
		    <p>
		        <form:label path="description">Description:</form:label>
		        <form:errors path="description"/>     
		        <form:textarea path="description"/>
		    </p>   
		    
		    <input type="submit" value="Submit"/>
		    
		</form:form>
	</div>
	
</body>
</html>