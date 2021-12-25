<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LoaiPhim extends Model
{
    protected $table = 'loai_phim';
    protected $primaryKey = 'loai_phim_id';
    protected $guarded = [];
    protected $perPage = 5;

    
}
