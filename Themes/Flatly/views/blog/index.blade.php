@extends('layouts.master')

@section('title')
Sự kiện | @parent
@stop

@section('content')
    <h1 class="text-white fw-bold text-center mb-5 iCiel">SỰ KIỆN NỔI BẬT</h1>
    <div class="row">
        <div class="col-md-12">
            <?php if (isset($posts)): ?>
            <ul>
                <?php foreach ($posts as $post): ?>
                    <li>
                        <span class="date">{{ $post->created_at->format('d-m-Y') }}</span>
                        <h3><a href="{{ URL::route($currentLocale . '.blog.slug', [$post->slug]) }}">{{ $post->title }}</a></h3>
                    </li>
                    <div class="clearfix"></div>
                <?php endforeach; ?>
            </ul>
            <?php endif; ?>
        </div>
    </div>
@stop
