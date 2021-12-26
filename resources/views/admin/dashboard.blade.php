@extends('admin.layout.master')
@section('title', 'Dashboard')
@section('content')


    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">DASHBOARD</h1>
        <!-- <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
            For more information about DataTables, please visit the <a target="_blank"
                href="https://datatables.net">official DataTables documentation</a>.</p> -->

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3 row">
                <div class="col-sm-8">
                    <h6 class="m-0 font-weight-bold text-primary">Danh sách người đặt vé</h6>
                </div>
                <div class="col-sm-4">
                    <input type="search" name="search" placeholder="Tên người đặt..." class="form-control">
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
                            <tr>
                                <td>Tiger Nixon</td>
                                <td>Tôi thấy hoa vàng trên thảo nguyên</td>
                                <td>1</td>
                                <td>20/09/2021</td>
                                <td>d7as6da</td>
                                <td>Duyệt</td>
                                <td> <a class="btn btn-outline-success" href="">
                                        <i class="fas fa-check"></i>
                                    </a></td>
                            </tr>
                            <tr>
                                <td>Donna Snider</td>
                                <td>Anh hùng núp</td>
                                <td>2</td>
                                <td>08/04/2021</td>
                                <td>das8d7g</td>
                                <td>Chờ duyệt</td>
                                <td> <a class="btn btn-outline-success" href="">
                                        <i class="fas fa-check"></i>
                                    </a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
@stop
