<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\HTTP\Controllers\MemberController;
use App\HTTP\Controllers\PageController;
use App\HTTP\Controllers\MovieController;
use App\HTTP\Controllers\AdminController;

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

    Route::group(['prefix' => 'login'], function () {
        Route::get('', [MemberController::class, 'getLogin']);
        Route::post('', [MemberController::class, 'postLogin']);
    });
    Route::group(['prefix' => 'register'], function () {
        Route::get('', [MemberController::class, 'getRegister']);
        Route::post('', [MemberController::class, 'postRegister']);
    });
    Route::get('', function () {
        return redirect("/movie");
    })->name('');

    Route::group(['prefix' => 'movie'], function () {
        Route::get('', [MovieController::class, 'index']);
        Route::post('', [MovieController::class, 'index']);
        Route::post('/notification', [MovieController::class, 'postNotification']);

        Route::group(['prefix' => 'step-1'], function () {
            Route::get('/{id}', [MovieController::class, 'getStep1']);
            Route::post('', [MovieController::class, 'postStep1']);
        });
        Route::group(['name' => 'step-2', 'prefix' => 'step-2'], function () {
            Route::get('/{id}', [MovieController::class, 'getStep2']);
        });
        Route::group(['prefix' => 'step-3'], function () {
            Route::get('/{id}', [MovieController::class, 'getStep3']);
        });
        Route::group(['prefix' => 'step-4'], function () {
            Route::get('/{id_sc}/{id_ng}', [MovieController::class, 'getStep4']);
        });
    });
});

Route::group(['prefix' => 'admin'], function () {
    Route::get('logout', [AdminController::class, 'getLogout'])->name('logout');

    Route::group(['prefix' => 'dashboard'], function () {
        Route::get('', [AdminController::class, 'index']);
        Route::get('/check/{id}', [AdminController::class, 'getCheck']);
        Route::post('/search', [AdminController::class, 'postTimKiem']);
    });
    Route::group(['prefix' => 'login'], function () {
        Route::get('', [AdminController::class, 'getLogin']);
        Route::post('', [AdminController::class, 'postLogin']);
    });
    Route::group(['prefix' => 'movie'], function () {
        Route::get('', [AdminController::class, 'getMovie']);
        Route::post('', [AdminController::class, 'getMovie']);


        Route::group(['prefix' => 'add'], function () {
            Route::get('', [AdminController::class, 'getAdd']);
            Route::post('', [AdminController::class, 'postAdd']);
        });

        Route::group(['prefix' => 'update'], function () {
            Route::get('/{id}', [AdminController::class, 'getUpdate']);
            Route::post('/{id}', [AdminController::class, 'postUpdate']);
        });

        Route::get('delete/{id}', [AdminController::class, 'deleteMovie']);
        Route::get('detail/{id}', [AdminController::class, 'getMovieDetail']);
    });
});
