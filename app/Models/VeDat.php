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
}
