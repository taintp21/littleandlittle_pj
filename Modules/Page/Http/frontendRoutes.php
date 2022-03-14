<?php

use Illuminate\Routing\Router;
use Modules\Page\Http\Controllers\PublicController;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use Illuminate\Support\Facades\App;

/** @var Router $router */

$router->post('/vnpay/return/send-ticket-email', [
    'uses' => 'PublicController@sendTicketEmail',
]);
$router->post('send-email',[
    'uses' => 'PublicController@sendEmail',
]);
$router->get('vnpay/return', [
    'uses' => 'PublicController@vnpayReturn',
]);
$router->get('form-thanhtoan', [
    'uses' => 'PublicController@formThanhToan',
]);
$router->post('form-thanhtoan/createPayment', [
    'uses' => 'PublicController@createPayment',
]);
$router->get('sukien/{slug}', [
    'uses' => 'PublicController@chitiet_sukien',
]);
$router->get('sukien', [
    'uses' => 'PublicController@sukien',
]);
$router->get('/', [
    'uses' => 'PublicController@homepage',
    'as' => 'homepage',
    'middleware' => config('asgard.page.config.middleware'),
]);
$router->any('{uri}', [
    'uses' => 'PublicController@uri',
    'as' => 'page',
    'middleware' => config('asgard.page.config.middleware'),
])->where('uri', '.*');