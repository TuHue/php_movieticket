<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GheNgoi extends Model
{
    protected $table = 'ghe_ngoi';
    protected $primaryKey = 'ghe_ngoi_id';
    protected $guarded = [];
    protected $perPage = 5;
}
