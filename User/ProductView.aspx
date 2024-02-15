<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="ProductView.aspx.cs" Inherits="Craftglow.User.ProductView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./css/view.css">
    <script  src="./javascript/view.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pview">
    <div class="row">
        <div class="col-md-6 left mt-2">
           <img src="../Assets/user/products/view1.jpg" alt="">
        </div>
        <div class="col-md-6 right mt-2">
            <div class="head">
                <h1>Old-School Charpahi-Style Tray</h1>
                <a href="#"><i class="fa-regular fa-heart"></i></a>
            </div>
            <p class="instock">In Stock</p>
            <div class="review">
                 
                    <p>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                    </p>
               
               
                   <p>4 Reviews</p>
                
            </div>
            <h2><i class="fa-solid fa-indian-rupee-sign mx-2"></i>1680</h2>
            <hr>
            <div class="qty">
                <span style="font-size: 20px;">Qty</span>
                <div class="box">
                    <span>-</span>
                    <span>0</span>
                    <span>+</span>
                </div>
            </div>
            <div class="btns">
                <button>Add To Cart</button>
                <button>Buy Now</button>
            </div>
            <hr>
            <div class="work">
                <div class="contain">
                    <div class="icon"><i class="fa-solid fa-box-open"></i></div>
                    <div class="text">
                        <span>Delivery</span>
                        <p>2-8 days</p>
                    </div>
                </div>
                <div class="contain">
                    <div class="icon"><i class="fa-solid fa-indian-rupee-sign"></i></div>
                    <div class="text">
                        <span>COD</span>
                        <p>Available</p>
                    </div>
                </div>
                <div class="contain">
                    <div class="icon"><i class="fa-solid fa-truck"></i></div>
                    <div class="text">
                        <span>Free</span>
                        <p>Shipping Access India</p>
                    </div>
                </div>
                <div class="contain">
                    <div class="icon"><i class="fa-solid fa-plane-departure"></i></div>
                    <div class="text">
                        <span>Eligible</span>
                        <p>For International Shipping</p>
                    </div>
                </div>
                <div class="contain">
                    <div class="icon"><i class="fa-solid fa-right-left"></i></div>
                    <div class="text">
                        <span>Exchange & Return</span>
                        <p>in 10 days</p>
                    </div>
                </div>
               
            </div>

            <div class="desc">
                <h3>Description:</h3>
                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Consectetur, maiores cum? Laboriosam odit corporis deserunt dignissimos explicabo assumenda beatae. Tempore ad explicabo voluptate maiores aut beatae deserunt incidunt eaque earum.</p>
            </div>

            <div class="userReviw">
                <h2>Customer Review</h2>
                <div class="component">
                    <p class="msg">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quo, iste.</p>
                    <div class="info">
                        <span>Sagar Mandal</span>
                        <span>20Aug</span>
                    </div>
                    <hr>
                </div>
                <div class="component">
                    <p class="msg">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quo, iste.</p>
                    <div class="info">
                        <span>Sagar Mandal</span>
                        <span>20Aug</span>
                    </div>
                    <hr>
                </div>
                <div class="component">
                    <p class="msg">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quo, iste.</p>
                    <div class="info">
                        <span>Sagar Mandal</span>
                        <span>20Aug</span>
                    </div>
                    <hr>
                </div>
                <div class="component">
                    <p class="msg">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quo, iste.</p>
                    <div class="info">
                        <span>Sagar Mandal</span>
                        <span>20Aug</span>
                    </div>
                    <hr>
                </div>
                <div class="component">
                    <p class="msg">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quo, iste.</p>
                    <div class="info">
                        <span>Sagar Mandal</span>
                        <span>20Aug</span>
                    </div>
                    <hr>
                </div>
                <div class="component">
                    <p class="msg">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quo, iste.</p>
                    <div class="info">
                        <span>Sagar Mandal</span>
                        <span>20Aug</span>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </div>

    <div class="writeReview row">
        <div class="left col-md-6">
            <div class="rating">
                <h2>Rating</h2>
                <div class="star">
                    <p>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                    </p>
               
               
                   <p>4 Reviews</p>
                </div>
                <div class="bars">
                    <div class="bar">
                        <span>5 Star</span>
                        <span>
                            <progress value="75" max="100"></progress>
                        </span>
                        <span>75%(5)</span>
                    </div>
                    <div class="bar">
                        <span>4 Star</span>
                        <span>
                            <progress value="75" max="100"></progress>
                        </span>
                        <span>75%(5)</span>
                    </div>
                    <div class="bar">
                        <span>3 Star</span>
                        <span>
                            <progress value="75" max="100"></progress>
                        </span>
                        <span>75%(5)</span>
                    </div>
                    <div class="bar">
                        <span>2 Star</span>
                        <span>
                            <progress value="75" max="100"></progress>
                        </span>
                        <span>75%(5)</span>
                    </div>
                    <div class="bar">
                        <span>1 Star</span>
                        <span>
                            <progress value="75" max="100"></progress>
                        </span>
                        <span>75%(5)</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="right col-md-6">
            <h2>Write Message</h2>
            <div class="form">
                <div class="star-rating">
                    <input type="radio" id="star5" name="rating" value="5" />
                    <label for="star5">★</label>
                    <input type="radio" id="star4" name="rating" value="4" />
                    <label for="star4">★</label>
                    <input type="radio" id="star3" name="rating" value="3" />
                    <label for="star3">★</label>
                    <input type="radio" id="star2" name="rating" value="2" />
                    <label for="star2">★</label>
                    <input type="radio" id="star1" name="rating" value="1" />
                    <label for="star1">★</label>
                  </div>
                <div class="mb-3 form-div">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" required>
                  </div>
                  <div class="mb-3 form-div">
                    <label for="message">Message:</label>
                    <textarea id="message" name="message" rows="4" required></textarea>
                  </div>
                  
                  <button type="submit" class="craft-btn">Submit Review</button>
            </div>
        </div>
    </div>

    <div class="recomend">
        <h1 class="text-center">Recomendation</h1>
    <div class="wrapper">
        
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
    </div>
</div>
    </div>

</asp:Content>
