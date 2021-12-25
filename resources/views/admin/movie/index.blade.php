@extends('admin.layout.master')
@section('title', 'Movie')
@section('content')

<style>
    svg {
        display: none;
    }

    nav>.justify-between {
        display: none
    }

    nav>.hidden>div>p {
        display: none
    }
</style>
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
            <div class="table">
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
                        @foreach ( $danh_sach_phim as $item )
                        <tr>
                            <td>{{ $item->ten_phim }}</td>
                            <td>{{ $item->thoi_luong }}</td>
                            <td>{{ $item->gioi_han_tuoi }}+</td>
                            <td>{{ $item->ngon_ngu }}</td>
                            <td>{{ $item->dien_vien }}</td>
                            <td>{{ $item->quoc_gia }}</td>
                            <td>
                                <a class="btn btn-outline-warning" href="/admin/movie/update/{{ $item->phim_id }}">
                                    <i class="fas fa-edit"></i>
                                </a>
                            </td>
                            </td>
                            <td>
                                <a class="btn btn-outline-danger" onclick="getValueIdPhim('{{$item->phim_id}}')"
                                    data-toggle="modal" data-target="#logoutModal">
                                    <i class="far fa-trash-alt"></i>
                                </a>
                            </td>

                        </tr>
                        @endforeach


                    </tbody>

                </table>
                {{ $danh_sach_phim->links() }}
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
                <a class="btn btn-danger" id="modaldelete" href="/admin/movie/delete/{{ $item->phim_id }}">Xóa</a>
            </div>
        </div>
    </div>
</div>
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
<script>
    function getValueIdPhim(id){
    var a = document.getElementById('modaldelete'); 
    a.href = "/admin/movie/delete/"+id;
}

</script>
@stop