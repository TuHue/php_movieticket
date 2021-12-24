<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PageController extends Controller
{
    public function about()
    {
        return view('pages.about.index');
    }

    public function contact()
    {
        return view('pages.contact.index');
    }
}
