window.initMap = () => {
    ymaps.ready(function () {
        let myMap = new ymaps.Map("map", {
            center: [44.504075, 34.190619],
            zoom: 13,
        }, {
            suppressMapOpenBlock: true, //убирает кнопку КАК ДОБРАТЬСЯ
        });

        let myPlacemark = new ymaps.Placemark(
            [44.511797, 34.215688],
            { hintContent: "КА Аврора" },
            {
                iconLayout: "default#image",
                iconImageHref: "img/icon-placemark.png",
                iconImageSize: [30, 59],
                iconImageOffset: [-20, -60]
            }
        );

        myMap.geoObjects.add(myPlacemark);
        myMap.behaviors.disable("scrollZoom");
    });
}
