@extends('admin.layout.master')
@section('title', 'Movie')
@section('content')
<div class="container-fluid">


    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">{{ ($phim === null) ?'THÊM PHIM MỚI':'CHỈNH SỬA PHIM' }}</h6>
            <P>Chỉ Admin mới có quyền thực hiện</P>
        </div>
        <div class="p-5">
            <form class="user" action="{{

                ($action) ? '/admin/movie/add':('/admin/movie/update/'.$phim->phim_id) 
                }}" method="post">
                @csrf
                <input type="text" class="form-control " name="phim_id" value={{ ($phim===null) ?'':$phim->phim_id }}
                placeholder="" hidden="true">
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <input required type="text" class="form-control " name="ten_phim" id="tenPhim"
                                aria-describedby="emailHelp" placeholder="Nhập tên phim..">
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <input required type="text" class="form-control " name="ngon_ngu" id="ngonNgu"
                                aria-describedby="emailHelp" placeholder="Ngôn ngữ..." value={{ ($phim===null)
                                ?'':$phim->ngon_ngu }}>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <input required type="text" class="form-control " name="quoc_gia" id="quocGia"
                                aria-describedby="emailHelp" placeholder="Quốc giá...">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <input type="datetime" class="form-control " name="thoi_luong" aria-describedby="emailHelp"
                                placeholder="Thời lượng phim..." value={{ ($phim===null) ?'':$phim->thoi_luong }}>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <input type="number" class="form-control " name="gioi_han_tuoi"
                                placeholder="Giới hạn tuổi..." value={{ ($phim===null) ?'':$phim->gioi_han_tuoi }}>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <input required type="text" class="form-control " name="dien_vien"
                                aria-describedby="emailHelp" placeholder="Diễn viên phim..." id="dienVien">
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <input required type="text" class="form-control " name="nha_san_xuat"
                                aria-describedby="emailHelp" placeholder="Nhà sản xuất phim..." id="nhaSanXuat">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <select class="form-control" placeholder="Trang thai..." name="trang_thai">
                                @if ($phim->trang_thai == 'Ngừng chiếu')
                                <option> Ngừng chiếu</option>
                                <option>Chiếu</option>
                                @else
                                <option>Chiếu</option>
                                <option> Ngừng chiếu</option>
                                @endif
                            </select>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">

                            <select class="form-control" placeholder="Thê loại..." name="id_loai_phim">
                                @if ($ten_loai_phim !== null)
                                <option value={{ $phim->id_loai_phim }} selected> {{ $ten_loai_phim }}</option>
                                @endif
                                @foreach ($danh_sach_loai_phim as $loai_phim)
                                <option value={{ $loai_phim->loai_phim_id }}> {{ $loai_phim->ten_loai_phim}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <input required type="date" class="form-control " name="ngay_cong_chieu" id="ngonNgu"
                                aria-describedby="emailHelp" placeholder="Ngôn ngữ..." value={{ ($phim===null)
                                ?'':$phim->ngay_cong_chieu }}>
                        </div>
                    </div>
                    <div class="col-6">
                     
                    </div>
                </div>
                <div class="row">

                    <div class="col-12">
                        <div class="form-group">
                            <textarea class="form-control" rows="5" cols="80" name="tom_tat"
                                placeholder="Tóm tắt phim...">
                                {{ ($phim===null) ?'':$phim->tom_tat }}
                                    </textarea>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-user btn-block">
                    {{ ($action) ?'Thêm':"Cập nhật" }}
                </button>
            </form>
        </div>
    </div>
</div>
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
<script>
    document.getElementById('tenPhim').value = '{{ $phim->ten_phim }}';
    document.getElementById('ngonNgu').value = '{{ $phim->ngon_ngu }}';
    document.getElementById('quocGia').value = '{{ $phim->quoc_gia }}';
    document.getElementById('dienVien').value = '{{ $phim->dien_vien }}';
    document.getElementById('nhaSanXuat').value = '{{ $phim->nha_san_xuat }}';
    document.getElementById('theLoai').value = '{{ $ten_loai_phim}}';
</script>
@stop