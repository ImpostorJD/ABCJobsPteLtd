<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
                <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
                        <link rel="stylesheet" href="css/style.css">
                        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
                    	
                    </head>

                    <body>
                        <header id="header" class="fixed-top">
                            <jsp:include page="components/header.jsp" />
                        </header>
                        <div class='container-fluid' style="margin-top: 8rem;">
                            <div class="row">
                                <aside class="col-xl-3 d-none d-xl-block position-fixed start-0 overflow-auto" style = "height:80vh">
                                    <div class="p-4" style="margin-top:2rem;">
                                        <div class="card shadow-sm mb-3">
                                            <div class="card-body">
                                                <div class="d-flex justify-content-center mb-3">
                                                    <div style="height:8vw; width:8vw;" class="border rounded-circle overflow-hidden">
                                                        <c:if test="${userProfile.getProfileImagePath()eq null }">
                                                            <img src="images/sampleimage.jpg" class="w-100 h-100">
                                                        </c:if>
                                                        <c:if test="${ userProfile.getProfileImagePath()ne null}">
                                                            <img src="displayPicture/${userProfile.getProfileImagePath()}" class="w-100 h-100">
                                                        </c:if>
                                                    </div>

                                                </div>
                                                <c:if test="${userProfile.getDisplayName() eq null }">
                                                    <h4 class="card-title text-center">${userProfile.getFirstName().concat(" ".concat(userProfile.getLastName()))}</h4>
                                                </c:if>
                                                <c:if test="${userProfile.getDisplayName() ne null }">
                                                    <h4 class="card-title text-center">${userProfile.getDisplayName() }</h4>
                                                </c:if>

                                                <div class=" d-flex justify-content-end">
                                                    <a href="/Profile?UID=${UID}" class="btn btn-success">View Profile</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card shadow-sm mt-4 p-3" style = "min-height:4vh;">
                                            <div class="card-body list-group w-100 h-100 p-2">
                                                <a href="#" class="list-group-item">Connections</a>
                                                <a href="#" class="list-group-item">Group</a>
                                                <a href="#" class="list-group-item">Events</a>
                                                <a href="#" class="list-group-item">Discover</a>
                                                <c:if test="${userProfile.getRoleID() eq 2 }">
                                                    <a href="/dashboard" class="list-group-item">Go to Admin</a>
                                                    <a href="/jobposting" class="list-group-item">Job Posting</a>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </aside>

                                <!-- main content, post etc -->
                                <main class="col-xl-5 col-12 position-relative start-50 translate-middle-x" id="maincontent">
                                    <div class="py-5">
                                        <div class="card mb-5">
                                            <div class="card-body">
                                                <h3 class="h5 mb-4">Post Content</h3>
                                                <form class="form-group my-3 mx-4">
                                                    <div class="row g-3">
                                                        <div class="col-12">
                                                            <div class="btn btn-outline-light border border-secondary w-100" data-bs-toggle="modal" data-bs-target="#Post-Content" style="height: 4.5rem;"></div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <h1 class="display-3 mb-3">Thread Posts</h1>
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
                                                                    	<form method = "post" action = "/deleteThread?th=${thread.getThreadId()}&${_csrf.parameterName}=${_csrf.token}">
                                                                    		<button class ="btn btn-danger">Delete Thread</button>
                                                                    	</form>                                                  
                                                                    </c:if>
                                                                    <c:if test="${thread.getUserUpvoteInstance() ne null}">
                                                                    	<form method = "post" action = "/downvote?th=${thread.getThreadId()}&${_csrf.parameterName}=${_csrf.token}">
                                                                    		<button class ="btn btn-outline-success mx-1">
                           														<span class="bi bi-arrow-down-square">
			                                               							<span>Downvote</span>
	                                                                            </span>                                         		
                                                                    		</button>
                                                                    	</form>  
                                                                      
                                                                    </c:if>
                                                                    <c:if test="${thread.getUserUpvoteInstance() eq null}">
                                                                    	<form method = "post" action = "/upvote?th=${thread.getThreadId()}&${_csrf.parameterName}=${_csrf.token}">
                                                                    		<button class ="btn btn-success mx-1">
                           														<span class="bi bi-arrow-up-square">
			                                               							<span>Upvote</span>
	                                                                            </span>                                         		
                                                                    		</button>
                                                                    	</form>  
                                                                        
                                                                    </c:if>
                                                                    <a href="/thread/${thread.getThreadId() }" class="btn comment-card-button ">
                                                                        <span class="bi bi-chat-left">
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

                                </main>

                                <!-- Recommended users -->
                                <aside class="col-xl-3 d-none d-xl-block position-fixed end-0" id="recommendedUsers">
                                    <div class="p-3 position-relative" style="top:2rem;">
                                        <div class="card shadow">
                                            <div class="card-header px-5 py-2 bg-transparent">
                                                <h2 class="h5">Who to Follow</h2>
                                            </div>
                                            <div class="card-body overflow-hidden" style="height: 30rem;">
                                                <c:forEach var="test" items="${usersto}">
                                                    <!-- Users contact list-->
                                                    <div class='card mb-4'>
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-3">
                                                                    <div class=" border rounded-circle me-1 overflow-hidden" style="width:4vw; height:4vw;">
                                                                        <c:if test="${test.getProfileImagePath() eq null }">
                                                                            <img src="images/sampleimage.jpg" class="w-100 h-100">
                                                                        </c:if>
                                                                        <c:if test="${ test.getProfileImagePath() ne null}">
                                                                            <img src="displayPicture/${test.getProfileImagePath()}" class="w-100 h-100">
                                                                        </c:if>
                                                                    </div>

                                                                </div>
                                                                <div class="col-9 mt-2 ps-3">
                                                                    <h5 class="h6">
                                                                        ${test.getDisplayName()}
                                                                    </h5>
                                                                </div>
                                                            </div>
                                                            <div class="d-flex justify-content-end me-2">
                                                                <a href="/Profile?UID=${test.getUserID()}" class="card-link text-success stretched-link">View Profile</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </aside>
                            </div>
                            <!-- Post content modal -->
                            <div class="modal fade" id="Post-Content">
                                <div class="modal-dialog modal-dialog-scrollable modal-fullscreen-md-down">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="h4 text-uppercase">Post Content</h4>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" data-bs-target="#Post-Content"></button>
                                        </div>
                                        <div class="modal-body py-2 px-4" style="min-height: 30rem;">
                                            <sf:form class="container-fluid shadow-sm" method="post" action="/postThread" modelAttribute="threadModel">
                                                <div class="row p-3">
                                                    <div class="col-12">
                                                        <div class="d-flex flex-row">
                                                            <div class="border rounded-circle overflow-hidden d-flex justify-content-center" style="height: 5rem; width: 5rem;">
                                                                <c:if test="${userProfile.getProfileImagePath() eq null }">
                                                                    <img src="images/sampleimage.jpg" class="w-100 h-100">
                                                                </c:if>
                                                                <c:if test="${ userProfile.getProfileImagePath()ne null}">
                                                                    <img src="displayPicture/${userProfile.getProfileImagePath()}" class="w-100 h-100">
                                                                </c:if>
                                                            </div>
                                                            <div class="mt-2 ms-3">
                                                                <c:if test="${userProfile.getDisplayName() eq null }">
                                                                    <h4 class="card-title text-center">${userProfile.getFirstName().concat(" ".concat(userProfile.getLastName()))}</h4>
                                                                </c:if>
                                                                <c:if test="${userProfile.getDisplayName() ne null }">
                                                                    <h4 class="card-title text-center">${userProfile.getDisplayName() }</h4>
                                                                </c:if>
                                                                <sf:select class="form-select border rounded-pill mt-2" path="visibility">
                                                                    <option selected value="publicType">Anyone</option>
                                                                    <option value="protectedType" disabled>My connection</option>
                                                                    <option value="privateType" disabled>Only me</option>
                                                                </sf:select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 d-flex flex-column mt-3">
                                                        <div class="form-floating">
                                                            <sf:input class="form-control" name="caption" id="caption" onchange="enablePost()" path="threadName" />
                                                            <label for="caption">Thread Caption</label>
                                                        </div>
                                                        <div class="form-floating my-4">
                                                            <sf:input class="form-control" name="subject" id="subject" onchange="enablePost()" path="subject" />
                                                            <label for="subject">Thread Subject</label>
                                                        </div>
                                                        <div class=" form-floating border rounded shadow w-100 form-outline" style="height: 15rem;">
                                                            <sf:textarea class="form-control w-100 h-100" name="threadbody" rows="4" id="content" onchange="enablePost()" path="content"></sf:textarea>
                                                            <label for="threadbody">Content goes here</label>
                                                        </div>
                                                    </div>                
                                                    <div class="col-12">
                                                        <div class="mt-5 d-flex justify-content-end">
                                                            <button type="submit" class="btn btn-success px-5 py-2 border rounded-pill" id="postButton" disabled>Post</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </sf:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">
               
                            let thname = document.querySelector('#caption');
                            let thsubject = document.querySelector('#subject');
                            let thbody = document.querySelector('#content');
                            let button = document.querySelector("#postButton");

                            function enablePost() {
                                if (thname.value.trim().length != 0 && thsubject.value.trim().length != 0 && thbody.value.trim().length != 0) {
                                    button.removeAttribute("disabled");
                                } else {
                                    button.setAttribute("disabled", true);
                                }
                            }
                        </script>
                       
                    </body>


                    </html>