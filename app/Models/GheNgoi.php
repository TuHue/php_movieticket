<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GheNgoi extends Model
{
    protected $table = 'ghe_ngoi';
    protected $primaryKey = 'ghe_ngoi_id';
    protected $guarded = [];
    protected $perPage = 5;

    public function veBan()
    {
        return $this->hasMany(VeBan::class, 'id_ve_ban', 've_dat_id');
    }
    public function loaiGhe()
    {
        return $this->hasOne(LoaiGhe::class, 'id_loai_ghe', 'loai_ghe_id');
    }
}
