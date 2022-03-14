<?php

namespace Modules\Event\Events;

use Modules\Event\Entities\Event;
use Modules\Core\Contracts\EntityIsChanging;
use Modules\Core\Events\AbstractEntityHook;

class EventIsUpdating extends AbstractEntityHook implements EntityIsChanging
{
    /**
     * @var Event
     */
    private $event;

    public function __construct(Event $event, array $data)
    {
        parent::__construct($data);

        $this->event = $event;
    }

    /**
     * @return Event
     */
    public function getEvent()
    {
        return $this->event;
    }
}
