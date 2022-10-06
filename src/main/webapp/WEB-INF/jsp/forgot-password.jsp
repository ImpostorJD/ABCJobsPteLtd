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
                    <main class="d-flex justify-content-center p-5" style="min-height:700px;">
                        <div class="container-fluid p-5 mx-5">
                            <div class="card shadow-lg px-5 mx-5">
                                <div class="card-header bg-transparent border-0">
                                    <span class="card-title p-5">
				                        <h1 class = "display-5 fw-bolder text-center">Forgot Password?</h1>
				                    </span>
                                </div>
                                <div class="card-body p-5">
                                    <p class="h2 fw-normal">
                                        Seems like you forgot your password. Kindly enter your email in the field below, that way we will be able to send you an email of set of instructions to recover your account. It is also a way of validating your identity so please bear with us.
                                    </p>
                                </div>
                                <div class="card-footer bg-transparent border-0">
                                    <div class="w-100 d-flex justify-content-center">
                                        <form class="d-flex justify-content-center flex-column mx-5 p-5" style="width: 50%;" action="/password-recovery" method="post">
                                            <label for="Email" class="form-label h5">Email</label>
                                            <input type="email" name="emailInput" class="form-control my-3" id="Email" value="">
                                            <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                                            <c:set var="error" value="${errorMSG}" />
                                            <c:if test="${error ne \"none\"}">
                                                <span class="text-danger mb-5">
			                          	  			${error}
                            					</span>
                                            </c:if>
                                            <button type="submit" class="btn btn-success rounded-pill px-3 w-100">Submit</button>
                                        </form>
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