<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Variant extends Model
{
    protected $table = 'mvariant';
    protected $fillable = [
        'id', 'MID', 'name', 'barcode', 'status'
    ];
}
