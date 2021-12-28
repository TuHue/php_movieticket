@extends('pages.layout.master')
@section('title','Check Out ')
@section('content')
<div class="ticketplan_top"></div>
<div class="checkout__container">
    <div class="title">
        <h3>Vé : {{ $phim->ten_phim }}</h3>
    </div>
    <table>
        <thead>
            <tr>
                <th>Mục</th>
                <th>Nội dung</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Tên phim</td>
                <td>{{ $phim->ten_phim }}</td>
            </tr>
            <tr>
                <td>Loại phim</td>
                <td>{{ $ten_loai_phim }}</td>
            </tr>
            <tr>
                <td>Giá vé</td>
                <td>{{ number_format($gia_ve_xem_phim, 0, '', ',') }}
                    <sup>đ</sup></span>
                </td>
            </tr>
            <tr>
                <td>Ngày công chiếu</td>
                <td>{{ Carbon\Carbon::parse($phim->ngay_cong_chieu) }}</td>
            </tr>
            <tr>
                <td>Suất chiếu</td>
                <td>{{ $suat_chieu->suat_chieu_id }}</td>
            </tr>
            <tr>
                <td>Phòng chiếu</td>
                <td>{{ $ghe_ngoi->id_phong_chieu }}</td>
            </tr>
            <tr>
                <td>Ghế</td>
                <td>{{$ghe_ngoi->vi_tri_day}}{{$ghe_ngoi->vi_tri_cot}}</td>
            </tr>
            <tr>
                <td>Thời lượng</td>
                <td>{{
                    floor($phim->thoi_luong/60).'hrs '.(($phim->thoi_luong%60
                    >0)?($phim->thoi_luong%60).'min':'')
                    }}</td>
            </tr>
            <tr>
                <td>Mã vé</td>
                <td>{{ $code }}</td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <form method="post" action="/movie/notification">
                        @csrf
                        <input name="id_phim" id="id_phim" type="hidden" value="" />
                        <input name="id_phong_chieu" id="id_phong_chieu" type="hidden" value="" />
                        <input name="id_ghe_ngoi" id="id_ghe_ngoi" type="hidden" value="" />
                        <input name="id_suat_chieu" id="id_suat_chieu" type="hidden" value="" />
                        <input name="tong_tien" id="tong_tien" type="hidden" value="" />
                        <input name="ma_xac_thuc" id="ma_xac_thuc" type="hidden" value="" />
                        <input name="ten_nguoi_dat" id="ten_nguoi_dat" type="hidden" value="" />
                        <input name="ten_phim" id="ten_phim" type="hidden" value="" />


                        <div class="row">
                            <a href="/movie" class="btn">Huy</a>
                            <button type="submit" class="btn">Đồng ý</a>

                        </div>

                    </form>
                </td>
            </tr>
        </tbody>
    </table>
</div>
<script>
    document.getElementById('id_phim').value = '{{ $phim->phim_id }}';
    document.getElementById('id_phong_chieu').value = '{{ $ghe_ngoi->id_phong_chieu}}';
    document.getElementById('id_ghe_ngoi').value = '{{ $ghe_ngoi->ghe_ngoi_id }}';
    document.getElementById('id_suat_chieu').value = '{{ $suat_chieu->suat_chieu_id }}';
    document.getElementById('tong_tien').value = '{{$gia_ve_xem_phim }}';
    document.getElementById('ma_xac_thuc').value = '{{$code}}';
    document.getElementById('ten_nguoi_dat').value = '{{ $nguoi_dung->ten_nguoi_dung }}';
    document.getElementById('ten_phim').value = '{{$phim->ten_phim }}';
</script>
@stop