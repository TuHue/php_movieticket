@extends('pages.layout.master')

@section('title','Register')
@section('content')<link rel="stylesheet" href="{{URL::asset('assets/css/login.css')}}">

<div class="login-page">
    <div class="form">
       
        <form class="login-form" action="/register" method="post">
            @csrf
            @if (isset($loi))
            <div style="color:red">
                {{
                $loi
                }}
            </div>
            @endif
            <div class="title">Đăng Ký</div>
            <input type="text" class="txt" name="email" placeholder="Email..." required />
            <input type="password" class="txt" name="mat_khau" placeholder="Mật khẩu..." required />
            <input type="password" class="txt" name="xac_nhan_mat_khau" placeholder="Xác nhận mật khẩu" required />           
            <button class="btn btn--now" type="submit">Đăng ký</button>
            <p class="message">Đã có tài khản? <a href="/login">đăng nhập</a></p>
        </form>
    </div>
</div>

@stop