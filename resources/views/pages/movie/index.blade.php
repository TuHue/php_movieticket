@extends('pages.layout.master')
@section('title','Danh sách phim ')
@section('content')
{
    {
        dd($danh_sach_phim);
    }
}
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
        color: white;
        padding: 4px 10px;
        text-decoration: none;
    }

    nav span span span {
        color: red;
    }

    nav .hidden div p {
        display: none !important;
    }
</style>
<div class="movie__top">
    <input type="text" name="searchPhim" />
</div>
<div class="movie__container">
    <div class="movie__filters">
        <div class="filters__category">
            <div class="title">
                <h3>Filters</h3>
            </div>
            <div class="filters__list">
                @foreach ($danh_sach_loai_phim as $loai_phim )
                <a href="/movie/{{ $loai_phim->loai_phim_id }}"><i class="fas fa-arrow-right"></i> {{
                    $loai_phim->ten_loai_phim }}</a>
                @endforeach
            </div>
        </div>
    </div>
    <div class="movie__context">
        <div class="search">
            <form
            class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
            action="/movie/search"
            method="POST"
            >
            @csrf
            <div class="topnav">
                <input type="text" placeholder="Search.." name="tenPhim">
              </div>
        </form>
        </div>
        <div class="title">
            <h3>Movie in Cinema</h3>
        </div>
        <div class="movie__list">
            @foreach ($danh_sach_phim as $phim )
            <div class="movie__item">
                <img src="{{ URL::asset('images/phim/'.$phim->hinh_anh) }}" alt="">
                <div class="item__infor">
                    <h3>{{ $phim->ten_phim }} </h3>
                    <p class="item_infor--author">{{ str_replace(',',' | ',$phim->dien_vien) }}</p>
                    <p class="item_infor--description">{{ $phim->tom_tat }}</p>
                    <a href="/movie/step-1/{{ $phim->phim_id }}" class=" btn btn--now">view</a>
                </div>
            </div>
            @endforeach
        </div>

        {{(($danh_sach_phim->count()) > 0) ? $danh_sach_phim->links() : null }}
    </div>
</div>
</div>
@stop