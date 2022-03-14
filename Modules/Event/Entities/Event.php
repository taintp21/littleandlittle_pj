<?php

namespace Modules\Event\Entities;

use Dimsav\Translatable\Translatable;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Laracasts\Presenter\PresentableTrait;
use Modules\Event\Presenters\EventPresenter;
use Modules\Core\Traits\NamespacedEntity;
use Modules\Media\Entities\File;
use Modules\Media\Support\Traits\MediaRelation;
use Modules\Tag\Contracts\TaggableInterface;
use Modules\Tag\Traits\TaggableTrait;

class Event extends Model implements TaggableInterface
{
    use Translatable, MediaRelation, PresentableTrait, NamespacedEntity, TaggableTrait;

    public $translatedAttributes = ['title', 'slug', 'images', 'location', 'fromDate', 'toDate', 'price', 'content'];
    protected $fillable = ['event_id', 'status', 'title', 'slug', 'images', 'location', 'fromDate', 'toDate', 'price', 'content'];
    protected $table = 'event__events';
    protected $presenter = EventPresenter::class;
    protected $casts = [
        'status' => 'int',
    ];

    /**
     * Get the thumbnail image for the current blog event
     * @return File|string
     */
    public function getThumbnailAttribute()
    {
        $thumbnail = $this->files()->where('zone', 'thumbnail')->first();

        if ($thumbnail === null) {
            return '';
        }

        return $thumbnail;
    }

    /**
     * Check if the event is in draft
     * @param Builder $query
     * @return Builder
     */
    public function scopeDraft(Builder $query)
    {
        return $query->whereStatus(Status::DRAFT);
    }

    /**
     * Check if the event is pending review
     * @param Builder $query
     * @return Builder
     */
    public function scopePending(Builder $query)
    {
        return $query->whereStatus(Status::PENDING);
    }

    /**
     * Check if the event is published
     * @param Builder $query
     * @return Builder
     */
    public function scopePublished(Builder $query)
    {
        return $query->whereStatus(Status::PUBLISHED);
    }

    /**
     * Check if the event is unpublish
     * @param Builder $query
     * @return Builder
     */
    public function scopeUnpublished(Builder $query)
    {
        return $query->whereStatus(Status::UNPUBLISHED);
    }

    // /**
    //  * @param $method
    //  * @param $parameters
    //  * @return mixed
    //  */
    // public function __call($method, $parameters)
    // {
    //     #i: Convert array to dot notation
    //     $config = implode('.', ['asgard.blog.config.event.relations', $method]);

    //     #i: Relation method resolver
    //     if (config()->has($config)) {
    //         $function = config()->get($config);

    //         return $function($this);
    //     }

    //     #i: No relation found, return the call to parent (Eloquent) to handle it.
    //     return parent::__call($method, $parameters);
    // }
}
