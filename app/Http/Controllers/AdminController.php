<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Phim;

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
        return view('admin.movie.add');
    }
    public function getUpdate()
    {
        return view('admin.movie.update');
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
