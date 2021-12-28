@extends('admin.layout.master')
@section('title', 'Movie')
@section('content')
    <style>
      
        #open_dialog {
            margin: 0 auto;
        }

        dialog {
            border: none !important;
            border-radius: calc(5px * var(--ratio));
            box-shadow: 0 0 #0000, 0 0 #0000, 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            padding: 1.6rem;
            max-width: 400px;
        }

        dialog img {
            display: block;
            max-width: 75%;
            margin: 1rem 0 auto 2rem;
        }

        .h1 {
            margin: 2rem 0 1rem;
            font-weight: 900;
        }

        .h2 {
            margin: 2rem 0 1rem;
            font-weight: 800;
        }

        p {
            color: var(--grey-color);
            letter-spacing: var(--leading, 0.025em);
            line-height: 1.625;
        }

        .flex {
            display: flex;
            flex-wrap: wrap;
        }

        .flex.flex-space-between {
            justify-content: space-between;
        }

        .flex button {
            margin: 8px auto;
        }


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

        .topnav a {
            float: right
        }
    .navs svg {
        font-size: 12px !important;
        display: none;
    }

    .navs nav {
        margin-top: 20px;
        font-size: 2rem;
    }

    .navs nav .flex {
        display: none !important
    }

    .navs nav span a {
        color: black;
        padding: 4px 10px;
        text-decoration: none;
        font-size: 16px;
    }

    .navs nav span span span {
        color: rgb(85, 85, 54);
    }

    .navs nav .hidden div p {
        display: none !important;
    }
        
    </style>
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">DANH SÁCH PHIM</h1>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <div class="row">
                    <div class="col-11">
                    </div>
                    <div class="topnav">
                        <P style="float: left; margin-top: 10px; margin-left: 10px;">Chỉ Admin mới có quyền thực hiện</P>
                        <a class="btn btn-primary" href="/admin/movie/add">
                            <i class="far fa-plus-square" style="font-size: 30px; margin-top: 10px; margin-right:10px"></i>
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
                                <th></th>
                            </tr>
                        </tfoot>
                        <tbody>
                            @foreach ($danh_sach_phim as $item)
                                <tr>
                                    <td>{{ $item->ten_phim }}</td>
                                    <td>{{ $item->thoi_luong }}</td>
                                    <td>{{ $item->gioi_han_tuoi }}+</td>
                                    <td>{{ $item->ngon_ngu }}</td>
                                    <td>{{ $item->dien_vien }}</td>
                                    <td>{{ $item->quoc_gia }}</td>
                                    <td>
                                        <a class="btn btn-outline-warning"
                                            href="/admin/movie/update/{{ $item->phim_id }}">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                    </td>
                                    </td>
                                    <td>
                                        <a class="btn btn-outline-danger open_dialog" href="#"
                                            onclick="getValueIdPhim('{{ $item->phim_id }}')">
                                            <i class="far fa-trash-alt"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a class="btn btn-outline-primary"
                                            href="/admin/movie/detail/{{ $item->phim_id }}">
                                            <i class="far fa-eye"></i>
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="navs">
                    {{ $danh_sach_phim->links() }}
                    </div>
                </div>
            </div>
        </div>

    </div>
    <dialog aria-labelledby="dialog_title" aria-describedby="dialog_description">
        <img src="https://native-dialog.surge.sh/location-service.svg" alt="Illustration of Location Services" />
        <h2 id="dialog_title" class="h2">Bạn có chắc chắn muốn xóa phim này ?</h2>
        <p id="dialog_description">
            Dữ liệu của bộ phim sẽ được xóa khỏi hệ thống!
        </p>
        <div class="flex flex-space-between">
            <button id="close_dialog">Hủy</button>
            <button id="confirm_dialog" class="cta">Xóa</button>
        </div>
    </dialog>
    <script src="{{ URL::asset('assets/css/admin/main.js') }}"></script>
    <script>
        function getValueIdPhim(id) {
            var a = document.getElementById('modaldelete');
            a.href = "/admin/movie/delete/" + id;
        }
    </script>

    <script>
        import dialogPolyfill from "https://cdn.skypack.dev/dialog-polyfill@0.5.6";

        const dialog = document.querySelector("dialog");
        const openDialogBtn = document.getElementsByClassName("open_dialog");
        const closeDialogBtn = document.getElementById("close_dialog");

        const elements = dialog.querySelectorAll(
            'a, button, input, textarea, select, details, [tabindex]:not([tabindex="-1"])'
        );
        const firstElement = elements[0];
        const lastElement = elements[elements.length - 1];

        const trapFocus = (e) => {
            if (e.key === "Tab") {
                const tabForwards = !e.shiftKey && document.activeElement === lastElement;
                const tabBackwards = e.shiftKey && document.activeElement === firstElement;
                if (tabForwards) {
                    // only TAB is pressed, not SHIFT simultaneously
                    // Prevent default behavior of keydown on TAB (i.e. focus next element)
                    e.preventDefault();
                    firstElement.focus();
                } else if (tabBackwards) {
                    // TAB and SHIFT are pressed simultaneously
                    e.preventDefault();
                    lastElement.focus();
                }
            }
        };

        const openDialog = () => {
            dialog.showModal();
            dialog.addEventListener("keydown", trapFocus);
        };

        const closeDialog = (e) => {
            e.preventDefault();
            dialog.close();
            dialog.removeEventListener("keydown", trapFocus);
            openDialogBtn.focus();
        };

        openDialogBtn.addEventListener("click", openDialog);
        closeDialogBtn.addEventListener("click", closeDialog);

        if (typeof dialog.showModal !== "function") {
            /**
             * How to add polyfill outside CodePen conditionally
             * let polyfill = document.createElement("script");
             * polyfill.type = "text/javascript";
             * polyfill.src = "/dist/dialog-polyfill.js";
             * document.body.append(polyfill);
            
             * const polyfillStyles = document.createElement("link");
             * polyfillStyles.rel = "stylesheet";
             * polyfillStyles.href = "dialog-polyfill.css";
             * document.head.append(polyfillStyles);
             **/

            // Register polyfill on dialog element once the script has loaded
            dialogPolyfill.registerDialog(dialog);
        }
    </script>
@stop
