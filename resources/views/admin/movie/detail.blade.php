@extends('admin.layout.master')
@section('title', 'Detail Movie')
@section('content')

    <div class="container-fluid">
        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">CHI TIẾT BỘ PHIM</h6>
                <P>Tất cả người dùng đều có thể xem chi tiết bộ phim</P>
            </div>
            <div class="p-5">
                <form class="user">
                    <div class="form-group row">
                        <div class="col-12">
                            <label for="staticEmail" class="col-sm-1 col-form-label">Tên phim</label>
                            <div class="col-sm-11">
                                <H4 id="staticEmail">{{ $phim->ten_phim }}</H4>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-6">
                            <label for="staticLanguage" class="col-sm-4 col-form-label">Ngôn ngữ</label>
                            <div class="col-sm-8">
                                <p id="staticLanguage">{{ $phim->ngon_ngu }}</p>
                            </div>
                        </div>
                        <div class="col-6">
                            <label for="staticCountry" class="col-sm-6 col-form-label">Quốc gia</label>
                            <div class="col-sm-6">
                                <p id="staticCountry">{{ $phim->quoc_gia }}</p>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-6">
                            <label for="staticTime" class="col-sm-6 col-form-label">Thời lượng</label>
                            <div class="col-sm-6">
                                <p id="staticTime">{{ $phim->thoi_luong }}</p>
                            </div>
                        </div>
                        <div class="col-6">
                            <label for="staticOld" class="col-sm-6 col-form-label">Giới hạn tuổi</label>
                            <div class="col-sm-6">
                                <p id="staticOld">{{ $phim->gioi_han_tuoi }}+</p>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-6">
                            <label for="staticActor" class="col-sm-6 col-form-label">Diễn viên phim</label>
                            <div class="col-sm-6">
                                <p id="staticActor">{{ $phim->dien_vien }}</p>
                            </div>
                        </div>
                        <div class="col-6">
                            <label for="staticProvider" class="col-sm-6 col-form-label">Nhà sản xuất</label>
                            <div class="col-sm-6">
                                <p id="staticProvider">{{ $phim->nha_san_xuat }}</p>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-6">
                            <label for="staticAction" class="col-sm-6 col-form-label">Trạng thái</label>
                            <div class="col-sm-6">
                                <p id="staticAction">{{ $phim->trang_thai }}</p>
                            </div>
                        </div>
                        <div class="col-6">
                            <label for="staticCategory" class="col-sm-6 col-form-label">Thể loại</label>
                            <div class="col-sm-6">
                                <p id="staticCategory">{{ $ten_loai_phim }}</p>
                            </div>
                        </div>

                    </div>
                    <div class="form-group row">

                        <div class="col-12">
                            <label for="staticTomtat" class="col-sm-6 col-form-label">Tóm tắt phim</label>
                            <div class="col-sm-6">
                                <p id="staticTomtat">{{ $phim->tom_tat }}</p>
                            </div>
                        </div>
                    </div>

                    <a href="/admin/movie" class="btn btn-success btn-user btn-block">
                        Trở lại danh sách
                    </a>

                </form>
            </div>
        </div>

    </div>
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
@stop
