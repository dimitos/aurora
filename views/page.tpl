<!DOCTYPE html>
<html lang="ru">
<head>
    <title>{$meta->title}</title>
    <meta charset="UTF-8">
    <meta name="viewport" id="viewport" content="viewport-fit=cover, width=device-width, initial-scale=1">
    <meta name="description" content="{$meta->description}">
    <meta name="keywords" content="{$meta->keywords}">

    <meta property="og:type" content="website">
    <meta property="og:url" content="{$meta->url}">
    <meta property="og:title" content="{$meta->title}">
    <meta property="og:description" content="{$meta->description}">
    <meta property="og:image" content="{$meta->image}">

    <link rel="canonical" href="{$meta->url}">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="192x192" href="/apple-touch-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="194x194" href="/favicon-194x194.png">
    <link rel="icon" type="image/png" sizes="192x192" href="/android-chrome-192x192.png">
    <link rel="manifest" href="/site.webmanifest">
    <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bb2c1">
    <meta name="msapplication-TileColor" content="#5bb2c1">
    <meta name="msapplication-TileImage" content="/mstile-144x144.png">
    <meta name="theme-color" content="#5bb2c1">

    <style>
        @font-face {
            font-family: 'Gilroy';
            font-weight: 400;
            font-style: normal;
            font-display: swap;
            src: url('/fonts/Gilroy-Regular.woff2') format('woff2'),
            url('/fonts/Gilroy-Regular.woff') format('woff');
        }

        @font-face {
            font-family: 'Gilroy';
            font-weight: 600;
            font-style: normal;
            font-display: swap;
            src: url('/fonts/Gilroy-Semibold.woff2') format('woff2'),
            url('/fonts/Gilroy-Semibold.woff') format('woff');
        }

        @font-face {
            font-family: 'Gilroy';
            font-weight: 700;
            font-style: normal;
            font-display: swap;
            src: url('/fonts/Gilroy-Bold.woff2') format('woff2'),
            url('/fonts/Gilroy-Bold.woff') format('woff');
        }

        @font-face {
            font-family: 'Manrope';
            font-weight: 400;
            font-style: normal;
            font-display: swap;
            src: url('/fonts/Manrope-Regular.woff2') format('woff2'),
            url('/fonts/Manrope-Regular.woff') format('woff');
        }

        @font-face {
            font-family: 'Manrope';
            font-weight: 500;
            font-style: normal;
            font-display: swap;
            src: url('/fonts/Manrope-Medium.woff2') format('woff2'),
            url('/fonts/Manrope-Medium.woff') format('woff');
        }

        @font-face {
            font-family: 'Montserrat';
            font-weight: 500;
            font-style: normal;
            font-display: swap;
            src: url('/fonts/Montserrat-Medium.woff2') format('woff2'),
            url('/fonts/Montserrat-Medium.woff') format('woff');
        }
    </style>

    {$common_styles}

    {if !empty($page->styles)}
        {$page->styles}
    {/if}

    <script type="application/ld+json">
            {
                "@context": "http://schema.org",
                "@type": "Organization",
                "url": "{$meta->url}",
                "name": "{$meta->title}",
                "image": "{$meta->image}",
                "description": "{$meta->description}",
                "telephone": "{$phone->title}",
                "email": "{$email->title}",
                "address": {
                    "@type": "PostalAddress",
                    "addressLocality": "г. Анапа",
                    "streetAddress": "",
                    "postalCode": ""
                },
                "contactPoint": {
                    "@type": "ContactPoint",
                    "contactType": "sales",
                    "name": "Менеджер",
                    "telephone": "{$phone->title}"
                }
            }
    </script>

    <script>
        var liters = {json_encode($liters)};
        var objects = {json_encode($objects)};
    </script>

    {$inline_scripts}

    <script>
        var utm_campaign = "{$referer.utm_campaign}";
        var utm_source = "{$referer.utm_source}";
        var utm_medium = "{$referer.utm_medium}";
        var utm_term = "{$referer.utm_term}";
        var utm_content = "{$referer.utm_content}";
        var utm_campaign_original = "{$referer.utm_campaign_original}";
        var utm_source_original = "{$referer.utm_source_original}";
        var utm_medium_original = "{$referer.utm_medium_original}";
        var utm_term_original = "{$referer.utm_term_original}";
        var utm_content_original = "{$referer.utm_content_original}";
        var referer = "{$referer.referer}";
        var ref_type2 = "{$referer.ref_type2}";
    </script>

    {if $smarty.env.MODE === "prod"}
        {include "blocks/counters.tpl"}
    {/if}
</head>
<body class="page page-{$page->name}">
<script>checkWebpSupport();</script>

{include "blocks/header.tpl"}

<main class="page__main page__main-{$page->name}">
    {block main}{/block}
</main>

{include "blocks/footer.tpl"}

<div class="intopModal__wrap">
    {include "modal/alert.tpl"}
    {include "modal/privacy.tpl"}
    {include "modal/request.tpl"}
</div>

{$vendor_scripts}
{$common_scripts}

{if !empty($page->scripts)}
    {$page->scripts}
{/if}

<script src="https://api-maps.yandex.ru/2.1/?apikey={$smarty.env.YMAPS_KEY}&lang=ru_RU&onload=initMap" async></script>
</body>
</html>
