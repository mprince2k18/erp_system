<?php

namespace SpondonIt\BizService\Repositories;

use App\User;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use App\Notification;
use Modules\ModuleManager\Entities\InfixModuleManager;
use Modules\RolePermission\Entities\Role;
use Modules\Setting\Model\BusinessSetting;
use Modules\Setting\Model\GeneralSetting;
use Nwidart\Modules\Facades\Module;

class InitRepository
{

    public function init()
    {
        config([
            'app.item' => '25350109',
            'spondonit.module_manager_model' => InfixModuleManager::class,
            'spondonit.module_manager_table' => 'infix_module_managers',

            'spondonit.settings_model' => GeneralSetting::class,
            'spondonit.module_model' => Module::class,

            'spondonit.user_model' => User::class,
            'spondonit.settings_table' => 'general_settings',
            'spondonit.database_file' => 'infixbiz.sql',
        ]);
    }

    public function config()
    {
        if (Schema::hasTable('general_settings')) {

            app()->singleton('business_settings', function () {
                return BusinessSetting::select('type', 'status')->get();
            });

            app()->singleton('general_setting', function () {
                return GeneralSetting::first();
            });

            $locale = 'en';
            if(session()->has('locale')){
                $locale = session()->get('locale');
            }
            else{
                $locale = app('general_setting')->language_name;
                session()->put('locale',$locale);
            }

            \App::setLocale($locale);

            config([
                'settings' => app('general_setting'),
                'bus_setting' => ''
            ]);


             app()->singleton('permission_list', function() {
                return Role::with(['permissions' => function($query){
                    $query->select('route','module_id','parent_id','role_id');
                }])->get(['id','name']);
            });

            view()->composer('backEnd.partials.menu', function ($view) {
                $data = [
                    'notifications' => Notification::with('notifiable')->where('user_id',auth()->user()->id)->where('role',auth()->user()->role_id)->where('read_at', null)->latest()->get(),
                ];
                $view->with($data);
            });

            Validator::extend('uniqueAccountName', function ($attribute, $value, $parameters, $validator) {
                $count = DB::table('chart_accounts')->where('type', $value)
                    ->where('name', $parameters[0])
                    ->count();

                return $count === 0;
            });

            Builder::macro('whereLike', function ($attributes, string $searchTerm) {
                $this->where(function (Builder $query) use ($attributes, $searchTerm) {
                    foreach (Arr::wrap($attributes) as $attribute) {
                        $query->when(
                            Str::contains($attribute, '.'),
                            function (Builder $query) use ($attribute, $searchTerm) {
                                [$relationName, $relationAttribute] = explode('.', $attribute);

                                $query->orWhereHas($relationName, function (Builder $query) use ($relationAttribute, $searchTerm) {
                                    $query->where($relationAttribute, 'LIKE', "%{$searchTerm}%");
                                });
                            },
                            function (Builder $query) use ($attribute, $searchTerm) {
                                $query->orWhere($attribute, 'LIKE', "%{$searchTerm}%");
                            }
                        );
                    }
                });
                return $this;
            });
        }

    }

}
