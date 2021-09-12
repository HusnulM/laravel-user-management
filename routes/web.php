<?php

use Illuminate\Support\Facades\Route;
// use Auth;
// use App\Http\Controllers\HomeController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['middleware' => 'guest'], function(){
    Route::group(['middleware' => 'revalidate'], function () {
        Route::get('/',       'HomeController@index')->name('login');
        Route::post('authenticate',  'HomeController@login');
    });
});

Route::group(['middleware' => 'auth'], function () {
    Route::group(['middleware' => 'revalidate'], function () {
        Route::get('/dashboard', 'HomeController@dashboard');
    
        Route::get('/setting/users',        'Setting\UserController@index');
        Route::get('/setting/users/create', 'Setting\UserController@create');
        Route::post('/setting/users/save',  'Setting\UserController@save');    

        Route::post('logout',  'HomeController@logout');
    });
});