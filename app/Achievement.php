<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Achievement extends Model
{
    protected $table = 'achievement';
    protected $fillable = [
        'tgl_awal', 'tgl_akhir', 'MID', 'target', 'actual'
    ];
}
