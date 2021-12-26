@extends('pages.layout.master')
@section('title', 'Movie ')
@section('content')
<!-- ==========Banner-Section========== -->
<section class="details-banner bg_img" data-background="{{ URL::asset('images/'.$phim->hinh_anh) }}">
    <div class="container">
        <div class="details-banner-wrapper">
            <div class="details-banner-thumb">
                <img src="{{ URL::asset('images/'.$phim->hinh_anh) }}" alt="movie">
                <a href="https://www.youtube.com/embed/KGeBMAgc46E" class="video-popup">
                    <img src="{{ URL::asset('images/'.$phim->hinh_anh) }}" alt="movie">
                </a>
            </div>
            <div class="details-banner-content offset-lg-3">
                <h3 class="title">{{ $phim->ten_phim }}</h3>
                <div class="tags">
                    {{ str_replace(',',' | ',$phim->dien_vien) }}
                </div>
                <a href="#0" class="button">horror</a>
                <div class="social-and-duration">
                    <div class="duration-area">
                        <div class="item">
                            <i class="fas fa-calendar-alt"></i><span>{{
                                Carbon\Carbon::parse($phim->ngay_cong_chieu)->toDayDateTimeString() }}</span>
                        </div>
                        <div class="item">
                            <i class="far fa-clock"></i><span>{{
                                floor($phim->thoi_luong/60).'hrs '.(($phim->thoi_luong%60
                                >0)?($phim->thoi_luong%60).'min':'')
                                }}</span>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
</section>
<!-- ==========Banner-Section========== -->

<!-- ==========Book-Section========== -->
<section class="book-section bg-one">
    <div class="container">
        <div class="book-wrapper offset-lg-3">
            <a href="/movie/step-2/{{ $phim->phim_id }}" class="custom-button">book tickets</a>
        </div>
    </div>
</section>
<!-- ==========Book-Section========== -->

<!-- ==========Movie-Section========== -->
<section class="movie-details-section padding-top padding-bottom">
    <div class="container">
        <div class="row justify-content-center flex-wrap-reverse mb--50">
            <div class="col-lg-3 col-sm-10 col-md-6 mb-50">
                <div class="widget-1 widget-tags">
                    <ul>
                        <li>
                            <a href="#0">2D</a>
                        </li>
                        <li>
                            <a href="#0">imax 2D</a>
                        </li>
                        <li>
                            <a href="#0">4DX</a>
                        </li>
                    </ul>
                </div>
                <div class="widget-1 widget-offer">
                    <h3 class="title">Applicable offer</h3>
                    <div class="offer-body">
                        <div class="offer-item">
                            <div class="thumb">
                                <img src="{{ URL::asset('assets/images/sidebar/offer01.png') }}" alt="sidebar">
                            </div>
                            <div class="content">
                                <h6>
                                    <a href="#0">Amazon Pay Cashback Offer</a>
                                </h6>
                                <p>Win Cashback Upto Rs 300*</p>
                            </div>
                        </div>
                        <div class="offer-item">
                            <div class="thumb">
                                <img src="{{ URL::asset('assets/images/sidebar/offer02.png') }}" alt="sidebar">
                            </div>
                            <div class="content">
                                <h6>
                                    <a href="#0">PayPal Offer</a>
                                </h6>
                                <p>Transact first time with Paypal and
                                    get 100% cashback up to Rs. 500</p>
                            </div>
                        </div>
                        <div class="offer-item">
                            <div class="thumb">
                                <img src="{{ URL::asset('assets/images/sidebar/offer03.png') }}" alt="sidebar">
                            </div>
                            <div class="content">
                                <h6>
                                    <a href="#0">HDFC Bank Offer</a>
                                </h6>
                                <p>Get 15% discount up to INR 100*
                                    and INR 50* off on F&B T&C apply</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="widget-1 widget-banner">
                    <div class="widget-1-body">
                        <a href="#0">
                            <img src="{{ URL::asset('assets/images/sidebar/banner/banner01.jpg') }}" alt="banner">
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 mb-50">
                <div class="movie-details">

                    <div class="tab summery-review">
                        <ul class="tab-menu">
                            <li class="active">
                                discription
                            </li>
                            <li>
                                user review <span>{{ $danh_sach_binh_luan ->count() }}</span>
                            </li>
                        </ul>
                        <div class="tab-area">
                            <div class="tab-item active">
                                <div class="item">
                                    <h5 class="sub-title">{{ $phim->ten_phim }}</h5>
                                    <p>{{ $phim->tom_tat }} </p>
                                </div>

                            </div>
                            <div class="tab-item">
                                @foreach ($danh_sach_binh_luan as $binh_luan )
                                <div class="movie-review-item">
                                    <div class="author">

                                        <div class="movie-review-info">
                                            <h6 class="subtitle"><a href="#0">{{ $binh_luan->ten_nguoi_binh_luan }}</a>
                                            </h6>
                                            <span><i class="fas fa-check"></i> {{ $binh_luan->email_nguoi_binh_luan
                                                }}</span>
                                        </div>
                                    </div>
                                    <div class="movie-review-content">

                                        <p>{{ $binh_luan->noi_dung_binh_luan }}</p>
                                        </p>

                                    </div>
                                </div>
                                @endforeach
                                <form action="/movie/step-1" method="post">
                                    @csrf
                                    <input type="text" name="id_phim" value="{{ $phim->phim_id }}" hidden/>
                                    <div class="form-group row">
                                        <label for="ten" class="col-sm-4 col-form-label">TÊN</label>
                                        <div class="col-sm-8">
                                            <input required type="text" class="form-control " name="ten_nguoi_binh_luan"
                                                aria-describedby="emailHelp" placeholder="Nhập tên..." id="ten">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="email_cmt" class="col-sm-4 col-form-label">EMAIL</label>
                                        <div class="col-sm-8">
                                            <input required type="email" class="form-control " name="email_nguoi_binh_luan"
                                                aria-describedby="emailHelp" placeholder="Nhập email..." id="email_cmt">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="binh_luan" class="col-sm-4 col-form-label">BÌNH LUẬN</label>
                                        <div class="col-sm-8">
                                            <textarea class="form-control" name="noi_dung_binh_luan" aria-describedby="emailHelp"
                                                placeholder="Nhập bình luận..." id="binh_luan"></textarea>

                                        </div>
                                    </div>
                                    <button type="submit" class="form-control btn btn-primary btn-user">
                                        Bình luận
                                    </button>
                                </form>
                                <div class="row">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@stop