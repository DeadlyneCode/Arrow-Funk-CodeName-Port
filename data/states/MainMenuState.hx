import flixel.util.FlxAxes;
import flixel.addons.display.FlxBackdrop;

function create(){

    bg = new FlxSprite(-30, 0).loadGraphic(Paths.image('menus/mainmenu/bg'));
    add(bg);
    
   var panorama:FlxBackdrop = new FlxBackdrop(Paths.image("menus/mainmenu/mmbg"),FlxAxes.X , 0, 0);
   panorama.velocity.x = 25;
   add(panorama);

    story = new FlxSprite(-100,-80 );
    story.frames = Paths.getSparrowAtlas('menus/mainmenu/shit');
    story.animation.addByPrefix('storymode', 'storymode', 24);
    story.animation.play('storymode');
    story.scale.x = story.scale.y = 1;
    add(story);

    freeplay = new FlxSprite(-130,-100 );
    freeplay.frames = Paths.getSparrowAtlas('menus/mainmenu/shit');
    freeplay.animation.addByPrefix('freeplay', 'freeplay', 24);
    freeplay.animation.play('freeplay');
    freeplay.scale.x = freeplay.scale.y = 1;
    add(freeplay);

    option = new FlxSprite(-130,-100 );
    option.frames = Paths.getSparrowAtlas('menus/mainmenu/shit');
    option.animation.addByPrefix('option', 'option', 24);
    option.animation.play('option');
    option.scale.x = option.scale.y = 0.98;
    add(option);

    up = new FlxSprite(0, 0).loadGraphic(Paths.image('menus/mainmenu/mmov'));
    add(up);
}

function postCreate(){
    magenta.destroy();
    for(e in state.menuItems) {
        e.scale.x = 0.7;
        e.scale.y= 0.7;
        e.scrollFactor.set();
        e.updateHitbox();
        e.animation.play(e.animation.curAnim.name, true);
      }
    FlxG.camera.followLerp = 0;
}
    function update(){
        if (curSelected == 0)
        {
            story.visible = true;
            freeplay.visible = false;
            option.visible = false;
        }
        if (curSelected == 1)
        {
            story.visible = false;
            freeplay.visible = true;
            option.visible = false;
        }
        if (curSelected == 2)
        {
            story.visible = false;
            freeplay.visible = false;
            option.visible = true;
        }
    }

    function postUpdate() {
        state.menuItems.members[0].offset.set(-250, 0); // story
        state.menuItems.members[1].offset.set(-200, -30); // freeplay
        state.menuItems.members[2].offset.set(-200, -80);// options

        FlxG.camera.scroll.x = FlxG.camera.scroll.y=0;
        FlxG.camera.scroll.set();
    }