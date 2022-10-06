<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
                <nav class="navbar navbar-expand-lg navbar-light py-3" id="header" style="background-color: #e7f2ed;">

                    <a href="/home" class="navbar-brand ms-2 me-5 pe-5" style="min-width:1vw; display:inline-block;">
                        <img src="/images/UIF_summative_Logo.png" class="ms-2" style="height:5vw;" />
                        <h1 class="h2 d-inline-block text-success text-uppercase">ABC Jobs</h1>
                    </a>


                    <button class="navbar-toggler collapsed me-2" type="button" data-bs-toggle="collapse" data-bs-target="#navs" aria-controls="navs" aria-expanded="false" aria-label="Toggle Navigation">
				        <span class = "navbar-toggler-icon"></span>
				    </button>
                    <div class="navbar-collapse collapse ps-3" id="navs">
                        <!--  for logged in users-->
                        <form class="form-inline my-2 my-md-0 row p-5 w-100" method="get" action="/search">
                            <div class="input-group">
                                <button type="submit" class="btn btn-success input-group-text bi bi-search">
                </button>
                                <input class="form-control me-sm-2" type="text" name="search" placeholder="search">
                            </div>

                        </form>
                        <div class="d-block d-lg-none p-5">
                            <div class="card bg-transparent">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="overflow-hidden border rounded-pill">
                                                <c:if test="${userProfile.getProfileImagePath()eq null }">
                                                    <img src="/images/sampleimage.jpg" class="w-100 h-100">
                                                </c:if>
                                                <c:if test="${ userProfile.getProfileImagePath()ne null}">
                                                    <img src="/displayPicture/${userProfile.getProfileImagePath()}" class="w-100 h-100">
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="col-8">
                                            <div class="d-flex h-100 w-100 align-items-center justify-content-start">
                                                <c:if test="${userProfile.getDisplayName() eq null }">
                                                    <h4 id ="username" class="card-title text-center">${userProfile.getFirstName().concat(" ".concat(userProfile.getLastName()))}</h4>
                                                </c:if>
                                                <c:if test="${userProfile.getDisplayName() ne null }">
                                                    <h4 id = "username" class="card-title text-center">${userProfile.getDisplayName() }</h4>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-end">
                                        <a href="Profile?UID=${UID}" class="btn btn-outline-success stretched-link">View Profile</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <ul class="navbar-nav mx-auto me-5 mt-4">
                            <!--  for logged in users-->
                             <li class="nav-item mx-2">
                                <a href="/message" class="nav-link btn text-success">
                                    <div class="bi bi-chat-fill d-none d-md-block"></div>
                                    <p>Message</p>
                                </a>
                            </li>
                            <li class="nav-item mx-2">
                                <a href="#" class="nav-link btn text-success">
                                    <div class="bi bi-people-fill d-none d-md-block"></div>
                                    <p>Network</p>
                                </a>
                            </li>
                            <li class="nav-item mx-2">
                                <a href="/Jobs" class="nav-link btn text-success">
                                    <div class="bi bi-briefcase d-none d-md-block"></div>
                                    <p>Jobs</p>
                                </a>
                            </li>
                            <li class="nav-item mx-2">
                                <a class="nav-link btn text-success" href="#">
                                    <div class="bi bi-bell d-none d-md-block"></div>
                                    <p>Notifications</p>
                                </a>

                            </li>
                            <li class="nav-item dropdown dropstart mx-2">
                                <a href="#" class="nav-link btn text-success" id="dropdown04" data-bs-toggle="dropdown" aria-haspop="true" aria-expanded="false">
                                    <div class="bi bi-gear d-none d-md-block"></div>
                                    <p>Settings</p>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="dropdown-item d-none d-lg-block" style="width:500px;">
                                        <div class="card bg-transparent">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-4">
                                                        <div class="overflow-hidden border rounded-pill">
                                                            <c:if test="${userProfile.getProfileImagePath()eq null }">
                                                                <img src="/images/sampleimage.jpg" class="w-100 h-100">
                                                            </c:if>
                                                            <c:if test="${ userProfile.getProfileImagePath()ne null}">
                                                                <img src="/displayPicture/${userProfile.getProfileImagePath()}" class="w-100 h-100">
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                    <div class="col-8">
                                                        <div class="d-flex h-100 w-100 align-items-center justify-content-start">
                                                            <c:if test="${userProfile.getDisplayName() eq null }">
                                                                <h4 class="card-title text-center">${userProfile.getFirstName().concat(" ".concat(userProfile.getLastName()))}</h4>
                                                            </c:if>
                                                            <c:if test="${userProfile.getDisplayName() ne null }">
                                                                <h4 class="card-title text-center">${userProfile.getDisplayName() }</h4>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="d-flex justify-content-end">
                                                    <a href="/Profile?UID=${UID}" class="btn btn-outline-success stretched-link">View Profile</a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <c:if test="${userProfile.getRoleID() eq 2 }">
                                        <li class="dropdown-item">
                                            <a href="/dashboard" class="btn btn-outline-success w-100">Go To Admin</a>
                                        </li>
                                        <li class="dropdown-item">
                                            <a href="/jobposting" class="btn btn-outline-success w-100">Post Job</a>
                                        </li>
                                    </c:if>
                                    <li class="dropdown-item">
                                        <a href="/logout" class="btn btn-outline-danger w-100">
                    	Logout
                    	</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                </nav>