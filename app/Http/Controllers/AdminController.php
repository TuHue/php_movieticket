<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function index()
    {
        return view('admin.dashboard');
    }
    public function movie()
    {
        return view('admin.movie.index');
    }

    public function getLogin()
    {
        return view('admin.login');
    }
}
