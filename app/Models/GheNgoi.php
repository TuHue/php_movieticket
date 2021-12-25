<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GheNgoi extends Model
{
    protected $table = 'dinh_dang_phim';
    protected $primaryKey = 'dinh_dang_phim_id';
    protected $guarded = [];
    protected $perPage = 5;
}
