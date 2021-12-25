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
        return $this->hasOne(SuatChieu::class, 'id_loai_phim', 'loai_phim_id');
    }
}
