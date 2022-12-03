package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flash.system.System;

class WarningIntroState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width, "Hey there thanks for downloading the mod and\nalso theres a eyesore in the songs if you dont like eyesores\nPress G to disable it - Press Q to leave\nPress Enter to Continue - Press Back to Back to title\nPress N to turn off/on warnings");
		warnText.setFormat(Paths.font("comic.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		warnText.screenCenter();
		add(warnText);
	}

	override function update(elapsed:Float)
	{
			if (controls.ACCEPT) {
				FlxG.sound.play(Paths.sound('confirmMenu'));
					MusicBeatState.switchState(new MainMenuState());
			}

			if (controls.BACK) {
				FlxG.sound.play(Paths.sound('cancelMenu'));
					MusicBeatState.switchState(new TitleState());
			}

			if (FlxG.keys.justPressed.G)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'));
					ClientPrefs.eyesores = !ClientPrefs.eyesores;
			}

			if (FlxG.keys.justPressed.Q)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
        				System.exit(0);
			}

			if (FlxG.keys.justPressed.N)
			{
				FlxG.sound.play(Paths.sound('confirmMenu'));
					ClientPrefs.warnings = !ClientPrefs.warnings;
			}
	}
}