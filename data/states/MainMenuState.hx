var bg:FlxSprite;

    function create(){
        bg = new FlxSprite(-230, -900).loadGraphic(Paths.image('menus/mainmenu/menuBGoverlay'));
        add(bg);
    }