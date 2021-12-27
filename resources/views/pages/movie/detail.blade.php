@extends('pages.layout.master')
@section('title', 'Movie ')
@section('content')
<div id="detail__banner" data-background="{{ URL::asset('images/'.$phim->hinh_anh) }}">
</div>

@stop