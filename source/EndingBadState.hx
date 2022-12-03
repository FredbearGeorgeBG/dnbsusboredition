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

class EndingBadState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('endings/bad'));
		bg.updateHitbox();
		bg.screenCenter();
		add(bg);
	}

	override function update(elapsed:Float)
	{
			if (controls.ACCEPT) {
					FlxG.sound.play(Paths.sound('confirmMenu'));
						MusicBeatState.switchState(new StoryMenuState());
			}
	}
}