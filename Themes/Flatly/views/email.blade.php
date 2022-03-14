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
            width: 100px;
        }
    </style>
</head>
<body>
    <table class="table table-bordered">
        <tr>
            <th>Tên</th>
            <td>{{$data['name']}}</td>
        </tr>
        <tr>
            <th>Email</th>
            <td>{{$data['email']}}</td>
        </tr>
        <tr>
            <th>Điện thoại</th>
            <td>{{$data['phone']}}</td>
        </tr>
        <tr>
            <th>Địa chỉ</th>
            <td>{{$data['address']}}</td>
        </tr>
    </table>
    <p><b>Tin nhắn:</b></p>
    <p style="white-space: pre-wrap;">{{$data['message']}}</p>
</body>
</html>