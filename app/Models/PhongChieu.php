<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PhongChieu extends Model
{
    protected $table = 'phong_chieu';
    protected $primaryKey = 'phong_chieu_id';
    protected $guarded = [];
    protected $perPage = 5;

    public function suatChieu()
    {
        return $this->hasMany(SuatChieu::class, 'id_suat_chieu', 'suat_chieu_id');
    }
    public function gheNgoi()
    {
        return $this->hasMany(GheNgoi::class, 'id_ghe_ngoi', 'ghe_ngoi_id');
    }
    public function veBan()
    {
        return $this->hasMany(VeBan::class, 'id_ve_ban', 've_ban_id');
    }
}
