<?

    /**
     * Возвращает число в виде строки без десятичных знаков и с пробелом перед тысячей/миллионом
     * @param mixed $int
     * @return string
     */
    function int_format($int): string
    {
        $true_int = intval($int);
        return number_format($true_int, 0, ",", " ");
    }

    /**
     * Возвращает число в виде строки с 2мя десятичными знаками и с пробелом перед тысячей/миллионом
     * @param mixed $float
     * @param bool $trim_zeroes
     * @return string
     */
    function float_format($float, bool $trim_zeroes = false): string
    {
        $true_float = floatval($float);
        $float_format = number_format($true_float, 2, ",", " ");
        if ($trim_zeroes) {
            $float_format = rtrim(rtrim($float_format, "0"), ",");
        }
        return $float_format;
    }

    /**
     * Возвращает число в виде строки со знаком рубля, с 2мя десятичными знаками и с пробелом перед тысячей/миллионом
     * @param mixed $float
     * @param bool $trim_zeroes
     * @return string
     */
    function currency_format($float, bool $trim_zeroes = true): string
    {
        return float_format($float, $trim_zeroes) . " ₽";
    }

    /**
     * Получаем цифры из строки
     * @param string $string
     * @return string
     */
    function numbers_from_str(string $string): string
    {
        return preg_replace("/[^0-9]/", "", $string);
    }

    /**
     * Нормализация номера телефона
     * @param string $phone_in
     * @param bool $is_first_8
     * @return string
     */
    function normalize_phone(string $phone_in, bool $is_first_8 = false): string
    {
        $prefix = 7;
        if ($is_first_8) {
            $prefix = 8;
        }

        $phone = numbers_from_str($phone_in);
        if (strlen($phone) >= 6) {
            if ((strlen($phone) == 11) && (substr($phone, 0, 1) == "8")) {
                $phone = $prefix . substr($phone, 1);
            } elseif (strlen($phone) == 10) {
                $phone = $prefix . $phone;
            }
        } else {
            $phone = "";
        }
        return $phone;
    }

    /**
     * Строка телефона в корректном формате
     * @param string $phone_in
     * @return string
     */
    function format_phone(string $phone_in): string
    {
        $phone = normalize_phone($phone_in);
        $prefix = "+7";
        $code = substr($phone, 1, 3);
        $part1 = substr($phone, 4, 3);
        $part2 = substr($phone, 7, 2);
        $part3 = substr($phone, 9, 2);

        return "{$prefix}({$code}) {$part1}-{$part2}-{$part3}";
    }

    /**
     * Получаем boolean из строки Да/Нет
     * @param string $db_yes_no
     * @return bool
     * @throws Exception
     */
    function bool_from_db(string $db_yes_no): bool
    {
        if ($db_yes_no == "1") {
            return true;
        } else {
            return false;
        }
    }

    /**
     * Получаем отформатированную дату из БД (квартал и год)
     * @param string $date
     * @return string
     * @throws Exception
     */
    function date_from_db(string $date): string
    {
        $date = new DateTime($date);
        $quarter = ceil(date_format($date, "m") / 3);
        $year = date_format($date, "Y");
        return $quarter . " кв. " . $year . " г.";
    }

    /**
     * @param $img_path
     * @return string|string[]|null
     */
    function img_path_to_webp($img_path) {
        return preg_replace("/\.(jpe?g|png)$/", ".webp", $img_path);
    }
