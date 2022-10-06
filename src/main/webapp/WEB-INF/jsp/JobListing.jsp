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
                        <main class="container-fluid" style="margin-top:3rem;">
                            <h1 class="fw-bold ms-5 mb-5">Available Jobs</h1>
                            <div class="row gy-3 px-5">
                                <c:if test="${Jobs.size()ne 0}">
                                    <c:forEach var="job" items="${Jobs}">
                                        <c:if test="${job.getStatus() ne \"closed\"}">
                                            <div class="card col-12 shadow">
                                                <div class="card-header bg-transparent border-0">
                                                    <h2 class="fw-bold">${job.getJobPosition() }</h2>
                                                </div>
                                                <div class="card-body row gy-3">
                                                    <div class="col-12 row ps-4">
                                                        <div class="col-lg-4 col-md-8 col-12 border rounded-3 p-2">
                                                            <div class="row">
                                                                <div class="col-6">
                                                                    <span class="bi bi-pen-fill">
								     					<span class ="ms-2 fw-bold">Author:</span>
                                                                    </span>
                                                                </div>
                                                                <div class="col-6">
                                                                    ${job.getAuthor()}
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-6">
                                                                    <span class="bi bi-building">
								     					<span class ="ms-2 fw-bold">Company:</span>
                                                                    </span>
                                                                </div>
                                                                <div class="col-6">
                                                                    ${job.getCompany()}
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-6">
                                                                    <span class="bi bi-cash-stack">
								     					<span class ="ms-2 fw-bold">Salary:</span>
                                                                    </span>
                                                                </div>
                                                                <div class="col-6">
                                                                    ${job.getSalary()}
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-6">
                                                                    <span class="bi bi-calendar">
								     					<span class ="ms-2 fw-bold">Date Posted:</span>
                                                                    </span>
                                                                </div>
                                                                <div class="col-6">
                                                                    ${job.getPosted()}
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-6">
                                                                    <span class="bi bi-calendar-check-fill">
								     					<span class ="ms-2 fw-bold">Application Deadline:</span>
                                                                    </span>
                                                                </div>
                                                                <div class="col-6">
                                                                    ${job.getDeadline()}
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-6">
                                                                    <span class="bi bi-clipboard">
								     					<span class ="ms-2 fw-bold">Status:</span>
                                                                    </span>
                                                                </div>
                                                                <div class="col-6">
                                                                    ${job.getStatus()}
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="border rounded-3 p-2" style="min-height:15rem;">
                                                            ${job.getJobOverview()}
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-footer bg-transparent border-0">
                                                    <div class="d-flex justify-content-end">
                                                        <c:if test="${userProfile.getRoleID() eq 2}">
                                                            <form method="post" action="/deletejobentry?id=${job.getJobId()}">
                                                                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                                                                <button type="submit" class="btn btn-danger me-3">Delete Job Post</button>
                                                            </form>
                                                        </c:if>
                                                        <a href="/Details/Job/${job.getJobId()}" class="btn btn-success mb-2">View Details</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </main>
                    </body>

                    </html>