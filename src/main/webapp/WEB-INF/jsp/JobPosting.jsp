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
                        <main class="container-fluid p-5">
                            <div class="card shadow">
                                <div class="card-header bg-transparent border-0 px-5 py-3">
                                    <h1 class="fw-bold">Job Posting Form</h1>
                                </div>
                                <div class="card-body">
                                    <div class="alert alert-danger">
                                        <em class="fw-bold">Caution!</em>
                                        <p>When adding responsibilities, separate each with semicolon <em>";"</em></p>
                                    </div>
                                    <sf:form class="row gy-5" method="post" action="/createJob" modelAttribute="jobForm">
                                        <div class="col-6 form-floating">
                                            <sf:input name="JobPosition" class="form-control" path="jobPosition" />
                                            <sf:errors path="jobPosition" cssClass="text-danger" />
                                            <label for="JobPosition" class="ms-2">Job Position</label>
                                        </div>
                                        <div class="col-6 form-floating">
                                            <sf:input name="JobCompany" class="form-control" path="company" />
                                            <label for="JobCompany" class="ms-2">Company</label>
                                            <sf:errors path="company" cssClass="text-danger" />
                                        </div>
                                        <div class="col-12 form-floating">
                                            <sf:textarea name="JobOverview" class="form-control" style="min-height:10rem;" path="jobOverview"></sf:textarea>
                                            <label for="JobOverview" class="ms-2">Overview</label>
                                            <sf:errors path="jobOverview" cssClass="text-danger" />
                                        </div>
                                        <div class="col-12 form-floating">
                                            <sf:textarea name="JobDescription" class="form-control" style="min-height:10rem;" path="description"></sf:textarea>
                                            <label for="JobDescription" class="ms-2">Description</label>
                                            <sf:errors path="description" cssClass="text-danger" />
                                        </div>
                                        <div class="col-12 form-floating">
                                            <sf:textarea name="JobResponsibilities" class="form-control" style="min-height:8rem;" path="responsibilities"></sf:textarea>
                                            <label for="JobResponsibilities" class="ms-2">Responsibilities</label>
                                            <sf:errors path="responsibilities" cssClass="text-danger" />
                                        </div>
                                        <div class="col-6 form-floating">
                                            <sf:input name="JobSalary" class="form-control" path="salary" />
                                            <label for="JobSalary" class="ms-2">Salary</label>
                                            <sf:errors path="salary" cssClass="text-danger" />
                                        </div>
                                        <div class="col-6 form-floating">
                                            <sf:input name="JobClose" type="date" class="form-control" path="deadline" />
                                            <label for="JobClose" class="ms-2">Application deadline</label>
                                            <sf:errors path="deadline" cssClass="text-danger" />
                                        </div>
                                        <div class="col-12 d-flex justify-content-end">
                                            <button class="btn btn-success px-5 py-3 border rounded-pill">Submit</button>
                                        </div>
                                    </sf:form>
                                </div>
                            </div>
                        </main>
                        <footer>
                            <jsp:include page="components/footer.jsp" />
                        </footer>

                    </body>

                    </html>