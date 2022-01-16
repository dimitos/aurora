<html>
<body>
    <center style="background-color:#e6eef2;table-layout: fixed;">
        <table border="0" cellpadding="0" cellspacing="0" height="100%" width="100%" style="
            width: 100% !important;
            min-width: 100% !important;
            max-width: 600px !important;
            padding: 10px 0;">
            <tr>
                <td align="center" valign="top">
                    <table bgcolor="#FFFFFF" border="0" cellpadding="0" cellspacing="0" width="600">
                        <tr>
                            <td align="center" valign="top" bgcolor="#d0dde4">
                                <div style="
                                    color: #313a3f;
                                    text-align:center;
                                    font-size:34px;
                                    line-height:135%;
                                    padding: 25px;">
                                    Заявка с сайта <span style="white-space: nowrap;">{$data.sitename}</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="top">
                                <div style="font-family: Helvetica, Arial, sans-serif;
                                            font-size:15px;
                                            line-height:155%;
                                            color:#adadad;
                                            padding: 30px 35px 0 35px;">
                                    <div style="padding-bottom: 15px">
                                        <center>Информация о клиенте</center>
                                    </div>
                                    {if !empty($data.name)}
                                        <div>От: <span style="color: #000;">{$data.name}</span></div>
                                    {/if}
                                    {if !empty($data.phone)}
                                        <div>Телефон: <span style="color: #000;">{$data.phone}</span></div>
                                    {/if}
                                    {if !empty($data.email)}
                                        <div>E-mail: <span style="color: #000;">{$data.email}</span></div>
                                    {/if}
                                    {if !empty($data.comment)}
                                        <div>Комментарий: <span style="color: #000;">{$data.comment}</span></div>
                                    {/if}
                                    <div>Отправлено: <span style="color: #000;">{$smarty.now|date_format:'%d.%m.%Y г. в %H:%M:%S'}</span></div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="top">
                                <div style="font-family: Helvetica, Arial, sans-serif;
                                            font-size:15px;
                                            line-height:155%;
                                            color:#adadad;
                                            padding: 30px 35px;">
                                    <div style="padding-bottom: 15px">
                                        <center>Информация об источнике</center>
                                    </div>
                                    <div>Форма захвата: <span style="color: #000;">{$data.from}</span></div>
                                    <div>utm_campaign: <span style="color: #000;">{$data.utm_campaign}</span></div>
                                    <div>utm_source: <span style="color: #000;">{$data.utm_source}</span></div>
                                    <div>utm_medium: <span style="color: #000;">{$data.utm_medium}</span></div>
                                    <div>utm_term: <span style="color: #000;">{$data.utm_term}</span></div>
                                    <div>utm_content: <span style="color: #000;">{$data.utm_content}</span></div>
                                    <div>utm_campaign_original: <span style="color: #000;">{$data.utm_campaign_original}</span></div>
                                    <div>utm_source_original: <span style="color: #000;">{$data.utm_source_original}</span></div>
                                    <div>utm_medium_original: <span style="color: #000;">{$data.utm_medium_original}</span></div>
                                    <div>utm_term_original: <span style="color: #000;">{$data.utm_term_original}</span></div>
                                    <div>utm_content_original: <span style="color: #000;">{$data.utm_content_original}</span></div>
                                    <div>referer: <span style="color: #000;">{$data.referer}</span></div>
                                    <div>ref_type2: <span style="color: #000;">{$data.ref_type2}</span></div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </center>
</body>
</html>
