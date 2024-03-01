<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="currency" scope="page" class="Util.CurrencyConverter"></jsp:useBean>
<jsp:useBean id="sale" scope="page" class="Util.Sale"></jsp:useBean>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <base href="http://localhost:8080/" />
            <link rel="icon" type="image/x-icon" href="./uploads/base/favicon.png">
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
            <link rel="stylesheet" href="./user/assets/css/style.css" />
            <link rel="stylesheet" href="./user/assets/css/base.css" />
            <link rel="stylesheet" href="./user/assets/css/footer.css">
            <link rel="stylesheet" href="./user/assets/css/slick.css" />
            <link rel="stylesheet" href="./user/assets/css/slick-theme.css" />
            <link rel="stylesheet" href="./user/assets/css/responsive.css" />
            <title>Home</title>
        </head>
        <body>
        <%@include file="user/components/header.jsp" %>
        <main>
            <!-- banner -->
            <div class="banner">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" >
                    <div class="carousel-indicators">
                        <c:forEach var="button" items="${banners}" varStatus="indexLoop">
                            <c:choose>
                                <c:when test="${indexLoop.index == 0}">
                                    <button
                                        type="button"
                                        data-bs-target="#carouselExampleIndicators"
                                        data-bs-slide-to="${indexLoop.index}"
                                        class="active"
                                        aria-current="true"
                                        aria-label="Slide ${indexLoop.index + 1}"
                                        ></button>
                                </c:when>
                                <c:otherwise>
                                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${indexLoop.index}"
                                            aria-label="Slide ${indexLoop.index + 1}"></button>
                                </c:otherwise>
                            </c:choose> 
                        </c:forEach>
                    </div>
                    <div class="carousel-inner">
                        <c:forEach var="banner" items="${banners}" varStatus="indexLoop">
                            <c:choose>
                                <c:when test="${indexLoop.index == 0}">
                                    <div class="carousel-item active">
                                        <img src="${banner.img}" alt="Image ${indexLoop.index}" />
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="carousel-item">
                                        <img src="${banner.img}" alt="Image ${indexLoop.index}" />
                                    </div>
                                </c:otherwise>
                            </c:choose> 
                        </c:forEach>
                    </div>
                    <button
                        class="carousel-control-prev"
                        type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev"
                        >
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button
                        class="carousel-control-next"
                        type="button"
                        data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next"
                        >
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
            <!-- features -->
            <section class="features-area">
                <div class="container p-0">
                    <div class="row p-0 m-0">
                        <div class="feature-item col-6 col-md-6 col-lg-3">
                            <div class="feature-icon">
                                <i class="bx bxs-truck"></i>
                            </div>
                            <div class="feature-content">
                                <h5 class="feature-content-title">FREE DELIVERY</h5>
                                <p>For all orders over $120</p>
                            </div>
                        </div>
                        <div class="feature-item col-6 col-md-6 col-lg-3">
                            <div class="feature-icon">
                                <i class="bx bxs-credit-card"></i>
                            </div>
                            <div class="feature-content">
                                <h5 class="feature-content-title">SAFE PAYMENT</h5>
                                <p>100% secure payment</p>
                            </div>
                        </div>
                        <div class="feature-item col-6 col-md-6 col-lg-3">
                            <div class="feature-icon">
                                <i class="bx bxs-chat"></i>
                            </div>
                            <div class="feature-content">
                                <h5 class="feature-content-title">24/7 HELP CENTER</h5>
                                <p>Delicated 24/7 support</p>
                            </div>
                        </div>
                        <div class="feature-item col-6 col-md-6 col-lg-3">
                            <div class="feature-icon">
                                <i class="bx bx-support"></i>
                            </div>
                            <div class="feature-content">
                                <h5 class="feature-content-title">FRIENDLY SERVICES</h5>
                                <p>30 day satisfaction guarantee</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- banner product -->
            <section class="banner-product">
                <div class="container p-0">
                    <div class="row p-0 m-0">
                        <c:forEach begin="0" end="2" items="${bannerTexts}" var="bannerText">
                            <div class="card card-banner-item border-0 col-12 col-md-4 col-lg-4 p-2">
                                <div class="container-banner-product">
                                    <img src="${bannerText.img}" class="card-img" alt="${bannerText.img}"/>
                                    <div class="card-img-overlay">
                                        <h5 class="card-title">${bannerText.title}</h5>
                                        <p class="card-text">${bannerText.description}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <!-- product top seller -->
            <c:if test="${productsDeal.size() != 0}">
                <section class="top-seller">
                    <div class="container p-0">
                        <div class="header-product flex-column-mobile">
                            <h2 class="title-products">Top Deals Of The Day</h2>
                            <div class="box-count-down-time">
                                <div class="time-item">
                                    <span>0</span>
                                    <span>Day</span>
                                </div>
                                <div class="time-item">
                                    <span>0</span>
                                    <span>Hours</span>
                                </div>
                                <div class="time-item">
                                    <span>0</span>
                                    <span>Min</span>
                                </div>
                                <div class="time-item">
                                    <span>0</span>
                                    <span>Sec</span>
                                </div>
                            </div>
                        </div>
                        <div class="wrapper-product">
                            <div class="products">
                                <c:forEach var="productDeal" items="${productsDeal}">
                                    <div class="card col-6 col-md-3 col-lg-3 border-0" onclick="changePage(this, event)">
                                        <div class="box-img">
                                            <img src="${productDeal.mainImg}" class="card-img-top" alt="${productDeal.name}" />
                                        </div>
                                        <a class="link-page" href="/product/detail/${productDeal.slug}"></a>
                                        <div class="card-body">
                                            <h5 class="card-text name">
                                                ${productDeal.name}
                                            </h5>
                                            <p class="card-text price">
                                                <c:if test="${productDeal.newPrice > 0}">
                                                    <span class="new-price">${currency.currencyFormat(productDeal.newPrice, "VND")}</span>
                                                    <span class="old-price">${currency.currencyFormat(productDeal.oldPrice, "VND")}</span>
                                                </c:if>
                                                <c:if test="${productDeal.newPrice <= 0}">
                                                    <span>${currency.currencyFormat(productDeal.oldPrice, "VND")}</span>
                                                </c:if>
                                            </p>
                                            <div class="add-to-cart">
                                                <a href="/product/detail/${productDeal.slug}" class="btn btn-mini-cart active">
                                                    View detail
                                                </a>
                                            </div>
                                        </div>
                                        <c:if test="${productDeal.newPrice != null && productDeal.newPrice != 0}">
                                            <div class="sale">
                                                <span>
                                                    ${sale.calculateSale(productDeal.newPrice, productDeal.oldPrice)}
                                                </span>
                                            </div>
                                        </c:if>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </section>
            </c:if>
            <!-- banner product -->
            <section class="banner-product">
                <div class="container p-0">
                    <div class="row m-0">
                        <c:forEach begin="3" end="4" items="${bannerTexts}" var="bannerTextSecond">
                            <div class="card card-banner-item border-0 col-12 col-md-6 col-lg-6 p-2">
                                <div class="container-banner-product">
                                    <img src="${bannerTextSecond.img}" class="card-img" alt${bannerTextSecond.img}/>
                                    <div class="card-img-overlay">
                                        <h5 class="card-title">${bannerTextSecond.title}</h5>
                                        <p class="card-text">${bannerTextSecond.description}</p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <!-- product top seller -->
            <c:if test="${productsFeature.size() > 0}">
                <section class="top-seller">
                    <div class="container p-0">
                        <div class="header-product flex-column-mobile">
                            <h2 class="title-products">Top Products Feature</h2>
                            <ul class="list-category ">
                                <li class="category-item">
                                    <a href="/product" >See all</a>
                                </li>
                            </ul>
                        </div>
                        <div class="wrapper-product">
                            <div class="products product-orderst">
                                <c:forEach items="${productsFeature}" var="product">
                                    <div class="card col-6 col-md-3 col-lg-3 border-0" onclick="changePage(this, event)">
                                        <div class="box-img">
                                            <img src="${product.mainImg}" class="card-img-top" alt="${product.name}" />
                                        </div>
                                        <a class="link-page" href="/product/detail/${product.slug}"></a>
                                        <div class="card-body">
                                            <h5 class="card-text name">
                                                ${product.name}
                                            </h5>
                                            <p class="card-text price">
                                                <c:if test="${product.newPrice > 0}">
                                                    <span class="new-price">${currency.currencyFormat(product.newPrice, "VND")}</span>
                                                    <span class="old-price">${currency.currencyFormat(product.oldPrice, "VND")}</span>
                                                </c:if>
                                                <c:if test="${product.newPrice <= 0}">
                                                    <span >${currency.currencyFormat(product.oldPrice, "VND")}</span>
                                                </c:if>
                                            </p>
                                            <div class="add-to-cart">
                                                <a href="/product/detail/${product.slug}" class="btn btn-mini-cart active">
                                                    View detail
                                                </a>
                                            </div>
                                        </div>
                                        <c:if test="${product.newPrice > 0}">
                                            <div class="sale">
                                                <span>
                                                    ${sale.calculateSale(product.newPrice, product.oldPrice)}
                                                </span>
                                            </div>
                                        </c:if>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </section>
            </c:if>
            <!-- product featured -->
            <!-- render 5 product -->
            <c:if test="${productsNormal.size() > 0}">
                <section class="product-feature">
                    <div class="container p-0">
                        <div class="header-product">
                            <h2 class="title-products">Top Selling Products</h2>
                            <ul class="list-category">
                                <li class="category-item">
                                    <a href="/product">See all product
                                        <i class='bx bx-chevron-right'></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="box-product-feature row m-0 p-0">
                            <div class="col-12 col-md-6 col-lg-6 left-product-feature">
                                <div class="card mb-3 border-0 h-100" onclick="changePage(this)">
                                    <div class="row g-0 m-0 h-100">
                                        <a href="/product/detail/${productsNormal.get(0).slug}" class="link-page"></a>
                                        <div class="col-md-4 img-main-feature">
                                            <img src="${productsNormal.get(0).mainImg}" class="img-fluid rounded-start" alt="${productsNormal.get(0).name}">
                                        </div>
                                        <div class="col-md-8">
                                            <div class="card-body">
                                                <h5 class="name-product-feature">${productsNormal.get(0).name}</h5>
                                                <p class="price-product-feature">
                                                    <c:if test="${productsNormal.get(0).newPrice > 0}">
                                                        <span class="new-price">${currency.currencyFormat(productsNormal.get(0).newPrice, "VND")}</span>
                                                        <span class="old-price">${currency.currencyFormat(productsNormal.get(0).oldPrice, "VND")}</span>
                                                    </c:if>
                                                    <c:if test="${productsNormal.get(0).newPrice <= 0}">
                                                        <span>${currency.currencyFormat(productsNormal.get(0).oldPrice, "VND")}</span>
                                                    </c:if>
                                                </p>
                                                <div class="add-to-cart on-active">
                                                    <a href="/product/detail/${productsNormal.get(0).slug}" class="btn btn-mini-cart active">
                                                        View detail
                                                    </a>
                                                </div>
                                            </div>
                                            <c:if test="${productsNormal.get(0).newPrice > 0}">
                                                <div class="sale">
                                                    <span>
                                                        ${sale.calculateSale(productsNormal.get(0).newPrice, productsNormal.get(0).oldPrice)}
                                                    </span>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-md-6 col-lg-6 row p-0 m-0 right-product-feature">
                                <c:forEach begin="1" end="4" items="${productsNormal}" var="productNormal">
                                    <div class="col-6 col-lg-6">
                                        <div class="card mb-3 border-0 h-100" onclick="changePage(this)">
                                            <div class="row g-0 m-0">
                                                <a href="/product/detail/${productNormal.slug}" class="link-page"></a>
                                                <div class="col-md-4">
                                                    <img src="${productNormal.mainImg}" class="img-fluid rounded-start" alt="${productNormal.mainImg}">
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="card-body">
                                                        <h5 class="name-product-feature">${productNormal.name}</h5>
                                                        <p class="price-product-feature">
                                                            <c:if test="${productNormal.newPrice > 0}">
                                                                <span class="new-price">${currency.currencyFormat(productNormal.newPrice, "VND")}</span>
                                                                <span class="old-price">${currency.currencyFormat(productNormal.oldPrice, "VND")}</span>
                                                            </c:if>
                                                            <c:if test="${productNormal.newPrice <= 0}">
                                                                <span>${currency.currencyFormat(productNormal.oldPrice, "VND")}</span>
                                                            </c:if>
                                                        </p>
                                                    </div>
                                                    <c:if test="${productNormal.newPrice > 0}">
                                                        <div class="sale">
                                                            <span>
                                                                ${sale.calculateSale(productNormal.newPrice, productNormal.oldPrice)}
                                                            </span>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                </c:forEach> 
                            </div>
                        </div>
                    </div>
                </section>
                <!-- moving text -->
                <section class="moveing-text-area">
                    <div class="">
                        <div class="ovic-running">
                            <div class="wrap">
                                <div class="inner">
                                    <p class="item">All product information is provided by TGDD   |   All product information is provided by TGDD</p>
                                    <p class="item">All product information is provided by TGDD</p>
                                    <p class="item">All product information is provided by TGDD</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </c:if>
        </main>
        <%@include file="user/components/footer.jsp" %>
        <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./user/assets/js/app.js"></script>
        <script type="text/javascript" src="./user/assets/js/slick.js"></script>
        <script src="./user/assets/js/countDown.js"></script>
        <script>
                                            $(document).ready(function () {
                                                $(".products").slick({
                                                    dots: false,
                                                    infinite: false,
                                                    speed: 400,
                                                    slidesToShow: 5,
                                                    slidesToScroll: 5,
                                                    autoplay: true,
                                                    responsive: [
                                                        {
                                                            breakpoint: 1024,
                                                            settings: {
                                                                slidesToShow: 3,
                                                                slidesToScroll: 3,
                                                                infinite: true,
                                                                dots: true,
                                                            },
                                                        },
                                                        {
                                                            breakpoint: 600,
                                                            settings: {
                                                                slidesToShow: 2,
                                                                slidesToScroll: 2,
                                                            },
                                                        },
                                                        {
                                                            breakpoint: 480,
                                                            settings: {
                                                                slidesToShow: 2,
                                                                slidesToScroll: 2,
                                                            },
                                                        },
                                                    ],
                                                });
                                            });
        </script>
    </body>
</html>
