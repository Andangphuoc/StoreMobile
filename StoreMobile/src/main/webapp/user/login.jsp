<%-- 
    Document   : login
    Created on : Oct 30, 2023, 11:04:14 AM
    Author     : Le Tan Kim
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <base href="http://localhost:8080/" />
        <link rel="icon" type="image/x-icon" href="./uploads/base/favicon.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login</title>
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="./user/assets/css/style.css" />
        <link rel="stylesheet" href="./user/assets/css/base.css" />
        <link rel="stylesheet" href="./user/assets/css/footer.css">
        <link rel="stylesheet" href="./user/assets/css/account.css">
        <link rel="stylesheet" href="./user/assets/css/form.css">
        <link rel="stylesheet" href="./user/assets/css/toast.css">
        <link rel="stylesheet" href="./user/assets/css/responsive.css" />
    </head>
    <body>
        <%@include file="components/header.jsp" %>
        <div id="toast"></div>
        <main>
            <section class="img-account">
                <img src="https://wphix.com/template/dukamarket/dukamarket/assets/img/banner/page-banner-4.jpg" alt="">
                <div class="box-img-account">
                    <h1>MY ACCOUNT</h1>
                    <ul>
                        <li><a style="color: #666;" href="">Home</a></li>
                        &#47;
                        <li><a href="">My account</a></li>
                    </ul>
                </div>
            </section>
            <section class="all-box-create-log">

                <!-- section box information -->
                <section class="form-inf">
                    <!-- Pills navs -->
                    <ul class="nav nav-pills nav-justified mb-3">
                        <li class="nav-item-auth" role="presentation">
                            <a class="nav-link-auth active text-uppercase" id="tab-login">Login</a>
                        </li> 
                        <li class="nav-item-auth" role="presentation">
                            <a href="/auth/register"class="nav-link-auth text-uppercase" id="tab-login">Register</a>
                        </li> 
                    </ul>
                    <!-- Pills navs -->
                    <!-- Pills content -->
                    <div class="tab-content" id="login-active-show">
                        <div class="tab-pane fade show active" id="pills-login" role="tabpanel" aria-labelledby="tab-login">
                            <form id="form-login" action="/auth/login" method="post">
                                <!-- Email input -->
                                <div class="form-outline form-group mb-4">
                                    <label for="loginName">Username</label>
                                    <input type="text" id="loginName" name="loginName" class="form-control" />
                                    <span class="message_error"></span>
                                </div>
                                <!-- Password input -->
                                <div class="form-outline form-group mb-4">
                                    <label for="loginPassword">Password</label>
                                    <input type="password" id="loginPassword" name="loginPassword" class="form-control" />
                                    <span class="message_error"></span>
                                </div>
                                <!-- 2 column grid layout -->
                                <div class="row mb-4 box-config-account">
                                    <div class="col-6 d-flex justify-content-center">
                                        <!-- Checkbox -->
                                        <div class="form-check mb-3 mb-md-0">
                                            <input name="remember" class="form-check-input" type="checkbox" value="" id="loginCheck"
                                                   checked />
                                            <label class="form-check-label" for="loginCheck"> Remember me </label>
                                        </div>
                                    </div>
                                    <div class="col-6 d-flex justify-content-center">
                                        <!-- Simple link -->
                                        <a href="/forget-password">Forgot password?</a>
                                    </div>
                                </div>
                                <!-- Submit button -->
                                <button id="login-btn" type="submit" name="submitLogin"  class="btn btn-primary btn-submit-form">Sign in</button>
                                <!-- Register buttons -->
                            </form>
                        </div>
                    </div>
                </section>
            </section>
        </main>
        <%@include file="components/footer.jsp" %>
        <script
            src="https://code.jquery.com/jquery-3.7.0.js"
            integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
            crossorigin="anonymous"
        ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./user/assets/js/app.js"></script>
        <script src="./user/assets/js/validator.js"></script>
        <script src="./user/assets/js/toast.js"></script>
        <script>
            <c:if test="${messageSuccessRegister != null}">
            showSuccess("${messageSuccessRegister}");
            </c:if>
            <c:if test="${messageUserAuth != null}">
            showError("${messageUserAuth}");
            </c:if>
// validation form
            const messageUsername = "Username must be form 6 to 100 character",
                    messagePassword = "Password must greater 8 character";
            const username = document.getElementById('loginName'),
                    password = document.getElementById('loginPassword');
            const inputsToValidateLogin = [
                {element: username, message: messageUsername, regex: /^[a-zA-Z0-9.,!#$%&'*+/=?^_]{6,100}$/},
                {element: password, message: messagePassword, regex: /^[a-zA-Z0-9.,!#$%&'*+/=?^_]{8,}$/}
            ];
            validation(inputsToValidateLogin, document.querySelector("#login-btn"));
        </script>
    </body>
</html>