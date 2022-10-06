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
	<link rel="icon" type="images/png" href ="/images/UIF logo header.png">
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
	<script type="text/javascript" src="/js/bootstrap.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/css/style.css">
</head>

<body>
    <header id="header" class="fixed-top">
    	<jsp:include page = "components/header.jsp"/>
    </header>
    <div class ="row w-100" style ="margin-top:15rem;">
    	<main class ="col-6 p-5">
    		 <div class="card">
		          <div class="card-body">		             
		              <div class="card my-5">
		                    <div class="card-header">
		                           <div class="d-flex align-items-center">
		                                   <div style="height:3rem; width:3rem;" class="border border-dark rounded-circle overflow-hidden">
			                                   <c:if test ="${thread.getAuthorImage()eq null }">
					                               <img src="/images/sampleimage.jpg" class ="w-100 h-100">
					                           </c:if>
					                           <c:if test = "${ thread.getAuthorImage()ne null}">
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
		                           <h5 class="card-title display-6 fw-bold">${thread.getThreadName() }</h5> <!-- title -->
		                                 <span class ="badge border rounded-3 bg-success">
		                                      ${thread.getSubject()}
		                                 </span>
		                           <div class ="container mt-3">    
		                                 <p class ="w-100">
		                                      ${thread.getContent()}
		                                 </p> <!-- content -->
		                           </div>
		                     </div>
		                        <div class="card-footer bg-transparent">
		                             <div class="d-flex justify-content-end">
		                                  <c:if test = "${userProfile.getUserID() eq thread.getUserId() }">
		                                  		<form method = "post" action = "/deleteThread?th=${thread.getThreadId()}&${_csrf.parameterName}=${_csrf.token}">
                                                      <button class ="btn btn-danger">Delete Thread</button>
                                                </form>
		                                  </c:if>
		                                  <c:if test = "${thread.getUserUpvoteInstance() ne null}">
		                                  		<form method = "post" action = "/downvoteFromThreadDetails?th=${thread.getThreadId()}&${_csrf.parameterName}=${_csrf.token}">
                                                      <button class ="btn btn-outline-success mx-1">
                           									<span class="bi bi-arrow-down-square">
			                                               			<span>Downvote</span>
	                                                        </span>                                         		
                                                      </button>
                                                </form> 		                                       
		                                  </c:if>
		                                  <c:if test = "${thread.getUserUpvoteInstance() eq null}">
		                                  	<form method = "post" action = "/upvoteFromThreadDetails?th=${thread.getThreadId()}&${_csrf.parameterName}=${_csrf.token}">
                                                      <button class ="btn btn-success mx-1">
                           									<span class="bi bi-arrow-up-square">
			                                               		<span>Upvote</span>
	                                                        </span>                                         		
                                                      </button>
                                             </form> 			                                      
		                                  </c:if>
		                              </div>
		                              <div class="d-flex justify-content-end my-3">
		                                   <p class="text-muted me-2"><span class ="me-1">${thread.getUpvotes()}</span>Upvote/s</p>
		                              </div>
		                    	</div>
		     			</div>
		            </div>
		       </div>
    	</main>
    	<aside class ="col-6 p-5">
    		<div class ="card">
    			<div class ="card-header bg-transparent">
    				<span class ="fw-bold display-6">Comments</span>
    			</div>
    			<div class ="card-body overflow-auto" style = "height:30rem;">
    				<!-- for each this for comments -->
    				<c:if test = "${threadReplies.size() ne 0 }">
    					<c:forEach var = "reply" items ="${threadReplies}">
    						<div class ="card my-2">
		    					<div class ="card-header bg-transparent">
		    						<div class ="d-flex align-items-center">
		    							<div style="height:3rem; width:3rem;" class="border border-dark rounded-circle overflow-hidden">
					                        <c:if test ="${reply.getAuthorImage() eq null }">
							                     <img src="/images/sampleimage.jpg" class ="w-100 h-100">
							                 </c:if>
							                 <c:if test = "${ reply.getAuthorImage()ne null}">
												  <img src="/displayPicture/${reply.getAuthorImage()}" class="w-100 h-100">
										     </c:if>
				                        </div>
				                        <div class="ms-2 flex-fill">
				                             <h5 class="h5">${ reply.getAuthor()}</h5>
				                        </div>
				                        <div class="d-flex justify-content-end">
				                            <p class="text-muted">${reply.getReplyPosted()}</p>
				                        </div>
		    						</div>
		    					</div>
		    					<div class ="card-body px-5">
		    						<div class ="border rounded-1 p-2">
		    							${reply.getComment() }
		    						</div>
		    					</div>
		    					<c:if test = "${reply.getUserId() == UID}">
		    						<div class ="card-footer bg-transparent border-0">
		    							<div class ="d-flex justify-content-end">
		    								<form method = "post" action = "/deleteReply?RID=${reply.getReplyId()}&thid=${thread.getThreadId()}&${_csrf.parameterName}=${_csrf.token}">
                                                  <button class ="btn btn-outline-danger">
                           								Delete Thread Reply                                        		
                                                  </button>
                                            </form>		    							
		    							</div>
		    						</div>
		    					</c:if>
		    				</div>
    					</c:forEach>
    				</c:if>
    			</div>
    			<div class ="card-footer bg-transparent">
    				  <sf:form class="container-fluid py-2 px-4" method = "post" action ="/commentToThread?thid=${thread.getThreadId()}" modelAttribute="comment">
                            <div class="d-flex">
                                <div class ="d-flex justify-content-center">
                                	<div style ="height:5rem; width:5rem;" class ="border rounded-circle overflow-hidden">
                                		 <c:if test ="${userProfile.getProfileImagePath() eq null }">
				                              <img src="/images/sampleimage.jpg" class ="w-100 h-100">
				                         </c:if>
				                         <c:if test = "${ userProfile.getProfileImagePath()ne null}">
				                              <img src="/displayPicture/${userProfile.getProfileImagePath()}" class ="w-100 h-100">
				                         </c:if>
                                	</div>
                                	<div class ="d-flex align-items-center mx-3">
                                		<p class ="fw-bold">${userProfile.getDisplayName()}</p>
                                	</div>
                                </div>
                                <div class ="flex-fill">
                                    <div class="form d-flex align-items-center" style="min-height: 5rem;">
                                        <sf:textarea class="form-control" path = "comment" onchange ="enableComment(this)"></sf:textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end">
                                <button id ="buttonsubmit" class="btn btn-success" disabled>
                                        <span class ="bi bi-chat-dots me-md-1"></span>
                                        <span class ="d-md-inline-block d-none">Comment</span>
                                </button>
                            </div>
    				</sf:form>
    			</div>
    		</div>
    	</aside>
    </div>
	<script>
		let button = document.querySelector("#buttonsubmit");
		function enableComment(e){
			if (e.value.length != 0){
				button.removeAttribute("disabled");
			}else{
				button.setAttribute("disabled", true);
			}
		}
	</script>
</body>
</html>