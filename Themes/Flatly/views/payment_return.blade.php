@extends('layouts.master')

@section('title', 'Thanh toán thành công')

@section('content')
    <h1 class="text-white fw-bold text-center mb-5 iCiel">THANH TOÁN THÀNH CÔNG</h1>
    <div class="g-3 w-75 m-auto">
        <div id="carouselThanhToan" class="carousel formGeneral" data-bs-ride="carousel">
            <div class="carousel-inner p-3">
                @for ($i=1; $i <= $paymentInfo->soluong; $i++)
                    <div class="carousel-item border-0 rounded-5">
                        <div class="card">
                            <div class="card-header text-center border-0 bg-body pt-4">
                                {!! $generateQR !!}
                                <span id="qrcodehidden" style="display: none;"></span>
                            </div>
                            <div class="card-body text-center">
                                <p class="fw-bold">{{$vnp_TxnRef}}</p>
                                <p class="fw-bold" style="color: #FFC226;">VÉ CỔNG</p>
                                ---
                                <p>Ngày sử dụng: {{$paymentInfo->ngaysudung}}</p>
                                <i class="fa-solid fa-circle-check" style="color: green"></i>
                            </div>
                        </div>
                    </div>
                @endfor
            </div>
            <p class="p-3">Số lượng: {{$paymentInfo->soluong}} vé</p>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselThanhToan"
                    data-bs-slide="prev">
                    <i class="fa-solid fa-caret-left fa-2xl"></i>
                    <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselThanhToan"
                data-bs-slide="next">
                <i class="fa-solid fa-caret-right fa-2xl"></i>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <div class="text-center d-flex justify-content-center mt-3">
        <button id="download" class="btn ms-3 btn_payment_return" onclick="setTimeout(downloadURI, 2000)">Tải vé</button>
        <form action="/vnpay/return/send-ticket-email" method="POST">
            <input type="hidden" name="_token" value="{{ csrf_token() }}" />
            <input type="hidden" name="vnp_TxnRef" value="{{$vnp_TxnRef}}">
            <input type="hidden" name="giatien" value="{{$paymentInfo->giatien}}">
            <input type="hidden" name="soluong" value="{{$paymentInfo->soluong}}">
            <input type="hidden" name="ngaysudung" value="{{$paymentInfo->ngaysudung}}">
            <input type="hidden" name="hoten" value="{{$paymentInfo->hoten}}">
            <input type="hidden" name="dienthoai" value="{{$paymentInfo->dienthoai}}">
            <input type="hidden" name="email" value="taintp21@gmail.com">
            <button type="submit" class="btn ms-3 btn_payment_return">Gửi Email</button>
        </form>
        
        @if(session()->has('messageSuccess'))
            <p style="color: white;">{!! session()->get('messageSuccess') !!}</p>
        @endif
    </div>
@endsection


@section('scripts')
<script>
    //Carousel
    var multipleCardCarousel = document.querySelector("#carouselThanhToan");
    if (window.matchMedia("(min-width: 768px)").matches) {
    var carousel = new bootstrap.Carousel(multipleCardCarousel, {
        interval: false,
    });
    var carouselWidth = $(".carousel-inner")[0].scrollWidth;
    var cardWidth = $(".carousel-item").width();
    var scrollPosition = 0;
    $("#carouselThanhToan .carousel-control-next").on("click", function () {
        if (scrollPosition < carouselWidth - cardWidth * 4) {
            scrollPosition += cardWidth;
            $("#carouselThanhToan .carousel-inner").animate(
                { scrollLeft: scrollPosition },
                200
            );
        }
    });
    $("#carouselThanhToan .carousel-control-prev").on("click", function () {
        if (scrollPosition > 0) {
            scrollPosition -= cardWidth;
            $("#carouselThanhToan .carousel-inner").animate(
                { scrollLeft: scrollPosition },
                200
            );
        }
    });
    } else {
        $(multipleCardCarousel).addClass("slide");
    }

    //Download
    let qrcode = new QRCode(document.getElementById("qrcodehidden"),{
        text: "{{$QRvnp_TxnRef}}",
        width: 150,
        height: 150,
        colorDark : "#000000",
        colorLight : "#ffffff",
        correctLevel : QRCode.CorrectLevel.H
    });
    
    function downloadURI() {
        let dataUrl = document.querySelector('#qrcodehidden').querySelector('img').src;
        var name = 'qrcode.png';
        var link = document.createElement("a");
        link.download = name;
        link.href = dataUrl;
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
        delete link;
    };
</script>
@endsection
