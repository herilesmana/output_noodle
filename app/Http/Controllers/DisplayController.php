<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DisplayController extends Controller
{
    public function index()
    {
        return view('display');
    }
    public function get_achievements()
    {
        $achievements = DB::table('achievement')
        ->join('mvariant', 'achievement.MID', '=', 'mvariant.MID')
        ->select('achievement.id', 'mvariant.name as nama_variant')
        ->where('end_date', '>=' , date('Y-m-d') )->get();
        return json_encode($achievements);
    }
}
