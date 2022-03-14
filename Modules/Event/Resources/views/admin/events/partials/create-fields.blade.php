<div class="box-body">
    <div class='form-group{{ $errors->has("$lang.title") ? ' has-error' : '' }}'>
        {!! Form::label("{$lang}[title]", 'Tiêu đề') !!}
        {!! Form::text("{$lang}[title]", old("$lang.title"), ['class' => 'form-control', 'data-slug' => 'source', 'placeholder' => 'Tiêu đề']) !!}
        {!! $errors->first("$lang.title", '<span class="help-block">:message</span>') !!}
    </div>
    <div class='form-group{{ $errors->has("$lang.slug") ? ' has-error' : '' }}'>
       {!! Form::label("{$lang}[slug]", 'Slug') !!}
       {!! Form::text("{$lang}[slug]", old("$lang.slug"), ['class' => 'form-control slug', 'data-slug' => 'target', 'placeholder' => 'Slug']) !!}
       {!! $errors->first("$lang.slug", '<span class="help-block">:message</span>') !!}
    </div>
    <div class='form-group{{ $errors->has("$lang.images") ? ' has-error' : '' }}'>
        {!! Form::label("{$lang}[images]", 'Tên hình ảnh') !!}
        {!! Form::text("{$lang}[images]", old("$lang.images"), ['class' => 'form-control', 'placeholder' => 'Tên hình ảnh']) !!}
        {!! $errors->first("$lang.images", '<span class="help-block">:message</span>') !!}
    </div>
    <div class='form-group{{ $errors->has("$lang.location") ? ' has-error' : '' }}'>
        {!! Form::label("{$lang}[location]", 'Địa điểm') !!}
        {!! Form::text("{$lang}[location]", old("$lang.location"), ['class' => 'form-control', 'placeholder' => 'Địa điểm']) !!}
        {!! $errors->first("$lang.location", '<span class="help-block">:message</span>') !!}
    </div>
    <div class='form-group{{ $errors->has("$lang.fromDate") ? ' has-error' : '' }}'>
        {!! Form::label("{$lang}[fromDate]", 'Từ') !!}
        {!! Form::date("{$lang}[fromDate]", old("$lang.fromDate"), ['class' => 'form-control']) !!}
        {!! $errors->first("$lang.fromDate", '<span class="help-block">:message</span>') !!}
    </div>
    <div class='form-group{{ $errors->has("$lang.toDate") ? ' has-error' : '' }}'>
        {!! Form::label("{$lang}[toDate]", 'Đến') !!}
        {!! Form::date("{$lang}[toDate]", old("$lang.location"), ['class' => 'form-control']) !!}
        {!! $errors->first("$lang.toDate", '<span class="help-block">:message</span>') !!}
    </div>
    <div class='form-group{{ $errors->has("$lang.price") ? ' has-error' : '' }}'>
        {!! Form::label("{$lang}[price]", 'Giá') !!}
        {!! Form::number("{$lang}[price]", old("$lang.price"), ['class' => 'form-control', 'placeholder' => 'Price']) !!}
        {!! $errors->first("$lang.price", '<span class="help-block">:message</span>') !!}
    </div>
    

    @editor('content', 'Content', old("{$lang}.content"), $lang)
</div>
