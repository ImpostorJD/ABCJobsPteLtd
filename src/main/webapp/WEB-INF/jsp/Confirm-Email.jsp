<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
                <!DOCTYPE html>
                <html>

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
                    <div class="d-flex justify-content-center p-5" style="min-height: 700px;">
                        <div class="row shadow-lg rounded p-5 w-75">
                            <div class="col-12">
                                <h1 class="display-3 fw-bold text-success text-center">Registration Complete</h1>
                            </div>
                            <div class="col-12">
                                <p class="display-6 px-5 mx-5 mt-5">
                                    You are successfully registered. The next step is to click the button below to send a set of instructions to
                                    <c:out value="${user}" />. The instructions will send you a redirection link in which you will be able to activate your account. You are one step closer to a new world.
                                </p>
                            </div>
                            <div class="d-flex justify-content-center col-12">
                                <form action="/verifyUser?${_csrf.parameterName}=${_csrf.token}&email=${user}" method="post">
                                    <button class="btn btn-success px-4 rounded-pill d-flex align-items-center">Activate Account</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <footer>
                        <jsp:include page="components/footer.jsp" />
                    </footer>
                </body>

                </html>