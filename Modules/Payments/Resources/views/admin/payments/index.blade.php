@extends('layouts.master')

@section('content-header')
    <h1>
        {{ trans('payments::payments.title.payments') }}
    </h1>
    <ol class="breadcrumb">
        <li><a href="{{ route('dashboard.index') }}"><i class="fa fa-dashboard"></i> {{ trans('core::core.breadcrumb.home') }}</a></li>
        <li class="active">{{ trans('payments::payments.title.payments') }}</li>
    </ol>
@stop

@section('content')
    <div class="row">
        <div class="col-xs-12">
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
                                    <th>Mã đơn hàng (vnp_TxnRef)</th>
                                    <th>Giá tiền</th>
                                    <th>Số lượng</th>
                                    <th>Ngày sử dụng</th>
                                    <th>Họ tên người mua</th>
                                    <th>Điện thoại</th>
                                    <th>Email</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($payments as $r)
                                    <tr>
                                        <td>{{ $r->id }}</td>
                                        <td>{{ $r->vnp_TxnRef }}</td>
                                        <td>{{ $r->giatien }}</td>
                                        <td>{{ $r->soluong }}</td>
                                        <td>{{ $r->ngaysudung }}</td>
                                        <td>{{ $r->hoten }}</td>
                                        <td>{{ $r->dienthoai }}</td>
                                        <td>{{ $r->email }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Id</th>
                                    <th>vnp_TxnRef</th>
                                    <th>Giá tiền</th>
                                    <th>Số lượng</th>
                                    <th>Ngày sử dụng</th>
                                    <th>Họ tên người mua</th>
                                    <th>Điện thoại</th>
                                    <th>Email</th>
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
@stop

@section('footer')
    <a data-toggle="modal" data-target="#keyboardShortcutsModal"><i class="fa fa-keyboard-o"></i></a> &nbsp;
@stop