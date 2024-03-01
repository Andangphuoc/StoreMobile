<%-- 
    Document   : footer
    Created on : Oct 22, 2023, 9:41:00 PM
    Author     : Le Tan Kim
--%>
    <footer>
        <section class="connectpp">
            <div class="section-contect">
                <div class="container">
                    <div class="row m-0 p-0">
                        <div class="followst col-12 col-md-6 col-lg-4">
                            <h5>Follow us</h5>
                            <p class="followft-p">
                                We make consolidating, marketing and tracking your social media website easy.
                            </p>
                            <section class="mb-4">
                                <!-- Facebook -->
                                <a class="contact-social facebook" href="#">
                                    <i class='bx bxl-facebook'></i>
                                </a>
                                <a class="contact-social twitter" href="#">
                                    <i class='bx bxl-twitter' ></i>
                                </a>
                                <a class="contact-social youtube" href="#">
                                    <i class='bx bxl-youtube' ></i>
                                </a>
                                <a class="contact-social linkedin" href="#">
                                    <i class='bx bxl-linkedin' ></i>
                                </a>
                            </section>
                        </div>
                        <div class="followst col-12 col-md-6 col-lg-4">
                            <h5>Makerting</h5>
                            <p class="followft-p">
                                We make consolidating, marketing and tracking your social media website easy.
                            </p>
                        </div>
                        <div class="followst col-12 col-md-6 col-lg-4">
                            <h5>Download</h5>
                            <p class="followft-p">
                                Group 2 App is now available on App Store & Google Play. Get it now.
                            </p>
                            <div class="boxst subboxst">
                                <img src="https://wphix.com/template/dukamarket/dukamarket/assets/img/brand/app_ios.png" alt="">
                                <img src="https://wphix.com/template/dukamarket/dukamarket/assets/img/brand/app_android.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="footer-about">
            <div class="container">
                <div class="row m-0 p-0">
                    <div class="customer col-12 col-md-6 col-lg-4">
                        <h5>Customer service</h5>
                        <div class="sub-customer">
                            <ul>
                                <li><a href="/help-center">Help center</a></li>
                                <li><a href="/contact">Contact us</a></li>
                                <li><a href="/about">About us</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="customer col-12 col-md-6 col-lg-4">
                        <h5>Category</h5>
                        <div class="sub-customer">
                            <ul>
                            <c:forEach begin="0" end="6" items="${categoriesBean.getCategoryByStatus(1)}" var="category">
                                <li><a href="/category/${category.slug}">${category.name}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="customer navcustomer col-12 col-md-6 col-lg-4">
                    <h5>About company</h5>
                    <div class="sub-customer">
                        <div class="introduce-company">${companyBean.top1CompanyActive.introduce}</div>
                        <div class="navcustomer-img">
                            <i class='bx bxs-phone'></i>
                            <ul>
                                <li>
                                    <a href="tel:${companyBean.top1CompanyActive.phone}">
                                        Got Question? Call us 24/7!
                                    </a>
                                </li>
                                <li>
                                    <a style="color: yellow;font-size: 2.1rem;" href="tel:${companyBean.top1CompanyActive.phone}">
                                        ${companyBean.top1CompanyActive.phone}
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="aboutUS">
        <div class="navaboutus">
            <p>
                ©
                <script>
                    let date = new Date();
                    document.write(date.getFullYear());
                </script>
                Copyright by
                Group2. All Rights Reserved. Powered by Group2</p>
        </div>
    </div>
</footer>
