<%-- 
    Document   : personal
    Created on : Oct 31, 2023, 12:54:11 AM
    Author     : Le Tan Kim
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="currency" class="Util.CurrencyConverter"></jsp:useBean>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <base href="http://localhost:8080/" />
            <link rel="icon" type="image/x-icon" href="./uploads/base/favicon.png">
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Personal</title>
            <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
            <link rel="stylesheet" href="./user/assets/css/style.css" />
            <link rel="stylesheet" href="./user/assets/css/base.css" />
            <link rel="stylesheet" href="./user/assets/css/footer.css">
            <link rel="stylesheet" href="./user/assets/css/yourCart.css">
            <link rel="stylesheet" href="./user/assets/css/form.css">
            <link rel="stylesheet" href="./user/assets/css/personal.css">
            <link rel="stylesheet" href="./user/assets/css/toast.css">
            <link rel="stylesheet" href="./user/assets/css/responsive.css" />
        </head>
        <body>
        <%@include file="components/header.jsp" %>
        <c:if test="${usernameUser == null}">
            <c:redirect url="/404"/>
        </c:if>
        <c:if test="${usernameUser != personalCurrentUser.username}">
            <c:redirect url="/404"/>
        </c:if>
        <div id="toast"></div>
        <main>
            <div class="container">
                <div class="box-info-personal">
                    <h2 class="personal-title">Your account</h2>
                    <div class="main-info-personal">
                        <div class="group-info-personal">
                            <span class="group-title">
                                Full name: 
                            </span>
                            <span class="group-content">
                                ${personalCurrentUser.fullname == null ? "Not update" : personalCurrentUser.fullname}
                            </span>
                        </div>
                        <div class="group-info-personal">
                            <span class="group-title">
                                Username: 
                            </span>
                            <span class="group-content">
                                ${personalCurrentUser.username}
                            </span>
                        </div>
                        <div class="group-info-personal">
                            <span class="group-title">
                                Email: 
                            </span>
                            <span class="group-content">
                                ${personalCurrentUser.email}
                            </span>
                        </div>
                        <div class="group-info-personal">
                            <span class="group-title">
                                Phone 
                            </span>
                            <span class="group-content">
                                ${personalCurrentUser.phone}
                            </span>
                        </div>
                    </div>
                    <div class="group-btn">
                        <button onclick="showPopup(this)" class="btn-change-info personal">Change information</button>
                        <button onclick="showPopup(this)" class="btn-change-info password">Change password</button>
                    </div>
                    <div class="box-history-order">
                        <h2 class="personal-title">Your history order</h2>
                        <div class="yourCart-table p-0">
                            <div class="container">
                                <div class="wrapper-cart">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">Index</th>
                                                <th scope="col">Fullname</th>
                                                <th scope="col">Phone</th>
                                                <th class="width-15" scope="col">Email</th>
                                                <th class="width-20" scope="col">Address</th>
                                                <th class="width-15" scope="col">Total</th>
                                                <th class="width-10" scope="col">Status</th>
                                                <th scope="col">View</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${bills}" var="bill" varStatus="loopIndex">
                                                <tr>
                                                    <td>${loopIndex.index+ 1}</td>      
                                                    <td>${bill.customerName}</td>      
                                                    <td>${bill.phone}</td>
                                                    <td>${bill.email}</td>
                                                    <td>${bill.address}</td>
                                                    <td>${currency.currencyFormat(bill.total, "$")}</td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${bill.status == 1}">
                                                                <span class="label label-primary">
                                                                    New
                                                                </span>
                                                            </c:when>
                                                            <c:when test="${bill.status == 2}">
                                                                <span class="label label-info">
                                                                    Accept
                                                                </span>
                                                            </c:when>
                                                            <c:when test="${bill.status == 3}">
                                                                <span class="label label-danger">
                                                                    Prepare
                                                                </span>
                                                            </c:when>
                                                            <c:when test="${bill.status == 4}">
                                                                <span class="label label-warning">
                                                                    Delivery
                                                                </span>
                                                            </c:when>
                                                            <c:when test="${bill.status == 5}">
                                                                <span class="label label-success">
                                                                    Finish
                                                                </span>
                                                            </c:when>
                                                            <c:when test="${bill.status == 0}">
                                                                <span class="label label-default">
                                                                    Cancel
                                                                </span>
                                                            </c:when>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <a href="personal/${personalCurrentUser.username}/view-bill/${bill.id}">
                                                            <span><i class='bx bx-show-alt'></i></span>
                                                        </a> 
                                                    </td>
                                                </tr> 
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>  
                        </div>   
                    </div>
                </div>
                <div onclick = "closePopup()" class="overlay-personal"></div>
                <div class="pop-up change-personal">
                    <h2 class="header-pop-up">Change information</h2>
                    <form action="/personal/${personalCurrentUser.username}" id="form-change-info" method="post">
                        <div class="group-input form-group">
                            <label for="#fullname">Full name</label>
                            <input value="${personalCurrentUser.fullname}" type="text" placeholder="Full name" name="fullname" id="fullname" class = 'form-control'>
                            <span class="message_error"></span>
                        </div>
                        <div class="group-input form-group">
                            <label for="#email">Email</label>
                            <input value="${personalCurrentUser.email}" type="email" placeholder="Email" name="email" id="email" class = 'form-control'>
                            <span class="message_error"></span>
                        </div>
                        <div class="group-input form-group">
                            <label for="#phone">Phone</label>
                            <input value="${personalCurrentUser.phone}" type="text" placeholder="Phone" name="phone" id="phone" class = 'form-control'>
                            <span class="message_error"></span>
                        </div>
                        <div class="group-input from-group submit">
                            <button name="btn-update-personal" id="change-personal" onclick="checkFormChangePersonal()" class="btn btn-success btn-change">Change</button>
                        </div>
                    </form>
                </div>
                <div class="pop-up change-password">
                    <h2 class="header-pop-up">Change Password</h2>
                    <form action="/personal/${personalCurrentUser.username}" method="post" id="form-change-password">
                        <div class="group-input form-group">
                            <label for="#oldPassword">Old password: </label>
                            <input type="password" placeholder="Old password" id="oldPassword" name="oldPassword" class="form-control">
                            <span class="message_error"></span>
                        </div>
                        <div class="group-input form-group">
                            <label for="#password">New password: </label>
                            <input type="password" placeholder="New password" id="newPassword" name="newPassword" class="form-control">
                            <span class="message_error"></span>
                        </div>
                        <div class="group-input submit">
                            <button name="btn-update-password" id="update-password-btn" onclick="checkFormChangePassword()" class="btn btn-success btn-change">Change</button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
        <%@include file="components/footer.jsp" %>
        <script src="https://code.jquery.com/jquery-3.7.0.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./user/assets/js/app.js"></script>
        <script src="./user/assets/js/validator.js"></script>
        <script src="./user/assets/js/toast.js"></script>
        <script>
            <c:if test="${updateMessageSuccess != null}">
                                showSuccess("${updateMessageSuccess}");
            </c:if>
            <c:if test="${updateMessageFail != null}">
                                showError("${updateMessageFail}");
            </c:if>
                                const  messageFullname = "Full name can not empty",
                                        messageEmail = "Email is not valid. Ex: domain.@gmail.com",
                                        messagePhone = "Phone is not valid. Ex: 0865341745";

                                const fullname = document.getElementById('fullname'),
                                        email = document.getElementById('email'),
                                        phone = document.getElementById('phone');
                                const inputsToValidatePersonal = [
                                    {element: fullname, message: messageFullname, regex: /^.{1,}$/},
                                    {element: email, message: messageEmail, regex: /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/},
                                    {element: phone, message: messagePhone, regex: /^[0][0-9]{9}$/}
                                ];
                                validation(inputsToValidatePersonal, document.querySelector("#change-personal"));
                                //
                                const  messagePassword = "Password must greater 8 character";
                                const oldPassword = document.getElementById('oldPassword'),
                                        newPassword = document.getElementById('newPassword');
                                const inputsToValidateUpdatePassword = [
                                    {element: oldPassword, message: messagePassword, regex: /^[a-zA-Z0-9.,!#$%&'*+/=?^_]{8,}$/},
                                    {element: newPassword, message: messagePassword, regex: /^[a-zA-Z0-9.,!#$%&'*+/=?^_]{8,}$/}
                                ];
                                validation(inputsToValidateUpdatePassword, document.querySelector("#update-password-btn"));
                                const overlayPersonal = document.querySelector(".overlay-personal");
                                const popupPersonal = document.querySelector(".pop-up.change-personal");
                                const popupPassword = document.querySelector(".pop-up.change-password");
                                const showPopup = (ele) => {
                                    closePopup();
                                    if (ele.classList.contains("personal")) {
                                        popupPersonal.classList.add("active");
                                        overlayPersonal.classList.add("active");
                                    } else {
                                        popupPassword.classList.add("active");
                                        overlayPersonal.classList.add("active");
                                    }
                                }
                                const closePopup = () => {
                                    popupPersonal ? popupPersonal.classList.remove("active") : "";
                                    popupPassword ? popupPassword.classList.remove("active") : "";
                                    overlayPersonal.classList.remove("active");
                                }
        </script>
    </body>
</html>