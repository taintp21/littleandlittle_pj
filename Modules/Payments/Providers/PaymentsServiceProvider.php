<?php

namespace Modules\Payments\Providers;

use Illuminate\Support\ServiceProvider;
use Modules\Core\Traits\CanPublishConfiguration;
use Modules\Core\Events\BuildingSidebar;
use Modules\Core\Events\LoadingBackendTranslations;
use Modules\Payments\Events\Handlers\RegisterPaymentsSidebar;

class PaymentsServiceProvider extends ServiceProvider
{
    use CanPublishConfiguration;
    /**
     * Indicates if loading of the provider is deferred.
     *
     * @var bool
     */
    protected $defer = false;

    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        $this->registerBindings();
        $this->app['events']->listen(BuildingSidebar::class, RegisterPaymentsSidebar::class);

        $this->app['events']->listen(LoadingBackendTranslations::class, function (LoadingBackendTranslations $event) {
            $event->load('payments', array_dot(trans('payments::payments')));
            // append translations

        });
    }

    public function boot()
    {
        $this->publishConfig('payments', 'permissions');

        $this->loadMigrationsFrom(__DIR__ . '/../Database/Migrations');
    }

    /**
     * Get the services provided by the provider.
     *
     * @return array
     */
    public function provides()
    {
        return array();
    }

    private function registerBindings()
    {
        $this->app->bind(
            'Modules\Payments\Repositories\PaymentsRepository',
            function () {
                $repository = new \Modules\Payments\Repositories\Eloquent\EloquentPaymentsRepository(new \Modules\Payments\Entities\Payments());

                if (! config('app.cache')) {
                    return $repository;
                }

                return new \Modules\Payments\Repositories\Cache\CachePaymentsDecorator($repository);
            }
        );
// add bindings

    }
}
