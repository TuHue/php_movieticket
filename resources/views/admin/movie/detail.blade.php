@extends('admin.layout.master')
@section('title', 'Detail Movie')
@section('content')
<style type="text/css">
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
    .container{
      max-width: 700px;
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
    form .input-box span.details{
      display: block;
      font-weight: 500;
      margin-bottom: 5px;
    }
    .user-details .input-box p{
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
    {{-- <div class="container-fluid">
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
    </a> --}}

    <div class="container">
        <div class="title">CHI TIẾT BỘ PHIM</div>
        <div class="content">

            <div class="user-details">
                <div class="input-box">
                    <span class="details">Tên phim</span>
                    <p>{{ $phim->ten_phim }}</p>
                </div>
                <div class="input-box">
                    <span class="details">Ngôn ngữ</span>
                    <p id="staticLanguage">{{ $phim->ngon_ngu }}</p>
                </div>
                <div class="input-box">
                    <span class="details">Quốc gia</span>
                    <p id="staticCountry">{{ $phim->quoc_gia }}</p>
                </div>
                <div class="input-box">
                    <span class="details">Thời lượng phim</span>
                    <p id="staticTime">{{ $phim->thoi_luong }}</p>
                </div>
                <div class="input-box">
                    <span class="details">Giới hạn tuổi</span>
                    <p id="staticOld">{{ $phim->gioi_han_tuoi }}+</p>
                </div>
                <div class="input-box">
                    <span class="details">Diễn viễn phim</span>
                    <p id="staticActor">{{ $phim->dien_vien }}</p>
                </div>
                <div class="input-box">
                    <span class="details">Nhà sản xuất</span>
                    <p id="staticProvider">{{ $phim->nha_san_xuat }}</p>
                </div>
                <div class="input-box">
                    <span class="details">Trạng thái</span>
                    <p id="staticAction">{{ $phim->trang_thai }}</p>
                </div>
                <div class="input-box">
                    <span class="details">Thể loại</span>
                    <p id="staticCategory">{{ $ten_loai_phim }}</p>
                </div>
              
                <div class="input-box">
                    <span class="details">Tóm tắt nội dung phim</span>
                    <p id="staticTomtat">{{ $phim->tom_tat }}</p>
                </div>
            </div>
            <div class="button">
                <a href="/admin/movie" class="btn btn-success btn-user btn-block">
                    Trở lại danh sách
                </a>
            </div>
        </div>
    </div>
@stop
