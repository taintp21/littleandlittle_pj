<?php

namespace Modules\Event\Repositories\Cache;

use Modules\Event\Repositories\EventRepository;
use Modules\Core\Repositories\Cache\BaseCacheDecorator;

class CacheEventDecorator extends BaseCacheDecorator implements EventRepository
{
    public function __construct(EventRepository $event)
    {
        parent::__construct();
        $this->entityName = 'event.events';
        $this->repository = $event;
    }
}
