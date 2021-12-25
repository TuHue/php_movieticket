<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VeBan extends Model
{
    protected $table = 've_ban';
    protected $primaryKey = 've_ban_id';
    protected $guarded = [];
    protected $perPage = 5;
}
