$(document).ready(function () {
  $.ajax({
    type: "POST",
    url: "Home.aspx/GetBannerData",
    contentType: "application/json; charset=utf-8",
    success: function (response) {
      let data = JSON.parse(response.d);
      let bannerContain = $("#banner-contain");

      $.each(data.Table, function (index, item) {
        let banner = $('<div class="swiper-slide"></div>');
        banner.html(`
        <div class="text">
            <h1>${item.heading}</h1>
            <p>${item.sub_head}</p>
        </div>
        <a href="#">
            <img src="../Assets/user/${item.img}" alt="">
        </a>
    `);
        bannerContain.append(banner);
      });

      // Initialize Swiper after populating the slides
      var swiper = new Swiper(".mySwiper", {
        centeredSlides: true,
        loop: true,
        parallax: true,
        autoplay: {
          delay: 5000,
          disableOnInteraction: false,
        },
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
          dynamicBullets: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    },
    error: function (xhr, status, error) {
      console.error(error);
    },
  });
});


document.addEventListener('DOMContentLoaded', function () {
    let cartItems = document.querySelectorAll(".cart-add");

    cartItems.forEach((item) => {
        item.addEventListener("click", () => {
            item.innerText = "Go to Cart";
        });
    });
});
