<?php

namespace SpondonIt\BizService\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {

        $rules = array();

        $rules = [
            'email'                 => 'required|email',
            'password'              => 'required|min:6',
            'password_confirmation' => 'required|same:password',
        ];

        return $rules;
    }

    /**
     * Translate fields with user friendly name.
     *
     * @return array
     */
    public function attributes()
    {
        return [

            'email'                 => trans('bio::install.email'),
            'password'              => trans('bio::install.password'),
            'password_confirmation' => trans('bio::install.password_confirmation'),
        ];
    }
}
