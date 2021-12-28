@extends('pages.layout.master')
@section('title','Ghế')
@section('content')
<div class="movie__top">
</div>
<div class="seatphan_container">
    <div class="screen-area">
        <div class="screen-thumb">
            <img src="{{URL::to('assets/images/movie/screen-thumb.png')}}" alt="movie">
        </div>
        <h5 class="subtitle">Ghế thường</h5>
        <div class="screen-wrapper">
            <ul class="seat-area">
                <li class="seat-line">
                    <ul class="seat--area">
                        <li class="front-seat">
                            <ul class="seat_container" >
                                @foreach ( $danh_sach_loc as $item )
                                @if ( $item['item']->id_loai_ghe == 'GT')
                                @if($item['key']==false)
                                <a href="/movie/step-4/{{  $id}}/{{$item['item']->ghe_ngoi_id }}"
                                    style="color:#fff">
                                    <li class="single-seat">
                                        <img src="{{URL::asset('assets/images/movie/seat01.png')}}" alt="seat">
                                        <span
                                            class="sit-num">{{$item['item']->vi_tri_day}}{{$item['item']->vi_tri_cot}}</span>
                                    </li>
                                </a>
                                @else
                                <li class="single-seat">
                                    <img src="{{URL::asset('assets/images/movie/seat01-free.png')}}" alt="seat">
                                    <span
                                        class="sit-num">{{$item['item']->vi_tri_day}}{{$item['item']->vi_tri_cot}}</span>
                                </li>
                                @endif
                                @endif
                                @endforeach
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        <h5 class="subtitle">Ghế Vip</h5>
        <div class="screen-wrapper">
            <ul class="seat-area">
                <li class="seat-line">
                    <ul class="seat--area">
                        <li class="front-seat">
                            <ul class="container" style="display:flex; flex-wrap: wrap">
                                @foreach ( $danh_sach_loc as $item )
                                @if ( $item['item']->id_loai_ghe == 'GV')
                                @if($item['key']==false)
                                <a href="/movie/step-4/{{  $id}}/{{$item['item']->ghe_ngoi_id }}"
                                    style="color:#fff">
                                    <li class="single-seat">
                                        <img src="{{URL::asset('assets/images/movie/seat02.png')}}" alt="seat">
                                        <span
                                            class="sit-num">{{$item['item']->vi_tri_day}}{{$item['item']->vi_tri_cot}}</span>
                                    </li>
                                </a>
                                @else
                                <li class="single-seat">
                                    <img src="{{URL::asset('assets/images/movie/seat02-free.png')}}" alt="seat">
                                    <span
                                        class="sit-num">{{$item['item']->vi_tri_day}}{{$item['item']->vi_tri_cot}}</span>
                                </li>
                                @endif
                                @endif
                                @endforeach
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

</div>
<!-- ==========Movie-Section========== -->

@stop