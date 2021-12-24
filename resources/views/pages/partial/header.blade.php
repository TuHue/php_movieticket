    <header class="header-section">
    <div class="container">
        <div class="header-wrapper">
            <div class="logo">
                <a href="/movie">
                    <img src="./assets/images/favicon.png" alt="logo">
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
                <li class="header-button pr-0">
                    <a href="/login">join us</a>
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