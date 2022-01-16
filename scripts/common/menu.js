/**
 * Mobile menu
 */
const setHeightMobileMenu = () => $('.menu__content').css({'height': window.innerHeight});
setHeightMobileMenu();
$(window).resize(() => setHeightMobileMenu());

$('.menu__btn').on('click', () => {
    $('.menu').css({'left': '0'});
    $('.menu').addClass('menu-opened');
    $('.page').css({'overflow': 'hidden'});
})
const closeMobileMenu = () => {
    $('.menu').css({'left': '-800px'});
    $('.menu').removeClass('menu-opened');
    $('.page').css({'overflow': 'initial'});
}

$('.menu__closer').on('click', () => closeMobileMenu());
for (let i = 0; i < $('.menu__item').length; i++) {
    $('.menu__item').eq(i).on('click', () => closeMobileMenu());
}
for (let i = 0; i < $('.menu__contacts').length; i++) {
    $('.menu__contacts').eq(i).on('click', () => closeMobileMenu());
}