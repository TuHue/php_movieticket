<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BinhLuan extends Model
{
    protected $table = 'binh_luan';
    protected $primaryKey = 'binh_luon_id';
    protected $guarded = [];
    protected $perPage = 5;
    public $timestamps = false;


}
