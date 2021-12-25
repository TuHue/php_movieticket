<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MovieController extends Controller
{
    public function index()
    {
        return view('pages.movie.index');
    }

    public function getStep1()
    {
        return view('pages.movie.detail');
    }

    public function getStep2()
    {
        return view('pages.movie.ticketplan');
    }

    public function getStep3()
    {
        return view('pages.movie.seatplan');
    }

    public function getStep4()
    {
        return view('pages.movie.checkout');
    }
}
