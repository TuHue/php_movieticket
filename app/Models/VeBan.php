<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VeBan extends Model
{
    protected $table = 've_ban';
    protected $primaryKey = 've_ban_id';
    protected $guarded = [];
    protected $perPage = 5;

    public function gheNgoi()
    {
        return $this->hasOne(GheNgoi::class, 'id_ghe_ngoi', 'ghe_ngoi_id');
    }
    public function loaiGhe()
    {
        return $this->hasOne(LoaiGhe::class, 'id_loai_ghe', 'loai_ghe_id');
    }
    public function phim()
    {
        return $this->hasOne(Phim::class, 'id_phim', 'phim_id');
    }
    public function veDat()
    {
        return $this->hasOne(VeDat::class, 'id_ve_dat', 've_dat_id');
    }
    public function suatChieu()
    {
        return $this->hasOne(SuatChieu::class, 'id_suat_chieu', 'suat_chieu_id');
    }
}
