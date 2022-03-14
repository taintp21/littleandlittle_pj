<?php

namespace Modules\Event\Presenters;

use Laracasts\Presenter\Presenter;
use Modules\Event\Entities\Status;

class EventPresenter extends Presenter
{
    /**
     * @var \Modules\Event\Entities\Status
     */
    protected $status;
    /**
     * @var \Modules\Event\Repositories\PostRepository
     */
    private $event;

    public function __construct($entity)
    {
        parent::__construct($entity);
        $this->event = app('Modules\Event\Repositories\EventRepository');
        $this->status = app('Modules\Event\Entities\Status');
    }

    /**
     * Get the previous post of the current post
     * @return object
     */
    public function previous()
    {
        return $this->event->getPreviousOf($this->entity);
    }

    /**
     * Get the next post of the current post
     * @return object
     */
    public function next()
    {
        return $this->event->getNextOf($this->entity);
    }

    /**
     * Get the post status
     * @return string
     */
    public function status()
    {
        return $this->status->get($this->entity->status);
    }

    /**
     * Getting the label class for the appropriate status
     * @return string
     */
    public function statusLabelClass()
    {
        switch ($this->entity->status) {
            case Status::DRAFT:
                return 'bg-red';
                break;
            case Status::PENDING:
                return 'bg-orange';
                break;
            case Status::PUBLISHED:
                return 'bg-green';
                break;
            case Status::UNPUBLISHED:
                return 'bg-purple';
                break;
            default:
                return 'bg-red';
                break;
        }
    }
}
