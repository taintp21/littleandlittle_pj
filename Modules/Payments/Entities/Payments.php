<?php

namespace Modules\Payments\Entities;

use Dimsav\Translatable\Translatable;
use Illuminate\Database\Eloquent\Model;

class Payments extends Model
{
    use Translatable;

    protected $table = 'payments__payments';
    public $translatedAttributes = [];
    protected $fillable = ['vnp_TxnRef'];
}
