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
                        <link rel="stylesheet" href="css/style.css">

                    </head>

                    <body>
                        <header>
                            <jsp:include page="components/header.jsp" />
                        </header>
                        <div class='container-fluid px-5' style="margin-top: 2rem; min-height:40rem;">
                            <div class="row w-100">
                                <div class="col-xl-6 col-12 d-flex align-items-end justify-content-center">
                                    <div class="row gy-3">
                                        <div class="col-12 d-flex justify-content-center">
                                            <div class="d-flex flex-column">
                                                <img src="images/UIF_summative_Logo.png" style="height:3vw;">
                                                <span class="fw-bold text-success text-center text-uppercase">ABC Jobs</span>
                                            </div>
                                        </div>
                                        <div class="col-12 d-flex justify-content-center">
                                            <em class="display-1 text-center text-danger">
            		 							<c:out value ="${code }"/>!
            		 						</em>
                                        </div>
                                        <div class="col-12 d-flex justify-content-center px-5 mx-5">
                                            <span class="text-center display-6">
					            				<c:out value ="${error }"/>, You might be lost, Please head back home and try again.
					            			</span>
                                        </div>
                                        <div class="col-12 d-flex justify-content-center">
                                            <a href="/home" class="display-3 btn btn-success mt-5 border rounded-pill py-3 px-5">Go Home</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-xl-block d-none col-6 flex-fill" style="width:30rem; height:35rem;">
                                    <div class="d-flex justify-content-end" style="z-index:-1;">
                                        <c:set var="image" value="${imgErr}" />
                                        <img src="${image }" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <footer>
                            <jsp:include page="components/footer.jsp" />
                        </footer>
                    </body>

                    </html>