var bg:FlxSprite;

function postUpdate{
    bg = new FlxSprite(44 * 6, 14 * 6);
    bg.loadGraphic(Paths.image('menus/mainmenu/menuBGoverlay'));
    //bg.scale.set(6, 6);
    bg.updateHitbox();
    //bg.scale.y = 4;
    //bg.cameras = [pauseCam];
    add(bg);
}