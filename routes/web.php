<?php

use Illuminate\Support\Facades\Route;
use App\HTTP\Controllers\MemberController;
use App\HTTP\Controllers\PageController;
use App\HTTP\Controllers\MovieController;


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

Route::group(['prefix' => ''], function () {
    Route::get('about', [PageController::class, 'about'])->name('about');
    Route::get('contact', [PageController::class, 'contact'])->name('contact');
    Route::get('', function () {
        return redirect("/movie");
    })->name('');
    Route::group(['prefix' => 'movie'], function () {
        Route::get('', [MovieController::class, 'index'])->name('movie');

        Route::group(['prefix' => 'step-1'], function () {
            Route::get('', [MovieController::class, 'getStep1']);
            Route::post('', [MovieController::class, 'postStep1']);
        });
        Route::group(['prefix' => 'step-2'], function () {
            Route::get('', [MovieController::class, 'getStep2']);
            Route::post('', [MovieController::class, 'postStep2']);
        });
        Route::group(['prefix' => 'step-3'], function () {
            Route::get('', [MovieController::class, 'getStep3']);
            Route::post('', [MovieController::class, 'postStep3']);
        });
        Route::group(['prefix' => 'step-4'], function () {
            Route::get('', [MovieController::class, 'getStep4']);
            Route::post('', [MovieController::class, 'postStep4']);
        });
    });
    Route::group(['prefix' => 'login'], function () {
        Route::get('', [MemberController::class, 'getLogin']);
        Route::post('', [MemberController::class, 'getLogin']);
    });
    Route::group(['prefix' => 'register'], function () {
        Route::get('', [MemberController::class, 'getRegister']);
        Route::post('', [MemberController::class, 'getRegister']);
    });
});
