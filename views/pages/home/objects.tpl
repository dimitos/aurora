<section class="objects">
    <div class="objects__container">
        <picture>
            <source srcset="/img/objects/objects-bg-420.webp" media="(max-width: 420px)" type="image/webp" />
            <source srcset="/img/objects/objects-bg-767.webp" media="(max-width: 767px)" type="image/webp" />
            <source srcset="/img/objects/objects-bg-1194.webp" media="(max-width: 1194px)" type="image/webp" />
            <source srcset="/img/objects/objects-bg-1599.webp" media="(max-width: 1599px)" type="image/webp" />
            <source srcset="/img/objects/objects-bg-1920.webp" type="image/webp" />
            <source srcset="/img/objects/objects-bg-420.jpg" media="(max-width: 420px)" />
            <source srcset="/img/objects/objects-bg-767.jpg" media="(max-width: 767px)" />
            <source srcset="/img/objects/objects-bg-1194.jpg" media="(max-width: 1194px)" />
            <source srcset="/img/objects/objects-bg-1599.jpg" media="(max-width: 1599px)" />
            <img class="image cover objects-bg"
                src="/img/objects/objects-bg-1920.jpg"
                alt="Объекты уже построенные Застройщиком"
                width="1920"
                height="766"
                loading="lazy"
                decoding="async"/>
        </picture>
        <div class="objects__content">
            <h2 class="title title-1 objects__title">Застройщик <span class="color-main no-wrap">уже построил</span></h2>
            <div class="objects-slider__container">
                <div class="swiper-slider objects-slider">
                    <div class="swiper">
                        <div class="swiper-wrapper">
                            {foreach $objects as $object}
                                <div class="swiper-slide">
                                    <div class="swiper-slide__wrapper">
                                        <div class="swiper-slide__content">
                                            <div class="swiper-slide__inner">
                                                <picture>
                                                    <source srcset="{$object.src}-420.webp" media="(max-width: 420px)" type="image/webp" />
                                                    <source srcset="{$object.src}-767.webp" media="(max-width: 767px)" type="image/webp" />
                                                    <source srcset="{$object.src}-1920.webp" type="image/webp" />
                                                    <source srcset="{$object.src}-420.jpg" media="(max-width: 420px)" />
                                                    <source srcset="{$object.src}-767.jpg" media="(max-width: 767px)" />
                                                    <img class="image cover swiper-slide__img"
                                                        src="{$object.src}-1920.jpg"
                                                        alt="{$object.name}"
                                                        width="543"
                                                        height="336"
                                                        loading="lazy"
                                                        decoding="async"/>
                                                </picture>
                                            </div>
                                            <div class="swiper-slide__blur">
                                                <div class="swiper-slide__name">{$object.name}</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    </div>
                </div>
            </div>
            <div class="slider-nav-scrollbar">
                <div class="swiper-scrollbar"></div>
            </div>
        </div>
    </div>
</section>
