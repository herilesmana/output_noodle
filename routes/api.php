<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::resource('user', 'UserController');
Route::resource('variant', 'VariantController');
Route::resource('achievement', 'AchievementController');
Route::get('/display/get_achievements', 'AchievementController@get_achievements');
Route::get('/display/get_achievement/{barcode}', 'AchievementController@get_achievement');
