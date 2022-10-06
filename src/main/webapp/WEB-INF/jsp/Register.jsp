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
                    </head>

                    <body>
                        <header>
                            <jsp:include page="components/header.jsp" />
                        </header>
                        <main class="container-fluid bg-light">
                            <div class="row" style="min-height:60vw;">
                                <div class="d-none d-lg-block position-relative col-lg-6 col-12 p-5 h-auto" style="background-image:linear-gradient(rgba(155, 255, 137, 0.692),rgba(173, 255, 177, 0.911));
             background-size: cover;">
                                    <img src="images/login.jpg" class="w-100 h-100 position-absolute start-0 top-0" style="opacity:0.3">
                                    <div class="w-100 h-100 position-absolute start-0 top-0 p-5">
                                        <h1 class="display-5 mb-6 text-success fw-bold" style="font-size:3vw">Connect With Peers</h1>
                                        <p class="display-6 text-start text-dark" style="font-size:2.3vw;">
                                            Interact, connect, and collaborate. The community portal serves as the bridge that aims to connect one another with things in common such as industry, interest and more. Be a part of the ever-growing community and take advantage of the benefits that the
                                            website is providing. Job hunting will not be a difficult feat as the ABC Jobs Pte Ltd also takes into account the employment rate, such that here, the job opportunities are more open and diverse.
                                        </p>
                                    </div>
                                </div>
                                <div class="d-flex col-lg-6 col-12 p-5 h-auto justify-content-center" style="background-color: white;">
                                    <div class="p-5 rounded shadow-lg">
                                        <sf:form class="row g-3 gy-5 px-5" method="post" action="/Register" modelAttribute="registerUser">
                                            <div class="col-md-12 form-floating">
                                                <h1 class="display-6 fw-bold text-success">Register</h1>
                                            </div>
                                            <div class="col-md-12 form-floating">
                                                <sf:input type="text" class="form-control" path="firstName" onfocusout="onFocusOut(this)" />
                                                <label for="FNfield" class="form-label ms-2">First Name</label>
                                                <sf:errors path="firstName" cssClass="text-danger" />
                                                <c:set var="fnErr" value="${errorFN}" />
                                                <c:if test="${fnErr ne \"none\"}">
                                                    <span class="text-danger">
					     								${fnErr}
					     							</span>
                                                </c:if>
                                            </div>
                                            <div class="col-md-12 form-floating">
                                                <sf:input type="text" class="form-control" path="lastName" onfocusout="onFocusOut(this)" />
                                                <label for="LNfield" class="form-label ms-2">Last Name</label>
                                                <sf:errors path="lastName" cssClass="text-danger" />
                                                <c:set var="lnErr" value="${errorLN}" />
                                                <c:if test="${lnErr ne \"none\"}">
                                                    <span class="text-danger">
					     								${lnErr}
					     							</span>
                                                </c:if>
                                            </div>

                                            <div class="col-12 form-floating">
                                                <sf:input type="text" class="form-control" path="emailAddress" onfocusout="onFocusOut(this)" />
                                                <label for="email" class="form-label ms-2">Email</label>
                                                <sf:errors path="emailAddress" cssClass="text-danger" />
                                                <c:set var="emErr" value="${errorEmail}" />
                                                <c:if test="${emErr ne \"none\"}">
                                                    <span class="text-danger">
					     								${emErr}
					     							</span>
                                                </c:if>
                                            </div>
                                            <div class="col-md-12 form-floating">
                                                <sf:input type="password" class="form-control" path="password" onfocusout="onFocusOut(this)" />
                                                <label for="PassField" class="form-label ms-2">Password</label>
                                                <sf:errors path="password" cssClass="text-danger" />
                                            </div>
                                            <div class="col-md-12 form-floating">
                                                <input type="password" class="form-control" name="cpw" onfocusout="onFocusOut(this)" />
                                                <label for="ConfirmPassField" class="form-label ms-2">Confirm Password</label>
                                                <c:set var="cpwErr" value="${errorCPW}" />
                                                <c:if test="${cpwErr ne \"none\"}">
                                                    <span class="text-danger">
					     								${cpwErr}
					     							</span>
                                                </c:if>
                                            </div>

                                            <div class="col-12">
                                                <button type="submit" class="btn btn-main p-2 w-100 border rounded-pill">Register</button>
                                            </div>
                                        </sf:form>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <footer>
                            <jsp:include page="components/footer.jsp" />
                        </footer>
                        <!-- Just to remove error highlights -->
                        <script>
                            function onFocusOut(e) {
                                e.classList.remove("is-invalid");
                            }

                            function onCheck() {
                                const errorMessage = document.querySelector("#errorAgreeMsg");
                                errorMessage.classList.add("d-none");
                            }
                        </script>

                    </body>

                    </html>