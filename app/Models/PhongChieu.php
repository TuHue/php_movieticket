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
}
