@extends('pages.layout.master')
@section('title','Suất chiếu ')
@section('content')
<div class="movie__top">
</div>

<div class="ticketplan_container">
  <div class="ticketplan_list">
    <div class="title">
      <h2><span> Danh sách các suất chiếu phim: </span>{{ $phim->ten_phim }}</h2>
    </div>
    <div class="ticketplan_content">
      @if ($danh_sach_suat_chieu->count() == 0)
      <h5 style="color:green">Hiện tại phim đã ngừ chiếu, Mong quý khác thông cảm</h5>
      @else
      <table>
        <thead>
          <tr>
            <th>Suất chiếu</th>
            <th>Giờ bắt đầu</th>
            <th>Giờ kết thức</th>
            <th>Ngày chiếu</th>
            <th>Giá</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          @foreach ($danh_sach_suat_chieu as $suat_chieu )
          <tr>
            <td>{{ $suat_chieu->suat_chieu_id }}</td>
            <td>{{Carbon\Carbon::parse($suat_chieu->gio_bat_dau)->format('h:i') }}</td>
            <td>{{  Carbon\Carbon::parse($suat_chieu->gio_ket_thuc)->format('h:i') }}</td>
            <td>{{  Carbon\Carbon::parse($suat_chieu->ngay_chieu)->format('M d') }}</td>
          
            <td>{{ number_format($suat_chieu->tien_suat_chieu, 0,'', ',') }} <sup>đ</sup></td>
            <td>
              <a href="/movie/step-3/{{  $suat_chieu->suat_chieu_id }}" class=" btn btn--while">Chọn</a>
            </td>
          </tr>
          @endforeach

        </tbody>
      </table>


      @endif
    </div>
  </div>
</div>
@stop