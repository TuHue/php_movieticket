@extends('admin.layout.master')
@section('title', 'Movie')
@section('content')
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Movie</h1>
        <!-- <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
            For more information about DataTables, please visit the <a target="_blank"
                href="https://datatables.net">official DataTables documentation</a>.</p> -->

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="row">
                    <div class="col-11">
                        <h6 class="m-0 font-weight-bold text-primary">DANH SÁCH PHIM</h6>
                        <P>Chỉ Admin mới có quyền thực hiện</P>
                    </div>
                    <div class="col-1 right">
                        <a class="btn btn-primary" href="/admin/movie/add">
                            <i class="far fa-plus-square"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Tên phim</th>
                                <th>Thời lượng</th>
                                <th>Giới hạn tuổi</th>
                                <th>Ngôn ngữ</th>
                                <th>Diễn viên</th>
                                <th>Quốc gia</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Tên phim</th>
                                <th>Thời lượng</th>
                                <th>Giới hạn tuổi</th>
                                <th>Ngôn ngữ</th>
                                <th>Diễn viên</th>
                                <th>Quốc gia</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </tfoot>
                        <tbody>
                            <tr>
                                <td>Tiger Nixon</td>
                                <td>02:03:00</td>
                                <td>16+</td>
                                <td>Tiếng Việt</td>
                                <td>Trương Thanh Tú</td>
                                <td>Lào</td>
                                <td>
                                    <a class="btn btn-outline-warning"  href="/admin/movie/update/1">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                </td>
                                </td>
                                <td>
                                    <a class="btn btn-outline-danger"  href="/admin/movie/delete" data-toggle="modal" data-target="#logoutModal">
                                        <i class="far fa-trash-alt"></i>
                                    </a>
                                </td>

                            </tr>
                            <tr>
                                <td>Donna Snider</td>
                                <td>01:32:35</td>
                                <td>18+</td>
                                <td>English</td>
                                <td>Quang Huy</td>
                                <td>Campuchia</td>
                                <td>
                                    <a class="btn btn-outline-warning"  href="/admin/movie/update/1">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                </td>
                                <td>
                                    <a class="btn btn-outline-danger"  href="/admin/movie/delete" data-toggle="modal" data-target="#logoutModal">
                                        <i class="far fa-trash-alt"></i>
                                    </a>
                                </td>

                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc chắn muốn xóa phim này ?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Dữ liệu của bộ phim sẽ được xóa khỏi hệ thống</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Hủy</button>
                <a class="btn btn-danger" href="/admin/login">Xóa</a>
            </div>
        </div>
    </div>
</div>
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
@stop
