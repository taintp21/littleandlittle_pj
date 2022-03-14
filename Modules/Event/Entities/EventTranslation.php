<?php

namespace Modules\Event\Entities;

use Illuminate\Database\Eloquent\Model;
use Modules\Event\Events\EventContentIsRendering;

class EventTranslation extends Model
{
    public $timestamps = false;
    protected $fillable = ['title', 'slug', 'images', 'location', 'fromDate', 'toDate', 'price', 'content'];
    protected $table = 'event__event_translations';

    public function getContentAttribute($content)
    {
        event($event = new EventContentIsRendering($content));

        return $event->getContent();
    }
}
