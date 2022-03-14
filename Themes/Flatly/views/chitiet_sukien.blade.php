@extends('layouts.master')

@section('title')
{{$chitiet_sukien->title}} | @parent
@stop

@section('content')
    <h1 class="text-white fw-bold text-center iCiel">{{$chitiet_sukien->title}}</h1>
    <div class="container mt-5" style="max-width: 1520px">
        <div class="formGeneral p-2">
            <div class="content p-3 d-flex">
                <div style="margin-right: 40px;">
                    <p><img src="{{ url('/assets/media/'. $chitiet_sukien->images) }}" alt="{{$chitiet_sukien->title}}" style="width: 411px; height: 337px"></p>
                    <small>{!! date('d/m/Y', strtotime($chitiet_sukien->fromDate)) !!} - {!! date('d/m/Y', strtotime($chitiet_sukien->toDate)) !!}</small>
                    <p class="text-muted">{{$chitiet_sukien->location}}</p>
                    <h5 class="price">{{number_format($chitiet_sukien->price, 0, '', '.')}} VNĐ</h5>
                </div>

                <div class="event_content">
                    {!! $chitiet_sukien->content !!}
                </div>
            </div>
        </div>
    </div>
@endsection
