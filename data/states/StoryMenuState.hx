function postUpdate(){
    if (curWeek == 0)
    {
        sagu.visible = false;
        barbara.visible = false;
        kevin.visible = true;
    }
    if (curWeek == 1)
    {
        sagu.visible = true;
        barbara.visible = true;
        kevin.visible = false;
    }
}

function postCreate(){
    track = new FlxSprite(90, 500).loadGraphic(Paths.image('menus/Menu_Tracks'));
    add(track);

    bg = new FlxSprite(0, 0).loadGraphic(Paths.image('menus/storymenu/storybg'));
    add(bg);

    bf = new FlxSprite(800,120 );
    bf.frames = Paths.getSparrowAtlas('menus/storymenu/characters/Menu_Bidu');
    bf.animation.addByPrefix('idle', 'BiduDance', 24);
    bf.animation.addByPrefix('hey', 'BiduHey', 24);
    bf.animation.play('idle');
    bf.scale.x = bf.scale.y = 0.575;
    add(bf);

    barbara = new FlxSprite(280,-77.8 );
    barbara.frames = Paths.getSparrowAtlas('menus/storymenu/characters/Menu_Barbara');
    barbara.animation.addByPrefix('idle', 'BarbaraDance', 24);
    barbara.animation.play('idle');
    barbara.scale.x = barbara.scale.y = 0.575;
    add(barbara);

    sagu = new FlxSprite(90,-120 );
    sagu.frames = Paths.getSparrowAtlas('menus/storymenu/characters/AF');
    sagu.animation.addByPrefix('idle', 'SaguDance', 24);
    sagu.animation.play('idle');
    sagu.scale.x = sagu.scale.y = 0.575;
    add(sagu);

    kevin = new FlxSprite(168.5,-48.5 );
    kevin.frames = Paths.getSparrowAtlas('menus/storymenu/characters/AF');
    kevin.animation.addByPrefix('idle', 'KevinDance', 24);
    kevin.animation.play('idle');
    kevin.scale.x = kevin.scale.y = 0.575;
    add(kevin);
}