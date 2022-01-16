import { scrollToBlock } from "../common/helpers";

$(document).ready(function() {
    $("a[href^='#']:not([data-modal])").click(function(event) {
        event.preventDefault();
        scrollToBlock($(this).attr("href"));
    });

    var $apartmentSlider = $(".apartment-slider .slider");

    function filterApartmentSliderByActiveBtn() {
        $apartmentSlider.slick("slickUnfilter").slick("slickFilter","[data-rooms=" + $(".tab-btn.active").data("rooms") + "]");
    }

    $apartmentSlider.slick({
        slidesToShow: 2,
        slidesToScroll: 1,
        speed: 600,
        dots: false,
        prevArrow: $(".apartment-slider .btn-slider__prev"),
        nextArrow: $(".apartment-slider .btn-slider__next"),
        responsive: [
            {
                breakpoint: 768,
                settings: {
                slidesToShow: 1
                },
            }
        ],
    });

    filterApartmentSliderByActiveBtn();

    $(".tab-btn").click(function() {
        $(this).addClass("active").siblings().removeClass("active");
        filterApartmentSliderByActiveBtn();
    });

    $(".docs__btn").click(function() {
        $(this).toggleClass("active");
        $('.docs__list-more').slideToggle();
    });

    //  ===================  Фильтр просмотра этажей  ===================  //

    // ----------  render  -----------

    // index.php->$data_floors_filter->page.tpl->data_floors_filter
    var literSelected = 1;        // выбранный литер
    var porchSelected = 1;        // выбранный корпус
    var floorSelected = 1;        // выбранный просмотра

    // устанавливаем select литера
    setSelectLiter();
    // рисуем select возможных корпусов в зависимости от выбранного литера
    showHtmlSelectPorch();
    // рисуем select возможных этажей в зависимости от выбранного корпуса
    showHtmlSelectFloor();

    // ----------  events  -----------

    // окрытие / закрытие селектов
    $(".floor-orientation__btn").on("click", () =>  $(".floor-orientation").toggleClass("close"));

    // окрытие / закрытие селекта литеров
    $(".liter-select").on("click", () => {
        $(".select-list__porch, .select-list__floor").fadeOut(200);
        $(".select-list__liter").fadeToggle(200);
    })

    // слушатель на select-options литеров
    $(document).on("click", ".select-list__liter .select-option", function () {
        literSelected = $(this).data("liter");
        floorSelected = 1;

        if (literSelected === 1) porchSelected = 1
        else if (literSelected === 2) porchSelected = 4
        else if (literSelected === 3) porchSelected = 5;

        // устанавливаем select литера
        setSelectLiter();
        // рисуем select возможных корпусов в зависимости от выбранного литера
        showHtmlSelectPorch();
        // рисуем select возможных этажей в зависимости от выбранного корпуса
        showHtmlSelectFloor();
    });

    // окрытие / закрытие селекта корпусов
    $(".porch-select").on("click", () => {
        $(".select-list__liter, .select-list__floor").fadeOut(200);
        $(".select-list__porch").fadeToggle(200);
    })

    // слушатель на select-options корпусов
    $(document).on("click", ".select-list__porch .select-option", function () {
        porchSelected = $(this)[0].value;
        floorSelected = 1;
        // устанавливаем select корпусов
        setSelectPorch();
        // рисуем select возможных этажей в зависимости от выбранного корпуса
        showHtmlSelectFloor();
    });

    // окрытие / закрытие селекта этажей
    $(".floor-select").on("click", () => {
        $(".select-list__porch, .select-list__liter").fadeOut(200);
        $(".select-list__floor").fadeToggle(200);
    })

    // слушатель на select-options этажей
    $(document).on("click", ".select-list__floor .select-option", function () {
        floorSelected = $(this)[0].value;
        // устанавливаем select этажей
        setSelectFloor();
    });

    $(document).on("click", (e) => {
        if(!$(".floor-filter__current").is(e.target)) {
            $(".select-list__liter, .select-list__porch, .select-list__floor").fadeOut(200);
        }
    });

    // --------- functions -----------

    /**
     * Функция приcваевает значение выбранному select литеров
     */
    function setSelectLiter() {
        var liters = ["А", "Б", "В"];
        $(".liter-select .floor-filter__current span").text(liters[literSelected - 1]);
    }


    /**
     * Функция отрисовывает html select-option корпусов соответствующему литеру
     */
    function showHtmlSelectPorch() {
        // приcваеваем значение выбранному select корпусов
        setSelectPorch();
        var liters = { "1": [1, 2, 3], "2": [4], "3": [5, 6] };

        var html = liters[literSelected].map((el) => el = `<li value="${el}" class="select-option">Корпус ${el}</li>`).join('');
        $(".select-list__porch").empty().append(html);
    }


    /**
     * Функция приcваевает значение выбранному select корпусов
     */
    function setSelectPorch() {
        $(".porch-select .floor-filter__current span").text(porchSelected);
        // рисуем план расположения корпусов в зависимости от выбранного корпуса
        showImagelLitters();
    }


    /**
     * Функция отрисовывает html select-option этажей соответствующему корпусу
     */
    function showHtmlSelectFloor() {
        // приcваеваем значение выбранному select этажей
        setSelectFloor();

        var floors = {
            "1": [1, 2, 3, 4, 5, 6, 7, 8],
            "2": [1, 2, 3, 4, 5, 6, 7, 8],
            "3": [1, 2, 3, 4, 5, 6, 7, 8],
            "4": [1, 2],
            "5": [1, 2, 3, 4, 5, 6, 7, 8],
            "6": [1, 2, 3, 4, 5, 6, 7, 8]
        };

        var html = floors[porchSelected].map((el) => el = `<li value="${el}" class="select-option">Этаж ${el}</li>`).join('');
        $(".select-list__floor").empty().append(html);
    }


    /**
     * Функция приcваевает значение выбранному select этажей
     */
    function setSelectFloor() {
        $(".floor-select .floor-filter__current span").text(floorSelected);
        showImagelFloor();
    }


    /**
     * Функция отрисовывает html план расположения корпусов соответствующему корпусу
     */
    function showImagelLitters() {
        // index.php->$liters->page.tpl->liters
        var html =  `<picture>
            <source srcset="${liters[porchSelected - 1].plan}.webp" type="image/webp" />
            <img class="image cover"
                src="${liters[porchSelected - 1].plan}.png"
                width="222"
                height="272"
                loading="lazy"
                decoding="async"
                alt="Ялта. КА Аврора. Литер ${liters[porchSelected - 1].letter}, корпус ${liters[porchSelected - 1].porch}, план расположения корпусов по отношению к морю" />
        </picture>`

        $(".floor-orientation__img").empty().append(html);
    }


    /**
     * Функция отрисовывает html план этажа
     */
    function showImagelFloor() {

        var image = `/img/floors/floor_${literSelected}_${porchSelected}_${floorSelected}`;
        var alt = `Ялта. Комплекс Апартаментов АВРОРА. Литер ${["А", "Б", "В"][literSelected - 1]}, корпус ${porchSelected}, план расположения квартир ${floorSelected}-го этажа`;
        var html =  `
        <picture>
            <source srcset="${image}-420.webp" media="(max-width: 420px)" type="image/webp" />
            <source srcset="${image}-767.webp" media="(max-width: 767px)" type="image/webp" />
            <source srcset="${image}-1920.webp" type="image/webp" />
            <source srcset="${image}-420.png" media="(max-width: 420px)" />
            <source srcset="${image}-767.png" media="(max-width: 767px)" />
            <img class="image contain floor__img"
                src="${image}-1920.png"
                width="500"
                height="500"
                loading="lazy"
                decoding="async"
                alt="${alt}"
                title="${alt}"/>
        </picture>`

        $(".floor__right").empty().append(html);
    }
});

