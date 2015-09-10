<!DOCTYPE html>
<html>
<head lang="en">
	
	<jsp:include page="/includes/header.jsp"></jsp:include>

    <script></script>

    <script>
        (function($) {
            $.StartScreen = function(){
                var plugin = this;
                var width = (window.innerWidth > 0) ? window.innerWidth : screen.width;

                plugin.init = function(){
                    setTilesAreaSize();
                    if (width > 640) addMouseWheel();
                };

                var setTilesAreaSize = function(){
                    var groups = $(".tile-group");
                    var tileAreaWidth = 80;
                    $.each(groups, function(i, t){
                        if (width <= 640) {
                            tileAreaWidth = width;
                        } else {
                            tileAreaWidth += $(t).outerWidth() + 80;
                        }
                    });
                    $(".tile-area").css({
                        width: tileAreaWidth
                    });
                };

                var addMouseWheel = function (){
                    $("body").mousewheel(function(event, delta, deltaX, deltaY){
                        var page = $(document);
                        var scroll_value = delta * 50;
                        page.scrollLeft(page.scrollLeft() - scroll_value);
                        return false;
                    });
                };

                plugin.init();
            }
        })(jQuery);

        $(function(){
            $.StartScreen();

            var tiles = $(".tile, .tile-small, .tile-sqaure, .tile-wide, .tile-large, .tile-big, .tile-super");

            $.each(tiles, function(){
                var tile = $(this);
                setTimeout(function(){
                    tile.css({
                        opacity: 1,
                        "-webkit-transform": "scale(1)",
                        "transform": "scale(1)",
                        "-webkit-transition": ".3s",
                        "transition": ".3s"
                    });
                }, Math.floor(Math.random()*500));
            });

            $(".tile-group").animate({
                left: 0
            });
        });

        function showCharms(id){
            var  charm = $(id).data("charm");
            if (charm.element.data("opened") === true) {
                charm.close();
            } else {
                charm.open();
            }
        }

        function setSearchPlace(el){
            var a = $(el);
            var text = a.text();
            var toggle = a.parents('label').children('.dropdown-toggle');

            toggle.text(text);
        }

        $(function(){
            var current_tile_area_scheme = localStorage.getItem('tile-area-scheme') || "tile-area-scheme-dark";
            $(".tile-area").removeClass (function (index, css) {
                return (css.match (/(^|\s)tile-area-scheme-\S+/g) || []).join(' ');
            }).addClass(current_tile_area_scheme);

            $(".schemeButtons .button").hover(
                    function(){
                        var b = $(this);
                        var scheme = "tile-area-scheme-" +  b.data('scheme');
                        $(".tile-area").removeClass (function (index, css) {
                            return (css.match (/(^|\s)tile-area-scheme-\S+/g) || []).join(' ');
                        }).addClass(scheme);
                    },
                    function(){
                        $(".tile-area").removeClass (function (index, css) {
                            return (css.match (/(^|\s)tile-area-scheme-\S+/g) || []).join(' ');
                        }).addClass(current_tile_area_scheme);
                    }
            );

            $(".schemeButtons .button").on("click", function(){
                var b = $(this);
                var scheme = "tile-area-scheme-" +  b.data('scheme');

                $(".tile-area").removeClass (function (index, css) {
                    return (css.match (/(^|\s)tile-area-scheme-\S+/g) || []).join(' ');
                }).addClass(scheme);

                current_tile_area_scheme = scheme;
                localStorage.setItem('tile-area-scheme', scheme);

                showSettings();
            });
        });

        var weather_icons = {
            'clear-day': 'mif-sun',
            'clear-night': 'mif-moon2',
            'rain': 'mif-rainy',
            'snow': 'mif-snowy3',
            'sleet': 'mif-weather4',
            'wind': 'mif-wind',
            'fog': 'mif-cloudy2',
            'cloudy': 'mif-cloudy',
            'partly-cloudy-day': 'mif-cloudy3',
            'partly-cloudy-night': 'mif-cloud5'
        };


    </script>

