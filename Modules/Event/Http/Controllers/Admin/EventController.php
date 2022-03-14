<?php

namespace Modules\Event\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\Event\Entities\Event;
use Modules\Event\Entities\Status;
use Modules\Event\Http\Requests\CreateEventRequest;
use Modules\Event\Http\Requests\UpdateEventRequest;
use Modules\Event\Repositories\EventRepository;
use Modules\Core\Http\Controllers\Admin\AdminBaseController;

class EventController extends AdminBaseController
{
    /**
     * @var EventRepository
     */
    private $event;
    /**
     * @var Status
     */
    private $status;

    public function __construct(
        EventRepository $event,
        Status $status
        
    ) {
        parent::__construct();

        $this->event = $event;
        $this->status = $status;
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $events = $this->event->all();

        return view('event::admin.events.index', compact('events'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        $statuses = $this->status->lists();
        $this->assetPipeline->requireJs('ckeditor.js');
        return view('event::admin.events.create', compact('statuses'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CreateEventRequest $request
     * @return Response
     */
    public function store(CreateEventRequest $request)
    {
        $this->event->create($request->all());

        return redirect()->route('admin.event.event.index')
            ->withSuccess('Thêm mới event thành công !');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Event $event
     * @return Response
     */
    public function edit(Event $event)
    {
        $statuses = $this->status->lists();
        $this->assetPipeline->requireJs('ckeditor.js');
        return view('event::admin.events.edit', compact('event', 'statuses'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  Event $event
     * @param  UpdateEventRequest $request
     * @return Response
     */
    public function update(Event $event, UpdateEventRequest $request)
    {
        $this->event->update($event, $request->all());

        return redirect()->route('admin.event.event.index')
            ->withSuccess('Cập nhật event thành công !');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Event $event
     * @return Response
     */
    public function destroy(Event $event)
    {
        $this->event->destroy($event);

        return redirect()->route('admin.event.event.index')
            ->withSuccess('Xoá thành công !');
    }
}
