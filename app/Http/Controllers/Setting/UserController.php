<?php

namespace App\Http\Controllers\Setting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Validator,Redirect,Response;
use DB;

class UserController extends Controller
{
    public function index(){
        $data = DB::table('users')->get();
        return view('settings.users.index', ['data' => $data]);
    }

    public function create(){
        return view('settings.users.create');
    }

    public function edit(){
        return view('settings.users.edit');
    }

    public function save(Request $request){
        $validated = $request->validate([
            'email'    => 'required|unique:users|max:255',
            'name'     => 'required',
            'password' => 'required',
        ]);

        $options = [
            'cost' => 12,
        ];
        $password = password_hash($request['password'], PASSWORD_BCRYPT, $options);

        $output = array();

        DB::beginTransaction();
        try{
            DB::table('users')->insert([
                'name'        => $request['name'],
                'email'       => $request['email'],
                'password'    => $password
            ]);

            DB::commit();
            return Redirect::to("/setting/users")->withSuccess('New User Created');
        }catch(\Exception $e){
            DB::rollBack();
            return Redirect::to("/setting/users")->withError($e->getMessage());
        }
    }
}
