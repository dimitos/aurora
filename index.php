<?
    const ROOT = __DIR__;

    include ROOT . "/vendor/autoload.php";
    include ROOT . "/php/common.php";
    include ROOT . "/php/referer_init.php";

    if (file_exists(ROOT . "/.env")) {
        Dotenv\Dotenv::createImmutable(ROOT)->load();
    } else {
        $_ENV["MODE"] = "prod";
    }

    if ($_ENV["MODE"] === "dev") {
        include ROOT . "/php/display-errors.php";
    }

    db_connect();

    $page = get_page();

    if ($page->code === 404) {
        header($_SERVER["SERVER_PROTOCOL"] . " 404 Not Found");
    }

    // Получаем квартиры
    $house_filter = new HouseFilter();
    $house_filter->house = House::get_by_id("aurora");

    $flat_filter_1kom = new FlatFilter();
    $flat_filter_1kom->rooms = "1";

    $flat_filter_2kom = new FlatFilter();
    $flat_filter_2kom->rooms = "2";

    $flat_filter_3kom = new FlatFilter();
    $flat_filter_3kom->rooms = "3";

    $flats = [
        "1" => HouseFlatGrouped::get_all([$house_filter, $flat_filter_1kom]),
        "2" => HouseFlatGrouped::get_all([$house_filter, $flat_filter_2kom]),
        "3" => HouseFlatGrouped::get_all([$house_filter, $flat_filter_3kom])
    ];

    $liters = [
        ["plan" => "/img/liters/litA_1", "letter" => "А", "liter" => 1,],
        ["plan" => "/img/liters/litA_2", "letter" => "А", "liter" => 2,],
        ["plan" => "/img/liters/litA_3", "letter" => "А", "liter" => 3,],
        ["plan" => "/img/liters/litB_4", "letter" => "Б", "liter" => 4,],
        ["plan" => "/img/liters/litV_5", "letter" => "В", "liter" => 5,],
        ["plan" => "/img/liters/litV_6", "letter" => "В", "liter" => 6,]
    ];

    $objects = [
        ["src" => "/img/objects/objects-01", "name" => "ЖК «На Адмирала Пустошкина»"],
        ["src" => "/img/objects/objects-02", "name" => "ЖК «Молодежный»"],
        ["src" => "/img/objects/objects-03", "name" => "ЖК «Южный-2»"],
        ["src" => "/img/objects/objects-04", "name" => "ЖК «Горизонт»"],
        ["src" => "/img/objects/objects-05", "name" => "ЖК «Южный»"],
        ["src" => "/img/objects/objects-06", "name" => "ЖК «Уютный»"],
        ["src" => "/img/objects/objects-07", "name" => "ЖК «На Владимерской»"],
        ["src" => "/img/objects/objects-08", "name" => "ЖК «Радонеж»"]
    ];

    // Инициализируем шаблонизатор
    $smarty = init_smarty();

    $smarty->assign([
        "page" => $page,
        "phone" => new Phone($phone_src2),
        //"email" => new Email("test@test.ru"),
        "meta" => new Meta(),
        "inline_scripts" => inline_scripts(actual_bundle_path("dist/js", "inline")),
        "vendor_scripts" => external_scripts(actual_bundle_path("dist/js", "vendor")),
        "common_scripts" => external_scripts(actual_bundle_path("dist/js", "common")),
        "vendor_styles" => external_styles(actual_bundle_path("dist/css/prod", "vendor")),
        "common_styles" => styles_by_mode("common"),
        "flats" => $flats,
        "liters" => $liters,
        "objects" => $objects,
        "referer" => [
            "utm_campaign" => $utm_campaign,
            "utm_source" => $utm_source,
            "utm_medium" => $utm_medium,
            "utm_term" => $utm_term,
            "utm_content" => $utm_content,
            "utm_campaign_original" => $utm_campaign_original,
            "utm_source_original" => $utm_source_original,
            "utm_medium_original" => $utm_medium_original,
            "utm_term_original" => $utm_term_original,
            "utm_content_original" => $utm_content_original,
            "referer" => $referer,
            "ref_type2" => $ref_type2
        ]
    ])->display($page->view);

    db_disconnect();
