<div class="box-body">
    <div class='form-group{{ $errors->has("$lang.title") ? ' has-error' : '' }}'>
        <?php $oldTitle = isset($event->translate($lang)->title) ? $event->translate($lang)->title : ''; ?>
        {!! Form::label("{$lang}[title]", 'Tiêu đề') !!}
        {!! Form::text("{$lang}[title]", old("$lang.title", $oldTitle), ['class' => 'form-control', 'data-slug' => 'source', 'placeholder' => 'Tiêu đề']) !!}
        {!! $errors->first("$lang.title", '<span class="help-block">:message</span>') !!}
    </div>
    <div class='form-group{{ $errors->has("$lang.slug") ? ' has-error' : '' }}'>
        <?php $oldSlug = isset($event->translate($lang)->slug) ? $event->translate($lang)->slug : ''; ?>
        {!! Form::label("{$lang}[slug]", 'Slug') !!}
        {!! Form::text("{$lang}[slug]", old("$lang.slug", $oldSlug), ['class' => 'form-control slug', 'data-slug' => 'target', 'placeholder' => 'Slug']) !!}
        {!! $errors->first("$lang.slug", '<span class="help-block">:message</span>') !!}
    </div>
    <div class='form-group{{ $errors->has("$lang.images") ? ' has-error' : '' }}'>
        <?php $oldImages = isset($event->translate($lang)->images) ? $event->translate($lang)->images : ''; ?>
        {!! Form::label("{$lang}[images]", 'Tên hình ảnh') !!}
        {!! Form::text("{$lang}[images]", old("$lang.images", $oldImages), ['class' => 'form-control', 'placeholder' => 'Tên hình ảnh']) !!}
        {!! $errors->first("$lang.images", '<span class="help-block">:message</span>') !!}
    </div>
    <div class='form-group{{ $errors->has("$lang.location") ? ' has-error' : '' }}'>
        <?php $oldLocation = isset($event->translate($lang)->location) ? $event->translate($lang)->location : ''; ?>
        {!! Form::label("{$lang}[location]", 'Địa điểm') !!}
        {!! Form::text("{$lang}[location]", old("$lang.location", $oldLocation), ['class' => 'form-control', 'placeholder' => 'Địa điểm']) !!}
        {!! $errors->first("$lang.location", '<span class="help-block">:message</span>') !!}
    </div>
    <div class='form-group{{ $errors->has("$lang.fromDate") ? ' has-error' : '' }}'>
        <?php $oldFromDate = isset($event->translate($lang)->fromDate) ? $event->translate($lang)->fromDate : ''; ?>
        {!! Form::label("{$lang}[fromDate]", 'Từ') !!}
        {!! Form::date("{$lang}[fromDate]", old("$lang.fromDate", $oldFromDate), ['class' => 'form-control', 'placeholder' => 'Từ']) !!}
        {!! $errors->first("$lang.fromDate", '<span class="help-block">:message</span>') !!}
    </div>
    <div class='form-group{{ $errors->has("$lang.toDate") ? ' has-error' : '' }}'>
        <?php $oldToDate = isset($event->translate($lang)->toDate) ? $event->translate($lang)->toDate : ''; ?>
        {!! Form::label("{$lang}[toDate]", 'Đến') !!}
        {!! Form::date("{$lang}[toDate]", old("$lang.toDate", $oldToDate), ['class' => 'form-control']) !!}
        {!! $errors->first("$lang.toDate", '<span class="help-block">:message</span>') !!}
    </div>
    <div class='form-group{{ $errors->has("$lang.price") ? ' has-error' : '' }}'>
        <?php $oldPrice = isset($event->translate($lang)->price) ? $event->translate($lang)->price : ''; ?>
        {!! Form::label("{$lang}[price]", 'Giá') !!}
        {!! Form::number("{$lang}[price]", old("$lang.price", $oldPrice), ['class' => 'form-control']) !!}
        {!! $errors->first("$lang.price", '<span class="help-block">:message</span>') !!}
    </div>
    <?php $old = isset($event->translate($lang)->content) ? $event->translate($lang)->content : ''; ?>
    @editor('content', 'Content', old("$lang.content", $old), $lang)
</div>
