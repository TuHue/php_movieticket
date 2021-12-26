<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NguoiDung extends Model
{
    protected $table = 'nguoi_dung';
    protected $primaryKey = 'nguoi_dung_id';
    protected $guarded = [];
    protected $perPage = 5;
    public $timestamps = false;

    public function veDat()
    {
        return $this->hasMany(VeDat::class, 'id_ve_dat', 've_dat_id');
    }
}
