<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Casts\ArrayObject;
use App\Models\Phim;
use App\Models\SuatChieu;
use App\Models\VeBan;
use App\Models\GheNgoi;
use App\Models\BinhLuan;
use App\Models\LoaiPhim;
use App\Models\LoaiGhe;


class MovieController extends Controller
{
    public function index()
    {
        $danh_sach_phim = Phim::select()->paginate(10);
        return view('pages.movie.index', compact('danh_sach_phim'));
    }

    public function getStep1($id)
    {
        $phim = Phim::findOrFail($id);
        $danh_sach_binh_luan = BinhLuan::select()->where('id_phim', '=', $id)->get();
        return view('pages.movie.detail', compact('phim', 'danh_sach_binh_luan'));
    }
    public function postStep1(Request $request)
    {
        // dd($request->all());
        $binh_luan = new BinhLuan();
        $binh_luan->id_phim = $request->id_phim;
        $binh_luan->ten_nguoi_binh_luan = $request->ten_nguoi_binh_luan;
        $binh_luan->email_nguoi_binh_luan = $request->email_nguoi_binh_luan;
        $binh_luan->noi_dung_binh_luan = $request->noi_dung_binh_luan;
        $binh_luan->save();

        $phim = Phim::findOrFail($request->id_phim);
        $danh_sach_binh_luan = BinhLuan::select()->where('id_phim', '=', $request->id_phim)->get();
        return view('pages.movie.detail', compact('phim', 'danh_sach_binh_luan'));
    }

    public function getStep2($id)
    {
        if (session()->get('nguoi_dung_user') != null) {
            $danh_sach_suat_chieu = SuatChieu::select()->where('id_phim', '=', $id)->get();
            $phim = Phim::findOrFail($id);

            return view('pages.movie.ticketplan', compact('danh_sach_suat_chieu', 'phim'));
        }
        return redirect('/login');
    }

    public function getStep3($id)
    {
        $suat_chieu = SuatChieu::findOrFail($id);
        $danh_sach_ve_ban = VeBan::select()
            ->where('id_suat_chieu', '=', $id)
            ->where('id_phong_chieu', '=', $suat_chieu->id_phong_chieu)
            ->get();
        $danh_sach_ghe_ngoi = GheNgoi::select()
            ->where('id_phong_chieu', '=', $suat_chieu->id_phong_chieu)
            ->get();
        $danh_sach_loc = new ArrayObject([]);
        function kienTraGheDaDat($id, $items)
        {
            $flag = false;
            foreach ($items as $item) {
                if ($item->id_ghe_ngoi  == $id) {
                   return $flag = true;
                    
                }
            }
            return $flag;
        }
        foreach ($danh_sach_ghe_ngoi as $ghe_ngoi) {
            if (kienTraGheDaDat($ghe_ngoi->ghe_ngoi_id, $danh_sach_ve_ban)) {
                $danh_sach_loc->append(['key' => true, 'item' => $ghe_ngoi]);
            } else {
                $danh_sach_loc->append(['key' => false, 'item' => $ghe_ngoi]);
            }
        }
        return view('pages.movie.seatplan', compact('danh_sach_loc', 'id'));
    }

    public function postNotification(Request $request)
    {
        $nguoi_dung = session()->get('nguoi_dung_user');

        $ve_ban = new VeBan();
        $ve_ban->id_phim = $request->id_phim;
        $ve_ban->id_phong_chieu = $request->id_phong_chieu;
        $ve_ban->id_ghe_ngoi = $request->id_ghe_ngoi;
        $ve_ban->id_suat_chieu = $request->id_suat_chieu;
        $ve_ban->ngay_ban = date('Y-m-d H:i:s');
        $ve_ban->tong_tien = $request->tong_tien;
        $ve_ban->id_nguoi_dung = $nguoi_dung->nguoi_dung_id;
        $ve_ban->ma_xac_thuc = $request->ma_xac_thuc;
        $ve_ban->ten_phim = $request->ten_phim;
        $ve_ban->ten_nguoi_dat = $request->ten_nguoi_dat;
        $ve_ban->save();
        $danh_sach_phim = Phim::select()->paginate(10);
        return view('pages.movie.index', compact('danh_sach_phim'));
    }
    public function getStep4($id_sc, $id_ng)
    {
        $nguoi_dung = session()->get('nguoi_dung_user');
        $ghe_ngoi = GheNgoi::findOrFail($id_ng);
        $loai_ghe = LoaiGhe::findOrFail($ghe_ngoi->id_loai_ghe);
        $suat_chieu = SuatChieu::findOrFail($id_sc);
        $phim = Phim::findOrFail($suat_chieu->id_phim);
        $loai_phim = LoaiPhim::findOrFail($phim->id_loai_phim);
        $ten_loai_phim = $loai_phim->ten_loai_phim;
        $gia_ve_xem_phim = $suat_chieu->tien_suat_chieu + $loai_ghe->phu_phi;
        $code = $this->generateRandomString(9);

        return view('pages.movie.checkout', compact('nguoi_dung', 'ghe_ngoi', 'phim', 'ten_loai_phim', 'gia_ve_xem_phim', 'code', 'suat_chieu'));
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
}
