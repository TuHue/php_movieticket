<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LoaiGhe extends Model
{
    protected $table = 'loai_ghe';
    protected $primaryKey = 'loai_ghe_id';
    protected $guarded = [];
    protected $perPage = 5;
}
