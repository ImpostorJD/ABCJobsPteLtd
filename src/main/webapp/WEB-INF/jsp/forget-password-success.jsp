<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

        <main class="d-flex justify-content-center p-5" style="min-height: 800px;">
            <div class="container px-5 mx-5">
                <div class="card px-5 mx-5 py-3 shadow-lg">
                    <div class="card-header bg-transparent border border-0">
                        <span class="card-title">
                        <h1 class="display-3 fw-bold text-success text-center">Account Successfully Recovered!</h1>
                    </span>
                    </div>
                    <div class="card-body">
                        <p class="px-5 display-6">
                            You have successfully retrieved your account. Make sure you do not misplace it. Keep it inside a note or use a password manager app.
                        </p>
                        <div class="mt-5">
                            <p class="text-start display-6">Best regards!</p>
                            <p class="text-start display-6">ABC Jobs Support Staff</p>
                        </div>
                    </div>
                    <div class="card-footer bg-transparent border border-0">
                        <div class="px-5 mx-5 d-flex justify-content-center">
                            <a href="/login" class="btn btn-outline-success px-5 py-2 rounded-pill">Go to Log In</a>
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