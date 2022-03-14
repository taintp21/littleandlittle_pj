<?php

use Illuminate\Routing\Router;
/** @var Router $router */

$router->group(['prefix' =>'/payments'], function (Router $router) {
    $router->bind('payments', function ($id) {
        return app('Modules\Payments\Repositories\PaymentsRepository')->find($id);
    });
    $router->get('payments', [
        'as' => 'admin.payments.payments.index',
        'uses' => 'PaymentsController@index',
        'middleware' => 'can:payments.payments.index'
    ]);
    $router->get('payments/create', [
        'as' => 'admin.payments.payments.create',
        'uses' => 'PaymentsController@create',
        'middleware' => 'can:payments.payments.create'
    ]);
    $router->post('payments', [
        'as' => 'admin.payments.payments.store',
        'uses' => 'PaymentsController@store',
        'middleware' => 'can:payments.payments.create'
    ]);
    $router->get('payments/{payments}/edit', [
        'as' => 'admin.payments.payments.edit',
        'uses' => 'PaymentsController@edit',
        'middleware' => 'can:payments.payments.edit'
    ]);
    $router->put('payments/{payments}', [
        'as' => 'admin.payments.payments.update',
        'uses' => 'PaymentsController@update',
        'middleware' => 'can:payments.payments.edit'
    ]);
    $router->delete('payments/{payments}', [
        'as' => 'admin.payments.payments.destroy',
        'uses' => 'PaymentsController@destroy',
        'middleware' => 'can:payments.payments.destroy'
    ]);
// append

});
