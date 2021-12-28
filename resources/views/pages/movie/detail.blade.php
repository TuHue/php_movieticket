@extends('pages.layout.master')
@section('title', 'Movie ')
@section('content')
<div id="detail__banner" data-background="{{ URL::asset('images/'.$phim->hinh_anh) }}">
</div>
<div class="detail__container">
    <div class="detail__context">
        <div class="detail__img">
            <img src="{{ URL::asset('images/'.$phim->hinh_anh)}}" alt="">
        </div>
        <div class="detail__infor">
            <h3> <span>Tên phim: </span> {{ $phim->ten_phim }}</h3>
            <p class="detail__infor--author"><span>Diễn viên: </span> {{ str_replace(',',' | ',$phim->dien_vien) }}</p>
            <p> <span>Thời lương: </span> {{
                floor($phim->thoi_luong/60).'hrs '.(($phim->thoi_luong%60
                >0)?($phim->thoi_luong%60).'min':'')
                }}</p>
            <p> <span>Độ tuổi: </span> {{ $phim->gioi_han_tuoi }} +</p>
            <p><span>Quốc gia: </span> {{ $phim->quoc_gia }}</p>
            <p><span>Ngày công chiếu: </span> {{ Carbon\Carbon::parse($phim->ngay_cong_chieu)->toDayDateTimeString() }}</p>
            <p><span>Mô tả:</span> {{ $phim->tom_tat }}</p>
            <a href="/movie/step-2/{{ $phim->phim_id }}" class=" btn btn--now">book now</a>
        </div>
    </div>
</div>
@stop