@extends('layouts.master')

@section('title')
Sự kiện | @parent
@stop

@section('content')
    <h1 class="text-white fw-bold text-center mb-5 iCiel">SỰ KIỆN NỔI BẬT</h1>
    <div class="g-3 w-75 m-auto">
        <div id="carouselSuKien" class="carousel" data-bs-ride="carousel">
            <div class="carousel-inner">
                @foreach ($sukien as $r)
                    <div class="carousel-item border-0">
                        <div class="card">
                            <div class="img-wrapper"><img src="{{ url('/assets/media/'. $r->images) }}" class="d-block w-100" alt="{{$r->title}}"> </div>
                            <div class="card-body">
                                <h5 class="card-title m-0"><a class="text-decoration-none fw-bold text-black" href="/su-kien/{{$r->id}}">{{$r->title}}</a></h5>
                                <p class="text-muted">{{$r->location}}</p>
                                <small>{!! date('d/m/Y', strtotime($r->fromDate)) !!} - {!! date('d/m/Y', strtotime($r->toDate)) !!}</small>
                                <h5 class="price">{{number_format($r->price, 0, '', '.')}} VNĐ</h5>
                                <a class="btn fw-bold w-75 iCiel" style="background: #FF000A; color: white;" href="/en/sukien/{{$r->slug}}">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselSuKien"
                    data-bs-slide="prev">
                    <i class="fa-solid fa-caret-left fa-2xl"></i>
                    <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselSuKien"
                data-bs-slide="next">
                <i class="fa-solid fa-caret-right fa-2xl"></i>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
@endsection

@section('scripts')
<script>
    $(document).ready(function(){
        $(".carousel-item:first-child").addClass('active');
    });
    var multipleCardCarousel = document.querySelector("#carouselSuKien");
    if (window.matchMedia("(min-width: 768px)").matches) {
    var carousel = new bootstrap.Carousel(multipleCardCarousel, {
        interval: false,
    });
    var carouselWidth = $(".carousel-inner")[0].scrollWidth;
    var cardWidth = $(".carousel-item").width();
    var scrollPosition = 0;
    $("#carouselSuKien .carousel-control-next").on("click", function () {
        if (scrollPosition < carouselWidth - cardWidth * 4) {
            scrollPosition += cardWidth;
            $("#carouselSuKien .carousel-inner").animate(
                { scrollLeft: scrollPosition },
                200
            );
        }
    });
    $("#carouselSuKien .carousel-control-prev").on("click", function () {
        if (scrollPosition > 0) {
            scrollPosition -= cardWidth;
            $("#carouselSuKien .carousel-inner").animate(
                { scrollLeft: scrollPosition },
                200
            );
        }
    });
    } else {
        $(multipleCardCarousel).addClass("slide");
    }
</script>
@endsection
