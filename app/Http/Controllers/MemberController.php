<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MemberController extends Controller
{
    public function getLogin()
    {
        return view('pages.member.login');
    }

    public function getRegister()
    {
        return view('pages.member.register');
    }
}
