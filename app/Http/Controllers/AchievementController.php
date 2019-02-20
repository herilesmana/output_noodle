<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Achievement;
use Illuminate\Support\Facades\DB;

class AchievementController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $achievements = DB::table('achievement')->get();
        echo json_encode($achievements);
    }

    public function get_achievements()
    {
        $achievements = DB::table('achievement')
        ->join('mvariant', 'achievement.MID', '=', 'mvariant.MID')
        ->select('achievement.*', 'mvariant.name as nama_variant', 'mvariant.barcode as barcode_variant')
        ->where('end_date', '>=' , date('Y-m-d') )->get();
        return json_encode($achievements);
    }

    public function get_achievement($barcode, $start_date, $end_date)
    {
        $achievement = DB::connection('sqlsrv')
        ->table('mlog')
        ->select('barcode')
        ->where('barcode', $barcode)
        ->where('tgljam', '>=', $start_date.' 00:00:00')
        ->where('tgljam', '<=', $end_date.' 23:59:59')
        ->orderBy('tgljam', 'desc')->count();
        return json_encode(["barcode" => $barcode, "actual" => $achievement]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $achievement = new Achievement;
        $achievement->start_date = $request->start_date;
        $achievement->end_date = $request->end_date;
        $achievement->MID = $request->variant;
        $achievement->target = $request->target;
        $achievement->actual = 0;
        if($achievement->save())
        {
            return json_encode(['success' => 1]);
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
