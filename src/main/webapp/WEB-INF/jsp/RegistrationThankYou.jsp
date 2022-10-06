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
            <div class="row shadow-lg rounded p-5 w-75">
                <div class="col-12">
                    <h1 class="fw-bold display-2 text-center">Congratulations!</h1>
                </div>
                <div class="col-12 mt-5">
                    <p class="display-5">
                        You are now officially registered in the community portal. Thank you for registering, should you have any issue within the platform, do not hesitate to contact our support staff. Have fun exploring the community portal. We wish you the best, we hope you
                        find the features helpful not only for you, but also for your career.
                    </p>
                </div>
                <div class="col-12 mt-5 pt-5">
                    <p class="text-start display-6">Best regards!</p>
                    <p class="text-start display-6">ABC Jobs Support Staff</p>
                </div>
                <div class="d-flex justify-content-center col-12">
                    <a href="/login" type="button" class="btn btn-outline-success px-5 py-3 my-5 rounded-pill">
                        <span class="display-6 p-5 text-uppercase">
                        		Go to Log In
                        	</span>
                    </a>
                </div>
            </div>
        </main>
        <footer>
            <jsp:include page="components/footer.jsp" />
        </footer>
    </body>

    </html>