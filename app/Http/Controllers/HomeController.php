<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use DB;
use Validator,Redirect,Response;

class HomeController extends Controller
{
    public function index(){
        if(Auth::check()){
            return redirect()->intended('dashboard');
        }
        return view('login');
    }

    public function dashboard(){
        return view('home.dashboard');
    }

    public function barang(){
        return view('home.example', ["page" => "Halaman Master Barang"]);
    }
    
    public function supplier(){
        return view('home.example', ["page" => "Halaman Master Supplier"]);
    }
    
    public function pr(){
        return view('home.example', ["page" => "Halaman Purchase Request"]);
    }
    
    public function po(){
        return view('home.example', ["page" => "Halaman Purchase Order"]);
    }
    
    public function reportpo(){
        return view('home.example', ["page" => "Halaman Laporan PO"]);
    }
    
    public function openpr(){
        return view('home.example', ["page" => "Halaman Open Purchase Request"]);
    }
    
    public function penerimaan(){
        return view('home.example', ["page" => "Halaman Laporan Penerimaan Barang"]);
    }

    public function login(Request $request){
        $request->validate([
            'email'    => 'required|email:dns',
            'password' => 'required|string'
        ]);

        $options = [
            'cost' => 12,
        ];
        $password = password_hash($request['password'], PASSWORD_BCRYPT, $options);

        $credentials = $request->only('email', 'password');

        $dataAttempt = array(
            'email'    => strtolower($request['email']),
            'password' => $request['password']
        );

        if (Auth::attempt($credentials)) {
            if(Auth::user()->deletion_flag === "X"){
                Auth::logout();
                return Redirect::back()
                ->withErrors(
                    [
                        'error' => 'Opps! Your account is deleted, please contact System Administrator',
                    ]
                );
            }elseif(Auth::user()->request_change_acc === "Y"){
                Auth::logout();
                return Redirect::back()
                ->withErrors(
                    [
                        'error' => 'Your account temporarily is inactive, your data changes are being verified',
                    ]
                );
            }else{
                return redirect()->intended('dashboard');
            }
        }else{
            return Redirect::back()
                ->withErrors(
                    [
                        'error' => 'Opps! You have entered invalid credentials',
                    ]
                );
        }
    }

    public function logout(Request $request){
        Auth::logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/');
    }

    public function home(){
        if(Auth::check()){
            $nama = $nama = Auth::user()->name;
            return view('home.index',['nama' => $nama]);
        }
        return Redirect::to("login")->withErrors('Opps! You do not have access');
    }
}