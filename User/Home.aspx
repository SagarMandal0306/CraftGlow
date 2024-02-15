<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs"
    Inherits="Craftglow.User.Home" %>
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
                <div class="wrapper">
                    <!-- <a href="#" class="prduct_click"> -->
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../Assets/user/products/dsc02308.jpg">
                            <span class="label">New</span>
                            <ul class="product__hover">
                                <li><a href="#" class="text-light"><i class="fa-regular fa-heart"></i></a></li>
                                <!-- <li><a href="#"><img src="../Assets/user/products/dsc02308.jpg" alt=""> <span>Compare</span></a></li>
                    <li><a href="#"><img src="img/icon/search.png" alt=""></a></li> -->
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Old-Shool-Charpahi-Style-Tray</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>


                            </div>
                            <h5><i class="fa-solid fa-indian-rupee-sign"></i>1083</h5>
                            <!-- <div class="product__color__select">
                    <label for="pc-1">
                        <input type="radio" id="pc-1">
                    </label>
                    <label class="active black" for="pc-2">
                        <input type="radio" id="pc-2">
                    </label>
                    <label class="grey" for="pc-3">
                        <input type="radio" id="pc-3">
                    </label>
                </div> -->
                        </div>
                    </div>
                    <!-- </a> -->
                    <!-- <a href="#" class="prduct_click"> -->
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../Assets/user/products/dsc02308.jpg">
                            <span class="label">New</span>
                            <ul class="product__hover">
                                <li><a href="#" class="text-light"><i class="fa-regular fa-heart"></i></a></li>
                                <!-- <li><a href="#"><img src="../Assets/user/products/dsc02308.jpg" alt=""> <span>Compare</span></a></li>
                    <li><a href="#"><img src="img/icon/search.png" alt=""></a></li> -->
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Old-Shool-Charpahi-Style-Tray</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>


                            </div>
                            <h5><i class="fa-solid fa-indian-rupee-sign"></i>1083</h5>
                         
                        </div>
                    </div>
                    <!-- </a> -->
                    <!-- <a href="#" class="prduct_click"> -->
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../Assets/user/products/dsc02308.jpg">
                            <span class="label">New</span>
                            <ul class="product__hover">
                                <li><a href="#" class="text-light"><i class="fa-regular fa-heart"></i></a></li>
                                <!-- <li><a href="#"><img src="../Assets/user/products/dsc02308.jpg" alt=""> <span>Compare</span></a></li>
                    <li><a href="#"><img src="img/icon/search.png" alt=""></a></li> -->
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Old-Shool-Charpahi-Style-Tray</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>


                            </div>
                            <h5><i class="fa-solid fa-indian-rupee-sign"></i>1083</h5>
                            <!-- <div class="product__color__select">
                    <label for="pc-1">
                        <input type="radio" id="pc-1">
                    </label>
                    <label class="active black" for="pc-2">
                        <input type="radio" id="pc-2">
                    </label>
                    <label class="grey" for="pc-3">
                        <input type="radio" id="pc-3">
                    </label>
                </div> -->
                        </div>
                    </div>
                    <!-- </a> -->
                    <!-- <a href="#" class="prduct_click"> -->
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../Assets/user/products/dsc02308.jpg">
                            <span class="label">New</span>
                            <ul class="product__hover">
                                <li><a href="#" class="text-light"><i class="fa-regular fa-heart"></i></a></li>
                                <!-- <li><a href="#"><img src="../Assets/user/products/dsc02308.jpg" alt=""> <span>Compare</span></a></li>
                    <li><a href="#"><img src="img/icon/search.png" alt=""></a></li> -->
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Old-Shool-Charpahi-Style-Tray</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>


                            </div>
                            <h5><i class="fa-solid fa-indian-rupee-sign"></i>1083</h5>
                            <!-- <div class="product__color__select">
                    <label for="pc-1">
                        <input type="radio" id="pc-1">
                    </label>
                    <label class="active black" for="pc-2">
                        <input type="radio" id="pc-2">
                    </label>
                    <label class="grey" for="pc-3">
                        <input type="radio" id="pc-3">
                    </label>
                </div> -->
                        </div>
                    </div>
                    <!-- </a> -->
                    <!-- <a href="#" class="prduct_click"> -->
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../Assets/user/products/dsc02308.jpg">
                            <span class="label">New</span>
                            <ul class="product__hover">
                                <li><a href="#" class="text-light"><i class="fa-regular fa-heart"></i></a></li>
                                <!-- <li><a href="#"><img src="../Assets/user/products/dsc02308.jpg" alt=""> <span>Compare</span></a></li>
                    <li><a href="#"><img src="img/icon/search.png" alt=""></a></li> -->
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Old-Shool-Charpahi-Style-Tray</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>


                            </div>
                            <h5><i class="fa-solid fa-indian-rupee-sign"></i>1083</h5>
                            <!-- <div class="product__color__select">
                    <label for="pc-1">
                        <input type="radio" id="pc-1">
                    </label>
                    <label class="active black" for="pc-2">
                        <input type="radio" id="pc-2">
                    </label>
                    <label class="grey" for="pc-3">
                        <input type="radio" id="pc-3">
                    </label>
                </div> -->
                        </div>
                    </div>
                    <!-- </a> -->

                </div>
                <a href="#" class="craft-btn my-5">View All</a>
            </div>

            <div class="categories">
                <h1>It's All Here!</h1>
                <p>Check out our complete range of craft works</p>
                <div class="wrapper">
                    <a href="#">
                        <div class="category">
                            <img src="../Assets/user/category/Aari_embroidery.png" alt="">
                            <span>Asri Embroidery</span>
                        </div>
                    </a>
                    <a href="#">
                        <div class="category">
                            <img src="../Assets/user/category/Aari_embroidery.png" alt="">
                            <span>Asri Embroidery</span>
                        </div>
                    </a>
                    <a href="#">
                        <div class="category">
                            <img src="../Assets/user/category/Aari_embroidery.png" alt="">
                            <span>Asri Embroidery</span>
                        </div>
                    </a>
                    <a href="#">
                        <div class="category">
                            <img src="../Assets/user/category/Aari_embroidery.png" alt="">
                            <span>Asri Embroidery</span>
                        </div>
                    </a>
                    <a href="#">
                        <div class="category">
                            <img src="../Assets/user/category/Aari_embroidery.png" alt="">
                            <span>Asri Embroidery</span>
                        </div>
                    </a>
                    <a href="#">
                        <div class="category">
                            <img src="../Assets/user/category/Aari_embroidery.png" alt="">
                            <span>Asri Embroidery</span>
                        </div>
                    </a>
                    <a href="#">
                        <div class="category">
                            <img src="../Assets/user/category/Aari_embroidery.png" alt="">
                            <span>Asri Embroidery</span>
                        </div>
                    </a>
                    <a href="#">
                        <div class="category">
                            <img src="../Assets/user/category/Aari_embroidery.png" alt="">
                            <span>Asri Embroidery</span>
                        </div>
                    </a>
                    <a href="#">
                        <div class="category">
                            <img src="../Assets/user/category/Aari_embroidery.png" alt="">
                            <span>Asri Embroidery</span>
                        </div>
                    </a>
                </div>
            </div>


            <div class="most-loved">
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
            </div>



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