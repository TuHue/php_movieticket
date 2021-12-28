<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\Models\Phim;
use App\Models\LoaiPhim;
use App\Models\NguoiDung;
use App\Models\VeBan;

class AdminController extends Controller
{
    public function index()
    {
        if (session()->get('nguoi_dung')) {
            $danh_sach_ve_ban = VeBan::select()->get();

            return view('admin.dashboard', compact('danh_sach_ve_ban'));
        } else {
            return redirect('admin/login');
        }
    }
    public  function postTimKiem( Request $request)
    {
        if (session()->get('nguoi_dung')) {
            $danh_sach_ve_ban = VeBan::select()->where('ma_xac_thuc','=',$request->ma_xac_thuc)->get();
            return view('admin.dashboard', compact('danh_sach_ve_ban'));
        } else {
            return redirect('admin/login');
        }
    }
    public function getCheck($id)
    {
        if (session()->get('nguoi_dung')) {
            $ve_ban = VeBan::findOrFail($id);
            $ve_ban->trang_thai = 1;
            $ve_ban->save();
            return redirect('admin/dashboard');
        } else {
            return redirect('admin/login');
        }
    }
  
    public function getMovie()
    {
        if (session()->get('nguoi_dung')) {
            $danh_sach_phim = Phim::select('ten_phim', 'gioi_han_tuoi', 'thoi_luong', 'ngon_ngu', 'dien_vien', 'quoc_gia', 'phim_id')
                ->orderBy('phim_id', 'desc')->paginate(10);
            return view('admin.movie.index-css', compact('danh_sach_phim'));
        } else {
            return redirect('admin/login');
        }
    }
    public function getMovieDetail($id)
    {
        if (session()->get('nguoi_dung')) {
            $phim = Phim::findOrFail($id);
            $loai_phim = LoaiPhim::findOrFail($phim->id_loai_phim);
            $ten_loai_phim = $loai_phim->ten_loai_phim;
            return view('admin.movie.detail', compact('phim', 'ten_loai_phim'));
        } else {
            return redirect('admin/login');
        }
    }

    public function getAdd()
    {

        if (session()->get('nguoi_dung')) {
            $phim = new Phim();
            $ten_loai_phim = '';
            $danh_sach_loai_phim = LoaiPhim::select()->get();
            $action = true;
            return view('admin.movie.add', compact('phim', 'ten_loai_phim', 'danh_sach_loai_phim', 'action'));
        } else {
            return redirect('admin/login');
        }
    }

    public function generateRandomString($length = 25)
    {

        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
    public function postAdd(Request $request)
    {
        if (session()->get('nguoi_dung')) {
            $tenPhim = $request->ten_phim;
            $ngonNgu = $request->ngon_ngu;
            $quocGia = $request->quoc_gia;
            $thoiLuong = $request->thoi_luong;
            $gioiHanTuoi = $request->gioi_han_tuoi;
            $dienVien = $request->dien_vien;
            $nhaSanXuat = $request->nha_san_xuat;
            $idLoaiPhim = $request->id_loai_phim;
            $tomTat = $request->tom_tat;
            $thoiLuong = $request->thoi_luong;
            $target = "images/phim/" . ($_FILES['img_file']['name']);
            $nameHinhAnh = $_FILES['img_file']['name'];

            move_uploaded_file($_FILES['img_file']['tmp_name'], $target);

            $phim = new Phim();
            $phim->phim_id = $this->generateRandomString(7);
            $phim->ten_phim = $tenPhim;
            $phim->ngon_ngu = $ngonNgu;
            $phim->quoc_gia = $quocGia;
            $phim->thoi_luong = $thoiLuong;
            $phim->gioi_han_tuoi = $gioiHanTuoi;
            $phim->dien_vien = $dienVien;
            $phim->nha_san_xuat = $nhaSanXuat;
            $phim->id_loai_phim = $idLoaiPhim;
            $phim->tom_tat = $tomTat;
            $phim->ngay_cong_chieu = $request->ngay_cong_chieu;
            $phim->trang_thai = $request->trang_thai;
            $phim->hinh_anh = $nameHinhAnh;
            $phim->save();
            return redirect('/admin/movie');
        } else {
            return redirect('admin/login');
        }
    }

    public function getUpdate($id)
    {
        if (session()->get('nguoi_dung')) {
            $phim = Phim::findOrFail($id);
            $danh_sach_loai_phim = LoaiPhim::select()->get();
            $loai_phim = LoaiPhim::findOrFail($phim->id_loai_phim);
            $ten_loai_phim = $loai_phim->ten_loai_phim;
            $action = false;

            return view('admin.movie.add', compact('phim', 'ten_loai_phim', 'danh_sach_loai_phim', 'action'));
        } else {
            return redirect('admin/login');
        }
    }


    public function postUpdate(Request $request, $id)
    {

        if (session()->get('nguoi_dung')) {
            $tenPhim = $request->ten_phim;
            $ngonNgu = $request->ngon_ngu;
            $quocGia = $request->quoc_gia;
            $thoiLuong = $request->thoi_luong;
            $gioiHanTuoi = $request->gioi_han_tuoi;
            $dienVien = $request->dien_vien;
            $nhaSanXuat = $request->nha_san_xuat;
            $idLoaiPhim = $request->id_loai_phim;
            $tomTat = $request->tom_tat;
            $thoiLuong = $request->thoi_luong;

            $phim = Phim::findOrFail($id);
            $phim->ten_phim = $tenPhim;
            $phim->ngon_ngu = $ngonNgu;
            $phim->quoc_gia = $quocGia;
            $phim->thoi_luong = $thoiLuong;
            $phim->gioi_han_tuoi = $gioiHanTuoi;
            $phim->dien_vien = $dienVien;
            $phim->nha_san_xuat = $nhaSanXuat;
            $phim->id_loai_phim = $idLoaiPhim;
            $phim->tom_tat = $tomTat;
            $phim->trang_thai = $request->trang_thai;
            $phim->ngay_cong_chieu = $request->ngay_cong_chieu;
            $phim->save();
            return redirect('/admin/movie');
        } else {
            return redirect('admin/login');
        }
    }
    public function deleteMovie($id)
    {
        if (session()->get('nguoi_dung')) {
            $phim = Phim::findOrFail($id);
            $phim->delete();
            return redirect('/admin/movie');
        } else {
            return redirect('admin/login');
        }
    }
    public function getLogin()
    {
        return view('admin.login');
    }

    public function postLogin(Request $request)
    {
        $nguoi_dung = NguoiDung::select()
            ->where('email', '=', $request->email)
            ->where('mat_khau', '=', md5($request->mat_khau))
            ->first();
        if ($nguoi_dung != null) {
            if ($nguoi_dung->vai_tro == 2) {
                session()->put('nguoi_dung', $nguoi_dung);
                return redirect('/admin/dashboard');
            } else {
                $loi = "Tài khoản của bạn không có quyền truy cập";
                return view('admin.login', compact('loi'));
            }
        } else {
            $loi = "Tài khoản của bạn không đúng";
            return view('admin.login', compact('loi'));
        }
    }
    public function getLogout()
    {
        session()->forget('nguoi_dung');
        return redirect('/admin/login');
    }
}
