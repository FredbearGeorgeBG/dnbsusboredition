package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.effects.FlxFlicker;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class FreeplaySelectorState extends MusicBeatState
{
	var options:Array<String> = ['main', 'joke', 'base'];
	private var grpOptions:FlxTypedGroup<Alphabet>;
	private static var curSelected:Int = 0;
	public static var menuBG:FlxSprite;
	var sectionImage:FlxSprite;

	override function create() {
		#if desktop
		DiscordClient.changePresence("in The Menus", null);
		#end

		menuBG = new FlxSprite().loadGraphic(Paths.image('freeplaybackgrounds/menuFreeplay_' + options[curSelected]));
		menuBG.color = 0xFFD80000;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = ClientPrefs.globalAntialiasing;
		add(menuBG);

		sectionImage = new FlxSprite(0, 150).loadGraphic(Paths.image('freeplayselector/week_icons_' + options[curSelected]));
		sectionImage.screenCenter();
		add(sectionImage);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...options.length)
		{
			var optionText:Alphabet = new Alphabet(0, 0, options[i], true, false);
			optionText.screenCenter(Y);
			optionText.x = 100;
			optionText.y += (100 * (i - (options.length / 2))) + 50;
			grpOptions.add(optionText);
		}
		changeSelection();

		super.create();
	}

	override function closeSubState() {
		super.closeSubState();
		ClientPrefs.saveSettings();
		changeSelection();
	}

	override function update(elapsed:Float) {

		super.update(elapsed);

		menuBG.loadGraphic(Paths.image('freeplaybackgrounds/menuFreeplay_' + options[curSelected]));
		menuBG.color = 0xFFD80000;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = ClientPrefs.globalAntialiasing;
		add(menuBG);

		sectionImage.loadGraphic(Paths.image('freeplayselector/week_icons_' + options[curSelected]));
		sectionImage.screenCenter();
		add(sectionImage);

		if (controls.UI_UP_P) {
			FlxG.sound.play(Paths.sound('scrollMenu'));
			changeSelection(-1);
		}
		if (controls.UI_DOWN_P) {
			FlxG.sound.play(Paths.sound('scrollMenu'));
			changeSelection(1);
		}

		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}

		if (controls.ACCEPT) {
			for (item in grpOptions.members) {
				item.alpha = 0;
			}

			FlxG.sound.play(Paths.sound('confirmMenu'));
			remove(sectionImage);

			switch(options[curSelected]) {
				case 'main':
					MusicBeatState.switchState(new FreeplayState());

				case 'joke':
					MusicBeatState.switchState(new FreeplayState2());

				case 'base':
					MusicBeatState.switchState(new FreeplayState3());
			}
		}
	}
	
	function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = options.length - 1;
		if (curSelected >= options.length)
			curSelected = 0;

		var bullShit:Int = 0;

		for (item in grpOptions.members) {
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;
			if (item.targetY == 0) {
				item.alpha = 1;
			}
		}
	}
}