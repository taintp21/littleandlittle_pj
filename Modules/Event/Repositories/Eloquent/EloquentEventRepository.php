<?php

namespace Modules\Event\Repositories\Eloquent;

use Illuminate\Database\Eloquent\Builder;
use Modules\Event\Entities\Event;
use Modules\Event\Entities\Status;
use Modules\Event\Events\EventIsCreating;
use Modules\Event\Events\EventIsUpdating;
use Modules\Event\Events\EventWasCreated;
use Modules\Event\Events\EventWasDeleted;
use Modules\Event\Events\EventWasUpdated;

use Modules\Event\Repositories\EventRepository;
use Modules\Core\Repositories\Eloquent\EloquentBaseRepository;

class EloquentEventRepository extends EloquentBaseRepository implements EventRepository
{
    
}
