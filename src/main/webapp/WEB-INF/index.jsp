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
<title>Index Page for Safe Travels</title>

</head>
<body>

	<h1>Save Travels</h1>

	<div>
		<table>
			<thead>
				<tr>
					<th>Expense</th>
					<th>Vendor</th>
					<th>Amount</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="e" items="${expenses}">
					<tr>
						<td><a href="/expenses/${e.id}"><c:out value="${e.expenseName }"/></a></td>
						<td><c:out value="${e.vendor }"/></td>
						<td><c:out value="${e.amount }"/></td>
						<td><a href="/${e.id}/edit">Edit</a><td>
						<td>
						<form action="/${e.id}/delete" method="post">
						    <input type="hidden" name="_method" value="delete">
						    <input type="submit" value="Delete">
						</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div>
	
		<h2>Add an Expense:</h2>
		
		<form:form action="/" method="post" modelAttribute="expense">
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