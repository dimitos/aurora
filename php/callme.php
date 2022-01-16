<?

    const ROOT = __DIR__ . "/..";

    include ROOT . "/vendor/autoload.php";
    include ROOT . "/php/common.php";
    include_once ROOT . "/php/config.php";

    $smarty = init_smarty();

    const SITENAME = "аврора-ялта.рф";
    const EMAILFROM = "info@xn----7sbabh0dspbx5l.xn--p1ai";
    $emails = ["info@xn----7sbabh0dspbx5l.xn--p1ai"];

    if (isset($_POST) && isset($_POST["phone"])) {

        $data = array_merge($_POST, [
            "sitename" => SITENAME
        ]);

        $smarty->assign("data", $data);
        $message = $smarty->fetch(ROOT . "/views/letter.tpl");

        $sub = "Перезвонить. " .
            (!empty($_POST["name"]) ? ($_POST["name"] . ", ") : " ") .
            $_POST["phone"] . " (заявка с сайта " . SITENAME . ")";

        $headers = "From: =?utf-8?B?" . base64_encode(SITENAME) . "?= <" . EMAILFROM . ">\n"
            . "Content-type: text/html; charset=utf-8\r\n";

        foreach ($emails as $email_to) {
            if (!mail($email_to, $sub, $message, $headers)) {
                http_response_code(400);
                echo json_encode([
                    "result" => "failure",
                    "error" => "Ошибка отправки заявки"
                ], JSON_UNESCAPED_UNICODE);
            }
        }

        echo json_encode(["result" => "success"], JSON_UNESCAPED_UNICODE);

        // Отправка заявки в AmoCRM
        $data = [
            "name" => "Неизвестно",
            "phone" => normalize_phone($_POST["phone"]),
            "email" => "",
            "source" => "Сайт: " . SITENAME,
            "comment" => "",
            "site" => SITENAME
        ];
        if (!empty($_POST["name"])) {
            $data["name"] = $_POST["name"];
        }
        if ($_POST["email"]) {
            $email_class = new Email($_POST["email"]);
            $data["email"] = $email_class->title;
        }

        if ($_POST["comment"]) {
            $data["comment"] = $_POST["comment"];
        }
        $data["source"] .= ". \n{$_POST["from"]}. \nГеотаргетинг (utm_campaign): {$_POST["utm_campaign"]}. \nИсточник (utm_source): {$_POST["utm_source"]}. \nМесто клика (utm_medium): {$_POST["utm_medium"]}. \nКлючевое слово (utm_term): {$_POST["utm_term"]}";

        $ch = curl_init();
        curl_setopt_array($ch, [
            CURLOPT_URL => "https://xn----7sbbaaio5ajiisihlvte8x.xn--p1ai/php/amocrm/handler.php",
            CURLOPT_POST => 1,
            CURLOPT_POSTFIELDS => http_build_query($data),
            CURLOPT_HTTPHEADER => ["Content-Type: application/x-www-form-urlencoded"],
            CURLOPT_FRESH_CONNECT => 1,
            CURLOPT_RETURNTRANSFER => 1,
            CURLOPT_FORBID_REUSE => 1,
            CURLOPT_SSL_VERIFYPEER => 0,
            CURLOPT_SSL_VERIFYHOST => 0
        ]);
        $server_output = curl_exec($ch);
        curl_close($ch);
    } else {
        http_response_code(400);
        echo json_encode([
            "result" => "failure",
            "error" => "Не указан номер телефона"
        ], JSON_UNESCAPED_UNICODE);
    }
