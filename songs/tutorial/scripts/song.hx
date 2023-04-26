function postCreate(){
    song_name = new FlxSprite(-800, -150).loadGraphic(Paths.image('song/song-Tutorial'));
    song_name.antialiasing = true;
    song_name.scale.set(0.7, 0.7);
	add(song_name);
    song_name.cameras = [camHUD];
}

function stepHit(curStep:Int){
	switch(curStep) {
		case 1:
		  tween = FlxTween.tween(song_name, { x:-200 }, 3, { type: FlxTween.PINGPONG, ease: FlxEase.smoothStepInOut});

                case 34:
                  tween.cancel();
                  song_name.destroy();
}}
