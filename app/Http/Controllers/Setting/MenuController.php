<?php

namespace App\Http\Controllers\Setting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator,Redirect,Response;
use DB;

class MenuController extends Controller
{
    public function index(){
        $data = DB::table('menus')->get();
        return view('settings.menus.index', ['data' => $data]);
    }

    public function create(){
        $data = DB::table('menugroups')->get();
        return view('settings.menus.create', ['groups' => $data]);
    }

    public function list(){
        $data['data'] = DB::table('v_menus')
                        ->get();
        return json_encode($data);
    }

    public function save(Request $request){
        DB::beginTransaction();
        try{
            DB::table('menus')->insert([
                'name'      => $request['menuname'],
                'route'     => $request['menuroute'],
                'menugroup' => $request['menugroups']
            ]);

            DB::commit();
            return Redirect::to("/setting/menus")->withSuccess('New Menu Created');
        }catch(\Exception $e){
            DB::rollBack();
            return Redirect::to("/setting/menus")->withError($e->getMessage());
        }
    }
}
