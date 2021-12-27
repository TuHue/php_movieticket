<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{URL::asset('assets/css/main.css')}}" >
    <link rel="shortcut icon" href="{{URL::asset('assets/images/favicon.png')}}" type="image/x-icon"> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <title>@yield('title') | Movie Ticket</title>
</head>

<body>
    <!-- ==========Header-Section========== -->
    @include('pages.partial.header')
    <!-- ==========Header-Section========== -->
    @include('pages.partial.login')
    @yield('content')

    <!-- ==========Newslater-Section========== -->
    @include('pages.partial.footer')
    <!-- ==========Newslater-Section========== -->


    <script src="{{URL::asset('assets/js/jquery-3.3.1.min.js')}}" ></script>
    <script src="{{URL::asset('assets/js/main.js')}}" ></script>
</body>

</html>