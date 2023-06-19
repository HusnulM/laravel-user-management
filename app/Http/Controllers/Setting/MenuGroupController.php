<?php

namespace App\Http\Controllers\Setting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Validator,Redirect,Response,Auth;
use DB;

class MenuGroupController extends Controller
{
    public function index(){
        $data = DB::table('menugroups')->get();
        return view('settings.menugroups.index', ['data' => $data]);
    }

    public function create(){
        return view('settings.menugroups.create');
    }

    public function save(Request $request){
        DB::beginTransaction();
        try{
            DB::table('menugroups')->insert([
                'description'  => $request['groupname']
            ]);

            DB::commit();
            return Redirect::to("/setting/menugroups")->withSuccess('New Menu Group Created');
        }catch(\Exception $e){
            DB::rollBack();
            return Redirect::to("/setting/menugroups")->withError($e->getMessage());
        }
    }
}
