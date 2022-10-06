<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
        <main class="w-100 position-relative" style="min-height:50vw;">
            <div class="position-absolute w-100 h-100" style="background:rgb(102,255,102); opacity:0.3;">

            </div>
            <div class="position-absolute w-100 h-100">
                <img src="images/community.jpg" class="w-100 h-100" style="opacity:0.35;">
            </div>
            <div class="h-100 w-100 position-absolute">
                <div class="m-5 p-3 h-100">
                    <h1 class="mb-5 fw-bold text-uppercase text-center text-success" style="font-size:4vw;">Welcome to ABC Jobs Community Portal</h1>
                    <div class="row gy-5 justify-content-center">
                        <h3 class="text-center text-success col-12">Inspire, Create, Collaborate, Maintain. Your Story Begins Here</h3>
                        <a href="Register" class="btn btn-success text-uppercase border border-0 rounded-pill p-3 col-12" style="font-size:1.677vw; width:20vw;">Get Started</a>

                    </div>
                </div>
            </div>
        </main>
        <footer>
            <jsp:include page="components/footer.jsp" />
        </footer>
    </body>

    </html>