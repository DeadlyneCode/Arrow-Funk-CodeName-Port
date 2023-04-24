

function postCreate() {
    healthBarBG.visible = false;
	bar = new FlxSprite(339, 648).loadGraphic(Paths.image('healthBarOV2'));
	bar.antialiasing = true;
	PlayState.instance.insert(PlayState.instance.members.indexOf(healthBar)+1,bar);

    bar.cameras = [camHUD];
}

