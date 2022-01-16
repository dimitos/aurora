<?
    /**
     * Класс данных для метатегов
     */
    class Meta
    {
        public $title = "Аврора";
        public $description = "Аврора";
        public $keywords = "Аврора";
        public $image = "/img/og-image.png";
        public $url;

        /**
         * Meta constructor
         */
        public function __construct()
        {
            $this->url = get_current_url(false);
        }

    }
