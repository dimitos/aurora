{extends "page.tpl"}

{block main}
    {include "blocks/page-error.tpl" page_error=[
        "class" => "404__error",
        "text" => "415 Не поддерживаемый тип данных"
    ]}
{/block}
