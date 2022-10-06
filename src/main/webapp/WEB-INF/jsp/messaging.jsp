<%@page import="java.io.PrintWriter"%>
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
                        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
                    	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
                    	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
                    </head>

                    <body>
                        <header>
                            <jsp:include page="components/header.jsp" />
                        </header>
                  		<div class ="row w-100" style ="height:47vw; margin-top:0rem;">
                  			<aside class = "col-lg-3 col-12 h-100 bg-light bg-gradient bg-opacity-25">
                  				<div class ="card bg-transparent border-0 h-100 w-100">
                  					<div class = "card-body overflow-auto bg-transparent">
                  						<div class ="d-flex flex-lg-column flex-row">
                  							<c:if test ="${RegisteredUsers ne null }">
                  								<c:forEach var ="user" items = "${RegisteredUsers}">
                  									<c:if test ="${user.getUserID() ne UID}">
                  										<div class ="col-12 card w-100 h-100 my-lg-3 mx-lg-0 mx-3">
						                  					<div class ="card-body">
						                  						<div class ="d-flex align-items-center flex-row">
						                  							<div class ="border rounded-circle overflow-hidden" style = "height:5rem; width:5rem;">
						                  								 <c:if test="${user.getProfileImagePath()eq null }">
				                                                            <img src="images/sampleimage.jpg" class="w-100 h-100">
				                                                        </c:if>
				                                                        <c:if test="${ user.getProfileImagePath()ne null}">
				                                                            <img src="displayPicture/${user.getProfileImagePath()}" class="w-100 h-100">
				                                                        </c:if>
						                  							</div>
						                  							<span class ="ms-3 fw-bold">
						                  								<c:if test="${ user.getDisplayName() eq null }">
						                                                    <p class="card-title text-center">${user.getFirstName().concat(" ".concat(user.getLastName()))}</p>
						                                                </c:if>
						                                                <c:if test="${user.getDisplayName() ne null }">
						                                                    <p class="card-title text-center">${user.getDisplayName() }</p>
						                                                </c:if>
						                  							</span>
						                  						</div>
						                  					</div>
						                  					<div class ="card-footer bg-transparent border-0 pb-4">
						                  						<div class ="d-flex justify-content-end">
						                  							<a id = "${user.getUserID()}" class ="btn btn-success stretched-link" onclick ="selectUser(this)">Start Messaging</a>
						                  						</div>
						                  					</div>
					                  					</div>
                  									</c:if>
                  								</c:forEach>
                  							</c:if>			
		                  				</div>
                  					</div>
                  				</div>
                  				
                  			</aside>
                  			<main class ="col-lg-9 col-12 h-100 p-5">
                  				<div class ="card">
                  					<div class ="card-header d-none bg-gradient" style="background-color: #c5fac9" id = "chatheader">
                  					</div>
                  					<div class = "card-body overflow-auto" id = "conversation-body" style ="height:30rem;">
                  						<div id="defaultMessage" class = "d-flex justify-content-center align-items-center h-100">
                  							<span class ="text-muted display-5">Please select a conversation</span>
                  						</div>
                  						<div id="noConvo" class = "d-flex justify-content-center align-items-center d-none h-100">
                  							<span class ="text-muted display-5">Please start a conversation</span>
                  						</div>
                  					</div>
                  					<div class ="card-footer bg-transparent d-none" id ="messageform">
                  						<form class ="w-100" id ="messageSend">
                  							<textarea id = "textareaId" class ="form-control w-100" style = "min-height:5rem;" placeholder ="hit enter to send a message"></textarea>
                  						</form>
                  					</div>
                  				</div>
                  			</main>
                  		</div>
                    </body>
                    <script>
	                    //setting up
	                    let userId = ${UID};
	                   	let receiver;
                    </script>
                    <script src = "/js/Message.js"></script>

                    </html>