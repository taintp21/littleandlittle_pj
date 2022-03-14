<?php

namespace Modules\Blog\Http\Requests;

use Modules\Core\Internationalisation\BaseFormRequest;

class CreatePostRequest extends BaseFormRequest
{
    public function rules()
    {
        return [];
    }

    public function translationRules()
    {
        return [
            'title' => 'required',
            'slug' => "required|unique:blog__post_translations,slug,null,post_id,locale,$this->localeKey",
        ];
    }

    public function authorize()
    {
        return true;
    }

    public function translationMessages()
    {
        return [
            'title.required' => trans('Tiêu đề không được để trống !'),
            'slug.required' => trans('Slug không được để trống !'),
            'slug.unique' => trans('Slug phải là duy nhất !'),
        ];
    }
}
