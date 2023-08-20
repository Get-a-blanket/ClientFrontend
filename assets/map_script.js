ymaps.ready(init);

function init() {
    var myMap = new ymaps.Map('map', {
        center: [55.722422, 37.593933],
        zoom: 14,
        controls: [],
    }, {
        suppressMapOpenBlock: true,
        suppressObsoleteBrowserNotifier: true,
        yandexMapDisablePoiInteractivity: true
    });

    //Местоположение точек
    // TODO забирать с сервера
    var myPlacemark = new ymaps.Placemark([55.730929, 37.600319]);
    myMap.geoObjects.add(myPlacemark);
    myPlacemark = new ymaps.Placemark([55.729960, 37.605291]);
    myMap.geoObjects.add(myPlacemark);
    myPlacemark = new ymaps.Placemark([55.728646, 37.602068]);
    myMap.geoObjects.add(myPlacemark);
    myPlacemark = new ymaps.Placemark([55.728015, 37.598041]);
    myMap.geoObjects.add(myPlacemark);
    myPlacemark = new ymaps.Placemark([55.725714, 37.597157]);
    myMap.geoObjects.add(myPlacemark);
    myPlacemark = new ymaps.Placemark([55.724262, 37.596354]);
    myMap.geoObjects.add(myPlacemark);
    myPlacemark = new ymaps.Placemark([55.722095, 37.591494]);
    myMap.geoObjects.add(myPlacemark);
    myPlacemark = new ymaps.Placemark([55.717997, 37.588556]);
    myMap.geoObjects.add(myPlacemark);
    myPlacemark = new ymaps.Placemark([55.715957, 37.586093]);
    myMap.geoObjects.add(myPlacemark);
    myPlacemark = new ymaps.Placemark([55.711496, 37.585433]);
    myMap.geoObjects.add(myPlacemark);

    // Создадим пользовательский макет ползунка масштаба.
    let ZoomLayout = ymaps.templateLayoutFactory.createClass(
        "<div id='zoom-btn-rectangle'>" +
        "<div id='zoom-in' class='zoom-btn'><div id='vector-plus-1'></div><div id='vector-plus-2'></div></div>" +
        "<div id='delimiter'></div>" +
        "<div id='zoom-out' class='zoom-btn'><div id='vector-minus'></div></div>" +
        "</div>", {

            // Переопределяем методы макета, чтобы выполнять дополнительные действия
            // при построении и очистке макета.
            build: function () {
                // Вызываем родительский метод build.
                ZoomLayout.superclass.build.call(this);

                // Привязываем функции-обработчики к контексту и сохраняем ссылки
                // на них, чтобы потом отписаться от событий.
                this.zoomInCallback = ymaps.util.bind(this.zoomIn, this);
                this.zoomOutCallback = ymaps.util.bind(this.zoomOut, this);

                // Начинаем слушать клики на кнопках макета.
                $('#zoom-in').bind('click', this.zoomInCallback);
                $('#zoom-out').bind('click', this.zoomOutCallback);
            },

            clear: function () {
                // Снимаем обработчики кликов.
                $('#zoom-in').unbind('click', this.zoomInCallback);
                $('#zoom-out').unbind('click', this.zoomOutCallback);

                // Вызываем родительский метод clear.
                ZoomLayout.superclass.clear.call(this);
            },

            zoomIn: function () {
                var map = this.getData().control.getMap();
                map.setZoom(map.getZoom() + 1, {checkZoomRange: true});
            },

            zoomOut: function () {
                var map = this.getData().control.getMap();
                map.setZoom(map.getZoom() - 1, {checkZoomRange: true});
            }
        });
    let zoomControl = new ymaps.control.ZoomControl({options: {layout: ZoomLayout}});

    myMap.controls.add(zoomControl, {
        position: {
            right: -20,
            top: window.document.documentElement.clientHeight * 0.5 - 100 / 2
        }
    });

    // Макет кнопки геолокации
    let GeolocationLayout = ymaps.templateLayoutFactory.createClass(
        // '<svg id="geo-btn" width="50" height="50" viewBox="0 0 50 50" fill="none" xmlns="http://www.w3.org/2000/svg">\n' +
        // '<circle cx="25" cy="25" r="25" fill="#71BA74"/>\n' +
        // '<path d="M36 20.5C36 29.1792 24.5 42.4151 24.5 42.4151C24.5 42.4151 13 29.8302 13 20.5C13 14.1487 18.1487 9 24.5 9C30.8513 9 36 14.1487 36 20.5Z" fill="white"/>\n' +
        // '<circle cx="24.5" cy="20.5" r="5.85849" fill="#71BA74"/>\n' +
        // '</svg>\n' +
        '<svg id="geo-btn" width="65" height="74" viewBox="0 0 65 74" fill="none" xmlns="http://www.w3.org/2000/svg">\n' +
        '<g filter="url(#filter0_d_15_71)">\n' +
        '<circle cx="37" cy="37" r="25" fill="#71BA74"/>\n' +
        '<path d="M48 32.5C48 41.1792 36.5 54.4151 36.5 54.4151C36.5 54.4151 25 41.8302 25 32.5C25 26.1487 30.1487 21 36.5 21C42.8513 21 48 26.1487 48 32.5Z" fill="white"/>\n' +
        '<circle cx="36.5" cy="32.5" r="5.85849" fill="#71BA74"/>\n' +
        '</g>\n' +
        '<defs>\n' +
        '<filter id="filter0_d_15_71" x="0" y="0" width="74" height="74" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">\n' +
        '<feFlood flood-opacity="0" result="BackgroundImageFix"/>\n' +
        '<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"/>\n' +
        '<feOffset/>\n' +
        '<feGaussianBlur stdDeviation="6"/>\n' +
        '<feComposite in2="hardAlpha" operator="out"/>\n' +
        '<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"/>\n' +
        '<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_15_71"/>\n' +
        '<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_15_71" result="shape"/>\n' +
        '</filter>\n' +
        '</defs>\n' +
        '</svg>\n', {
            build: function () {
                // Вызываем родительский метод build.
                ZoomLayout.superclass.build.call(this);

                // Привязываем функции-обработчики к контексту и сохраняем ссылки
                // на них, чтобы потом отписаться от событий.
                this.getGeoCallback = ymaps.util.bind(this.getGeo, this);

                // Начинаем слушать клики на кнопках макета.
                $('#geo-btn').bind('click', this.getGeoCallback);
            },

            clear: function () {
                // Снимаем обработчики кликов.
                $('#geo-btn').unbind('click', this.getGeoCallback);

                // Вызываем родительский метод clear.
                ZoomLayout.superclass.clear.call(this);
            },

            getGeo: function () {
                // const successCallback = (position) => {
                //     // map.panTo(new ymaps.GeoPoint(position.), {flying: 1});
                //     console.log(position);
                // };
                //
                // const errorCallback = (error) => {
                //     console.log(error);
                // };
                //
                // navigator.geolocation.getCurrentPosition(successCallback, errorCallback);
                ymaps.geolocation.get({
                    // Выставляем опцию для определения положения по ip
                    provider: 'auto',
                    // Карта автоматически отцентрируется по положению пользователя.
                    mapStateAutoApply: true,
                    autoReverseGeocode: false
                }).then(function (result) {
                    myMap.geoObjects.add(result.geoObjects);
                });
            }
        })
    var geolocationControl = new ymaps.control.Button({
        options: {
            layout: GeolocationLayout,
            position: {
                right: 0,
                top: window.document.documentElement.clientHeight * 0.5 + 100 / 2 + 10
            }
        }
    });
    myMap.controls.add(geolocationControl);
}