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
                            <div class="d-none d-lg-block col-lg-6 col-12 h-auto position-relative" style="background-image:linear-gradient(rgba(155, 255, 137, 0.692),rgba(173, 255, 177, 0.911)); background-size: cover;">
                                <div class="position-absolute w-100 h-100 start-0 top-0" style="opacity:0.3;">
                                    <img src="images/login.jpg" class="w-100 h-100">
                                </div>
                                <div class="position-absolute">
                                    <h1 class="mb-6 fw-bold text-success mx-5 mt-3" style="font-size:3vw">Connect With Peers</h1>
                                    <p class="text-start mx-5" style="font-size:2.3vw;">
                                        Interact, connect, and collaborate. The community portal serves as the bridge that aims to connect one another with things in common such as industry, interest and more. Be a part of the ever-growing community and take advantage of the benefits that the
                                        website is providing. Job hunting will not be a difficult feat as the ABC Jobs Pte Ltd also takes into account the employment rate, such that here, the job opportunities are more open and diverse.
                                    </p>
                                </div>

                            </div>
                            <div class="d-flex col-lg-6 col-12 p-5 h-auto justify-content-center" style="background-color: white;">
                                <div class="p-5 rounded shadow-lg" style="height:600px">
                                    <form class="row gy-5" action="/login" method="post" modelAttribute="authUser">
                                        <div class="col-lg-12">
                                            <h1 class="display-6">Sign In</h1>
                                        </div>

                                        <div class="col-12 form-floating">
                                            <input type="text" class="form-control" name="username" />
                                            <label for="EMfield" class="form-label ms-2">Email</label>
                                            <%if (request.getParameter("EM") != null && request.getParameter("EM").equals("empty")){%>
                                                <span class="text-danger">
					                          		email cannot be empty
					                          	</span>
                                           <%}%>
                                           <%if (request.getParameter("error") != null && request.getParameter("error").equals("u")){%>
                                                <span class="text-danger">
					                          		email cannot be found
					                          	</span>
                                           <%}%>
                                        </div>
                                        <div class="col-12 form-floating">
                                            <input type="password" class="form-control" name="password" />
                                            <label for="PassField" class="form-label ms-2">Password</label>
                                            <%if (request.getParameter("PW") != null && request.getParameter("PW").equals("empty")){%>
                                                <span class="text-danger">
					                          		password cannot be empty
					                          	</span>
                                                <%}%>
                                                    <%if (request.getParameter("error") != null && request.getParameter("error").equals("pw")){%>
                                                        <span class="text-danger">
							                          		password is incorrect
							                          	</span>
                                                        <%}%>
                                                            <div class="d-flex justify-content-end">
                                                                <a href="/password-recovery" class="link-primary">Forgot Password</a>
                                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                                            <button type="submit" class="btn btn-success p-3 w-100 border border-0 rounded-pill">Log in</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </main>
                    <footer class="bg-success" style="min-height:300px">
                        <jsp:include page="components/footer.jsp" />
                    </footer>

                </body>

                </html>