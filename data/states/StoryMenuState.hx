function create(){
    bg = new FlxSprite(0, 0).loadGraphic(Paths.image("menus/storymenu/storybg"));
    bg.antialiasing = true;
}
function postCreate(){
    add(bg);
    StoryMenuState.instance.insert(StoryMenuState.instance.members.indexOf(weekBG)-1,bg);
}