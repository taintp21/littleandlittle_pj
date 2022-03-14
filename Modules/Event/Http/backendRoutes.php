<?php

use Illuminate\Routing\Router;
/** @var Router $router */

$router->group(['prefix' =>'/event'], function (Router $router) {
    $router->bind('event', function ($id) {
        return app('Modules\Event\Repositories\EventRepository')->find($id);
    });
    $router->get('events', [
        'as' => 'admin.event.event.index',
        'uses' => 'EventController@index',
        'middleware' => 'can:event.events.index'
    ]);
    $router->get('events/create', [
        'as' => 'admin.event.event.create',
        'uses' => 'EventController@create',
        'middleware' => 'can:event.events.create'
    ]);
    $router->post('events', [
        'as' => 'admin.event.event.store',
        'uses' => 'EventController@store',
        'middleware' => 'can:event.events.create'
    ]);
    $router->get('events/{event}/edit', [
        'as' => 'admin.event.event.edit',
        'uses' => 'EventController@edit',
        'middleware' => 'can:event.events.edit'
    ]);
    $router->put('events/{event}', [
        'as' => 'admin.event.event.update',
        'uses' => 'EventController@update',
        'middleware' => 'can:event.events.edit'
    ]);
    $router->delete('events/{event}', [
        'as' => 'admin.event.event.destroy',
        'uses' => 'EventController@destroy',
        'middleware' => 'can:event.events.destroy'
    ]);
// append

});
