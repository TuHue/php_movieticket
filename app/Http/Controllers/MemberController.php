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
        if($request->mat_khau != $request->xac_nhan_mat_khau){
            $loi = "Mật khẩu và xác nhận mật khẩu không khớp";
            return view('pages.member.register', compact('loi'));
        }
        $username = $request->email;
        $password = $request->mat_khau;
        $ten_nguoi_dung = $request->email;
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
        $nguoi_dung = NguoiDung::select()
        ->where('email', '=', $request->email)
        ->where('mat_khau', '=', md5($request->mat_khau))
        ->first();
    if ($nguoi_dung != null) {
        if ($nguoi_dung->vai_tro == 1) {
            session()->put('nguoi_dung_client', $nguoi_dung);
            return redirect('/movie');
        } else {
            $loi = "Tài khoản của bạn không có quyền truy cập";
            return view('pages.member.login', compact('loi'));
        }
    } else {
        $loi = "Tài khoản của bạn không đúng";
        return view('pages.member.login', compact('loi'));
    }
    }
    public function getLogout()
    {
        session()->forget('nguoi_dung_client');
        return redirect('/movie');
    }
}
