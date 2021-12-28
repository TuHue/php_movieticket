@extends('admin.layout.master')
@section('title', 'Dashboard')
@section('content')
<style>
    
    table,
        th,
        td {

            border: 1px solid black;

            border-collapse: collapse;

        }

        th,
        td {

            padding: 10px;

        }

        th {

            background-color: #FDDF95;

        }

        colgroup {

            width: 250px;

        }

        .topnav {
  overflow: hidden;
  background-color: #e9e9e9;
  padding-bottom: 15px;
}

/* Style the search box inside the navigation bar */
.topnav input[type=text] {
  float: right;
  padding: 6px;
  border: none;
  margin-top: 8px;
  margin-right: 16px;
  font-size: 17px;
}

/* When the screen is less than 600px wide, stack the links and the search field vertically instead of horizontally */
@media screen and (max-width: 600px) {
  .topnav a, .topnav input[type=text] {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
  }
  .topnav input[type=text] {
    border: 1px solid #ccc;
  }
}

</style>
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">DANH SÁCH NGƯỜI ĐẶT VÉ</h1>
    <!-- <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                For more information about DataTables, please visit the <a target="_blank"
                    href="https://datatables.net">official DataTables documentation</a>.</p> -->

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <div class="row">
                <div class="col-sm-8">
                    {{-- <h6 class="m-0 font-weight-bold text-primary">Danh sách người đặt vé</h6> --}}
                </div>
                <div class="col-sm-4">
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
                        action="/admin/dashboard/search"
                        method="POST"
                        >
                        @csrf
                        <div class="topnav">
                            <input type="text" placeholder="Search.." name="ma_xac_thuc">
                          </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Tên người đặt</th>
                            <th>Tên phim</th>
                            <th>Phòng chiếu</th>
                            <th>Ngày chiếu</th>
                            <th>Mã xác nhận</th>
                            <th>Trạng thái</th>
                            <th>Check</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Tên người đặt</th>
                            <th>Tên phim</th>
                            <th>Phòng chiếu</th>
                            <th>Ngày chiếu</th>
                            <th>Mã xác nhận</th>
                            <th>Trạng thái</th>
                            <th>Check</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        @foreach ($danh_sach_ve_ban as  $ve_ban)
                        <tr>
                            <td>{{ $ve_ban->ten_nguoi_dat }}</td>
                            <td>{{ $ve_ban->ten_phim }}</td>
                            <td>{{ $ve_ban->id_phong_chieu }}</td>
                            <td>{{
                                Carbon\Carbon::parse($ve_ban->ngay_ban)->toDayDateTimeString() }}</td>
                            <td>{{ $ve_ban->ma_xac_thuc }}</td>
                            <td style="color:{{ ($ve_ban->trang_thai ===0)?'red':'green' }}">{{ ($ve_ban->trang_thai ===0)?"Chưa Duyệt":"Duyệt" }}</td>
                            <td> <a class="btn btn-outline-success" href="/admin/dashboard/check/{{ $ve_ban->ve_ban_id }}">
                                    <i class="fas fa-check"></i>
                                </a></td>
                        </tr>
                            
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<script src="{{ URL::asset('assets/css/admin/main.js') }}"></script>
@stop