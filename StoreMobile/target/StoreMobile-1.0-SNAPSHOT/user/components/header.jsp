<%-- 
    Document   : header
    Created on : Oct 22, 2023, 9:39:04 PM
    Author     : Le Tan Kim
--%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="req" value="${pageContext.getRequest()}" />
<c:set var="resp" value="${pageContext.getResponse()}" />
<jsp:useBean id="cartMini" class="Util.Cart" ></jsp:useBean>
<jsp:useBean id="categoriesBean" class="DAO.CategoryDao"></jsp:useBean>
<jsp:useBean id="companyBean" class="DAO.CompanyDao"></jsp:useBean>
<c:set var="isLogoutUser" value="${param.logout != null}" />
<c:set var="session" value="${req.getSession()}" />
<jsp:useBean id="authUser" class="Util.Authentication" scope="page"></jsp:useBean>
<c:if test="${isLogoutUser}">
    <c:if test="${authUser.LogoutUser(req, resp, session)}">
        <c:redirect url="/"/>
    </c:if>
</c:if>
<c:set value="${authUser.isLogigUser(req)}" var="usernameCheck" />
<c:if test="${usernameCheck != null}">
    <c:set var="usernameUser" value="${usernameCheck}"/>
</c:if>
<header>
    <div class="container">
        <!-- information of company -->
        <div class="nav-info">
            <div class="nav-info-left">
                <ul class="nav-info-left-list">
                    <li class="nav-info-left-list-item">
                        <a href="/about" class="nav-info-left-list-link">${companyBean.top1CompanyActive.name}</a>
                    </li>
                    <li class="nav-info-left-list-item">
                        <a href="tel:${companyBean.top1CompanyActive.phone}" class="nav-info-left-list-link"
                           >Need Help? ${companyBean.top1CompanyActive.phone}</a
                        >
                    </li>
                </ul>
            </div>
            <div class="nav-info-right">
                <ul class="nav-info-left-list">
                    <li class="nav-info-left-list-item">
                        <a href="/about" class="nav-info-left-list-link">About us</a>
                    </li>
                    <li class="nav-info-left-list-item">
                        <a href="/contact" class="nav-info-left-list-link">Contact us</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- header with search -->
        <div class="nav-with-search row m-0">
            <div class="logo col-lg-2 col-12">
                <a href="/">
                    <img src="/uploads/base/logo.png" alt="Logo" />
                </a>
            </div>
            <div class="search col-lg-8 col-8">
                <div class="btn-menu-mobile hide-on-laptop hide-on-tablet">
                    <i class="bx bx-menu"></i>
                </div>
                <form action="/search" method="get">
                    <div class="box-input-search">
                        <input  type="text" name="keyword" id="search" placeholder="Search..." value="${keyword}"/>
                        <button class="btn btn-search" type="submit">
                            <i class="bx bx-search-alt-2"></i>
                        </button>
                    </div>
                </form>
            </div>
            <div class="user-function col-lg-2 col-4">
                <ul class="list-user-function">
                    <li class="user-function-item login-success">
                        <c:if test="${usernameUser == null}">
                            <a href="/auth/login" class="user-function-item-link">
                                <i class="bx bx-user"></i>
                                <span>Login</span>
                            </a>
                        </c:if>
                        <c:if test="${usernameUser != null}">
                            <a href="/personal/${usernameUser}" class="user-function-item-link">
                                <i class="bx bx-user"></i>
                                <span>${usernameUser}</span>
                            </a>
                            <div class="drop-down-personal">
                                <ul class="list-option-personal">
                                    <li class="item-option-personal">
                                        <a href="/personal/${usernameUser}" class="item-option-personal-link">Personal</a>
                                    </li>
                                    <li class="item-option-personal">
                                        <a href="?logout=true" class="item-option-personal-link">
                                            Logout
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </c:if>
                    </li>
                    <li class="user-function-item cart">
                        <a href="/cart" class="user-function-item-link">
                            <i class="bx bx-shopping-bag"></i>
                            <span class="hide-on-mobile">Cart</span>
                            <span class="number-of-cart">${cartMini.getNumberCart(req)}</span>
                        </a>
                        <div class="view-cart-mini">
                            ${cartMini.showMiniCart(req)}
                            <!--render mini cart-->
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- main navigation -->
        <div class="overlay"></div>
        <nav class="navbar">
            <div class="hide-on-laptop hide-on-tablet btn-close-menu">
                <i class="bx bx-x"></i>
            </div>
            <ul class="list-nav">
                <li class="nav-item">
                    <a href="/" class="nav-item-link">Home</a>
                </li>
                <li class="nav-item have-dropdown">
                    <a href="/product" class="nav-item-link">
                        Product
                        <i class="bx bx-chevron-down"></i>
                    </a>
                    <div class="dropdown-menu-custom">
                        <ul class="list-menu-dropdown">
                            <c:forEach begin="0" end="7" items="${categoriesBean.getCategoryByStatus(1)}" var="catHeader">
                                <li class="item-menu-dropdown">
                                    <a href="/category/${catHeader.slug}" class="item-menu-dropdown-link">${catHeader.name}</a>
                                </li>
                            </c:forEach>
                            <c:if test="${categoriesBean.getCategoryByStatus(1).size() > 7}">
                                <li class="item-menu-dropdown">
                                    <a href="/product" class="item-menu-dropdown-link">See all product</a>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a href="/about" class="nav-item-link">About us</a>
                </li>
                <li class="nav-item">
                    <a href="/contact" class="nav-item-link">Contact</a>
                </li>
            </ul>
            <div class="box-message-free-ship">
                <span>$ Shop in our store for more discounts</span>
            </div>
        </nav>
    </div>
</header>
