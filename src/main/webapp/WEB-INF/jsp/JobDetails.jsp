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
                        <link rel="icon" type="images/png" href="/images/UIF logo header.png">
                        <link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
                        <script type="text/javascript" src="/js/bootstrap.js"></script>
                        <link rel="stylesheet" href="/css/style.css">
                    </head>

                    <body>
                        <header>
                            <jsp:include page="components/header.jsp" />
                        </header>
                        <main class="container-fluid p-5">
                            <div class="card p-3">
                                <div class="card-body">
                                    <div class="row gy-2">
                                        <h1> ${jobDetails.getJobPosition()}</h1>
                                        <div class="col-md-4 col-8 border rounded-3 p-2">
                                            <div class="row">
                                                <div class="col-6">
                                                    <span class="bi bi-pen-fill">
					     					<span class ="ms-2 fw-bold">Author:</span>
                                                    </span>
                                                </div>
                                                <div class="col-6">
                                                    ${jobDetails.getAuthor()}
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <span class="bi bi-building">
				     					<span class ="ms-2 fw-bold">Company:</span>
                                                    </span>
                                                </div>
                                                <div class="col-6">
                                                    ${jobDetails.getCompany()}
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <span class="bi bi-cash-stack">
				     					<span class ="ms-2 fw-bold">Salary:</span>
                                                    </span>
                                                </div>
                                                <div class="col-6">
                                                    ${jobDetails.getSalary()}
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <span class="bi bi-calendar">
				     					<span class ="ms-2 fw-bold">Date Posted:</span>
                                                    </span>
                                                </div>
                                                <div class="col-6">
                                                    ${jobDetails.getPosted()}
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <span class="bi bi-calendar-check-fill">
				     					<span class ="ms-2 fw-bold">Application Deadline:</span>
                                                    </span>
                                                </div>
                                                <div class="col-6">
                                                    ${jobDetails.getDeadline()}
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-6">
                                                    <span class="bi bi-clipboard">
				     					<span class ="ms-2 fw-bold">Status:</span>
                                                    </span>
                                                </div>
                                                <div class="col-6">
                                                    ${jobDetails.getStatus()}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 border rounded-3 px-3" style="min-height:10rem;">
                                            <span class="fw-bold d-block" style="font-size:1.34rem;">Overview</span> ${jobDetails.getJobOverview()}
                                        </div>
                                        <div class="col-12 border rounded-3" style="min-height:10rem;">
                                            <span class="fw-bold d-block" style="font-size:1.34rem;">Description</span> ${jobDetails.getDescription()}
                                        </div>
                                        <div class="col-12 border rounded-3" style="min-height:10rem;">
                                            <span class="fw-bold d-block" style="font-size:1.34rem;">Responsibilities</span>
                                            <ul>
                                                <c:forEach var="resp" items="${jobDetails.getResponsibilitiesList()}">
                                                    <li>
                                                        <c:out value="${resp}" />
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                                <div class="card-footer border-0 bg-transparent">
                                    <div class="d-flex justify-content-end">
                                        <c:if test="${isAuthor eq false}">
                                            <c:if test="${canApply ne \"no\"}">
                                                <form method="post" action="/applyForJob/${jobDetails.getJobId()}">
                                                    <input type="hidden" name="userid" value="${UID}" />
                                                    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                                                    <button type="submit" class="btn btn-success px-5 py-2 border rounded-pill">Apply</button>
                                                </form>
                                            </c:if>
                                            <c:if test="${canApply eq \"no\"}">
                                                <button type="submit" class="btn btn-success px-5 py-2 border rounded-pill" disabled>Applied</button>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${isAuthor ne false}">
                                            <button class="btn btn-success px-5 py-2 border rounded-pill" data-bs-toggle="modal" data-bs-target="#applicants">Show Applicants</button>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <c:if test="${isAuthor ne false}">
                            <div class="modal fade" id="applicants">
                                <div class="modal-dialog modal-dialog-scrollable modal-fullscreen">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Applicants</h4>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" data-bs-target="#applicants"></button>
                                        </div>
                                        <div class="modal-body py-3">
                                            <c:forEach var="user" items="${applicants}">
                                                <div class='card my-4 mx-5'>
                                                    <div class="card-body">
                                                        <div class="d-flex flex-row">
                                                            <div style="width:10rem; height:10rem" class="border rounded-circle overflow-hidden me-2">
                                                                <c:if test="${user.getProfileImagePath() eq null }">
                                                                    <img src="/images/sampleimage.jpg" class="w-100 h-100">
                                                                </c:if>
                                                                <c:if test="${user.getProfileImagePath() ne null }">
                                                                    <img src="/displayPicture/${user.getProfileImagePath() }" class="w-100 h-100">
                                                                </c:if>
                                                            </div>
                                                            <div class="d-flex align-items-center ms-5">
                                                                <c:if test="${user.getDisplayName() eq null || user.getDisplayName() eq \"default\"}">
                                                                    <span class="fw-bold d-block text-center mt-4" style="font-size:2vw;">${user.getFirstName().concat(" ".concat(user.getLastName()))}</span>
                                                                </c:if>
                                                                <c:if test="${user.getDisplayName() ne null && user.getDisplayName() ne \"default\"}">
                                                                    <span class="fw-bold d-block text-center mt-4" style="font-size:2vw;">${user.getDisplayName()}</span>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex justify-content-end">
                                                            <form method="post" action="/DeleteApplication/${jobDetails.getJobId()}?u=${user.getUserID()}">
                                                                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                                                                <button type="submit" class="btn btn-danger px-5 py-2 border me-3">Delete Application</button>
                                                            </form>
                                                            <a href="/Profile?UID=${user.getUserID()}" class="card-link btn btn-outline-success">View Profile</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal" data-bs-target="#applicants">Close</button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </body>

                    </html>