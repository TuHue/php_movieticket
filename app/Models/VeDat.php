<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VeDat extends Model
{
    protected $table = 've_dat';
    protected $primaryKey = 've_dat_id';
    protected $guarded = [];
    protected $perPage = 5;

    public function nguoiDung()
    {
        return $this->hasOne(NguoiDung::class, 'id_nguoi_dung', 'nguoi_dung_id');
    }

    public function veBan()
    {
        return $this->hasOne(VeBan::class, 'id_ve_ban', 've_ban_id');
    }
}
