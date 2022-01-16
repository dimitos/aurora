import { arcticmodal_settings } from "./modal";

$(document).ready(function() {
    $("body").on("click", ".js-request", function() {
        $(".request__heading").text($(this).data("h")?.trim() || "Отправить заявку");
        $(".request__input-from").val($(this).data("from")?.trim() || `Кнопка: ${$(this).text()?.trim()}`);
        $(".request__submit").find(".btn__text").text($(this).data("btn")?.trim() || "Отправить заявку");
        $(".intopModal-request").arcticmodal(arcticmodal_settings);
    });

    $(".request__form").submit(function(event) {
        event.preventDefault();

        let data = {
            name: $(".request__input-name").val().trim(),
            phone: $(".request__input-phone").val().trim(),
            email: $(".request__input-email").val().trim(),
            comment: $(".request__input-comment").val().trim(),
            from: $(".request__input-from").val().trim(),
            utm_campaign: utm_campaign,
            utm_source: utm_source,
            utm_medium: utm_medium,
            utm_term: utm_term,
            utm_content: utm_content,
            utm_campaign_original: utm_campaign_original,
            utm_source_original: utm_source_original,
            utm_medium_original: utm_medium_original,
            utm_term_original: utm_term_original,
            utm_content_original: utm_content_original,
            referer: referer,
            ref_type2: ref_type2
        }

        if ($(".request__checkbox-privacy").prop("checked")) {
            if (data.phone) {
                $.ajax({
                    type: "POST",
                    url: "/php/callme.php",
                    data
                }).fail(() => {
                    alert("Ошибка!. Пожалуйста, повторите отправку.");
                });

                try {
                    $(".intopModal-request").arcticmodal("close");
                    ym(86519167,"reachGoal","REQUEST_SENT")
                    ga("send", "event", "REQUEST", "SENT");
                } catch (e) {}

                alert(`Спасибо, заявка отправлена.<br><br>Наш менеджер свяжется с Вами очень скоро.<br><br>Пожалуйста, убедитесь, что указали верный номер (${data.phone})`);

            } else {
                alert("Пожалуйста, укажите Ваш номер телефона, чтобы мы смогли позвонить Вам!");
            }
        } else {
            alert("Пожалуйста, дайте согласие на обработку ваших персональных данных.");
        }
    });

    $(".request__link-privacy").click(function(event) {
        event.preventDefault();
    });
});

