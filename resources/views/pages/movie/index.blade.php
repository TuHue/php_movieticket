@extends('pages.layout.master')
@section('title','Movie ')
@section('content')
<style>
    svg {
        font-size: 12px !important;
        display: none;
    }

    nav {
        margin-top: 20px;
        font-size: 2rem;
    }

    nav .flex {
        display: none !important
    }

    nav span a {
        color: black;
        padding: 4px 10px;
        text-decoration: none;
    }
    nav span span span {
        color: red ;
    }
    nav .hidden div p {
        display: none !important;
    }
</style>

<section class="home" id="home">

    <div class="content">
        <h3>adventure is worthwhile</h3>
        <p>dicover new places with us, adventure awaits</p>
        <a href="#" class="btn">discover more</a>
    </div>

    <div class="controls">
        <span class="vid-btn active" data-src="{{ URL::asset('/assets/images/vid-1.mp4') }}"></span>
        <span class="vid-btn" data-src="{{ URL::asset('/assets/images/vid-2.mp4') }}"></span>
        <span class="vid-btn" data-src="{{ URL::asset('/assets/images/vid-3.mp4') }}"></span>
        <span class="vid-btn" data-src="{{ URL::asset('/assets/images/vid-4.mp4') }}"></span>
        <span class="vid-btn" data-src="{{ URL::asset('/assets/images/vid-5.mp4') }}"></span>
    </div>

    <div class="video-container">
        <video src="{{ URL::asset('/assets/images/vid-1.mp4') }}" id="video-slider" loop autoplay muted></video>
    </div>

</section>

<section class="packages" id="packages">

    <h1 class="heading">
        <span>m</span>
        <span>o</span>
        <span>v</span>
        <span>i</span>
        <span>e</span>
        <span>t</span>
        <span>i</span>
        <span>k</span>
        <span>e</span>
        <span>t</span>
    </h1>

    <div class="box-container">
        @foreach ($danh_sach_phim as $phim )
        <div class="box" style="width: 18rem;">
            <img src="{{ URL::asset('images/'.$phim->hinh_anh) }}" alt="">
            <div class="content">
                <h3>{{ $phim->ten_phim }} </h3>
                <p>{{ str_replace(',',' | ',$phim->dien_vien) }}</p>
                <a href="/movie/step-1/{{ $phim->phim_id }}" class="btn">book now</a>
            </div>
        </div>
        @endforeach
    </div>
    {{ $danh_sach_phim->links() }}

</section>
@stop