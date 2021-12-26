@extends('pages.layout.master')
@section('title','Ticket Phan ')
@section('content')
<!-- ==========Window-Warning-Section========== -->
<section class="window-warning inActive">
    <div class="lay"></div>
    <div class="warning-item">
        <h6 class="subtitle">Welcome! </h6>
        <h4 class="title">Select Your Seats</h4>
        <div class="thumb">
            <img src="{{URL::asset('assets/images/movie/seat-plan.png')}}" alt="movie">
        </div>
        <a href="" id="nextstep" class="custom-button seatPlanButton">Seat Plans<i class="fas fa-angle-right"></i></a>
    </div>
</section>
<!-- ==========Window-Warning-Section========== -->

<!-- ==========Banner-Section========== -->
<section class="details-banner hero-area bg_img" data-background="{{URL::asset('assets/images/banner/banner03.jpg')}}">
    <div class="container">
        <div class="details-banner-wrapper">
            <div class="details-banner-content">
                <h5 class="title">{{ $phim->ten_phim }}</h3>
                    <div class="tags">
                        <p>{{ str_replace(',',' | ',$phim->dien_vien) }}</p>
                    </div>
            </div>
        </div>
    </div>
</section>
<!-- ==========Banner-Section========== -->

<!-- ==========Book-Section========== -->
<section class="book-section bg-one">
    <div class="container">
        <form class="ticket-search-form two">

        </form>
    </div>
</section>
<!-- ==========Book-Section========== -->

<!-- ==========Movie-Section========== -->
<div class="ticket-plan-section padding-bottom padding-top">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-9 mb-5 mb-lg-0">
                @if ($danh_sach_suat_chieu->count() == 0) <h5 style="color:green">Hiện tại phim đã ngừ chiếu, Mong quý khác thông cảm</h5>
                    @else
                    <ul class="seat-plan-wrapper bg-five">
                        @foreach ($danh_sach_suat_chieu as $suat_chieu)
                        <li>
                            <div class="movie-name">
                                <div class="icons">
                                    <i class="far fa-heart"></i>
                                    <i class="fas fa-heart"></i>
                                </div>
                                <a href="#0" class="name">Suất Chiếu {{ $suat_chieu->suat_chieu_id }}</a>
                                <div class="location-icon">
                                    <i class="fas fa-map-marker-alt"></i>
                                </div>
                            </div>
                            <div class="movie-schedule">
                                <div class="item" style="width: 100%;"
                                    onclick="onClickChonSuat({{ $suat_chieu->suat_chieu_id }})">
                                    {{Carbon\Carbon::parse($suat_chieu->gio_bat_dau)->format('h:i') }} : {{
                                    Carbon\Carbon::parse($suat_chieu->gio_ket_thuc)->format('h:i') }}: {{
                                    Carbon\Carbon::parse($suat_chieu->gio_bat_dau)->format('M d') }} : Số {{
                                    $suat_chieu->id_phong_chieu }}: {{ number_format($suat_chieu->tien_suat_chieu, 0,
                                    '', ',') }} <sup>đ</sup>
                                </div>
                            </div>
                        </li>
                        @endforeach

                    </ul>
                    @endif
            </div>
            <div class="col-lg-3 col-md-6 col-sm-10">
                <div class="widget-1 widget-banner">
                    <div class="widget-1-body">
                        <a href="#0">
                            <img src="{{URL::asset('assets/images/sidebar/banner/banner03.jpg')}}" alt="banner">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ==========Movie-Section========== -->
<script>
    function onClickChonSuat(id){
        var a = document.getElementById('nextstep'); 
    a.href = "/movie/step-3/"+id;
    }
</script>
@stop