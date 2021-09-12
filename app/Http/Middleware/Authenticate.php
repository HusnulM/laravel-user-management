<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return string|null
     */
    protected function redirectTo($request)
    {
        if (! $request->expectsJson()) {
            return route('login');
            // return Redirect::to("/");
        }
    }

    // public function handle($request, Closure $next)
    // {
        
    //     //check here if the user is authenticated
    //     if ( ! $this->auth->user() )
    //     {
    //         // here you should redirect to login 
    //     }

    //     return $next($request);
    // }
}
