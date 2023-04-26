function postCreate(){
    song = new FlxSprite(-800, -150).loadGraphic(Paths.image('song/song-Tutorial'));
    song.antialiasing = true;
    song.scale.set(0.7, 0.7);
	add(song);
    song.cameras = [camHUD];
}

function stepHit(curStep:Int){
	switch(curStep) {
		case 1:
		tween = FlxTween.tween(song, { x:-200 }, 0.5);
			
		case 15:
		tween = FlxTween.tween(song, { x:-800 }, 0.5);
}}
