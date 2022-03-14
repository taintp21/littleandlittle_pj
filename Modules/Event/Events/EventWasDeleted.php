<?php

namespace Modules\Event\Events;

use Modules\Media\Contracts\DeletingMedia;

class EventWasDeleted implements DeletingMedia
{
    /**
     * @var string
     */
    private $eventClass;
    /**
     * @var int
     */
    private $eventId;

    public function __construct($eventId, $eventClass)
    {
        $this->eventClass = $eventClass;
        $this->eventId = $eventId;
    }

    /**
     * Get the entity ID
     * @return int
     */
    public function getEntityId()
    {
        return $this->eventId;
    }

    /**
     * Get the class name the imageables
     * @return string
     */
    public function getClassName()
    {
        return $this->eventClass;
    }
}
