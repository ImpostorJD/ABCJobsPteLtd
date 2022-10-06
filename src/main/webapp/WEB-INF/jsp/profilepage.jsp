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
                    <link rel="icon" type="images/png" href="images/UIF logo header.png">
                    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
                    <script type="text/javascript" src="js/bootstrap.js"></script>
                    <link rel="stylesheet" href="css/style.css">
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
                   
               
                </head>

                <body>
                    <header class="fixed-top">
                        <jsp:include page="components/header.jsp" />
                    </header>
                    <div class='container-fluid' style="margin-top: 8rem;">
                        <div class="row g-3">
                            <div class="col-12">
                                <div class="p-5">
                                    <div class="card shadow" style="min-height: 50vw;">
                                        <div class="card-body px-5 py-4">
                                            <div class="position-relative ">
                                                <div id="img-banner" style="width: 100%; height:30vw;" class="border border-dark rounded overflow-hidden">
                                                    <c:if test="${Profile.getBannerImagePath()eq null }">
                                                        <img src="images/banner-imageplaceholder.png" class="w-100 h-100">
                                                    </c:if>
                                                    <c:if test="${ Profile.getBannerImagePath() ne null}">
                                                        <img src="bannerPicture/${Profile.getBannerImagePath()}" class="w-100 h-100">
                                                    </c:if>
                                                </div>
                                                <div id="DefaultViewImage" class="position-absolute ms-5" style="top:75%">
                                                    <div id="userprofileimageDefault" style="height: 15vw; width: 15vw;" class="border border-dark rounded-circle overflow-hidden">
                                                        <c:if test="${Profile.getProfileImagePath() eq null }">
                                                            <img src="images/sampleimage.jpg" class="w-100 h-100">
                                                        </c:if>
                                                        <c:if test="${Profile.getProfileImagePath() ne null}">
                                                            <img src="displayPicture/${Profile.getProfileImagePath()}" class="w-100 h-100">
                                                        </c:if>
                                                    </div>
                                                    <span class="d-block text-center" style="font-size:2.0112vw">${Profile.getDisplayName()}</span>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="card-footer border-0 pb-3 bg-transparent">
                                            <div class="d-flex justify-content-end">
                                                <c:if test="${(UIDcompare eq UID)}">
                                                    <a href="/edit-profile" class="btn btn-outline-success me-3" style="height:4vw; font-size:1.5vw; width:15vw;">Edit Profile</a>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Profile information -->
                                    <div class="card shadow mt-3" style="min-height: 20rem;">
                                        <div class="card-header bg-transparent border-0">
                                            <nav class="nav nav-tabs border-bottom border-success" id="nav-tab-profile" role="tab-list">
                                                <button class="tab-options nav-link active" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#profile-information" type="button" role="tab" aria-controls="profile-information" aria-selected="true">About</button>
                                                <button class="tab-options nav-link" id="nav-potfolio-tab" data-bs-toggle="tab" data-bs-target="#personal-portfolio" type="button" role="tab" aria-controls="personal-portfolio" aria-selected="false">Portfolio</button>
                                                <button class="tab-options nav-link" id="nav-posts-tab" data-bs-toggle="tab" data-bs-target="#user-posts" type="button" role="tab" aria-controls="user-posts" aria-selected="false">Posts</button>
                                            </nav>
                                        </div>
                                        <div class="card-body p-3 tab-content">
                                            <div id="profile-information" class="tab-pane fade show active" role="tabpanel" aria-labelledby="nav-profile-tab">
                                                <div class="row p-3">
                                                    <div class="col-12 col-md-6">
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <span class="h6">Public Address</span>
                                                            </div>
                                                            <div class="col-6">
                                                                <c:if test="${Profile.getAddress()ne null && Profile.getAddress() ne \"default\"}">
                                                                    <span>${Profile.getAddress()}</span>
                                                                </c:if>
                                                                <c:if test="${Profile.getAddress() eq null || Profile.getAddress() eq \"default\"}">
                                                                    <span class="text-muted">set a public address</span>
                                                                </c:if>
                                                            </div>
                                                            <div class="col-6">
                                                                <span class="h6">Job</span>
                                                            </div>
                                                            <div class="col-6">
                                                                <c:if test="${Profile.getJob()ne null && Profile.getJob() ne \"default\"}">
                                                                    <span>${Profile.getJob()}</span>
                                                                </c:if>
                                                                <c:if test="${Profile.getJob() eq null || Profile.getJob() eq \"default\"}">
                                                                    <span class="text-muted">set a job position</span>
                                                                </c:if>
                                                            </div>
                                                            <div class="col-6">
                                                                <span class="h6">City</span>
                                                            </div>
                                                            <div class="col-6">
                                                                <c:if test="${Profile.getCity()ne null && Profile.getCity() ne \"default\"}">
                                                                    <span>${Profile.getCity()}</span>
                                                                </c:if>
                                                                <c:if test="${Profile.getCity() eq null || Profile.getCity() eq \"default\"}">
                                                                    <span class="text-muted">set a city</span>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <span class="h6">Country</span>
                                                            </div>
                                                            <div class="col-6">
                                                                <c:if test="${Profile.getCountry() ne\"none\" && Profile.getCountry() ne \"none\"}">
                                                                    <span>${Profile.getCountry()}</span>
                                                                </c:if>
                                                                <c:if test="${Profile.getCountry() eq \"none\" || Profile.getCountry() eq \"none\"}">
                                                                    <span class="text-muted">set a country</span>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <span class="h6">Contact Number</span>
                                                            </div>
                                                            <div class="col-6">
                                                                <c:if test="${Profile.getContactNumber()ne null && Profile.getContactNumber() ne \"default\"}">
                                                                    <span>${Profile.getContactNumber()}</span>
                                                                </c:if>
                                                                <c:if test="${Profile.getContactNumber() eq null || Profile.getContactNumber() eq \"default\" }">
                                                                    <span class="text-muted">set a contact number</span>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <span class="h6">Nationality</span>
                                                            </div>
                                                            <div class="col-6">
                                                                <c:if test="${Profile.getNationality()ne \"none\" && Profile.getNationality() ne \"default\"}">
                                                                    <span>${Profile.getNationality()}</span>
                                                                </c:if>
                                                                <c:if test="${Profile.getNationality() eq \"none\" || Profile.getNationality() eq \"default\"}">
                                                                    <span class="text-muted">set a nationality</span>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <span class="h6">Affiliation</span>
                                                            </div>
                                                            <div class="col-6">
                                                                <c:if test="${Profile.getCompany() ne null && Profile.getCompany() ne \"default\"}">
                                                                    <span>${Profile.getCompany()}</span>
                                                                </c:if>
                                                                <c:if test="${Profile.getCompany() eq null || Profile.getCompany() eq \"default\" }">
                                                                    <span class="text-muted">set a company</span>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 mt-5">
                                                        <div class="card">
                                                            <div class="card-header bg-transparent">
                                                                <h4>Biography</h4>
                                                            </div>
                                                            <div class="card-body p-5">
                                                                ${Profile.getBiography() }
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div id="personal-portfolio" class="tab-pane fade" role="tabpanel" aria-labelledby="nav-portfolio-tab">
                                                <div class="row">
                                                    <div class="col-12 mt-3">
                                                        <div class="card">
                                                            <div class="card-header bg-transparent">
                                                                <h4>Education</h4>
                                                            </div>
                                                            <div class="card-body p-5">
                                                                See ${Profile.getDisplayName()}'s educational background.
                                                            </div>
                                                            <div class="card-footer bg-transparent border-0">
                                                                <div class="d-flex justify-content-end">
                                                                    <a href="/education/${Profile.getUserID()}" class="btn btn-outline-success stretched-link">
				                                            			<span class ="bi bi-eye me-2"></span>View Education Details
				                                            		</a>		
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 mt-3">
                                                        <div class="card">
                                                            <div class="card-header bg-transparent">
                                                                <h4>Career</h4>
                                                            </div>
                                                            <div class="card-body p-5">
                                                                See ${Profile.getDisplayName()}'s Career milestone.
                                                            </div>
                                                            <div class="card-footer bg-transparent border-0">
                                                                <div class="d-flex justify-content-end">
                                                                    <a href="/JobExperience/${Profile.getUserID()}" class="btn btn-outline-success stretched-link">
				                                            			<span class ="bi bi-eye me-2"></span>View Career Details
				                                            		</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="user-posts" class="tab-pane fade" role="tabpanel" aria-labelledby="nav-posts-tab">
                                                <c:if test="${Threads.size() ne 0 }">
                                                    <c:forEach var="thread" items="${Threads}">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <!-- Sample Posts-->
                                                                <div class="card my-5">
                                                                    <div class="card-header">
                                                                        <div class="d-flex align-items-center">
                                                                            <div style="height:3rem; width:3rem;" class="border border-dark rounded-circle overflow-hidden">
                                                                                <c:if test="${thread.getAuthorImage()eq null }">
                                                                                    <img src="/images/sampleimage.jpg" class="w-100 h-100">
                                                                                </c:if>
                                                                                <c:if test="${ thread.getAuthorImage()ne null}">
                                                                                    <img src="/displayPicture/${thread.getAuthorImage()}" class="w-100 h-100">
                                                                                </c:if>
                                                                            </div>
                                                                            <div class="ms-2 flex-fill">
                                                                                <h5 class="h5">${thread.getAuthor()}</h5>
                                                                            </div>
                                                                            <div class="d-flex justify-content-end">
                                                                                <p class="text-muted">${thread.getPosted()}</p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="card-body main-posted">
                                                                        <h5 class="card-title display-6 fw-bold">${thread.getThreadName() }</h5>
                                                                        <!-- title -->
                                                                        <span class="badge border rounded-3 bg-success">
								                                        	${thread.getSubject()}
								                                        </span>
                                                                        <div class="container mt-3">
                                                                            <p class="w-100">
                                                                                ${thread.getContent()}
                                                                            </p>
                                                                            <!-- content -->
                                                                        </div>
                                                                    </div>
                                                                    <div class="card-footer bg-transparent">
                                                                        <div class="d-flex justify-content-end">
                                                                            <c:if test="${userProfile.getUserID() eq thread.getUserId() }">
	                                                                            <form method = "post" action = "/deleteThreadFromProfile?th=${thread.getThreadId()}&uid=${UIDcompare}&${_csrf.parameterName}=${_csrf.token}">
		                                                                    		<button class ="btn btn-danger">Delete Thread</button>
		                                                                    	</form>                                                                
                                                                            </c:if>
                                                                            <c:if test="${thread.getUserUpvoteInstance() ne null}">
	                                                                            <form method = "post" action = "/downvoteFromProfile?th=${thread.getThreadId()}&uid=${UIDcompare}&${_csrf.parameterName}=${_csrf.token}">
		                                                                    		<button class ="btn btn-outline-success mx-1">
		                           														<span class="bi bi-arrow-down-square">
					                                               							<span>Downvote</span>
			                                                                            </span>                                         		
		                                                                    		</button>
		                                                                    	</form>                                                                          
                                                                            </c:if>
                                                                            <c:if test="${thread.getUserUpvoteInstance() eq null}">
	                                                                            <form method = "post" action = "/upvoteFromProfile?th=${thread.getThreadId()}&uid=${UIDcompare}&${_csrf.parameterName}=${_csrf.token}">
		                                                                    		<button class ="btn btn-success mx-1">
		                           														<span class="bi bi-arrow-up-square">
					                                               							<span>Upvote</span>
			                                                                            </span>                                         		
		                                                                    		</button>
		                                                                    	</form>                                                                               
                                                                            </c:if>
                                                                            <a href ="/thread/${thread.getThreadId() }" class="btn comment-card-button mx-1">
									                                                <span class ="bi bi-chat-left">
									                                                	<span>Comment</span>
									                                                </span>     
									                                        </a>
                                                                        </div>
                                                                        <div class="d-flex justify-content-end my-3">
                                                                            <p class="text-muted me-2"><span class="me-1">${thread.getUpvotes()}</span>Upvote/s</p>
                                                                        </div>
                                                                    </div>

                                                                </div>

                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 
        <div class="modal fade" id="Comments">
            <div class="modal-dialog modal-dialog-scrollable modal-fullscreen-md-down">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="h4 text-uppercase">Comments</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" data-bs-target="#Comments"></button>
                    </div>
                    <div class="modal-body py-2 px-4" style="min-height: 30rem;" id="commentlists">
                        <!-- Retrieve comments from the server...   
                    </div>
                    <div class="modal-footer">
                        <div class="container-fluid py-2 px-4">
                            <div class="row">
                                <div class="col-3">
                                    <img src="../images/sampleimage.jpg" class="border rounded-circle" style="height: 5rem; width: 5rem;">
                                </div>
                                <div class="col-9">
                                    <form class="form d-flex align-items-center" style="height: 5rem;">
                                        <input type="text" class="form-control border rounded-pill shadow">
                                    </form>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end">
                                <button class="btn btn-success">
                                    <span class ="bi bi-chat-dots me-md-1"></span>
                                    <span class ="d-md-inline-block d-none">Comment</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
                    </div>
                </body>

                </html>