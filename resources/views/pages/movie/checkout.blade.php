@extends('pages.layout.master')
@section('title','Check Out ')
@section('content')
 <!-- ==========Banner-Section========== -->
 <section class="details-banner hero-area bg_img seat-plan-banner" data-background="{{ URL::asset('/assets/images/banner/banner04.jpg') }}">
    <div class="container">
        <div class="details-banner-wrapper">
            <div class="details-banner-content style-two">
                <h3 class="title">Venus</h3>
                <div class="tags">
                    <a href="#0">City Walk</a>
                    <a href="#0">English - 2D</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==========Banner-Section========== -->

<!-- ==========Page-Title========== -->
<section class="page-title bg-one">
    <div class="container">
        <div class="page-title-area">
            <div class="item md-order-1">
                <a href="movie-ticket-plan.html" class="custom-button back-button">
                    <i class="flaticon-double-right-arrows-angles"></i>back
                </a>
            </div>
            <div class="item date-item">
                <span class="date">MON, SEP 09 2020</span>
                <select class="select-bar">
                    <option value="sc1">09:40</option>
                    <option value="sc2">13:45</option>
                    <option value="sc3">15:45</option>
                    <option value="sc4">19:50</option>
                </select>
            </div>
            <div class="item">
                <h5 class="title">05:00</h5>
                <p>Mins Left</p>
            </div>
        </div>
    </div>
</section>
<!-- ==========Page-Title========== -->

<!-- ==========Movie-Section========== -->
<div class="movie-facility padding-bottom padding-top">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="checkout-widget d-flex flex-wrap align-items-center justify-cotent-between">
                    <div class="title-area">
                        <h5 class="title">Already a Boleto  Member?</h5>
                        <p>Sign in to earn points and make booking easier!</p>
                    </div>
                    <a href="#0" class="sign-in-area">
                        <i class="fas fa-user"></i><span>Sign in</span>
                    </a>
                </div>
                <div class="checkout-widget checkout-contact">
                    <h5 class="title">Share your Contact  Details </h5>
                    <form class="checkout-contact-form">
                        <div class="form-group">
                            <input type="text" placeholder="Full Name">
                        </div>
                        <div class="form-group">
                            <input type="text" placeholder="Enter your Mail">
                        </div>
                        <div class="form-group">
                            <input type="text" placeholder="Enter your Phone Number ">
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Continue" class="custom-button">
                        </div>
                    </form>
                </div>
            
                <div class="checkout-widget checkout-card mb-0">
                    <h5 class="title">Phương thức thanh toán  </h5>
                    <p class="notice">
                        Người dùng thanh toán tại quầy bán vé <a href="http://">Liên hệ</a>
                    </p>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="booking-summery bg-one">
                    <h4 class="title">booking summery</h4>
                    <ul>
                        <li>
                            <h6 class="subtitle">Tên phim<span>Kẻ Không Ngủ</span></h6>
                            <span class="info">Loại phim<span>Tình cảm</span></span>
                        </li>
                        <li>
                            <h6 class="subtitle"><span>Số lượng vé</span><span>02</span></h6>
                            <div class="info"><span>10 SEP TUE, 11:00 PM</span> <span>Tickets</span></div>
                        </li>
                        {{-- <li>
                            <h6 class="subtitle mb-0"><span>Tickets  Price</span><span>$150</span></h6>
                        </li> --}}
                    </ul>
                    <ul class="side-shape">
                        <li>
                            <h6 class="subtitle"><span>Phòng chiếu</span><span>2</span></h6>
                            <span class="info"><span>Ghế ngồi</span><span>F7 - F8</span></span>
                        </li>
                        <li>
                            <h6 class="subtitle"><span>Quốc gia</span><span>Việt Nam</span></h6>
                        </li>
                    </ul>
                    <ul>
                        <li>
                            <span class="info"><span>Thời lượng</span><span>02:10:00</span></span>
                        </li>
                        <li>
                            <span class="info"><span>Mã vé</span><span>sad432h</span></span>
                        </li>
                    </ul>
                </div>
                <div class="proceed-area  text-center">
                    <h6 class="subtitle"><span>Người đặt:</span><span>Vũ Hoàng Ngân</span></h6>
                    <a href="#0" class="custom-button back-button">proceed</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ==========Movie-Section========== -->
@stop