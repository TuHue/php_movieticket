<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\NguoiDung;

class MemberController extends Controller
{
    public function getLogin()
    {
        $nguoiDung = new NguoiDung();
        $action = true;
        return view('pages.member.login', compact('nguoiDung', 'action'));
    }

    public function getRegister()
    {
        $nguoiDung = new NguoiDung();
        $action = true;
        return view('pages.member.register', compact('nguoiDung', 'action'));
    }

    public function postRegister(Request $request)
    {
        $username = $request->email1;
        $password = $request->pass1;
        $ten_nguoi_dung = "user";
        $so_dien_thoai = "";
        $dia_chi = "";
        $vai_tro = 1;

        $nguoiDung = new NguoiDung();
        $nguoiDung->ten_nguoi_dung = $ten_nguoi_dung;
        $nguoiDung->email = $username;
        $nguoiDung->mat_khau = md5($password);
        $nguoiDung->so_dien_thoai = $so_dien_thoai;
        $nguoiDung->dia_chi = $dia_chi;
        $nguoiDung->vai_tro = $vai_tro;
        $nguoiDung->save();

        return redirect('/login');
    }

    public function postLogin(Request $request)
    {
        $user = NguoiDung::select()
            ->where('email', '=', $request->email)
            ->where('mat_khau', '=', md5($request->pass))
            ->first();
        if ($user != null) {
            session()->put('nguoi_dung_user', $user);
            return redirect('/movie');
        }
        return redirect('/login');
    }
}
