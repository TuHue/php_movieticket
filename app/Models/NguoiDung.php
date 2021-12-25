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
}