/* ----------- Слайдер построенных объектов ---------- */
let objectsSlider = null;               // слайдер
let sliderSettingSize;                  // брейкпоинт ширины окна настройки слайдера
let windowWidth = $(window).width();    // фактическая ширина окна браузера

// если блок слайдера есть, то активируем его и вешаем слушатель resize окна
if($(".objects-slider").length > 0 ) {
    objectsSliderInit();
    $(window).on("resize", function() {
        windowWidth = $(window).width();
        // если нужно перезапустить слайдер, то перезапускаем
        if(getNeedResizeSlider(windowWidth, sliderSettingSize)) objectsSliderInit()
    });
}

/**
 * Функция определяет нужна ли перезагрузка слайдера
 * @param {number} windowWidth фактический рширина окна браузера
 * @param {number} sliderSettingSize брейкпоинт ширины окна настройки слайдера
 * @returns boolean
 */
function getNeedResizeSlider(windowWidth, sliderSettingSize) {
    if ((windowWidth >= 1600 && sliderSettingSize >= 1600)) {
        return false;
    } else if (windowWidth >= 1160 && windowWidth < 1600 && sliderSettingSize >= 1160 && sliderSettingSize < 1600) {
        return false;
    } else if (windowWidth >= 768 && windowWidth < 1195 && sliderSettingSize >= 768 && sliderSettingSize < 1195) {
        return false;
    } else if (windowWidth < 768 && sliderSettingSize < 768)
    return false;

    return true;
}

/**
 * Функция определяет настройки слайдера перед активацией
 */
function objectsSliderInit() {
    if(objectsSlider) {
        objectsSlider.destroy();
        objectsSlider = null;
    }
    if (windowWidth >= 1600) {
        objectsSliderRender(80, -100, 8);
        sliderSettingSize = 1600;
    } else if (windowWidth >= 1195 && windowWidth < 1600) {
        objectsSliderRender(60, -50, 8);
        sliderSettingSize = 1195;
    } else if (windowWidth >= 768 && windowWidth < 1195) {
        objectsSliderRender(40, -30, 7);
        sliderSettingSize = 768;
    } else {
        objectsSliderRender(20, -20, 7);
        sliderSettingSize = 0;
    }
}

/**
 * Функция активации слайдера
 * @param {number} spaceBetween расстояние между слайдами
 * @param {number} stretch размер растягивания боковых слайдов
 * @param {number} rotate размер перспективы боковых слайдов
 */
function objectsSliderRender(spaceBetween, stretch, rotate) {
    objectsSlider = new Swiper(".objects-slider .swiper", {
        slidesPerView: 1,
        speed: 800,
        initialSlide: 1,
        spaceBetween: spaceBetween,
        effect: 'coverflow',
        coverflowEffect: {
            rotate: rotate,
            stretch: stretch,
            slideShadows: false,
        },
        scrollbar: {
            el: ".objects .swiper-scrollbar",
            draggable: true
        },
    });
}
