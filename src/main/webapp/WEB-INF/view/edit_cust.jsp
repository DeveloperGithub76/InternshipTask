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
          <a class="nav-link" href="addEmp">Add Customer</a>
        </li>
      </ul>
     
    </div>
  </div>
</nav>

<div class="container p-4">
   <div class="row">
      <div class="col-md-6 offset-md-3">
         <div class="card">
            <div class="card-header text-center">
               <h3>Add Customer</h3>
               <c:if test="${not empty msg }">
                 <h4 class="text-success">${msg}</h4>
           <c:remove var="msg"/>
          </c:if>
            </div>
            <div class="card-body">
               <form action="${pageContext.request.contextPath}/updateCust" method="post">
               <input type="hidden" name="id" value="${cust.id }">
                  <div class="mb-3">
                    <label>Enter Full Name</label>
                    <input type="text" name="fullName" class="form-control" value="${cust.fullName }">
                  </div>
                  <div class="mb-3">
                    <label>Enter Address</label>
                    <input type="text" name="address" class="form-control" value="${cust.address }">
                  </div>
                  <div class="mb-3">
                    <label>Enter Email</label>
                    <input type="text" name="email" class="form-control" value="${cust.email }">
                  </div>
                  <div class="mb-3">
                    <label>Enter Password</label>
                    <input type="text"password"  name="password" class="form-control" value="${cust.password }">
                  </div>
                  <div class="mb-3">
                    <label>Enter Designation</label>
                    <input type="text" name="designation" class="form-control" value="${cust.designation }">
                  </div>
                  <div class="mb-3">
                    <label>Enter Salary:</label>
                    <input type="text" name="salary" class="form-control" value="${cust.salary }">
                  </div>
                  <button class="btn btn-primary">Update</button>
               </form>
            </div>
            </div>
      </div>
   </div>
</div>
</body>
</html>