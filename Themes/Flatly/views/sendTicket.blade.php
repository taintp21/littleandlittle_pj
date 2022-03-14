<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        th{
            text-align: left;
            width: 150px;
        }
    </style>
</head>
<body>
    <p>Xin chào, bạn đã đặt vé của website chúng tôi. Dưới đây là thông tin cơ bản</p>
    <table class="table table-bordered">
        <tr>
            <th>Mã đơn hàng</th>
            <td>{{$sendTicketData['vnp_TxnRef']}}</td>
        </tr>
        <tr>
            <th>Giá vé</th>
            <td>{{$sendTicketData['giatien']}}</td>
        </tr>
        <tr>
            <th>Số lượng</th>
            <td>{{$sendTicketData['soluong']}}</td>
        </tr>
        <tr>
            <th>Ngày sử dụng vé</th>
            <td>{{$sendTicketData['ngaysudung']}}</td>
        </tr>
        <tr>
            <th>Họ tên người mua</th>
            <td>{{$sendTicketData['hoten']}}</td>
        </tr>
        <tr>
            <th>Số điện thoại</th>
            <td>{{$sendTicketData['dienthoai']}}</td>
        </tr>
        <tr>
            <th>Email</th>
            <td>{{$sendTicketData['email']}}</td>
        </tr>
    </table>
    <p>Cảm ơn bạn đã đặt hàng !</p>
</body>
</html>
