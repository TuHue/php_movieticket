<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Phim;
use App\Models\LoaiPhim;

class AdminController extends Controller
{
    public function index()
    {
        return view('admin.dashboard');
    }
    public function getMovie()
    {
        $danh_sach_phim = Phim::select('ten_phim', 'gioi_han_tuoi', 'thoi_luong', 'ngon_ngu', 'dien_vien', 'quoc_gia', 'phim_id')->paginate(10);
        return view('admin.movie.index', compact('danh_sach_phim'));
    }

    public function getAdd()
    {
        $phim = new Phim();
        $ten_loai_phim = '';
        $danh_sach_loai_phim = LoaiPhim::select()->get();
        return view('admin.movie.add', compact('phim', 'ten_loai_phim', 'danh_sach_loai_phim'));
    }


    public function getUpdate($id)
    {
        $phim = Phim::findOrFail($id);
        $danh_sach_loai_phim = LoaiPhim::select()->get();
        $loai_phim = LoaiPhim::findOrFail($phim->id_loai_phim);
        $ten_loai_phim = $loai_phim->ten_loai_phim;

        return view('admin.movie.add', compact('phim', 'ten_loai_phim', 'danh_sach_loai_phim'));
    }

    public function postUpdate(Request $request, $id)
    {
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
        $phim->save();
        return redirect('/admin/movie');
    }
    public function deleteMovie($id)
    {
        $phim = Phim::findOrFail($id);
        $phim->delete();
        return redirect('/admin/movie');
    }
    public function getLogin()
    {
        return view('admin.login');
    }
}
