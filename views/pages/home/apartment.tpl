<section class="apartments">
    <div class="floor">
        <div class="floor__container container-small">
            <div class="floor__wr">
                <div class="floor__left">
                    <h2 class="title title-1 floor__title"><span class="color-main">План </span>типового этажа</h2>
                    <div class="floor__left-wr">
                        <div class="floor-filter">
                            <div class="floor-filter__item">
                                <div class="select floor-filter-select liter-select">
                                    <div class="floor-filter__current no-wrap">Литер <span>А</span></div>
                                    <ul class="select-list select-list__liter">
                                        <li data-liter="1" class="select-option">Литер A</li>
                                        <li data-liter="2" class="select-option">Литер Б</li>
                                        <li data-liter="3" class="select-option">Литер В</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="floor-filter__item">
                                <div class="select floor-filter-select porch-select">
                                    <div class="floor-filter__current no-wrap">Корпус <span>1</span></div>
                                    <ul class="select-list select-list__porch"></ul>
                                </div>
                            </div>
                            <div class="floor-filter__item">
                                <div class="select floor-filter-select floor-select">
                                    <div class="floor-filter__current no-wrap">Этаж <span>1</span></div>
                                    <ul class="select-list select-list__floor"></ul>
                                </div>
                            </div>
                        </div>
                        <div class="floor-orientation close">
                            <div class="floor-orientation__wr">
                                <div class="floor-orientation__img"></div>
                                <p class="floor-orientation__txt">Море</p>
                            </div>
                            <button class="floor-orientation__btn" type="button">
                                <span class="floor-orientation__closer-close">Скрыть расположение</span>
                                <span class="floor-orientation__closer-open">Показать генплан и море</span>
                                <span class="floor-orientation__btn-line"></span>
                            </button>
                        </div>
                        <button class="btn btn-default btn-color-main js-request floor-list__btn" data-from='Кнопка "Получить подборку" в блоке План типового этажа' type="button">
                            <span class="btn__text no-wrap">Получить подборку квартир</span>
                            <span class="btn__arrow"></span>
                        </button>
                    </div>
                </div>
                <div class="floor__right"></div>
            </div>
        </div>
    </div>
    <div class="apartment">
        <div class="apartment__container container-small">
            <h2 class="title title-1 apartmen__title"><span class="color-main">Comfort-планировки </span>апартаментов</h2>
            <div class="tab-btns">
                <div class="btn btn-default tab-btn btn-color-grey active" data-rooms="1">
                    <span class="btn__text">1-комнатные</span>
                </div>
                <div class="btn btn-default tab-btn btn-color-grey" data-rooms="2">
                    <span class="btn__text">2-комнатные</span>
                </div>
                <div class="btn btn-default tab-btn btn-color-grey" data-rooms="3">
                    <span class="btn__text">3-комнатные</span>
                </div>
            </div>
            <div class="apartment-slider">
                <div class="slider">
                    {foreach $flats as $rooms => $flats_by_rooms}
                        {foreach $flats_by_rooms as $flat}
                            <div class="apartment__item" data-rooms="{$rooms}">
                                <div class="apartment__item-wr">
                                    <div class="apartment__item-top">
                                        <picture>
                                            <source
                                                srcset="https://xn----7sbbaaio5ajiisihlvte8x.xn--p1ai{img_path_to_webp($flat->plan_img)}"
                                                type="image/webp">
                                            <img class="apartment__img"
                                                src="https://xn----7sbbaaio5ajiisihlvte8x.xn--p1ai{$flat->plan_img}"
                                                alt="{$flat->title}"
                                                title="{$flat->title}"
                                                loading="lazy"
                                                decoding="async">
                                        </picture>
                                    </div>
                                    <div class="apartment__item-bottom">
                                        <div class="apartment__item-bottom-wr">
                                            <div class="apartment__item-price">{$flat->cost_total_display}</div>
                                            <div class="apartment__item-square">{$rooms}-комнатная: {$flat->area_full_display}</div>
                                            <div class="apartment__item-house">{$flat->section->full}</div>
                                        </div>
                                        <button class="btn btn-default btn-color-main js-request"
                                                data-from='Кнопка "Подробнее". Квартира: {$flat->title}'
                                                type="button">
                                            <span class="btn__text">Подробнее</span>
                                            <span class="btn__arrow"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    {/foreach}
                </div>
                <div class="slider-arrows">
                    <button class="btn btn-slider btn-slider__prev" type="button">
                        <img src="/img/svg/slider-arrow.svg"
                            width="64"
                            height="64"
                            alt="arrow">
                    </button>
                    <button class="btn btn-slider btn-slider__next" type="button">
                        <img src="/img/svg/slider-arrow.svg"
                            width="64"
                            height="64"
                            alt="arrow">
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>
