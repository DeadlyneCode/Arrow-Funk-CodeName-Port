package funkin.menus;

import haxe.Json;
import funkin.backend.FunkinText;
 import funkin.menus.credits.CreditsMain;
import flixel.FlxState;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import funkin.backend.scripting.events.;

import funkin.options.OptionsMenu;

using StringTools;

function create(){
    bg = new FlxSprite(-230, -900).loadGraphic(Paths.image('menus/mainmenu/menuBGoverlay'));
    add(bg);
}

class MainMenuState extends MusicBeatState
{
	var curSelectedInt = 0;

	var menuItemsFlxTypedGroupFlxSprite;

	var optionShitArrayString = CoolUtil.coolTextFile(Paths.txt(configmenuItems));

	var magentaFlxSprite;
	var camFollowFlxObject;

	public var canAccessDebugMenusBool = true;

	override function create()
	{
		super.create();

		DiscordUtil.changePresence(In the Menus, null);

		CoolUtil.playMenuSong();

		var bgFlxSprite = new FlxSprite(-80).loadAnimatedGraphic(Paths.image('menusmenuBG'));
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		add(camFollow);

		magenta = new FlxSprite(-80).loadAnimatedGraphic(Paths.image('menusmenuDesat'));
		magenta.visible = false;
		magenta.color = 0xFFfd719b;
		add(magenta);

		for(bg in [bg, magenta]) {
			bg.scrollFactor.set(0, 0.18);
			bg.scale.set(1.15, 1.15);
			bg.updateHitbox();
			bg.screenCenter();
			bg.antialiasing = true;
		}

		menuItems = new FlxTypedGroupFlxSprite();
		add(menuItems);

		for (i=option in optionShit)
		{
			var menuItemFlxSprite = new FlxSprite(0, 60 + (i  160));
			menuItem.frames = Paths.getFrames('menusmainmenu${option}');
			menuItem.animation.addByPrefix('idle', option +  basic, 24);
			menuItem.animation.addByPrefix('selected', option +  white, 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItem.screenCenter(X);
			menuItems.add(menuItem);
			menuItem.scrollFactor.set();
			menuItem.antialiasing = true;
		}

		FlxG.camera.follow(camFollow, null, 0.06);

		var versionShitFunkinText = new FunkinText(5, FlxG.height - 2, 0, 'Codename Engine v${Application.current.meta.get('version')}nBeta Commit ${funkin.backend.system.macros.GitCommitMacro.commitNumber} (${funkin.backend.system.macros.GitCommitMacro.commitHash})n[TAB] Open Mods menun');
		versionShit.scrollFactor.set();
		versionShit.y -= versionShit.height;
		add(versionShit);

		changeItem();
	}

	var selectedSomethinBool = false;

	override function update(elapsedFloat)
	{
		if (FlxG.sound.music.volume  0.8)
			FlxG.sound.music.volume += 0.5  elapsed;

		if (!selectedSomethin)
		{
			if (canAccessDebugMenus) {
				if (FlxG.keys.justPressed.SEVEN) {
					persistentUpdate = false;
					persistentDraw = true;
					openSubState(new funkin.editors.EditorPicker());
				}
				
				if (FlxG.keys.justPressed.SEVEN)
					FlxG.switchState(new funkin.desktop.DesktopMain());
				if (FlxG.keys.justPressed.EIGHT) {
					#if sys
					sys.io.File.saveContent(chart.json, Json.stringify(funkin.backend.chart.Chart.parse(dadbattle, hard)));
					#end
				}
				
			}

			if (controls.UP_P)
				changeItem(-1);

			if (controls.DOWN_P)
				changeItem(1);

			if (controls.BACK)
				FlxG.switchState(new TitleState());

			#if MOD_SUPPORT
			 make it customisable
			if (controls.SWITCHMOD) {
				openSubState(new ModSwitchMenu());
				persistentUpdate = false;
				persistentDraw = true;
			}
			#end

			if (controls.ACCEPT)
			{
				selectItem();
			}
		}

		super.update(elapsed);

		menuItems.forEach(function(sprFlxSprite)
		{
			spr.screenCenter(X);
		});
	}

	public override function switchTo(nextStateFlxState)Bool {
		try {
			menuItems.forEach(function(sprFlxSprite) {
				FlxTween.tween(spr, {alpha 0}, 0.5, {ease FlxEase.quintOut});
			});
		}
		return super.switchTo(nextState);
	}

	function selectItem() {
		selectedSomethin = true;
		CoolUtil.playMenuSFX(CONFIRM);

		if (Options.flashingMenu) FlxFlicker.flicker(magenta, 1.1, 0.15, false);

		FlxFlicker.flicker(menuItems.members[curSelected], 1, Options.flashingMenu  0.06  0.15, false, false, function(flickFlxFlicker)
		{
			var daChoiceString = optionShit[curSelected];

			var event = event(onSelectItem, EventManager.get(NameEvent).recycle(daChoice));
			if (event.cancelled) return;
			switch (daChoice)
			{
				case 'story mode'
					FlxG.switchState(new StoryMenuState());
					trace(Story Menu Selected);

				case 'freeplay'
					FlxG.switchState(new FreeplayState());
					trace(Freeplay Menu Selected);

				case 'donate'
					
					FlxG.switchState(new CreditsMain());
					trace(Credits Menu Selected);
					

				case 'options'
					FlxG.switchState(new OptionsMenu());
			}
		});
	}
	function changeItem(huhInt = 0)
	{
		var event = event(onChangeItem, EventManager.get(MenuChangeEvent).recycle(curSelected, FlxMath.wrap(curSelected + huh, 0, menuItems.length-1), huh, huh != 0));
		if (event.cancelled) return;

		curSelected = event.value;

		if (event.playMenuSFX)
			CoolUtil.playMenuSFX(SCROLL, 0.7);

		menuItems.forEach(function(sprFlxSprite)
		{
			spr.animation.play('idle');

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				var mid = spr.getGraphicMidpoint();
				camFollow.setPosition(mid.x, mid.y);
				mid.put();
			}

			spr.updateHitbox();
			spr.centerOffsets();
		});
	}
}