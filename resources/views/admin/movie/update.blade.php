@extends('admin.layout.master')
@section('title', 'Update Movie')
@section('content')
    <div class="container-fluid">

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">CHỈNH SỬA PHIM</h6>
                <P>Chỉ Admin mới có quyền thực hiện</P>
            </div>
            <div class="p-5">
                <form class="user">
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <input type="text" class="form-control " id="exampleInputEmail" aria-describedby="emailHelp"
                                    placeholder="Nhập tên phim..">
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <select class="form-control" placeholder="Ngôn ngữ">
                                    <option>Tiếng Việt</option>
                                    <option>Tiếng Anh</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <select class="form-control" placeholder="Quốc gia">
                                    <option>Việt Nam</option>
                                    <option>Khác</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <input type="datetime" class="form-control " aria-describedby="emailHelp"
                                    placeholder="Thời lượng phim...">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <input type="number" class="form-control " placeholder="Giới hạn tuổi...">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <input type="text" class="form-control " aria-describedby="emailHelp"
                                    placeholder="Diễn viên phim...">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <input type="text" class="form-control " aria-describedby="emailHelp"
                                    placeholder="Nhà sản xuất phim...">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                                <select class="form-control" placeholder="Quốc gia">
                                    <option>Đã duyệt</option>
                                    <option>Chờ duyệt</option>
                                    <option>Chưa duyệt</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <select class="form-control" placeholder="Quốc gia">
                                    <option>Kinh dị</option>
                                    <option>Hành động</option>
                                    <option>Tỉnh cảm</option>
                                    <option>Khác</option>
                                </select>
                            </div>
                        </div>

                    </div>
                    <div class="row">

                        <div class="col-12">
                            <div class="form-group">
                                <textarea class="form-control" rows="5" cols="80" placeholder="Tóm tắt phim...">
                                    </textarea>
                            </div>
                        </div>
                    </div>
                
                    <a href="index.html" class="btn btn-success btn-user btn-block">
                        Cập nhật
                    </a>

                </form>
            </div>
        </div>

    </div>
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
@stop
