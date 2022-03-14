@extends('layouts.master')

@section('title')
Trang chủ | @parent
@stop

@section('content')
<div class="container">
    <div class="card border-0 text-white bg-transparent mb-5" style="max-width: 540px;">
        <div class="row g-0">
            <div class="col-md-4">
                <img src="{{ url('/assets/media/damsenpark.png') }}" class="img-fluid">
            </div>
            <div class="col-md-8" style="max-width: 240px;">
                <div class="card-body">
                   <h1 class="fw-bold iCiel">ĐẦM SEN PARK</h1>
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-center">
        <div class="formGeneral p-2">
            <div class="p-3 content">
                {!! $page->body !!}
            </div>
        </div>
        <form class="formDatVe ms-5" id="submitNextPage" method="GET" action="/en/form-thanhtoan">
            <h3 class="title iCiel">VÉ CỦA BẠN</h3>
            <input type="hidden" name="_token" value="{{ csrf_token() }}" />
            <div class="row p-3">
                <div class="col-10 mb-3">
                    <input type="text" class="form-control" name="goi" id="goi" placeholder="Gói" value="Gói gia đình">
                </div>
                <div class="col-5 mb-3">
                    <input type="number" class="form-control" name="soluong" id="soluong" placeholder="Số lượng vé" oninput="this.value = !!this.value && Math.abs(this.value) >= 0 ? Math.abs(this.value) : null" value="{{ old('soluong') }}">
                    @if($errors->has('soluong'))<p style="color: red">{{ $errors->first('soluong') }}</p>@endif
                </div>
                <div class="col-7 mb-3">
                    <input type="text" class="form-control w-75" name="ngaysudung" id="ngaysudung" placeholder="Ngày sử dụng" onkeydown="return false;" style="display: inline-block;" value="{{ old('ngaysudung') }}">
                    @if($errors->has('ngaysudung'))<p style="color: red">{{ $errors->first('ngaysudung') }}</p>@endif
                </div>
                <div class="col-12 mb-3">
                    <input type="text" class="form-control" name="hoten" id="hoten" placeholder="Họ và tên" value="{{ old('hoten') }}">
                    @if($errors->has('hoten'))<p style="color: red">{{ $errors->first('hoten') }}</p>@endif
                </div>
                <div class="col-12 mb-3">
                    <input type="number" class="form-control" name="dienthoai" id="dienthoai" placeholder="Số điện thoại" value="{{ old('dienthoai') }}">
                    @if($errors->has('dienthoai'))<p style="color: red">{{ $errors->first('dienthoai') }}</p>@endif
                </div>
                <div class="col-12 mb-3">
                    <input type="email" class="form-control" name="email" id="email" placeholder="Địa chỉ email" value="{{ old('email') }}">
                    @if($errors->has('email'))<p style="color: red">{{ $errors->first('email') }}</p>@endif
                </div>
                <div class="mb-3 text-center">
                    <button type="submit" class="btn fw-bold w-50 iCiel" style="background: #FF000A; color: white;">Đặt vé</button>
                </div>
            </div>
        </form>
    </div>
</div>
@stop

@section('scripts')
    <script>
        $(document).ready(function () {
            $('#chonGoi').change(function(){
                $('#goi').val($(this).val());
            });

            $("#ngaysudung").datepicker({
                numberOfMonths: 1,
                changeYear: true,
                changeMonth: true,
                showOn: 'both',
                minDate: new Date(),
                dateFormat: 'yy-mm-dd'
            });
            $(".ui-datepicker-trigger").html('<i class="fa-solid fa-calendar-days fa-lg"></i>');

            //Session
            $("#submitNextPage").submit(function(){
                sessionStorage.setItem("goi", $("#goi").val());
                sessionStorage.setItem("soluong", $("#soluong").val());
                sessionStorage.setItem("ngaysudung", $("#ngaysudung").val());
                sessionStorage.setItem("hoten", $("#hoten").val(),);
                sessionStorage.setItem("dienthoai", $("#dienthoai").val());
                sessionStorage.setItem("email", $("#email").val());
            });
        });
    </script>
@endsection