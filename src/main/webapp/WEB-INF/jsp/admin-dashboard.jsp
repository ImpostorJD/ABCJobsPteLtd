<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
                <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <meta charset="ISO-8859-1">
                        <title>ABC Jobs Community Portal</title>
                        <link rel="icon" type="images/png" href="images/UIF logo header.png">
                        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
                        <script type="text/javascript" src="js/bootstrap.js"></script>
                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
                        <link rel="stylesheet" href="css/style.css">
                    </head>

                    <body>
                        <jsp:include page="components/header.jsp" />
                        <main style="min-height:800px;">
                            <nav class="nav nav-tabs border-bottom border-success" id="nav-tab-profile" role="tab-list">
                                <button class="tab-options nav-link link-success active" id="nav-user-tab" data-bs-toggle="tab" data-bs-target="#registeredUsers" type="button" role="tab" aria-controls="registeredUsers" aria-selected="true">Users</button>
                                <button class="tab-options nav-link link-success" id="nav-send-tab" data-bs-toggle="tab" data-bs-target="#writeEmail" type="button" role="tab" aria-controls="writeEmail" aria-selected="false">Write-Email</button>
                                <button class="tab-options nav-link link-success" id="nav-email-tab" data-bs-toggle="tab" data-bs-target="#emailList" type="button" role="tab" aria-controls="emailList" aria-selected="false">Email</button>
                            </nav>
                            <div class="container pt-5 overflow-hidden w-100 pb-5 mb-5">
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="registeredUsers" role="tabpanel" aria-labelledby="nav-user-tab">

                                        <div class="alert alert-warning alert-dismissible fade show" role="alert" id="alert">
                                            <strong class="display 6 fw-bolder">Caution!</strong> You cannot delete yourself or other admin in the dashboard.
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" data-bs-target="#alert" aria-label="Close">
									    	
									  </button>
                                        </div>

                                        <div class="row mt-5 gy-5 overflow-auto border rounded" style="height:60rem;">
                                            <c:forEach var="users" items="${usersList}">
                                                <div class="card col-12 shadow w-100">
                                                    <div class="card-body">
                                                        <div class="d-flex flex-md-row flex-column w-100 align-items-center">
                                                            <div class="border rounded-circle overflow-hidden m-5" style="width:8rem; height:8rem;">
                                                                <c:if test="${users.getProfileImagePath() eq null }">
                                                                    <img src="images/sampleimage.jpg" class="w-100 h-100">
                                                                </c:if>
                                                                <c:if test="${users.getProfileImagePath() ne null }">
                                                                    <img src="displayPicture/${users.getProfileImagePath() }" class="w-100 h-100">
                                                                </c:if>
                                                            </div>
                                                            <div class="row flex-fill">
                                                                <div class="col-4 d-flex align-items-center">
                                                                    <span class="display-6">
															 			<c:if test = "${users.getDisplayName() eq null || users.getDisplayName() eq \"default\"}">
		                                    	 							<span>${users.getFirstName().concat(" ".concat(users.getLastName()))}</span>
	                                                                    </c:if>
	                                                                    <c:if test="${users.getDisplayName() ne null && users.getDisplayName() ne \"default\"}">
	                                                                        <span>${users.getDisplayName()}</span>
	                                                                    </c:if>
                                                                    </span>
                                                                </div>
                                                                <div class="col-8">
                                                                    <div class="border py-2 px-2">
                                                                        <div class="d-flex flex-column">
                                                                            <div class="d-flex flex-row">
                                                                                <span class="fw-bolder me-2">Public Address:</span>
                                                                                <c:if test="${users.getAddress()ne null && users.getAddress() ne \"default\"}">
                                                                                    <span>${users.getAddress()}</span>
                                                                                </c:if>
                                                                                <c:if test="${users.getAddress() eq null || users.getAddress() eq \"default\"}">
                                                                                    <span class="text-muted">set a public address</span>
                                                                                </c:if>
                                                                            </div>
                                                                            <div class="d-flex flex-row">
                                                                                <span class="fw-bolder  me-2">Job Position:</span>
                                                                                <c:if test="${users.getJob()ne null && users.getJob() ne \"default\"}">
                                                                                    <span>${users.getJob()}</span>
                                                                                </c:if>
                                                                                <c:if test="${users.getJob() eq null || users.getJob() eq \"default\"}">
                                                                                    <span class="text-muted">set a job position</span>
                                                                                </c:if>
                                                                            </div>
                                                                        </div>
                                                                        <div class="d-flex flex-row">
                                                                            <span class="fw-bolder  me-2">City:</span>
                                                                            <c:if test="${users.getCity()ne null && users.getCity() ne \"default\"}">
                                                                                <span>${users.getCity()}</span>
                                                                            </c:if>
                                                                            <c:if test="${users.getCity() eq null || users.getCity() eq \"default\"}">
                                                                                <span class="text-muted">set a city</span>
                                                                            </c:if>
                                                                        </div>
                                                                        <div class="d-flex flex-row">
                                                                            <span class="fw-bolder  me-2">Country:</span>
                                                                            <c:if test="${users.getCountry() ne \"none\" && users.getCountry() ne \"default\"}">
                                                                                <span>${users.getCountry()}</span>
                                                                            </c:if>
                                                                            <c:if test="${users.getCountry() eq  \"none\" || users.getCountry() eq \"default\"}">
                                                                                <span class="text-muted">set a country</span>
                                                                            </c:if>
                                                                        </div>
                                                                        <div class="d-flex flex-row">
                                                                            <span class="fw-bolder  me-2">Contact Number:</span>
                                                                            <c:if test="${users.getContactNumber() ne null && users.getContactNumber() ne \"default\" }">
                                                                                <span>${users.getContactNumber()}</span>
                                                                            </c:if>
                                                                            <c:if test="${users.getContactNumber() eq null || users.getContactNumber() eq \"default\" }">
                                                                                <span class="text-muted">set a contact number</span>
                                                                            </c:if>
                                                                        </div>
                                                                        <div class="d-flex flex-row">
                                                                            <span class="fw-bolder  me-2">Nationality:</span>
                                                                            <c:if test="${users.getNationality() ne  \"none\" && users.getNationality() ne \"default\" }">
                                                                                <span>${users.getNationality()}</span>
                                                                            </c:if>
                                                                            <c:if test="${users.getNationality() eq  \"none\" || users.getNationality() eq \"default\" }">
                                                                                <span class="text-muted">set a nationality </span>
                                                                            </c:if>
                                                                        </div>

                                                                        <div class="d-flex flex-row">
                                                                            <span class="fw-bolder  me-2">Affiliation:</span>
                                                                            <c:if test="${users.getCompany() ne null && users.getCompany() ne \"default\" }">
                                                                                <span>${users.getCompany()}</span>
                                                                            </c:if>
                                                                            <c:if test="${users.getCompany() eq null || users.getCompany() eq \"default\" }">
                                                                                <span class="text-muted">set a company</span>
                                                                            </c:if>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="d-flex flex-row w-100 justify-content-end p-3">

                                                            <a href="/Profile?UID=${users.getUserID()}" class="btn btn-success mx-2">
                                                                <span class="bi bi-eye">
														<span class ="ms-2">View</span>
                                                                </span>

                                                            </a>

                                                            <a href="/adminEditProfile?UID=${users.getUserID() }" class="btn btn-outline-success mx-2">
                                                                <span class="bi bi-pencil-square">
														<span class ="ms-2">Edit</span>
                                                                </span>
                                                            </a>

                                                            <form method="post" action="/user-delete?UID=${users.getUserID()}">
                                                                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                                                                <button type="submit" class="btn btn-danger mx-2">
														<span class ="bi bi-trash-fill">
															<span class ="ms-2">Delete</span>
														</span>
													</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>

                                    </div>
                                    <div class="tab-pane fade" id="writeEmail" role="tabpanel" aria-labelledby="nav-send-tab">
                                        <div class="container">
                                            <div class="card shadow">
                                                <div class="card-header py-3 ps-5 bg-transparent border border-0">
                                                    <h1>Send Email</h1>
                                                </div>
                                                <div class="card-body">
                                                    <div class="alert alert-info">
                                                        <h1>INFO!</h1>
                                                        <p>Please separate the recipients with comma ","</p>
                                                    </div>
                                                    <sf:form class="row gy-5" action="/dashboard" method="post" modelAttribute="emailForm">
                                                        <div class="col-12 form-floating">
                                                            <sf:input type="text" name="subject" class="form-control" path="subject" />
                                                            <label for="subject" class="ms-2">Subject:</label>
                                                            <sf:errors path="subject" cssClass="text-danger" />
                                                        </div>
                                                        <div class="col-12 form-floating">
                                                            <sf:input type="text" name="receiver" class="form-control" path="target" />
                                                            <label for="receiver" class="ms-2">Recipient/s:</label>
                                                            <sf:errors path="target" cssClass="text-danger" />
                                                            <c:if test = "${emailError ne null }">
                                                            	<span class ="text-danger">
                                                            		<c:out value="${emailError}"/>
                                                            	</span>                                                            
                                                            </c:if>
                                                        </div>
                                                        <div class="col-12 form-floating" style="min-height:20vw;">
                                                            <sf:textarea name="content" class="form-control w-100 h-100" path="content"></sf:textarea>
                                                            <label for="content" class="ms-2">Content:</label>
                                                            <sf:errors path="content" cssClass="text-danger" />
                                                        </div>
                                                        <div class="col-12">
                                                            <button type="submit" class="btn btn-success w-100"> Submit for Review</button>
                                                        </div>
                                                    </sf:form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="emailList" role="tabpanel" aria-labelledby="nav-email-tab">
                                        <div class="alert alert-danger">
                                            <h1>Caution!</h1>
                                            <p>When approving an email, do not leave the web page until the process is done</p>
                                        </div>
                                        <div class="overflow-auto px-4 border rounded shadow" style="max-height:30rem;">
                                            <table class="table table-bordered w-100">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">ID</th>
                                                        <th scope="col">Email Title</th>
                                                        <th scope="col">Content</th>
                                                        <th scope="col">Target</th>
                                                        <th scope="col">Author</th>
                                                        <th scope="col">Status</th>
                                                        <th scope="col">Approve</th>
                                                        <th scope="col">Junk</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="email" items="${listEmail}">
                                                        <tr>
                                                            <th scope="row">${email.getBulkID()}</th>
                                                            <td>${email.getSubject() }</td>
                                                            <td>
                                                                ${email.getContent()}
                                                            </td>
                                                            <td>
                                                                ${email.getTarget()}
                                                            </td>
                                                            <td>
                                                                ${email.getAuthor()}
                                                            </td>
                                                            <td>
                                                                ${email.getStatus()}
                                                            </td>
                                                            <td>
                                                                <c:if test="${email.getStatus() eq \"sent\" }">
                                                                    <button class="btn btn-outline-success bi bi-send-fill" disabled>Approved</button>
                                                                </c:if>
                                                                <c:if test="${email.getStatus() eq\"draft\" }">
																	<form method = "post" action = "/sendBulk?beid=${email.getBulkID() }&${_csrf.parameterName}=${_csrf.token}">
	                                                                    <button type = "submit" class ="btn btn-outline-success">
	                                                                    	<span class="bi bi-send">
																				<span class ="ms-2">
																					Approve
																				</span>
	                                                                        </span>
	                                                                    </button>
                                                                    </form>  
                                                                </c:if>
                                                            </td>
                                                            <td>
                                                                <form method="post" action="/deleteMail?EID=${email.getBulkID()}">
                                                                    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                                                                    <button class="btn btn-danger">
																		<span class ="bi bi-trash">
																			<span class = "ms-2">
																				Delete
																			</span>
																		</span>
																	</button>
                                                                </form>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <footer>
                            <jsp:include page="components/footer.jsp" />
                        </footer>
                    </body>

                    </html>