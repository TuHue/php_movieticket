
    <header class="header">
        <a href="/" class="logo">
          <i class="fas fa-shopping-basket"></i> MovieTickets
        </a>
        <div class="icons">
          @if (!empty(Session::get('nguoi_dung_client')))
          <span class="icons__name">{{ Session::get('nguoi_dung_client')->ten_nguoi_dung }}</span>
          <a href="/logout" style="padding:5px 10px; font-size:1rem;background:#ff7800">Đăng xuất</a>
          @else
          <a href="/login" style="padding:5px 10px; font-size:1rem;background:#ff7800">Đăng nhập</a>
          @endif
        </div>
      </header>