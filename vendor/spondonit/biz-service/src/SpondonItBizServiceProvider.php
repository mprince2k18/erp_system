<?php

namespace SpondonIt\BizService;

use Illuminate\Support\ServiceProvider;
use Illuminate\Contracts\Http\Kernel;
use SpondonIt\BizService\Middleware\BizService;

class SpondonItBizServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $kernel = $this->app->make(Kernel::class);
        $kernel->pushMiddleware(BizService::class);

        $this->loadRoutesFrom(__DIR__.'/../routes/web.php');
        $this->loadTranslationsFrom(__DIR__.'/../resources/lang', 'biz');
        $this->loadViewsFrom(__DIR__.'/../resources/views', 'biz');
        $this->loadMigrationsFrom(__DIR__.'/../database/migrations');
    }
}
