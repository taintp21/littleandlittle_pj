@extends('layouts.master')

@section('content-header')
<h1>
    {{ trans('event::events.title.events') }}
</h1>
<ol class="breadcrumb">
    <li><a href="{{ route('dashboard.index') }}"><i class="fa fa-dashboard"></i>{{ trans('core::core.breadcrumb.home') }}</a></li>
    <li class="active">{{ trans('event::events.title.events') }}</li>
</ol>
@stop

@section('content')
    <div class="row">
        <div class="col-xs-12">
            <div class="row">
                <div class="btn-group pull-right" style="margin: 0 15px 15px 0;">
                    <a href="{{ route('admin.event.event.create') }}" class="btn btn-primary btn-flat"
                        style="padding: 4px 10px;">
                        <i class="fa fa-pencil"></i> {{ trans('event::events.button.create event') }}
                    </a>
                </div>
            </div>
            <div class="box box-primary">
                <div class="box-header">
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="data-table table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Trạng thái</th>
                                    <th>Tiêu đề</th>
                                    <th>Slug</th>
                                    <th>Hình ảnh</th>
                                    <th>Địa điểm</th>
                                    <th>Thời gian</th>
                                    <th>Giá</th>
                                    <th data-sortable="false">{{ trans('core::core.table.actions') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if (isset($events)): ?>
                                <?php foreach ($events as $event): ?>
                                <tr>
                                    <td>
                                        <a href="{{ route('admin.event.event.edit', [$event->id]) }}">
                                            {{ $event->id }}
                                        </a>
                                    </td>
                                    <td>
                                        @if ($event->status == 0)
                                            <span class="label bg-red">Draft</span>
                                        @elseif ($event->status == 1)
                                            <span class="label bg-orange">Pending</span>
                                        @elseif ($event->status == 2)
                                            <span class="label bg-green">Published</span>
                                        @elseif ($event->status == 3)
                                            <span class="label bg-purple">Unpublished</span>
                                        @else
                                            <span class="label bg-red">Draft</span>
                                        @endif
                                    </td>
                                    <td>
                                        <a href="{{ route('admin.event.event.edit', [$event->id]) }}">
                                            {{ $event->title }}
                                        </a>
                                    </td>
                                    <td>
                                        <a href="{{ route('admin.event.event.edit', [$event->id]) }}">
                                            {{ $event->slug }}
                                        </a>
                                    </td>
                                    <td>
                                        <img src="/assets/media/{{ $event->images }}" width="150px" alt="">
                                    </td>
                                    <td>
                                        <a href="{{ route('admin.event.event.edit', [$event->id]) }}">
                                            {{ $event->location }}
                                        </a>
                                    </td>
                                    <td>
                                        <a href="{{ route('admin.event.event.edit', [$event->id]) }}">
                                            Từ: {{ $event->fromDate }} <br> Đến: {{ $event->toDate }}
                                        </a>
                                    </td>
                                    <td>
                                        <a href="{{ route('admin.event.event.edit', [$event->id]) }}">
                                            {{ $event->price }}
                                        </a>
                                    </td>
                                    <td>
                                        <div class="btn-group">
                                            <a href="{{ route('admin.event.event.edit', [$event->id]) }}"
                                                class="btn btn-default btn-flat"><i class="fa fa-pencil"></i></a>
                                            <button class="btn btn-danger btn-flat" data-toggle="modal"
                                                data-target="#modal-delete-confirmation"
                                                data-action-target="{{ route('admin.event.event.destroy', [$event->id]) }}"><i
                                                    class="fa fa-trash"></i></button>
                                        </div>
                                    </td>
                                </tr>
                                <?php endforeach; ?>
                                <?php endif; ?>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Id</th>
                                    <th>Status</th>
                                    <th>Title</th>
                                    <th>Slug</th>
                                    <th>Images</th>
                                    <th>Location</th>
                                    <th>Time</th>
                                    <th>Price</th>
                                    <th data-sortable="false">{{ trans('core::core.table.actions') }}</th>
                                </tr>
                            </tfoot>
                        </table>
                        <!-- /.box-body -->
                    </div>
                </div>
                <!-- /.box -->
            </div>
        </div>
    </div>
    @include('core::partials.delete-modal')
@stop

@section('footer')
    <a data-toggle="modal" data-target="#keyboardShortcutsModal"><i class="fa fa-keyboard-o"></i></a> &nbsp;
@stop
@section('shortcuts')
    <dl class="dl-horizontal">
        <dt><code>c</code></dt>
        <dd>{{ trans('event::events.title.create event') }}</dd>
    </dl>
@stop

@push('js-stack')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).keypressAction({
                actions: [{
                    key: 'c',
                    route: "<?= route('admin.event.event.create') ?>"
                }]
            });
        });
    </script>
    <?php $locale = locale(); ?>
    <script type="text/javascript">
        $(function() {
            $('.data-table').dataTable({
                "paginate": true,
                "lengthChange": true,
                "filter": true,
                "sort": true,
                "info": true,
                "autoWidth": true,
                "order": [
                    [0, "desc"]
                ],
                "language": {
                    "url": '<?php echo Module::asset("core:js/vendor/datatables/{$locale}.json"); ?>'
                }
            });
        });
    </script>
@endpush
