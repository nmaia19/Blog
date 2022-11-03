// ABRE E FECHA MENU QUANDO MOBILE

const menuToggleIcon = document.querySelector('#menu-toggle-icon')

menuToggleIcon.addEventListener('click', toggleMenu)

function toggleMenu() {
    const mobileMenu = document.querySelector("#menu")
    mobileMenu.classList.toggle('activated')
    menuToggleIcon.classList.toggle('activated')
}

