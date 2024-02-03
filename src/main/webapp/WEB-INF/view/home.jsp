<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Customer Management System</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="addCust">Add Customer</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="register">Register</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="login">Login</a>
        </li>
      </ul>   
    </div>
  </div>
</nav>

<div class="container p-4">
        <div class="row">
          <div class="col-md-12">
          <div class="card">
            <div class="card-header text-center">
             <h4>All Customer Details</h4>
             <c:if test="${not empty msg}">
                        <div class="alert alert-success">${msg}</div>
                        <c:remove var="msg"/>
                    </c:if>
            </div>
              <div class="card-body">        
                <table class="table">
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Full Name</th>
      <th scope="col">Address</th>
      <th scope="col">Email</th>
      <th scope="col">Password</th>
      <th scope="col">Designation</th>
      <th scope="col">Salary</th>
        <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${custList }" var="cust">
    <tr>
      <th scope="row">${cust.id }</th>
      <td>${cust.fullName }</td>
      <td>${cust.address }</td>
      <td>${cust.email }</td>
      <td>${cust.password }</td>
      <td>${cust.designation }</td>
      <td>${cust.salary }</td>
      <td>
      <a href="editCust/${cust.id }" class="btn btn-sm btn-primary">Edit</a>
      <a href="deleteCust/${cust.id }" class="btn btn-sm btn-danger">Delete</a>
      </td>
    </tr>
   </c:forEach>
  
  </tbody>
</table>
              </div>
          </div>
          </div>
        </div>
        
</body>
</html>