<?

    function get_page(): Page
    {
        $url = explode("/", get_current_url(false));
        $url_lvl1 = $url[3];

        try {
            // Страница не найдена
            if (($url_lvl1 == "404") || ($url_lvl1 == "home")) {
                return Page::code404();
            }

            $url_lvl1 = $url_lvl1 ?: "home";
            if (file_exists(ROOT . "/views/pages/$url_lvl1.tpl")) {
                return Page::code200($url_lvl1);
            } else {
                // Страница не найдена
                return Page::code404();
            }
        } catch (Exception $e) {
            return Page::code415();
        }
    }

    /**
     * Возвращает текущий URL
     * @param bool $with_query
     * @return string
     */
    function get_current_url(bool $with_query = true): string
    {
        $https = false;
        if (isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] == "on") {
            $https = true;
        } elseif (!empty($_SERVER["HTTP_X_FORWARDED_PROTO"]) && $_SERVER["HTTP_X_FORWARDED_PROTO"] == "https" || !empty($_SERVER["HTTP_X_FORWARDED_SSL"]) && $_SERVER["HTTP_X_FORWARDED_SSL"] == "on") {
            $https = true;
        }
        $REQUEST_PROTOCOL = $https ? "https" : "http";

        $current_url = $REQUEST_PROTOCOL . "://{$_SERVER["HTTP_HOST"]}";
        if ($with_query) {
            $current_url .= $_SERVER["REQUEST_URI"];
        } else {
            $url = explode("?", $_SERVER["REQUEST_URI"], 5);
            $current_url .= $url[0];
        }
        return $current_url;
    }
