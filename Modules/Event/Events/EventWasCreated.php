<?php

namespace Modules\Event\Events;

use Modules\Blog\Entities\Event;
use Modules\Media\Contracts\StoringMedia;

class EventWasCreated implements StoringMedia
{
    /**
     * @var array
     */
    public $data;
    /**
     * @var Event
     */
    public $event;

    public function __construct($event, array $data)
    {
        $this->data = $data;
        $this->event = $event;
    }

    /**
     * Return the entity
     * @return \Illuminate\Database\Eloquent\Model
     */
    public function getEntity()
    {
        return $this->event;
    }

    /**
     * Return the ALL data sent
     * @return array
     */
    public function getSubmissionData()
    {
        return $this->data;
    }
}
