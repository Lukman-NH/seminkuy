<?php

use App\Http\Controllers\Python\PythonController;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

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

Route::get('/' , 'HomeController@index')
    ->name('home');

Route::get('/event', 'EventController@index')
    ->name('event');
Route::get('/event/{id?}', 'EventController@detail')
    ->name('categories-detail');

    
Route::get('/detail/{id?}', 'DetailController@index')
    ->name('detail');
Route::post('/detail/{id?}', 'DetailController@add')
    ->name('detail-add');

Route::post('/checkout/callback', 'CheckoutController@callback')
    ->name('midtrans-callback');

Route::get('/success', 'CartController@success')
    ->name('success');

Route::get('/register/success', 'Auth\RegisterController@success')
    ->name('register-success');

Route::group(['middleware' => ['auth']], function () {
    Route::get('/cart', 'CartController@index')
        ->name('cart');
    Route::delete('/cart/{id?}', 'CartController@delete')
        ->name('cart-delete');

    Route::post('/rating', 'RatingController@add')
        ->name('rating-add');

    Route::post('/checkout', 'CheckoutController@process')
        ->name('checkout');

    Route::get('/dashboard', 'DashboardController@index')
        ->name('dashboard');
    
    Route::get('/dashboard/transactions', 'DashboardTransactionController@index')
        ->name('dashboard-transactions');
    Route::get('/dashboard/transactions/{id?}', 'DashboardTransactionController@de  tails')
        ->name('dashboard-transactions-details');
    Route::post('/dashboard/transactions/{id?}', 'DashboardTransactionController@update')
        ->name('dashboard-transactions-update');
    
    Route::get('/dashboard/account', 'DashboardSettingController@account')
        ->name('dashboard-setting-account');    
    Route::post('/dashboard/account/{redirect}', 'DashboardSettingController@update')
        ->name('dashboard-setting-redirect');

});

Route::prefix('admin')
    ->namespace('Admin')
    ->middleware(['auth','admin'])
    ->group(function() {
        Route::get('/','DashboardController@index')->name('admin-dashboard');
        Route::resource('user','UserController');
        Route::resource('category','CategoryController');
        Route::resource('event','EventController');
        Route::resource('event-gallery','EventGalleryController');
        Route::resource('transaction','TransactionController');
        Route::resource('rating','RatingController');
    });

// Python Routes
Route::prefix('python')
    ->group(function () {
        Route::get('/', [PythonController::class, 'index'])
            ->name('python.index');

        Route::get('/export', [PythonController::class, 'export'])
            ->name('python.export');
    });


Auth::routes();
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
