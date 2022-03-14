<?php

namespace Modules\Event\Http\Requests;

use Modules\Core\Internationalisation\BaseFormRequest;

class CreateEventRequest extends BaseFormRequest
{
    public function rules()
    {
        return [];
    }

    public function translationRules()
    {
        return [
            'title' => 'required',
            'slug' => "required|unique:event__event_translations,slug,null,event_id,locale,$this->localeKey",
            'images' => 'required',
            'location' => 'required',
            'fromDate' => 'required',
            'toDate' => 'required',
            'price' => 'required',
        ];
    }

    public function authorize()
    {
        return true;
    }

    public function messages()
    {
        return [];
    }

    public function translationMessages()
    {
        return [
            'title.required' => trans('Không được để trống !'),
            'slug.required' => trans('Không được để trống !'),
            'slug.unique' => trans('Slug phải là duy nhất !'),
            'images.required' => trans('Không được để trống !'),
            'location.required' => trans('Không được để trống !'),
            'fromDate.required' => trans('Không được để trống !'),
            'toDate.required' => trans('Không được để trống !'),
            'price.required' => trans('Không được để trống !'),
        ];
    }
}
