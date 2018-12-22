<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
    <link rel="stylesheet" href="Assets/CSS/support1.css">
    <link rel="stylesheet" href="Assets/CSS/support2.css">
    <link rel="stylesheet" href="Assets/CSS/register.css">

</head>

<body id="login" style="background-image: url(Assets/Images/login.jpg)">
<%	 	
		HttpServletResponse httpResponse = (HttpServletResponse)response;
 		httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
 		httpResponse.setHeader("Pragma", "no-cache"); // HTTP 1.0.
 %>
    <div class="container"">
        <div class="row tm-register-row tm-mb-35">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 tm-login-l">
                <form method="POST" action="/costestimator/login" class="tm-bg-black p-5 h-100" name="login_form">
                    <div class="input-field">
                        <input placeholder="Username" id="username" name="username" type="text" class="validate" title="Should contain alphabet only" required>
                    </div>
                    <div class="input-field mb-5">
                        <input placeholder="Password" id="password" name="password" type="password" class="validate" title="Should contain alphabet only" required>
                    </div>
                    <div class="tm-flex-lr">
                        <a href="register.jsp" style="font-size: 18px;">Register Yourself</a>
                        <button type="submit" style="padding-left:3.5rem!important; border-radius: 12px; padding-right:3.5rem!important"class="waves-effect btn-large btn-large-white black-text">Login</button>
                    </div>
                </form>
            </div>
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 tm-login-r">
                <header class="font-weight-light tm-bg-black p-5 h-100">
                    <h3 class="mt-0 text-white font-weight-light">Login Here</h3>
                    <p>Cost Estimator is a free website for friends and roommates to track bills and other shared expenses,
                     so that everyone gets paid back..
                    <p class="mb-0">To continue, login here..</p>
                </header>
            </div>
        </div>
    </div>

    <script src="Assets/JS/jquery-3.2.1.slim.min.js"></script>
    <script src="Assets/JS/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            $('select').formSelect();
        });
    </script>
</body>

</html>