<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Phim extends Model
{
    protected $table = 'phim';
    protected $primaryKey = 'phim_id';
    protected $guarded = [];
    protected $perPage = 5;

    public function loaiPhim()
    {
        return $this->hasOne(Phim::class, 'id_loai_phim', 'loai_phim_id');
    }

    public function suatChieu()
    {
        return $this->hasMany(SuatChieu::class, 'id_suat_chieu', 'suat_chieu_id');
    }
}
