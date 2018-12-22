<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Register Yourself</title>
	
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
    <link rel="stylesheet" href="Assets/CSS/support1.css">
    <link rel="stylesheet" href="Assets/CSS/support2.css">
    <link rel="stylesheet" href="Assets/CSS/register.css">
</head>

<body id="register" style="background-image: url(Assets/Images/signup.jpg)">
    <div class="container">
        <div class="row tm-register-row">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 tm-register-col-l">
                <form method="POST" action="/costestimator/SignUp" name="signup_form">
                    <div class="mb-2">
                        <label class="mr-4">
                            <input class="with-gap" name="title" type="radio" value="Mr." checked="checked" />
                            <span>Mr.</span>
                        </label>
                        <label class="mr-4">
                            <input class="with-gap" name="title" type="radio" value="Ms." />
                            <span>Ms.</span>
                        </label>
                    </div>

                    <div class="input-field">
                        <input placeholder="First Name" id="first_name" name="first_name" type="text" class="validate" title="Should contain alphabet only" required>
                    </div>
                    <div class="input-field">
                        <input placeholder="Last Name" id="last_name" name="last_name" type="text" class="validate" title="Should contain alphabet only" required>
                    </div>
                    <div class="input-field">
                        <input placeholder="Group ID" id="mobile" name="g_id" type="text" class="validate" title="should contain alphabet only" required>
                    </div>
                    <div class="input-field">
                        <input placeholder="Username" id="email" name="username" type="text" class="validate" title="Should contain alphabet only" required>
                    </div>
                    <div class="input-field">
                        <input placeholder="Password" id="password" name="password" type="password" class="validate" title="Should contain alphabet only" required>
                    </div>
                    <h5 style="font-size: 18px"><a href="login.jsp"> <p> Already have a account ? Click Here. </p></a></h5>
                    <div class="text-right mt-4">
                        <button type="submit" style="border-radius: 12px;" class="waves-effect btn-large btn-large-white px-4 black-text">SUBMIT</button>
                    </div>
                </form>
            </div>
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 tm-register-col-r">
                <header class="mb-5">
                    <h3 class="mt-0 text-white">REGISTER Yourself</h3>
                    <p class="grey-text">Cost Estimator is a free website for friends and roommates 
                    to track bills and other shared expenses, so that everyone gets paid back..</p>
                	<p class="grey-text">So get yourself registered quickly..</p> 
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