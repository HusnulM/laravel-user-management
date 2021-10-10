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

        Route::get('/master/barang',   'HomeController@barang')->middleware('checkAuth:master/barang');
        Route::get('/master/supplier', 'HomeController@supplier')->middleware('checkAuth:master/supplier');
        Route::get('/procurement/purchaserequest', 'HomeController@pr')->middleware('checkAuth:procurement/purchaserequest');
        Route::get('/procurement/purchaseorder', 'HomeController@po')->middleware('checkAuth:procurement/purchaseorder');
        Route::get('/reports/purchaseorder', 'HomeController@reportpo')->middleware('checkAuth:reports/purchaseorder');
        Route::get('/reports/outstandingpr', 'HomeController@openpr')->middleware('checkAuth:reports/outstandingpr');
        Route::get('/reports/penerimaan', 'HomeController@penerimaan')->middleware('checkAuth:reports/penerimaan');
    
        Route::get('/setting/users',        'Setting\UserController@index')->middleware('checkAuth:setting/users');
        Route::get('/setting/users/create', 'Setting\UserController@create')->middleware('checkAuth:setting/users');
        Route::post('/setting/users/save',  'Setting\UserController@save')->middleware('checkAuth:setting/users');  
        Route::get('/setting/users/list',   'Setting\UserController@list')->middleware('checkAuth:setting/users');
        
        Route::get('/setting/roles',        'Setting\RoleController@index')->middleware('checkAuth:setting/roles');
        Route::get('/setting/roles/create', 'Setting\RoleController@create')->middleware('checkAuth:setting/roles');
        Route::post('/setting/roles/save',  'Setting\RoleController@save')->middleware('checkAuth:setting/roles');  
        Route::get('/setting/roles/list',   'Setting\RoleController@list')->middleware('checkAuth:setting/roles');

        Route::get('/setting/menugroups',        'Setting\MenuGroupController@index')->middleware('checkAuth:setting/menugroups');
        Route::get('/setting/menugroups/create', 'Setting\MenuGroupController@create')->middleware('checkAuth:setting/menugroups');
        Route::post('/setting/menugroups/save',  'Setting\MenuGroupController@save')->middleware('checkAuth:setting/menugroups');  

        Route::get('/setting/menus',        'Setting\MenuController@index')->middleware('checkAuth:setting/menus');
        Route::get('/setting/menus/create', 'Setting\MenuController@create')->middleware('checkAuth:setting/menus');
        Route::post('/setting/menus/save',  'Setting\MenuController@save')->middleware('checkAuth:setting/menus');  
        Route::get('/setting/menus/list',   'Setting\MenuController@list')->middleware('checkAuth:setting/menus');

        Route::get('/setting/menuroles',        'Setting\MenuRoleController@index')->middleware('checkAuth:setting/menuroles');
        Route::get('/setting/menuroles/create', 'Setting\MenuRoleController@create')->middleware('checkAuth:setting/menuroles');
        Route::post('/setting/menuroles/save',  'Setting\MenuRoleController@save')->middleware('checkAuth:setting/menuroles');
        
        Route::get('/setting/userroles',        'Setting\UserRoleController@index')->middleware('checkAuth:setting/userroles');
        Route::get('/setting/userroles/create', 'Setting\UserRoleController@create')->middleware('checkAuth:setting/userroles');
        Route::post('/setting/userroles/save',  'Setting\UserRoleController@save')->middleware('checkAuth:setting/userroles');
        Route::get('/setting/userroles/delete/{user}/{role}', 'Setting\UserRoleController@delete')->middleware('checkAuth:setting/userroles');

        Route::post('logout',  'HomeController@logout');
    });
});