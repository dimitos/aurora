function loadFont(fontName, woffUrl, woff2Url, callback, cb_src) {
    // 0. Many unsupported browsers should stop here
    var nua = navigator.userAgent;
    var noSupport = !window.addEventListener // IE8 and below
        || (nua.match(/(Android (2|3|4.0|4.1|4.2|4.3))|(Opera (Mini|Mobi))/) && !nua.match(/Chrome/)) // Android Stock Browser below 4.4 and Opera Mini

    if (noSupport) {
        callback && callback(cb_src);
        return;
    }

    // 1. Setting up localStorage
    var loSto = {};
    try {
        // We set up a proxy variable to help with localStorage, e.g. when cookies are disabled
        // and the browser prevents us accessing it.
        // Otherwise some exceptions can be thrown which completely prevent font loading.
        loSto = localStorage || {};
    } catch (ex) {
    }

    var localStoragePrefix = 'x-font-' + fontName;
    var localStorageUrlKey = localStoragePrefix + 'url';
    var localStorageCssKey = localStoragePrefix + 'css';
    var storedFontUrl = loSto[localStorageUrlKey];
    var storedFontCss = loSto[localStorageCssKey];


    // 2. Setting up the <style> element, that we are using to apply the base64 encoded font data
    var styleElement = document.createElement('style');
    styleElement.rel = 'stylesheet';
    document.head.appendChild(styleElement);
    // Setting styleElement.textContent must be after this line, because of IE9 errors


    // 3. Checking whether the font data is already in localStorage and up-to-date
    if (storedFontCss && (storedFontUrl === woffUrl || storedFontUrl === woff2Url)) {
        // the css is still in the localStorage
        // AND it was loaded from one of the current URLs

        // 4. Applying the font style sheet
        styleElement.textContent = storedFontCss;

        callback && callback(cb_src);
    } else {
        // The data was not present, or loaded from an obsolete URL
        // So we have to load it again

        // 5. Checking for WOFF2 support to know which URL we should use
        var url = (woff2Url && supportsWoff2())
            ? woff2Url // WOFF2 URL provided and supported
            : woffUrl; // only WOFF support


        // 6. Fetching the font data from the server
        var request = new XMLHttpRequest();
        request.open('GET', url);
        request.onload = function () {
            if (request.status >= 200 && request.status < 400) {

                // 7. Updating localStorage with the fresh data and applying the font data
                loSto[localStorageUrlKey] = url;
                loSto[localStorageCssKey] = styleElement.textContent = request.responseText;

                callback && callback(cb_src);
            }
        };
        request.send();
    }

    function supportsWoff2() {
        if (!("FontFace" in window)) {
            return false;
        }

        var f = new FontFace('t', 'url( "data:application/font-woff2;base64,d09GMgABAAAAAADcAAoAAAAAAggAAACWAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAABk4ALAoUNAE2AiQDCAsGAAQgBSAHIBtvAcieB3aD8wURQ+TZazbRE9HvF5vde4KCYGhiCgq/NKPF0i6UIsZynbP+Xi9Ng+XLbNlmNz/xIBBqq61FIQRJhC/+QA/08PJQJ3sK5TZFMlWzC/iK5GUN40psgqvxwBjBOg6JUSJ7ewyKE2AAaXZrfUB4v+hze37ugJ9d+DeYqiDwVgCawviwVFGnuttkLqIMGivmDg" ) format( "woff2" )', {});
        f.load()['catch'](function () {
        });

        return f.status == 'loading' || f.status == 'loaded';
    }
}