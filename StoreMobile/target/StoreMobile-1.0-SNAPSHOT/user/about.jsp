<%-- 
    Document   : about
    Created on : Oct 30, 2023, 12:15:33 AM
    Author     : Le Tan Kim
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="./user/assets/css/aboutus.css" />
        <link rel="stylesheet" href="./user/assets/css/style.css" />
        <link rel="stylesheet" href="./user/assets/css/base.css" />
        <link rel="stylesheet" href="./user/assets/css/about.css" />
        <link rel="stylesheet" href="./user/assets/css/slide.css" />
        <link rel="stylesheet" href="./user/assets/css/footer.css">
        <link rel="stylesheet" href="./user/assets/css/404.css">
        <link rel="stylesheet" href="./user/assets/css/contact.css" />
        <link rel="stylesheet" href="./user/assets/css/responsive.css" />
    </head>

    <body>
        <%@include file="components/header.jsp" %>
        <main class="about-content">
            <div class="page-banner-area page-banner-height" data-background="https://didongviet.vn/dchannel/wp-content/uploads/2023/09/iphone-15-pro-max-co-may-mau-didongviet-1.jpg" style="background-image: url(&quot;https://didongviet.vn/dchannel/wp-content/uploads/2023/09/iphone-15-pro-max-co-may-mau-didongviet-1.jpg&quot;);">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="page-banner-content text-center">
                                <h3>About Us</h3>
                                <p>${companyBean.top1CompanyActive.introduce}</p>
                                <div class="page-bottom-btn mt-55">
                                    <a href="/product" class="st-btn-4">Shopping now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
                                <div class="about-area pt-80 pb-80" data-background="https://wphix.com/template/dukamarket/dukamarket/assets/img/bg/about-bg.png.png" style="background-image: url(&quot;https://wphix.com/template/dukamarket/dukamarket/assets/img/bg/about-bg.png&quot;);">
            <div class="container">
                <div class="row align-items-center">
                   <div class="col-xl-6 col-lg-6">
                       <div class="about-content">
                           <span>ABOUT OUR ONLINE STORE</span>
                           <h4>Hello,</h4>
                           <h5 class="banner-t mb-30">With 25+ Years Of Experience</h5>
                           <p class="about-text">Over 25 years Dukamarket helping companies reach their <br> financial and branding goals.</p>
                           <p>The perfect way to enjoy brewing tea on low hanging fruit to identify. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis. For me, the most important part of improving at photography.</p>
                       </div>
                   </div>
                   <div class="col-xl-6 col-lg-6">
                        <div class="about-image w-img">
                            <img src="https://wphix.com/template/dukamarket/dukamarket/assets/img/about/about-b.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                <div class="services-area pt-70 light-bg-s pb-50">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="abs-section-title text-center">
                            <span>HOW IT WORKS</span>
                            <h4>Complete Customer Ideas</h4>
                            <p>The perfect way to enjoy brewing tea on low hanging fruit to identify. Duis autem vel eum iriure dolor in hendrerit <br> in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.</p>
                        </div>
                    </div>
                </div>
                <div class="row mt-40">
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="services-item mb-30">
                            <div class="services-icon mb-25">
                                <i class="fal fa-share-square"></i>
                            </div>
                            <h6>Admin Verify Details</h6>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit accusantium doloremque laudantium totam rem aperiam, eaqueipsa quae veritatis.</p>
                            <div class="s-count-number">
                                <span>01</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="services-item mb-30">
                            <div class="services-icon mb-25">
                                <i class="https://wphix.com/template/dukamarket/dukamarket/assets/img/about/c-icon-01.png"></i>
                            </div>
                            <h6>Send The Solution</h6>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit accusantium doloremque laudantium totam rem aperiam, eaqueipsa quae veritatis.</p>
                            <div class="s-count-number">
                                <span>02</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6">
                        <div class="services-item mb-30">
                            <div class="services-icon mb-25">
                                <i class="fal fa-thumbs-up"></i>
                            </div>
                            <h6>Complete Profile</h6>
                            <p>Sed ut perspiciatis unde omnis iste natus error sit accusantium doloremque laudantium totam rem aperiam, eaqueipsa quae veritatis.</p>
                            <div class="s-count-number">
                                <span>03</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                        <div class="technolgy-index mt-70 mb-10">
            <div class="container">
                <div class="row mb-15">
                    <div class="col-xl-12">
                        <div class="abs-section-title text-center">
                            <span>TECHNOLOGY INDEX</span>
                            <h4>Let’s Get Creative</h4>
                            <p>The perfect way to enjoy brewing tea on low hanging fruit to identify. Duis autem vel eum iriure dolor in hendrerit <br> in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6 col-lg-6">
                        <div class="main-abs mb-30">
                            <div class="ab-counter-image w-img mb-40">
                                <img src="https://wphix.com/template/dukamarket/dukamarket/assets/img/about/ab-01.jpg" alt="">
                            </div>
                            <div class="row">
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                    <div class="ab-counter-item mb-30">
                                        <div class="ab-counter mb-20">
                                            <div class="counter-icon mr-10">
                                                <img src="https://wphix.com/template/dukamarket/dukamarket/assets/img/about/c-icon-01.png" alt="">
                                            </div>
                                            <div class="counter_info">
                                                <span class="counter">4089</span>
                                               <p>+</p>
                                           </div>
                                        </div>
                                        <h5>Active Clients</h5>
                                        <p>Sed ut perspiciatis unde omnis iste natus sit accusantium doloremque laudantium totam.</p>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                    <div class="ab-counter-item mb-30">
                                        <div class="ab-counter mb-20">
                                            <div class="counter-icon mr-10">
                                                <img src="https://wphix.com/template/dukamarket/dukamarket/assets/img/about/c-icon-01.png" alt="">
                                            </div>
                                            <div class="counter_info">
                                                <span class="counter">2080</span>
                                               <p>+</p>
                                           </div>
                                        </div>
                                        <h5>Projects Done</h5>
                                        <p>Sed ut perspiciatis unde omnis iste natus sit accusantium doloremque laudantium totam.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <div class="main-abs mb-30">
                            <div class="ab-counter-image w-img mb-40">
                                <img src="https://wphix.com/template/dukamarket/dukamarket/assets/img/about/ab-02.jpg" alt="">
                            </div>
                            <div class="row">
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                    <div class="ab-counter-item mb-30">
                                        <div class="ab-counter mb-20">
                                            <div class="counter-icon mr-10">
                                                <img src="https://wphix.com/template/dukamarket/dukamarket/assets/img/about/c-icon-01.png" alt="">
                                            </div>
                                            <div class="counter_info">
                                                <span class="counter">312</span>
                                               <p>+</p>
                                           </div>
                                        </div>
                                        <h5>Team Advisors</h5>
                                        <p>Sed ut perspiciatis unde omnis iste natus sit accusantium doloremque laudantium totam.</p>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                    <div class="ab-counter-item mb-30">
                                        <div class="ab-counter mb-20">
                                            <div class="counter-icon mr-10">
                                                <img src="https://wphix.com/template/dukamarket/dukamarket/assets/img/about/c-icon-01.png" alt="">
                                            </div>
                                            <div class="counter_info">
                                                <span class="counter">130</span>
                                               <p>k</p>
                                           </div>
                                        </div>
                                        <h5>Users Online</h5>
                                        <p>Sed ut perspiciatis unde omnis iste natus sit accusantium doloremque laudantium totam.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
            <div class="team-area light-bg-s pt-70 pb-40">       
                <div class="container">
                    <div class="abs-section-title text-center">
                        <span>THE TEAM</span>
                        <h4>Meet Our Team</h4>
                        <p>The perfect way to enjoy brewing tea on low hanging fruit to identify. Duis autem vel eum iriure dolor in hendrerit <br> in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.</p>
                    </div>
                    <div class="row">
                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                            <div class="single-team text-center mb-30">
                                <div class="team-image mb-35 w-img">
                                    <div class="inner-timg">
                                        <a href="/about">
                                            <img src="https://cdn.sforum.vn/sforum/wp-content/uploads/2023/08/hinh-nen-luffy-gear-5-8.jpg" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="tauthor-degination mb-15">
                                    <h5><a href="/about">Iqbal Hossain</a></h5>
                                    <span>CEO &amp; Pounder</span>
                                </div>
                                <div class="team-social">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-dribbble"></i></a>
                                    <a href="#"><i class="fab fa-youtube"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                            <div class="single-team text-center mb-30">
                                <div class="team-image mb-35 w-img">
                                    <div class="inner-timg">
                                        <a href="/about">
                                            <img src="https://gamek.mediacdn.vn/zoom/600_315/2019/3/10/avata-1552224321203384823192.jpg" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="tauthor-degination mb-15">
                                    <h5><a href="/about">Robin Gomes</a></h5>
                                    <span>CEO &amp; Pounder</span>
                                </div>
                                <div class="team-social">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-dribbble"></i></a>
                                    <a href="#"><i class="fab fa-youtube"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                            <div class="single-team text-center mb-30">
                                <div class="team-image mb-35 w-img">
                                    <div class="inner-timg">
                                        <a href="/about">
                                            <img src="https://cdn.popsww.com/blog/sites/2/2022/02/Hoa-quyen-Ace.jpg" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="tauthor-degination mb-15">
                                    <h5><a href="/about">Merry Bob</a></h5>
                                    <span>CEO &amp; Pounder</span>
                                </div>
                                <div class="team-social">
                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                    <a href="#"><i class="fab fa-dribbble"></i></a>
                                    <a href="#"><i class="fab fa-youtube"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="components/footer.jsp" %>
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>