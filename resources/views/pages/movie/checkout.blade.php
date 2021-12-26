@extends('pages.layout.master')
@section('title','Check Out ')
@section('content')
<!-- ==========Banner-Section========== -->
<section class="details-banner hero-area bg_img seat-plan-banner"
    data-background="{{ URL::asset('/assets/images/banner/banner04.jpg') }}">
    <div class="container">
        <div class="details-banner-wrapper">
            <div class="details-banner-content style-two">
                <h3 class="title">{{ $phim->ten_phim }}</h3>
                <div class="tags">
                    <a href="#0"> {{ str_replace(',',' | ',$phim->dien_vien) }}</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==========Banner-Section========== -->

<!-- ==========Page-Title========== -->
<section class="page-title bg-one">
    <div class="container">

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
                        <h5 class="title">Already a Boleto Member?</h5>
                        <p>Sign in to earn points and make booking easier!</p>
                    </div>
                    {{-- <a href="#0" class="sign-in-area">
                        <i class="fas fa-user"></i><span>Sign in</span>
                    </a> --}}
                </div>
                <div class="checkout-widget checkout-contact">
                    <h5 class="title">Share your Contact Details </h5>
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
                    <h5 class="title">Phương thức thanh toán </h5>
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
                            <h6 class="subtitle">Tên phim<span>{{ $phim->ten_phim }}</span></h6>
                            <span class="info">Loại phim<span>{{$ten_loai_phim }}</span></span>
                        </li>
                        <li>
                            <h6 class="subtitle"><span>Giá</span><span>{{ number_format($gia_ve_xem_phim, 0, '', ',') }}
                                    <sup>đ</sup></span></h6>
                            <div class="info"><span>{{ Carbon\Carbon::parse($phim->ngay_cong_chieu) }}</span>
                                <span>Tickets</span>
                            </div>
                        </li>
                        {{-- <li>
                            <h6 class="subtitle mb-0"><span>Tickets Price</span><span>$150</span></h6>
                        </li> --}}
                    </ul>
                    <ul class="side-shape">
                        <li>
                            <h6 class="subtitle"><span>Phòng chiếu</span><span>{{ $ghe_ngoi->id_phong_chieu }}</span>
                            </h6>
                            <span class="info"><span>Ghế
                                    ngồi</span><span>{{$ghe_ngoi->vi_tri_day}}{{$ghe_ngoi->vi_tri_cot}}</span></span>
                        </li>
                        <li>
                            <h6 class="subtitle"><span>Quốc gia</span><span>{{ $phim->quoc_gia }}</span></h6>
                        </li>
                    </ul>
                    <ul>
                        <li>
                            <span class="info"><span>Thời lượng</span><span>{{
                                    floor($phim->thoi_luong/60).'hrs '.(($phim->thoi_luong%60
                                    >0)?($phim->thoi_luong%60).'min':'')
                                    }}</span></span>
                        </li>
                        <li>
                            <span class="info"><span>Mã vé</span><span>{{ $code }}</span></span>
                        </li>
                    </ul>
                </div>
                <div class="proceed-area  text-center">
                    <h6 class="subtitle"><span>Người đặt:</span><span>{{ $nguoi_dung->ten_nguoi_dung }}</span></h6>
                    <form method="post" action="/movie/notification">
                        @csrf
                        <input name="id_phim" id="id_phim" type="hidden" value="" />
                        <input name="id_phong_chieu" id="id_phong_chieu" type="hidden" value="" />
                        <input name="id_ghe_ngoi" id="id_ghe_ngoi" type="hidden" value="" />
                        <input name="id_suat_chieu" id="id_suat_chieu" type="hidden" value="" />
                        <input name="tong_tien" id="tong_tien" type="hidden" value="" />
                        <div class="row">
                            <a href="/movie" class="custom-button back-button col-6">Huy</a>
                            <button type="submit" class="custom-button back-button col-6">Đồng ý</a>

                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    
    document.getElementById('id_phim').value = '{{ $phim->phim_id }}';
    document.getElementById('id_phong_chieu').value = '{{ $ghe_ngoi->id_phong_chieu}}';
    document.getElementById('id_ghe_ngoi').value = '{{ $ghe_ngoi->ghe_ngoi_id }}';
    document.getElementById('id_suat_chieu').value = '{{ $suat_chieu->suat_chieu_id }}';
    document.getElementById('tong_tien').value = '{{$gia_ve_xem_phim }}';
</script>
<!-- ==========Movie-Section========== -->
@stop