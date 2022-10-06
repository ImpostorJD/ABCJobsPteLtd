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
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                </head>

                <body>
                    <header>
                        <jsp:include page="components/header.jsp" />
                    </header>
                    <main class="d-flex justify-content-center p-5" style="min-height: 800px;">
                        <div class="row gy-3 shadow-lg rounded p-5 w-100">
                            <div class="col-12">
                                <h1 class="fw-bold text-center" style="font-size:3vw;">Account Recovery</h1>
                            </div>
                            <div class="col-12">
                                <p class="fw-normal" style="font-size:1.5vw;">
                                    Your identity has been confirmed, please enter a new password below the field. Make sure you do not misplace it. Keep it inside a note or use a password manager app.
                                </p>
                            </div>
                            <form class="col-12 row gy-2 px-5" action="/password-change?email=${email}" method="post" id = "changePassForm">
                                <div class="col-12 form-floating">
                                    <input type="password" class="form-control" name="NewPass">
                                    <label for="NewPass" class="form-label ms-2">New Password</label>
                                    <c:set var="pwError" value="${pwErrorMsg}" />

                                    <c:if test="${pwError ne \"none\"}">
                                        <span class="text-danger">
                							<c:out value ="${pwError}" />
                						</span>
                                    </c:if>

                                </div>
                                <div class="col-12 my-4 form-floating">
                                    <input type="password" class="form-control" name="ConfirmPass">
                                    <label for="ConfirmPass" class="form-label ms-2">Confirm Password</label>
                                    <c:set var="cpwError" value="${cpwErrorMsg}" />
                                    <c:if test="${cpwError ne \"none\"}">
                                        <span class="text-danger">
                							<c:out value = "${cpwError}"/>
                						</span>
                                    </c:if>

                                </div>

                                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                                <div class="col-12">
                                    <button type="submit" class="btn btn-outline-success px-4 rounded-pill w-100">Submit</button>
                                </div>
                            </form>
                        </div>
                    </main>
                    <!-- The Modal -->
                    <div class="modal fade" id="verify" data-bs-backdrop="static">
                        <div class="modal-dialog  modal-fullscreen-sm-down">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">User identification</h4>
                                    <span class="d-none spinner-border" id="loading"></span>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <div class="d-flex flex-column">
                                        <p>You're one step closer, please input the 6-digits code that has been sent to your email to verify your identity.</p>
                                        <form class="mt-5 form-floating">
                                            <input id="verificationcode" class="form-control w-100" />
                                            <label for="verificationcode">Verification Code:</label>
                                            <div class="invalid-feedback">
                                                The verification code is incorrect.
                                            </div>
                                        </form>
                                    </div>
                                </div>

                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-success w-100" id="verifyIdentity">Submit</button>
                                </div>

                            </div>
                        </div>
                    </div>
                    <footer>
                        <jsp:include page="components/footer.jsp" />
                    </footer>
                    <script>
                        $(document).ready(function() {
                            $("#verify").modal("show");
                        })

                        $("#verificationcode").focusout(function() {
                            $("#verificationcode").removeClass("is-invalid");
                        })
                        $("#verifyIdentity").click(function() {
                            $("#loading").toggleClass("d-none");
                            if (${code} != $("#verificationcode").val()) {
                                setTimeout(() => {
                                    $("#loading").toggleClass("d-none");
                                    $("#verificationcode").addClass("is-invalid");
                                }, 2000)
                            } else {
                                $("#verificationcode").removeClass("is-invalid");
                                setTimeout(() => {
                                    $("#loading").toggleClass("d-none");
                                    $("#verify").modal("hide");
                                    $("#verificationcode").addClass("is-valid");
                                }, 2000)

                            }
                        })
                        
                        function preventSubmission(){
                        	let form = document.querySelector("#changePassForm");
                        	
                        	if ($("#verify").modal("show") == true){
                        		form.preventDefault();
                        	}
                        }
                    </script>
                </body>

                </html>