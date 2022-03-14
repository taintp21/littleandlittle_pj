<?php

namespace Modules\Blog\Events;

use Modules\Event\Entities\Event;
use Modules\Media\Contracts\StoringMedia;

class EventWasUpdated implements StoringMedia
{
    /**
     * @var array
     */
    public $data;
    /**
     * @var Event
     */
    public $event;

    public function __construct(Event $event, array $data)
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
