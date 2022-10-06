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
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
                    <style>
                        .comment-card-button {
                            border-color: rgb(11, 172, 11)!important;
                            display: inline-block !important;
                            padding: 0 0.5rem 0 !important;
                            text-decoration: none !important;
                            color: rgb(11, 172, 11) !important;
                        }
                        
                        .comment-card-button:hover {
                            border-color: rgba(11, 172, 11, 0);
                            background-color: rgb(11, 172, 11) !important;
                            color: white !important;
                        }
                        
                        .profile-overflow {
                            overflow: hidden !important;
                        }
                        
                        .profile-overflow:hover {
                            overflow: auto !important;
                        }
                        
                        .tab-options.nav-link {
                            color: #157347 !important;
                            transition: 500ms;
                        }
                        
                        .tab-options.nav-link:hover {
                            border: solid 1px #157347 !important;
                            border-bottom: solid 1px white !important;
                            transition: 500ms;
                        }
                        
                        .tab-options.nav-link.active {
                            border: solid 1px #157347 !important;
                            background-color: #157347 !important;
                            color: white !important;
                            transition: 500ms;
                        }
                    </style>
                </head>

                <body>
                    <header class="fixed-top">
                        <jsp:include page="components/header.jsp" />
                    </header>
                    <div class='container-fluid p-5' style="margin-top: 8rem;">

                        <div class="card shadow">
                            <div class="card-header bg-transparent border-0">
                                <div class="d-flex flex-row">
                                    <h1>Education</h1>
                                    <div class="d-flex flex-fill justify-content-end">
                                        <c:if test="${UID eq educationDisplayUserId }">
                                            <a href="#educationForm" class="bi bi-plus h1" data-bs-toggle="modal">
                                            </a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body py-1 px-5">
                                <c:if test="${Educations.size() ne 0 }">
                                    <c:forEach var="education" items="${Educations}">
                                        <div class="card m-5">
                                            <div class="card-header bg-transparent border-0">
                                                <div class="d-flex flex-row">
                                                    <div class="d-flex flex-column">
                                                        <span class="fw-bold">${education.getSchoolName()}</span>
                                                        <span>${education.getDegree()}</span>
                                                    </div>
                                                    <div class="flex-fill d-flex justify-content-end">
                                                        <span class="text-muted">${education.getYearStart()} - ${education.getYearEnd()}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:if test="${education.getAchievement() ne \"none\"}">
                                                <div class="card-body">
                                                    <span class="fw-bold">Achievements</span>
                                                    <ul>
                                                        <c:forEach var="achievement" items="${education.getAchievements()}">
                                                            <li>
                                                                <c:out value="${achievement }" />
                                                            </li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                            </c:if>
                                            <c:if test="${education.getUserId() == UID }">
                                                <div class="card-footer bg-transparent border-0">
                                                    <div class="d-flex justify-content-end">
                                                        <a href="/deleteEducationBackground?e=${education.getEbId()}" class="btn btn-danger">Delete Education Background</a>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>

                    </div>
                    <c:if test="${ UID eq educationDisplayUserId}">
                        <div class="modal fade" id="educationForm" data-bs-backdrop="static">
                            <div class="modal-dialog modal-dialog-scrollable modal-fullscreen-md-down">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h2>Education Form</h2>
                                        <button class="btn btn-close" data-bs-dismiss="modal" data-bs-target="#educationForm"></button>
                                    </div>
                                    <div class="modal-body p-5">
                                        <sf:form class="row gy-3" method="post" action="/addEducationBackground" modelAttribute="education">
                                            <div class="col-12">
                                                <div class="alert alert-info">
                                                    <h1>Info!</h1>
                                                    <p>Please separate your achievements with comma "," and if you don't have any achievements, leave the achievements empty</p>
                                                </div>
                                            </div>
                                            <div class="col-12 form-floating">
                                                <sf:input class="form-control" id="School" onChange="enableSubmit()" path="schoolName" />
                                                <label for="School" class="ms-2">School/University</label>
                                            </div>
                                            <div class="col-12 form-floating">
                                                <sf:input class="form-control" id="Degree" onChange="enableSubmit()" path="degree" />
                                                <label for="Degree" class="ms-2">Degree</label>
                                            </div>
                                            <div class="col-12 form-floating">
                                                <sf:select class="form-select" id="YearStart" onChange="enableSubmit()" path="yearStart">
                                                    <option value="selected" selected disabled>select a year</option>
                                                </sf:select>
                                                <label for="YearStart" class="ms-2">Year Start</label>
                                            </div>
                                            <div class="col-12 form-floating">
                                                <sf:select class="form-select" id="YearEnd" onChange="enableSubmit()" path="yearEnd">
                                                    <option value="selected" selected disabled>select a year</option>
                                                </sf:select>
                                                <label for="YearEnd" class="ms-2">Year End</label>
                                            </div>
                                            <div class="col-12 form-floating">
                                                <sf:textarea id="Achievements" class="w-100 form-control" style="min-height:10rem;" onChange="enableSubmit()" path="achievement"></sf:textarea>
                                                <label for="Achievements" class="ms-2">Achievements</label>
                                            </div>
                                            <div class='col-12'>
                                                <div class="d-flex justify-content-end">
                                                    <button class="btn btn-success" type="submit" id="educSubmit" disabled>Submit</button>
                                                </div>
                                            </div>
                                        </sf:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <script>
                        let yearStart = document.getElementById('YearStart');
                        let yearEnd = document.getElementById('YearEnd');

                        let currentYear = new Date().getFullYear();
                        let earliestYear = 1922;

                        while (currentYear >= earliestYear) {
                            let dateOptionStart = document.createElement('option');
                            let dateOptionEnd = document.createElement("option");
                            dateOptionStart.text = currentYear;
                            dateOptionStart.value = currentYear;
                            dateOptionEnd.text = currentYear;
                            dateOptionEnd.value = currentYear;
                            yearEnd.add(dateOptionEnd);
                            yearStart.add(dateOptionStart);
                            currentYear -= 1;
                        }

                        function enableSubmit() {
                            let school = document.getElementById("School");
                            let degree = document.getElementById("Degree");
                            let yearStart = document.getElementById("YearStart");
                            let yearEnd = document.getElementById('YearEnd');
                            let submitButton = document.getElementById('educSubmit');

                            if (school.value.trim().length == 0 || degree.value.trim().length == 0 || yearStart.value == "selected" ||
                                yearEnd.value == "selected") {
                                submitButton.setAttribute("disabled", true);
                            } else {
                                submitButton.removeAttribute("disabled");
                            }
                        }
                    </script>
                </body>

                </html>