</head>
<body style="overflow-y: hidden;">
    <div data-role="charm" id="charmSearch">
        <h1 class="text-light">Search</h1>
        <hr class="thin"/>
        <br />
        <div class="input-control text full-size">
            <label>
                <span class="dropdown-toggle drop-marker-light">Anywhere</span>
                <ul class="d-menu" data-role="dropdown">
                    <li><a onclick="setSearchPlace(this)">Anywhere</a></li>
                    <li><a onclick="setSearchPlace(this)">Options</a></li>
                    <li><a onclick="setSearchPlace(this)">Files</a></li>
                    <li><a onclick="setSearchPlace(this)">Internet</a></li>
                </ul>
            </label>
            <input type="text">
            <button class="button"><span class="mif-search"></span></button>
        </div>
    </div>

    <div data-role="charm" id="charmSettings" data-position="top">
        <h1 class="text-light">Settings</h1>
        <hr class="thin"/>
        <br />
        <div class="schemeButtons">
            <div class="button square-button tile-area-scheme-dark" data-scheme="dark"></div>
            <div class="button square-button tile-area-scheme-darkBrown" data-scheme="darkBrown"></div>
            <div class="button square-button tile-area-scheme-darkCrimson" data-scheme="darkCrimson"></div>
            <div class="button square-button tile-area-scheme-darkViolet" data-scheme="darkViolet"></div>
            <div class="button square-button tile-area-scheme-darkMagenta" data-scheme="darkMagenta"></div>
            <div class="button square-button tile-area-scheme-darkCyan" data-scheme="darkCyan"></div>
            <div class="button square-button tile-area-scheme-darkCobalt" data-scheme="darkCobalt"></div>
            <div class="button square-button tile-area-scheme-darkTeal" data-scheme="darkTeal"></div>
            <div class="button square-button tile-area-scheme-darkEmerald" data-scheme="darkEmerald"></div>
            <div class="button square-button tile-area-scheme-darkGreen" data-scheme="darkGreen"></div>
            <div class="button square-button tile-area-scheme-darkOrange" data-scheme="darkOrange"></div>
            <div class="button square-button tile-area-scheme-darkRed" data-scheme="darkRed"></div>
            <div class="button square-button tile-area-scheme-darkPink" data-scheme="darkPink"></div>
            <div class="button square-button tile-area-scheme-darkIndigo" data-scheme="darkIndigo"></div>
            <div class="button square-button tile-area-scheme-darkBlue" data-scheme="darkBlue"></div>
            <div class="button square-button tile-area-scheme-lightBlue" data-scheme="lightBlue"></div>
            <div class="button square-button tile-area-scheme-lightTeal" data-scheme="lightTeal"></div>
            <div class="button square-button tile-area-scheme-lightOlive" data-scheme="lightOlive"></div>
            <div class="button square-button tile-area-scheme-lightOrange" data-scheme="lightOrange"></div>
            <div class="button square-button tile-area-scheme-lightPink" data-scheme="lightPink"></div>
            <div class="button square-button tile-area-scheme-grayed" data-scheme="grayed"></div>
        </div>
    </div>

    <div class="tile-area fg-white tile-area-scheme-lightBlue" style="height: 100%; max-height: 100% !important;">
	
	<jsp:include page="/includes/head_menu.jsp"></jsp:include>
	
        <div class="tile-group double">
            <span class="tile-group-title">General</span>

            <div class="tile-container">

                <a href="http://calendar.google.com" class="tile bg-indigo fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-calendar"></span>
                    </div>
                    <span class="tile-label">Calendar</span>
                </a>

                <div class="tile bg-darkBlue fg-white" data-role="tile" onclick="document.location.href='http://gmail.com'">
                    <div class="tile-content iconic">
                        <span class="icon mif-envelop"></span>
                    </div>
                    <span class="tile-label">Inbox</span>
                </div>

                <div class="tile-large bg-steel fg-white" data-role="tile" data-on-click="document.location.href='http://forecast.io'">
                    <div class="tile-content" id="weather_bg" style="background: top left no-repeat; background-size: cover">
                        <div class="padding10">
                            <h1 id="weather_icon" style="font-size: 6em;position: absolute; top: 10px; right: 10px;"></h1>
                            <h1 id="city_temp"></h1>
                            <h2 id="city_name" class="text-light"></h2>
                            <h4 id="city_weather"></h4>
                            <p id="city_weather_daily"></p>

                            <p class="no-margin text-shadow">Pressure: <span class="text-bold" id="pressure"></span> mm</p>
                            <p class="no-margin text-shadow">Ozone: <span class="text-bold" id="ozone"></span></p>
                            <p class="no-margin text-shadow">Wind bearing: <span class="text-bold" id="wind_bearing"></span></p>
                            <p class="no-margin text-shadow">Wind speed: <span class="text-bold" id="wind_speed">0</span> m/s</p>
                        </div>
                    </div>
                    <span class="tile-label">Weather</span>
                </div>
            </div>
        </div>

        <div class="tile-group double">
            <span class="tile-group-title">Images</span>
            <div class="tile-container">
                <div class="tile-wide" data-role="tile" data-effect="slideLeft">
                    <div class="tile-content">
                        <a href="http://google.com/search?q=bear" class="live-slide"><img src="../images/1.jpg" data-role="fitImage" data-format="fill"></a>
                        <a href="http://google.com/search?q=cat" class="live-slide"><img src="../images/2.jpg" data-role="fitImage" data-format="fill"></a>
                        <a href="http://google.com/search?q=dog" class="live-slide"><img src="../images/3.jpg" data-role="fitImage" data-format="fill"></a>
                        <a href="http://google.com/search?q=eagle" class="live-slide"><img src="../images/4.jpg" data-role="fitImage" data-format="fill"></a>
                        <a href="http://google.com/search?q=fox" class="live-slide"><img src="../images/5.jpg" data-role="fitImage" data-format="fill"></a>
                    </div>
                    <div class="tile-label">Gallery</div>
                </div>
                <div class="tile" data-role="tile" data-role="tile" data-effect="slideUpDown">
                    <div class="tile-content">
                        <div class="live-slide"><img src="../images/me.jpg" data-role="fitImage" data-format="fill"></div>
                        <div class="live-slide"><img src="../images/spface.jpg" data-role="fitImage" data-format="fill"></div>
                    </div>
                    <div class="tile-label">Photos</div>
                </div>
                <div class="tile-small bg-amber fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-video-camera"></span>
                    </div>
                </div>
                <div class="tile-small bg-green fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-gamepad"></span>
                    </div>
                </div>
                <div class="tile-small bg-pink fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-headphones"></span>
                    </div>
                </div>
                <div class="tile-small bg-yellow fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-lock"></span>
                    </div>
                </div>

                <div class="tile-wide bg-orange fg-white" data-role="tile">
                    <div class="tile-content image-set">
                        <img src="../images/jeki_chan.jpg">
                        <img src="../images/shvarcenegger.jpg">
                        <img src="../images/vin_d.jpg">
                        <img src="../images/jolie.jpg">
                        <img src="../images/jek_vorobey.jpg">
                    </div>
                </div>

            </div>
        </div>

        <div class="tile-group double">
            <span class="tile-group-title">Other</span>
            <div class="tile-container">
                <div class="tile bg-teal fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-pencil"></span>
                    </div>
                    <span class="tile-label">Editor</span>
                </div>
                <div class="tile bg-darkGreen fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-shopping-basket"></span>
                    </div>
                    <span class="tile-label">Store</span>
                </div>
                <div class="tile bg-cyan fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-skype"></span>
                    </div>
                    <div class="tile-label">Skype</div>
                </div>
                <div class="tile bg-darkBlue fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-cloud"></span>
                    </div>
                    <span class="tile-label">OneDrive</span>
                </div>
            </div>
        </div>
    </div>

    <!-- hit.ua -->
    <a href='http://hit.ua/?x=136046' target='_blank'>
        <script language="javascript" type="text/javascript"><!--
        Cd=document;Cr="&"+Math.random();Cp="&s=1";
        Cd.cookie="b=b";if(Cd.cookie)Cp+="&c=1";
        Cp+="&t="+(new Date()).getTimezoneOffset();
        if(self!=top)Cp+="&f=1";
        //--></script>
        <script language="javascript1.1" type="text/javascript"><!--
        if(navigator.javaEnabled())Cp+="&j=1";
        //--></script>
        <script language="javascript1.2" type="text/javascript"><!--
        if(typeof(screen)!='undefined')Cp+="&w="+screen.width+"&h="+
        screen.height+"&d="+(screen.colorDepth?screen.colorDepth:screen.pixelDepth);
        //--></script>
        <script language="javascript" type="text/javascript"><!--
        Cd.write("<img src='http://c.hit.ua/hit?i=136046&g=0&x=2"+Cp+Cr+
        "&r="+escape(Cd.referrer)+"&u="+escape(window.location.href)+
        "' border='0' wi"+"dth='1' he"+"ight='1'/>");
        //--></script></a>
    <!-- / hit.ua -->


</body>
</html>