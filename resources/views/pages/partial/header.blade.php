    <header class="header-section">
    <div class="container">
        <div class="header-wrapper">
            <div class="logo">
                <a href="/movie">
                    <img src="{{URL::asset('assets/images/favicon.png')}}" alt="logo">
                </a>
            </div>
            <ul class="menu">
              
                <li>
                    <a href="/movie" class="{{ (request()->segment(1) == 'movie') ? 'active' : '' }}">movies</a>
                </li>
                <li>
                    <a href="/contact" class="{{ (request()->segment(1) == 'contact') ? 'active' : '' }}">Contact</a>
                </li>
                <li>
                    <a href="/about" class="{{ (request()->segment(1) == 'about') ? 'active' : '' }}">about</a>
                </li>
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
                        <span class="mr-2 d-none d-lg-inline text-gray-600 small">User</span>
                        <img class="img-profile rounded-circle" src=" {{ URL::asset('assets/images/logo/undraw_profile.svg') }} ">
                    </a>
                    <!-- Dropdown - User Information -->
                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                        aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">
                            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                            Profile
                        </a>
                        <a class="dropdown-item" href="#">
                            <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                            Settings
                        </a>
                        <a class="dropdown-item" href="#">
                            <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                            Activity Log
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/admin/login" data-toggle="modal" data-target="#logoutModal">
                            <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                            Logout
                        </a>
                    </div>
                </li>
            </ul>
            <div class="header-bar d-lg-none">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
    </div>
</header>