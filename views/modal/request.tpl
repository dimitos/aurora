<div class="intopModal intopModal-request">
    <button class="intopModal__close arcticmodal-close">X</button>
    <div class="intopModal__whiteContent">
        <section class="request">
            <h2 class="request__heading">Отправить заявку</h2>
            <form class="request__form">
                <div class="request__fields">
                    <label class="request__field request__field-name">
                        <span class="request__label request__label-name">Ваше имя</span>
                        <input class="request__input request__input-name" type="text">
                    </label>
                    <label class="request__field request__field-phone">
                        <span class="request__label request__label-phone">Ваш телефон</span>
                        <input class="request__input request__input-phone" type="tel">
                        {* <input class="request__input request__input-phone" type="tel" inputmode="phone"> *}
                    </label>
                    <label class="request__field request__field-email">
                        <span class="request__label request__label-email">Ваш email</span>
                        <input class="request__input request__input-email" type="email">
                        {* <input class="request__input request__input-email" type="email" inputmode="email"> *}
                    </label>
                    <label class="request__field request__field-comment">
                        <span class="request__label request__label-comment">Комментарий</span>
                        <textarea class="request__input request__input-comment"></textarea>
                    </label>
                    <input class="request__input request__input-from" type="hidden">
                </div>
                <label class="request__privacy">
                    <input class="request__checkbox request__checkbox-privacy" type="checkbox" checked>
                    <span class="request__agreement">Даю <span class="request__link request__link-privacy" data-modal="privacy">согласие</span> на обработку персональных данных</span>
                </label>
                <button class="request__submit btn btn-default btn-color-main">
                    <span class="btn__text">Отправить</span>
                    <span class="btn__arrow"></span>
                </button>
            </form>
        </section>
    </div>
</div>
