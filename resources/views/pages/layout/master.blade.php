<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="{{URL::asset('assets/css/bootstrap.min.css')}}" >
    <link rel="stylesheet" href="{{URL::asset('assets/css/all.min.css')}}" >
    <link rel="stylesheet" href="{{URL::asset('assets/css/animate.css')}}">
    <link rel="stylesheet" href="{{URL::asset('assets/css/flaticon.css')}}" >
    <link rel="stylesheet" href="{{URL::asset('assets/css/magnific-popup.css')}}" >
    <link rel="stylesheet" href="{{URL::asset('assets/css/odometer.css')}}" >
    <link rel="stylesheet" href="{{URL::asset('assets/css/owl.carousel.min.css')}}" >
    <link rel="stylesheet" href="{{URL::asset('assets/css/owl.theme.default.min.css')}}">
    <link rel="stylesheet" href="{{URL::asset('assets/css/nice-select.css')}}">
    <link rel="stylesheet" href="{{URL::asset('assets/css/main.css')}}" >
    <link rel="shortcut icon" href="{{URL::asset('assets/images/favicon.png')}}" type="image/x-icon">

    <title>@yield('title') | Movie Ticket</title>


</head>

<body>
    <!-- ==========Preloader========== -->
    <div class="preloader">
        <div class="preloader-inner">
            <div class="preloader-icon">
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
    <!-- ==========Preloader========== -->
    <!-- ==========Overlay========== -->
    <div class="overlay"></div>
    <a href="#0" class="scrollToTop">
        <i class="fas fa-angle-up"></i>
    </a>
    <!-- ==========Overlay========== -->

    <!-- ==========Header-Section========== -->
    @include('pages.partial.header')
    <!-- ==========Header-Section========== -->

    @yield('content')

    <!-- ==========Newslater-Section========== -->
    @include('pages.partial.footer')
    <!-- ==========Newslater-Section========== -->


    <script src="{{URL::asset('assets/js/jquery-3.3.1.min.js')}}" ></script>
    <script src="{{URL::asset('assets/js/modernizr-3.6.0.min.js')}}" ></script>
    <script src="{{URL::asset('assets/js/plugins.js')}}" ></script>
    <script src="{{URL::asset('assets/js/bootstrap.min.js')}}" ></script>
    <script src="{{URL::asset('assets/js/isotope.pkgd.min.js')}}" ></script>
    <script src="{{URL::asset('assets/js/magnific-popup.min.js')}}" ></script>
    <script src="{{URL::asset('assets/js/owl.carousel.min.js')}}" ></script>
    <script src="{{URL::asset('assets/js/wow.min.js')}}" ></script>
    <script src="{{URL::asset('assets/js/countdown.min.js')}}" ></script>
    <script src="{{URL::asset('assets/js/odometer.min.js')}}" ></script>
    <script src="{{URL::asset('assets/js/viewport.jquery.js')}}" ></script>
    <script src="{{URL::asset('assets/js/nice-select.js')}}" ></script>
    <script src="{{URL::asset('assets/js/main.js')}}" ></script>
</body>

</html>