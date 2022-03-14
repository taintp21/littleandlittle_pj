<?php

namespace Modules\Payments\Entities;

use Illuminate\Database\Eloquent\Model;

class PaymentsTranslation extends Model
{
    public $timestamps = false;
    protected $fillable = [];
    protected $table = 'payments__payments_translations';
}
