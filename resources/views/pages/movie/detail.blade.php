@extends('pages.layout.master')
@section('title', 'Chi tiết')
@section('content')
<div class="movie__top">
</div>
<div class="detail__container">
    <div class="detail__context">
        <div class="detail__img">
            <img src="{{ URL::asset('images/'.$phim->hinh_anh)}}" alt="">
        </div>
        <div class="detail__infor">
            <table>
                <tr>
                    <td class="col-1">Tên phim:</td>
                    <td class="col">
                        <h3>{{ $phim->ten_phim }}</h3>
                    </td>
                </tr>
                <tr>
                    <td class="col-1">Diễn viên:</td>
                    <td class="col">
                        <p>{{ str_replace(',',' | ',$phim->dien_vien) }}</p>
                    </td>
                </tr>
                <tr>
                    <td class="col-1">Thời lương:</td>
                    <td class="col">
                        <p>{{ str_replace(',',' | ',$phim->dien_vien) }}</p>
                    </td>
                </tr>
                <tr>
                    <td class="col-1">Thời lương:</td>
                    <td class="col">
                        <p>{{ floor($phim->thoi_luong/60).'hrs
                            '.(($phim->thoi_luong%60>0)?($phim->thoi_luong%60).'min':'')}} </p>
                    </td>
                </tr>
                <tr>
                    <td class="col-1">Quốc gia:</td>
                    <td class="col">
                        <p>{{ $phim->quoc_gia }}</p>
                    </td>
                </tr>
                <tr>
                    <td class="col-1">Ngày công chiếu:</td>
                    <td class="col">
                        <p>{{ Carbon\Carbon::parse($phim->ngay_cong_chieu)->toDayDateTimeString() }}</p>
                    </td>
                </tr>
                <tr>
                    <td class="col-1">Mô tả</td>
                    <td class="col">
                        <p>{{ $phim->tom_tat }}</p>
                    </td>
                </tr>
                <tr>
                    <td class="col-1"></td>
                    <td class="col">
                        <a href="/movie" class=" btn btn--while">Quay lại</a>
                        <a href="/movie/step-2/{{ $phim->phim_id }}" class=" btn btn--while">Đặt vé</a>
                    </td>
                </tr>
            </table>

            <div class="detail__comment">
                <div class="comment__list">
                    <div class="comment__title">
                        <p>Các bình luận(<span>{{ $danh_sach_binh_luan->count() }}</span>)</p>
                    </div>
                    @foreach ($danh_sach_binh_luan as $binh_luan))
                    <div class="comment__item">
                        <h3 class="item__name">{{ $binh_luan->ten_nguoi_binh_luan }}</h3>
                        <p class="item__email">{{ $binh_luan->email_nguoi_binh_luan }}</p>
                        <p class="item__comment">{{ $binh_luan->noi_dung_binh_luan}}</p>
                    </div>

                    @endforeach

                </div>
                <form class="comment__form" action="/movie/step-1" method="post">
                   @csrf
                    <div class="title">Bình Luận</div>
                    <input type="hidden" value="{{ $phim->phim_id }}" name="id_phim">
                    <input type="text" required name="ten_nguoi_binh_luan" value="" placeholder="Tên..." />
                    <input type="text" required name="email_nguoi_binh_luan" value="" placeholder="Email..." />
                    <input type="text" required name="noi_dung_binh_luan" value="" placeholder="Bình luận..." />
                    <input type="submit" class="btn--post btn--while" value="Đăng" />
                </form>
            </div>
        </div>
    </div>
</div>
@stop