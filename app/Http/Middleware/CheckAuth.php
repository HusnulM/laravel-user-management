<?php

namespace App\Http\Middleware;

use Closure;
use DB;

use Illuminate\Http\Request;

class CheckAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        // return $next($request);
        if(auth()->user() === null){
            return redirect('/')->with(['error', 'Please login']);
        }

        $routeAuth = DB::table('v_usermenus')
            ->where('email', auth()->user()->email)
            ->where('route', $path)
            ->first();

        if(empty($routeAuth)){
            return redirect('/')->with(['error', 'Opps! You do not have access']);
        }

        return $next($request);
    }
}
