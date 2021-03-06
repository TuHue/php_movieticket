<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DinhDangPhim extends Model
{
    protected $table = 'dinh_dang_phim';
    protected $primaryKey = 'dinh_dang_phim_id';
    protected $guarded = [];
    protected $perPage = 5;

    public function suatChieu(){
        return $this->hasMany(SuatChieu::class,'id_suat_chieu','suat_chieu_id');
    }
}
