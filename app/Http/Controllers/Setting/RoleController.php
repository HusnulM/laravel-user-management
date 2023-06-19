<?php

namespace App\Http\Controllers\Setting;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

use Validator,Redirect,Response;
use DB;

class RoleController extends Controller
{
    public function index(){
        $data = DB::table('roles')->get();
        return view('settings.roles.index', ['data' => $data]);
    }

    public function create(){
        $data = DB::table('roles')->get();
        return view('settings.roles.create');
    }

    public function list(){
        if(Auth::check()){
            $data['data'] = DB::table('roles')
                    ->get();
            return json_encode($data);
        }
    }

    public function save(Request $request){
        $validated = $request->validate([
            'rolename' => 'required|unique:roles|max:255'
        ]);

        DB::beginTransaction();
        try{
            DB::table('roles')->insert([
                'rolename' => $request['rolename'],
                'createdby' => Auth::user()->email,
                'created_at'=> date('Y-m-d H:m:s')
            ]);

            DB::commit();
            return Redirect::to("/setting/roles")->withSuccess('New Role Created');
        }catch(\Exception $e){
            DB::rollBack();
            return Redirect::to("/setting/roles")->withError($e->getMessage());
        }
    }
}
