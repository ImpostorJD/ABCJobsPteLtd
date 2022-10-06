<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	 		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	        <meta name="viewport" content="width=device-width, initial-scale=1.0">
	        <meta charset="ISO-8859-1">
	        <title>ABC Jobs Community Portal</title>
	        <link rel="icon" type="images/png" href ="images/UIF logo header.png">
	        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	        <script type="text/javascript" src="js/bootstrap.js"></script>
	        <link rel="stylesheet" href="css/style.css">
	</head>
<body>
	<header>
		<jsp:include page = "components/header.jsp"/>
	</header>
    <div class='container-fluid'>
        <div class="row g-3">
            <!-- Search user container -->
            <div class="col-12">
                <div class="p-5">
                    <div class="card shadow">
                        <div class="card-header bg-light bg-gradient">
                            <form class="form-group px-5 py-3" method ="get" action ="/search">
                                <div class="input-group">
                                    <input type="text" class="form-control" name = "search" placeholder="Search a user">
                                    <button type="button" class="input-group-text bi bi-search btn btn-success">
                                    <span class ='mx-2 d-none d-md-inline-block'>Search</span>
                                </button>
                                </div>
                            </form>
                        </div>
                        <div class="card-body py-4" style="min-height:500px;">
                            <h3 class="h2">Search Results</h3>                           
                            <c:if test ="${ retrieveUsers.size() eq 0 }">
	                            <p>
	                                <span class="spinner-grow spinner-grow-sm me-2"></span> No Results Found....
	                            </p>
                            </c:if>
                            <!-- User results -->
                            <div id="Retrieve-Result-Search" class="px-5 mx-5">
                            <c:forEach var ="result" items ="${retrieveUsers}">
                                <div class='card my-4 mx-5'>
                                    <div class="card-body">
                                        <div class="d-flex flex-row">
                                        <div style = "width:10rem; height:10rem" class ="border rounded-circle overflow-hidden me-2">
	                                        <c:if test ="${result.getProfileImagePath() eq null }">
	                                            <img src="images/sampleimage.jpg" class="w-100 h-100">
	                                         </c:if>
	                                          <c:if test ="${result.getProfileImagePath() ne null }">
	                                            <img src="displayPicture/${result.getProfileImagePath() }" class="w-100 h-100">
	                                         </c:if>
                                        </div>
                                            <div class="d-flex align-items-center ms-5">
                                               
		                                         <c:if test = "${result.getDisplayName() eq null || result.getDisplayName() eq \"default\"}">
		                                    	 	<span class="display-5 d-block text-center mt-4">${result.getFirstName().concat(" ".concat(result.getLastName()))}</span>
		                                    	</c:if>
		                                    	<c:if test = "${result.getDisplayName() ne null && result.getDisplayName() ne \"default\"}">
		                                    	 	<span class="display-5 d-block text-center mt-4">${result.getDisplayName()}</span>
		                                    	</c:if>
	                                    
                                        	 </div>
                                        </div>
                                        <div class="d-flex justify-content-end">
                                            <a href="/Profile?UID=${result.getUserID()}" class="card-link btn btn-outline-success">View Profile</a>
                                        </div>
                                    </div>
                                </div>
							</c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
 
</body>

</html>