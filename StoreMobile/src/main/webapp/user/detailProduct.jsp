<%-- 
    Document   : detailProduct
    Created on : Oct 26, 2023, 11:39:24 AM
    Author     : ACER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="currency" scope="page" class="Util.CurrencyConverter"></jsp:useBean>
<jsp:useBean id="accountDao" scope="page" class="DAO.AccountDao"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="product" value="${product}" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <base href="http://localhost:8080/" />
        <link rel="icon" type="image/x-icon" href="./uploads/base/favicon.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>${product.name}</title>
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />  
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"  rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" />
        <link rel="stylesheet" href="./user/assets/css/style.css" />
        <link rel="stylesheet" href="./user/assets/css/slick.css" />
        <link rel="stylesheet" href="./user/assets/css/slick-theme.css" />
        <link rel="stylesheet" href="./user/assets/css/base.css" />
        <link rel="stylesheet" href="./user/assets/css/inputNumber.css">
        <link rel="stylesheet" href="./user/assets/css/itemProduct.css">
        <link rel="stylesheet" href="./user/assets/css/footer.css">
        <link rel="stylesheet" href="./user/assets/css/toast.css">
        <link rel="stylesheet" href="./user/assets/css/responsive.css" />
    </head>
    <body>
        <%@include file="components/header.jsp" %>       
        <div id="toast"></div>
        <main>
            <section class="header-navigation">
                <div class="container">
                    <ul class="list-redirect">
                        <li class="redirect-item">
                            <a href="" class="redirect-link">Home</a>
                        </li>
                        <span>/</span>
                        <li class="redirect-item">
                            <a href="/category/${category.slug}" class="redirect-link">${category.name}</a>
                        </li>
                        <span>/</span>
                        <li class="redirect-item">
                            <a href="/product/detail/${product.slug}" class="redirect-link">${product.name}</a>
                        </li>
                    </ul>
                </div>
            </section>
            <section class="main-product">
                <div class="container">
                    <div class="row m-0 wrapper-detail-product">
                        <div class="img-product col-12 col-lg-6">
                            <div class="row p-0 m-0">
                                <div class="img-product-desc col-12 col-lg-2">
                                    <ul class="list-img-desc">
                                        <li class="item-img-desc active" onclick="changeImgPreview(this)">
                                            <img src="${product.mainImg}" alt="${product.name}">
                                        </li>
                                        <c:forEach var="image" items="${imgDesc}" varStatus="loopIndex">
                                            <li class="item-img-desc" onclick="changeImgPreview(this)">
                                                <img src="${image.imgUrl}" alt="Image description ${loopIndex.index}">
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div class="main-img-product col-12 col-lg-10">
                                    <div class="box-main-product">
                                        <img src="${product.mainImg}" alt="${product.name}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="info-product col-12 col-lg-6">
                            <div class="box-info-product">
                                <h2 class="name-product">${product.name}</h2>
                                <h3 class="price-product">
                                    <c:if test="${product.newPrice > 0}">
                                        <span class="new-price">
                                            ${currency.currencyFormat(product.newPrice, "VND")}
                                        </span>
                                        <span class="old-price">
                                            ${currency.currencyFormat(product.oldPrice, "VND")}
                                        </span>
                                    </c:if>
                                    <c:if test="${product.newPrice <= 0}">
                                        ${currency.currencyFormat(product.oldPrice, "VND")}
                                    </c:if>
                                </h3>
                            </div>
                            <div class="box-buy-product">
                                <div class="available-product">
                                    <span class="available-title">Available: </span>
                                    <c:if test="${product.available <=0}">
                                        <span class="available-number">Sold out</span>
                                    </c:if>
                                    <c:if test="${product.available >0}">
                                        <span class="available-number">${product.available}</span>
                                    </c:if>
                                </div>
                                <div class="buy-now">
                                    <div class="color-product">
                                        <h4>Color:  </h4>
                                        <ul class="list-color">
                                            <c:forEach var="color" items="${colors}" varStatus="loopIndex">
                                                <c:choose>
                                                    <c:when test="${loopIndex.index == 0}">
                                                        <li class="item-color" >
                                                            <label for="${color.ID}" class="yellow active" onclick="changeColorProduct(this); changeImgPreview(this);">
                                                                <img src="${color.imgColor}" alt="Image description ${loopIndex.index}">
                                                                <span class="desc-color">${color.name}</span>
                                                            </label>
                                                            <input onchange="changeColor(this.value)" value="${color.ID}" type="radio" name="color" id="${color.ID}">
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li class="item-color" >
                                                            <label for="${color.ID}" class="yellow" onclick="changeColorProduct(this); changeImgPreview(this);">
                                                                <img src="${color.imgColor}" alt="${loopIndex.index}">
                                                                <span class="desc-color">${color.name}</span>
                                                            </label>
                                                            <input onchange="changeColor(this.value)" value="${color.ID}" type="radio" name="color" id="${color.ID}">
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <c:if test="${product.available > 0}">
                                        <div class="box-add-to-cart">
                                            <div class="number-of-product-buy">
                                                <div class="number-input">
                                                    <button onclick="downInput()" class="minus"></button>
                                                    <input class="quantity" min="1" max="${product.available}" name="quantity" value="1" type="number" readonly>
                                                    <button onclick="upInput()" class="plus"></button>
                                                </div>
                                            </div>
                                            <div class="box-btn-add-to-cart">
                                                <div class="add-to-cart">
                                                    <form action="/cart" method="post">
                                                        <input type="hidden" name="color" class="color-add-to-cart" value="${colors.get(0).ID}"/>
                                                        <input type="hidden" name="idProduct" value="${product.ID}"/>
                                                        <input type="hidden" name="quantityCart" id="quantityCart" value="1"/>
                                                        <button class="btn btn-mini-cart" name="add-to-cart">
                                                            Add to cart
                                                        </button>
                                                    </form>
                                                </div>
                                                <div class="add-to-cart">
                                                    <form action="/checkout" method="post">
                                                        <input type="hidden" name="color" class="color-add-to-buy" value="${colors.get(0).ID}"/>
                                                        <input type="hidden" name="idProduct" value="${product.ID}"/>
                                                        <input type="hidden" name="numberOfProduct" id="numberOfProduct" value="1"/>
                                                        <button class="btn btn-mini-cart active" name="btn-checkout">
                                                            Buy now
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <script>
                                            const inputNumber = document.querySelector('.quantity');
                                            const downInput = () => {
                                                inputNumber.stepDown();
                                                document.querySelector('#numberOfProduct').value = inputNumber.value;
                                                document.querySelector('#quantityCart').value = inputNumber.value;
                                            }
                                            const upInput = () => {
                                                document.querySelector('.quantity').stepUp();
                                                document.querySelector('#numberOfProduct').value = inputNumber.value;
                                                document.querySelector('#quantityCart').value = inputNumber.value;
                                            }
                                            const changeColor = (value) => {
                                                document.querySelector('.color-add-to-buy').value = value;
                                                document.querySelector('.color-add-to-cart').value = value;
                                            }
                                        </script>
                                    </c:if>
                                </div>
                            </div>
                            <div class="wrapper-info-more">
                                <div class="box-info-more">
                                    <span class="box-info-more-title">Model:</span>
                                    <span class="box-info-more-content">${product.model}</span>
                                </div>
                            </div>
                        </div>
                        <div class="wrapper-desc-product">
                            <div class="box-header-desc-product">
                                <ul class="list-header-desc">
                                    <li class="item-header-desc active" onclick="changeContent('.desc-content', this)">
                                        Description
                                    </li>
                                    <li class="item-header-desc" onclick="changeContent('.config-content', this)">
                                        Config
                                    </li>
                                    <li class="item-header-desc" onclick="changeContent('.comment', this)">
                                        Comment
                                    </li>
                                </ul>
                            </div>
                            <div class="box-desc-content">
                                <div class="desc-content main-desc-content active">
                                    ${product.description}
                                </div>
                                <div class="config-content main-desc-content">
                                    ${product.configProduct}
                                </div>
                                <div class="comment main-desc-content">
                                    <div class="box-comment">
                                        <c:if test="${usernameUser != null}">
                                            <form action="/comment" method="post">
                                                <input type="text" placeholder="Comment" name="comment" required="">
                                                <input type="hidden" name="idProduct" value="${product.ID}">
                                                <input type="hidden" name="slugProduct" value="${product.slug}">
                                                <input type="hidden" name="idUser" value="${accountDao.getAccountByUsername(usernameUser).id}">
                                                <button class="btn btn-add-comment" name="btn-add-comment">Add comment</button>
                                            </form>
                                        </c:if>
                                        <c:if test="${usernameUser == null}">
                                            <a href="/auth/login" class="go-to-login">Please login to comment</a>
                                        </c:if>
                                    </div>
                                    <div class="wrapper-comments">
                                        <div class="statistic-comment">
                                            <span class="number-of-comment">${comments != null ? comments.size() : 0} comment for this product</span>
                                        </div>
                                        <ul class="list-comment">
                                            <c:forEach items="${comments}" var="comment">
                                                <c:set var="author" value="${accountDao.getAccountByID(comment.userID).username}" />
                                                <li class="comment-item">
                                                    <div class="main-comment">
                                                        <div class="box-author">
                                                            <span class="comment-author">
                                                                ${author}
                                                            </span>
                                                            <span class="comment-time">
                                                                <c:if test="${comment.dateUpdate != null}">
                                                                    Update at ${comment.dateUpdate}
                                                                </c:if>
                                                                <c:if test="${comment.dateUpdate == null}">
                                                                    Post at ${comment.datePost}
                                                                </c:if>
                                                            </span>
                                                        </div>
                                                        <form action="/comment" method="post">
                                                            <input type="hidden" name="idComment" value="${comment.id}"/>
                                                            <input type="hidden" name="slugProduct" value="${product.slug}"/>
                                                            <span class="comment-content">
                                                                ${comment.comment}
                                                            </span>
                                                        </form>
                                                    </div>
                                                    <c:if test="${author == usernameUser}">
                                                        <div class="comment-action">
                                                            <span title="Update comment" class="comment-action-item" onclick="updateCommentForm(this)">
                                                                <i class='bx bxs-edit-alt'></i>
                                                            </span>
                                                            <a title="Delet comment" onclick="return confirm('Are you sure to delete?')" href="/comment/delete/${product.slug}/${comment.id}" class="comment-action-item">
                                                                <i class='bx bx-x'></i>
                                                            </a>
                                                        </div>
                                                    </c:if>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <%@include file="components/footer.jsp" %>
        <script src="https://code.jquery.com/jquery-3.7.0.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="./user/assets/js/app.js"></script>
        <script src="./user/assets/js/itemProduct.js"></script>
        <script src="./user/assets/js/toast.js"></script>
        <script>
            <c:if test="${param.status != null && param.status == 1}">
                                                                showSuccess("Action comment successfull");
            </c:if>
            <c:if test="${param.status != null && param.status==0}">
                                                                showError("Action comment fail. Try again");
            </c:if>
        </script>
    </body>
</html>