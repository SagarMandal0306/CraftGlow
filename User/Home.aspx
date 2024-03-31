<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Craftglow.User.Home" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         
        <link rel="stylesheet" href="css/home.css">

       <script src="javascript/Home.js"></script>
       
    </asp:Content>


    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="home">
            <div class="banner">
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper" id="banner-contain">
                    </div>
                    <div class="swiper-button-next arrow"></div>
                    <div class="swiper-button-prev arrow"></div>

                    <div class="swiper-pagination"></div>
                </div>
            </div>

            <div class="features">
                <div class="contain"><span class="fa-solid fa-truck-fast mx-2"></span>
                    <p>Worldwide Shipping</p>
                </div>
                <div class="contain"><span class="fa-solid fa-comments mx-2"></span>
                    <p>24x7 Customer Support</p>
                </div>
                <div class="contain"><span class="fa-solid fa-shield-halved mx-2"></span>
                    <p>Secure Transactions</p>
                </div>
            </div>




            <div class="new-arrivals">
                <h1>New Arrivals</h1>
                <p>Take a look at the latest masterpieces to arrive on our virtual shelves</p>
                <div runat="server" id="newProducts"  class="wrapper" >

                </div>
                <a href="#" class="craft-btn my-5">View All</a>
            </div>
            
            <div class="categories">
                <h1>It's All Here!</h1>
                <p>Check out our complete range of craft works</p>
                <div runat="server" class="wrapper" id="categoryList">
                </div>
            </div>


           <%-- <div class="most-loved">
                <h1>Our Most Loved Categories</h1>
                <div class="wrapper">
                    <div class="box">
                        <img src="../Assets/user/category/Shwals-Wraps.jpg" alt="">
                        <p>Shawles & Wraps</p>
                    </div>
                    <div class="box">
                        <img src="../Assets/user/category/Shwals-Wraps.jpg" alt="">
                        <p>Shawles & Wraps</p>
                    </div>
                    <div class="box">
                        <img src="../Assets/user/category/Shwals-Wraps.jpg" alt="">
                        <p>Shawles & Wraps</p>
                    </div>
                    <div class="box">
                        <img src="../Assets/user/category/Shwals-Wraps.jpg" alt="">
                        <p>Shawles & Wraps</p>
                    </div>
                </div>
                <a href="#" class="craft-btn">View All </a>
            </div>--%>



            <div class="testimonials">
                <h1>Our Honest Customer Rivew</h1>
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide content">
                            <div class="img">
                                <img src="../Assets/user/products/Nadeya_shibori_saree.png" alt="">
                            </div>
                            <div class="text">
                                <div class="review">
                                    <i class="fa-solid fa-quote-left"></i>
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur magni molestias
                                    magnam eius a aspernatur ad, voluptates aperiam non modi molestiae deserunt nesciunt
                                    distinctio nostrum tempore inventore dicta, odio accusamus officiis eum sequi! Magni
                                    enim itaque quam in illo nobis iusto provident voluptate modi saepe, earum est nemo
                                    expedita nam.
                                </div>
                                <h2>Sagar Mandal</h2>
                                <p>Jajpur</p>
                            </div>
                        </div>
                        <div class="swiper-slide content">
                            <div class="img">
                                <img src="../Assets/user/products/Nadeya_shibori_saree.png" alt="">
                            </div>
                            <div class="text">
                                <div class="review">
                                    <i class="fa-solid fa-quote-left"></i>
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur magni molestias
                                    magnam eius a aspernatur ad, voluptates aperiam non modi molestiae deserunt nesciunt
                                    distinctio nostrum tempore inventore dicta, odio accusamus officiis eum sequi! Magni
                                    enim itaque quam in illo nobis iusto provident voluptate modi saepe, earum est nemo
                                    expedita nam.
                                </div>
                                <h2>Sagar Mandal</h2>
                                <p>Jajpur</p>
                            </div>
                        </div>
                        <div class="swiper-slide content">
                            <div class="img">
                                <img src="../Assets/user/products/Nadeya_shibori_saree.png" alt="">
                            </div>
                            <div class="text">
                                <div class="review">
                                    <i class="fa-solid fa-quote-left"></i>
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur magni molestias
                                    magnam eius a aspernatur ad, voluptates aperiam non modi molestiae deserunt nesciunt
                                    distinctio nostrum tempore inventore dicta, odio accusamus officiis eum sequi! Magni
                                    enim itaque quam in illo nobis iusto provident voluptate modi saepe, earum est nemo
                                    expedita nam.
                                </div>
                                <h2>Sagar Mandal</h2>
                                <p>Jajpur</p>
                            </div>
                        </div>
                        <div class="swiper-slide content">
                            <div class="img">
                                <img src="../Assets/user/products/Nadeya_shibori_saree.png" alt="">
                            </div>
                            <div class="text">
                                <div class="review">
                                    <i class="fa-solid fa-quote-left"></i>
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur magni molestias
                                    magnam eius a aspernatur ad, voluptates aperiam non modi molestiae deserunt nesciunt
                                    distinctio nostrum tempore inventore dicta, odio accusamus officiis eum sequi! Magni
                                    enim itaque quam in illo nobis iusto provident voluptate modi saepe, earum est nemo
                                    expedita nam.
                                </div>
                                <h2>Sagar Mandal</h2>
                                <p>Jajpur</p>
                            </div>
                        </div>

                    </div>
                    <div class="swiper-button-next arrow"></div>
                    <div class="swiper-button-prev arrow"></div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>








        </div>







    </asp:Content>