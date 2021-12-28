@extends('pages.layout.master')

@section('title','Login')
@section('content')
<link rel="stylesheet" href="{{URL::asset('assets/css/login.css')}}">

<div class="login-page">
    <div class="form">
        {{-- <form class="register-form">
            <input type="text" placeholder="name" />
            <input type="password" placeholder="password" />
            <input type="text" placeholder="email address" />
            <button>create</button>
            <p class="message">Already registered? <a href="#">Sign In</a></p>
        </form> --}}
        <form class="login-form" action="/login" method="post">
            @csrf
            @if (isset($loi))
            <div style="color:red">
                {{
                $loi
                }}
            </div>
            @endif
            <div class="title">Đăng Nhập</div>
            <input type="text" class="txt" name="email" placeholder="Email..." required />
            <input type="password" class="txt" name="mat_khau" placeholder="Mật khẩu..." required />
            <button class="btn btn--now" type="submit">Đăng nhập</button>
            <p class="message">Chưa có tài khản? <a href="/register">Tạo mới tài khoản</a></p>
        </form>
    </div>
</div>


@stop