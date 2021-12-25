<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SuatChieu extends Model
{
    protected $table = 'suat_chieu';
    protected $primaryKey = 'suat_chieu_id';
    protected $guarded = [];
    protected $perPage = 5;

    public function phim()
    {
        return $this->hasOne(Phim::class, 'id_loai_phim', 'loai_phim_id');
    }
    public function dinhDangPhim()
    {
        return $this->hasOne(DinhDangPhim::class, 'id_dinh_dang_phim', 'dinh_dang_phim_id');
    }
    public function phongChieu()
    {
        return $this->hasOne(PhongChieu::class, 'id_phong_chieu', 'phong_chieu_id');
    }

    public function veBan()
    {
        return $this->hasMany(VeBan::class, 'id_ve_dat', 've_dat_id');
    }
}
