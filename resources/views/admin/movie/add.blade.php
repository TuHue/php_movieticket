@extends('admin.layout.master')
@section('title', 'Add Movie')
@section('content')
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
.container{
  /* max-wi dth: 700px; */
  width: 100%;
  background-color: #fff;
  padding: 25px 30px;
  border-radius: 5px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.15);
}
.container .title{
  font-size: 25px;
  font-weight: 500;
  position: relative;
}
.container .title::before{
  content: "";
  position: absolute;
  left: 0;
  bottom: 0;
  height: 3px;
  width: 30px;
  border-radius: 5px;
  background: linear-gradient(135deg, #71b7e6, #9b59b6);
}
.content form .user-details{
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  margin: 20px 0 12px 0;
}
form .user-details .input-box{
  margin-bottom: 15px;
  width: calc(100% / 2 - 20px);
}
form .user-details .input-textarea{
  margin-bottom: 15px;
  width: 100%;
}
form .input-box span.details{
  display: block;
  font-weight: 500;
  margin-bottom: 5px;
}
.user-details .input-box input{
  height: 45px;
  width: 100%;
  outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 1px solid #ccc;
  border-bottom-width: 2px;
  transition: all 0.3s ease;
}
.user-details .input-box textarea{
  height: 45px;
  width: 100%;
  outline: none;
  font-size: 16px;
  border-radius: 5px;
  padding-left: 15px;
  border: 1px solid #ccc;
  border-bottom-width: 2px;
  transition: all 0.3s ease;
}

.user-details .input-box input:focus,
.user-details .input-box input:valid{
  border-color: #9b59b6;
}
 form .gender-details .gender-title{
  font-size: 20px;
  font-weight: 500;
 }
 form .category{
   display: flex;
   width: 80%;
   margin: 14px 0 ;
   justify-content: space-between;
 }
 form .category label{
   display: flex;
   align-items: center;
   cursor: pointer;
 }
 form .category label .dot{
  height: 18px;
  width: 18px;
  border-radius: 50%;
  margin-right: 10px;
  background: #d9d9d9;
  border: 5px solid transparent;
  transition: all 0.3s ease;
}
 #dot-1:checked ~ .category label .one,
 #dot-2:checked ~ .category label .two,
 #dot-3:checked ~ .category label .three{
   background: #9b59b6;
   border-color: #d9d9d9;
 }
 form input[type="radio"]{
   display: none;
 }
 form .button{
   height: 45px;
   margin: 35px 0
 }
 form .button input{
   height: 100%;
   width: 100%;
   border-radius: 5px;
   border: none;
   color: #fff;
   font-size: 18px;
   font-weight: 500;
   letter-spacing: 1px;
   cursor: pointer;
   transition: all 0.3s ease;
   background: linear-gradient(135deg, #71b7e6, #9b59b6);
 }
 form .button input:hover{
  /* transform: scale(0.99); */
  background: linear-gradient(-135deg, #71b7e6, #9b59b6);
  }
 @media(max-width: 584px){
 .container{
  max-width: 100%;
}
form .user-details .input-box{
    margin-bottom: 15px;
    width: 100%;
  }
  form .user-details .input-textarea{
    margin-bottom: 15px;
    width: 100%;
  }
  form .category{
    width: 100%;
  }
  .content form .user-details{
    max-height: 300px;
    overflow-y: scroll;
  }
  .user-details::-webkit-scrollbar{
    width: 5px;
  }
  }
  @media(max-width: 459px){
  .container .content .category{
    flex-direction: column;
  }
}
</style>
<div class="container">
    <div class="title">{{ ($phim === null) ?'THÊM PHIM MỚI':'CHỈNH SỬA PHIM' }}</div>
    <div class="content">
        <form class="user" action="{{
            ($action) ? '/admin/movie/add':('/admin/movie/update/'.$phim->phim_id) 
            }}" method="post" enctype="multipart/form-data">
            @csrf
            <input type="hidden" class="form-control " name="phim_id" value={{ ($phim===null) ?'':$phim->phim_id }}>
        <div class="user-details">
          <div class="input-box">
            <span class="details">Tên phim</span>
            <input required type="text" name="ten_phim" id="tenPhim" placeholder="Nhập tên phim...">
          </div>
          <div class="input-box">
            <span class="details">Ngôn ngữ</span>
            <input required type="text"name="ngon_ngu" id="ngonNgu"placeholder="Ngôn ngữ..." value={{ ($phim===null)?'':$phim->ngon_ngu }}>
          </div>
          <div class="input-box">
            <span class="details">Quốc gia</span>
            <input required type="text" name="quoc_gia" id="quocGia" placeholder="Quốc gia...">
          </div>
          <div class="input-box">
            <span class="details">Thời lượng phim</span>
            <input type="datetime" name="thoi_luong"
            placeholder="Thời lượng phim..." value={{ ($phim===null) ?'':$phim->thoi_luong }}>
          </div>
          <div class="input-box">
            <span class="details">Giới hạn tuổi</span>
            <input type="number" name="gioi_han_tuoi"
            placeholder="Giới hạn tuổi..." value={{ ($phim===null) ?'':$phim->gioi_han_tuoi }}>
          </div>
          <div class="input-box">
            <span class="details">Diễn viễn phim</span>
            <input required type="text" name="dien_vien" placeholder="Diễn viên phim..." id="dienVien">
          </div>
          <div class="input-box">
            <span class="details">Nhà sản xuất</span>
            <input required type="text" name="nha_san_xuat" placeholder="Nhà sản xuất phim..." id="nhaSanXuat">
          </div>
          <div class="input-box">
            <span class="details">Trạng thái</span>
            <select name="trang_thai">
                @if ($phim->trang_thai == 'Ngừng chiếu')
                <option> Ngừng chiếu</option>
                <option>Chiếu</option>
                @else
                <option>Chiếu</option>
                <option> Ngừng chiếu</option>
                @endif
            </select>

          </div>
          <div class="input-box">
            <span class="details">Thể loại</span>
            <select name="id_loai_phim">
                @if ($ten_loai_phim !== null)
                <option value={{ $phim->id_loai_phim }} selected> {{ $ten_loai_phim }}</option>
                @endif
                @foreach ($danh_sach_loai_phim as $loai_phim)
                <option value={{ $loai_phim->loai_phim_id }}> {{ $loai_phim->ten_loai_phim}}</option>
                @endforeach
            </select>

          </div>
          <div class="input-box">
            <span class="details">Ngày chiếu phim</span>
            <input required type="date" name="ngay_cong_chieu" id="ngay_cong_chieu" value={{ ($phim===null)
            ?'':$phim->ngay_cong_chieu }}>
          </div>
          <div class="input">
            <span class="details">Hình ảnh</span>
            <input type="hidden" name="size" value="100000">
            <input type="file" name="img_file" id="img_file" />
          </div>
          <div class="input-textarea">
            <span class="details">Tóm tắt nội dung phim</span>
           <textarea class="form-control" rows="5" cols="80" name="tom_tat"
           placeholder="Tóm tắt phim...">
           {{ ($phim===null) ?'':$phim->tom_tat }}
               </textarea>
          </div>
        </div>
        <div class="button">
          <input type="submit" value=" {{ ($action) ?'Thêm':"Cập nhật" }}">
        </div>
      </form>
    </div>
  </div>
{{-- <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a> --}}
<script>
    document.getElementById('tenPhim').value = '{{ $phim->ten_phim }}';
    document.getElementById('ngonNgu').value = '{{ $phim->ngon_ngu }}';
    document.getElementById('quocGia').value = '{{ $phim->quoc_gia }}';
    document.getElementById('dienVien').value = '{{ $phim->dien_vien }}';
    document.getElementById('nhaSanXuat').value = '{{ $phim->nha_san_xuat }}';
    document.getElementById('img_file').value = '{{ $phim->hinh_anh }}';
    document.getElementById('theLoai').value = '{{ $ten_loai_phim}}';
</script>
@stop