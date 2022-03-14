<?php

namespace Modules\Event\Events;

use Modules\Core\Contracts\EntityIsChanging;
use Modules\Core\Events\AbstractEntityHook;

class EventIsCreating extends AbstractEntityHook implements EntityIsChanging
{
}
