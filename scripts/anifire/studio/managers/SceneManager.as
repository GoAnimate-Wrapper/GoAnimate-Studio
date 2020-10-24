package anifire.studio.managers
{
	import anifire.constant.AnimeConstants;
	import anifire.constant.LicenseConstants;
	import anifire.studio.components.ComplexityPopUp;
	import anifire.studio.core.AnimeScene;
	import anifire.studio.core.Asset;
	import anifire.studio.core.Console;
	import anifire.studio.core.EffectThumb;
	import anifire.studio.core.ProgramEffectAsset;
	import anifire.studio.core.Theme;
	import anifire.util.UtilDict;
	import anifire.util.UtilErrorLogger;
	import flash.display.DisplayObjectContainer;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import mx.core.FlexGlobals;
	
	public class SceneManager extends EventDispatcher
	{
		
		private static var _copiedScene:String = null;
		
		private static var _hasShownSceneNumMildWarning:Boolean = false;
		
		private static var _hasShownSceneNumSeriousWarning:Boolean = false;
		
		private static var _hasShownDurationWarning:Boolean = false;
		
		private static var _hasShownCameraWarning:Boolean = false;
		 
		
		public function SceneManager(param1:IEventDispatcher = null)
		{
			super(param1);
		}
		
		public static function get copiedScene() : String
		{
			return _copiedScene;
		}
		
		public static function set copiedScene(param1:String) : void
		{
			_copiedScene = param1;
		}
		
		public static function copyScene(param1:AnimeScene) : void
		{
			var scene:AnimeScene = param1;
			try
			{
				if(scene)
				{
					_copiedScene = scene.serialize(-1,false);
				}
				return;
			}
			catch(e:Error)
			{
				_copiedScene = null;
				UtilErrorLogger.getInstance().appendCustomError("SceneManager:copyScene",e);
				return;
			}
		}
		
		public static function addDefaultZoomEffect(param1:AnimeScene) : void
		{
			var _loc3_:EffectThumb = null;
			var _loc4_:ProgramEffectAsset = null;
			var _loc2_:Theme = ThemeManager.instance.commonTheme;
			if(_loc2_)
			{
				_loc3_ = _loc2_.getEffectThumbById("cut");
				if(_loc3_)
				{
					_loc4_ = new ProgramEffectAsset();
					_loc4_.thumb = _loc3_;
					_loc4_.scene = param1;
					_loc4_.x = AnimeConstants.SCREEN_X;
					_loc4_.y = !!LicenseConstants.isWideScreen()?Number(AnimeConstants.WIDE_SCREEN_Y):Number(AnimeConstants.SCREEN_Y);
					_loc4_.width = AnimeConstants.SCREEN_WIDTH;
					_loc4_.height = !!LicenseConstants.isWideScreen()?Number(AnimeConstants.WIDE_SCREEN_HEIGHT):Number(AnimeConstants.SCREEN_HEIGHT);
					_loc4_.startDuration = param1.duration;
					param1.addAsset(_loc4_);
				}
			}
		}
		
		public static function addDefaultAssetsToScene(param1:Theme, param2:AnimeScene) : Boolean
		{
			var _loc3_:Asset = null;
			if(param1 && param2 && param1.defaultBgThumb)
			{
				if(param1.defaultBgThumb.isComposite && (param1.defaultBgThumb.isWhiteboardAsset || param1.defaultBgThumb.isInfographicAsset))
				{
					param2.addTransitionForCompositeBg = true;
				}
				if(param1.defaultBgThumb.isThemeStarter)
				{
					Console.getConsole().addStarter(param1.defaultBgThumb,0,true,true);
					return true;
				}
				_loc3_ = param2.createAsset(param1.defaultBgThumb);
				if(_loc3_)
				{
					param2.addAsset(_loc3_);
				}
			}
			return false;
		}
		
		public static function checkSceneNum(param1:int) : void
		{
			var _loc4_:String = null;
			var _loc2_:int = 150;
			var _loc3_:int = 200;
			if(param1 < _loc2_)
			{
				return;
			}
			if(param1 >= _loc3_)
			{
				if(_hasShownSceneNumSeriousWarning)
				{
					return;
				}
				_hasShownSceneNumSeriousWarning = true;
				_loc4_ = UtilDict.toDisplay("go","Your video contains 200 scenes or more. Please save often to avoid losing work.\n\nBecause of the length, some features in this video maker will slow down. In addition, you may experience issues with downloading and exporting this video.\n\nWe recommend splitting this project into multiple, shorter episodes to ensure the best quality possible. You can do this by using the \"Copy Video\" option in the Full Video Maker and then deleting extra scenes in your additional video(s).\n\nWhile we realize this is not an ideal solution for you, it will serve to make your experience the best it can be while using our site as-is. For our part, we will continue to work on supporting longer videos such as yours and to make general site improvements.\n\nThanks in advance for your understanding.");
			}
			else if(param1 >= _loc2_)
			{
				if(_hasShownSceneNumMildWarning)
				{
					return;
				}
				_hasShownSceneNumMildWarning = true;
				_loc4_ = UtilDict.toDisplay("go","Your video contains 150 scenes or more. Because of the length, some features in this video maker will slow down. In addition, you may experience issues with downloading and exporting this video.\n\nWe recommend splitting this project into multiple, shorter episodes to ensure the best quality possible. You can do this by using the \"Copy Video\" option in the Full Video Maker and then deleting extra scenes in your additional video(s).\n\nWhile we realize this is not an ideal solution for you, it will serve to make your experience the best it can be while using our site as-is. For our part, we will continue to work on supporting longer videos such as yours and to make general site improvements.\n\nThanks in advance for your understanding.");
			}
			displayPopUp(_loc4_);
		}
		
		public static function checkMovieDuration(param1:Number) : void
		{
			if(_hasShownDurationWarning)
			{
				return;
			}
			var _loc2_:Number = 12 * 60;
			if(param1 > _loc2_)
			{
				_hasShownDurationWarning = true;
				displayPopUp(UtilDict.toDisplay("go","Your video is exceeding twelve minutes. Because of the length, some features in this video maker will slow down. In addition, you may experience issues with downloading and exporting this video.\n\nWe recommend splitting this project into multiple, shorter episodes to ensure the best quality possible. You can do this by using the \"Copy Video\" option in the Full Video Maker and then deleting extra scenes in your additional video(s).\n\nWhile we realize this is not an ideal solution for you, it will serve to make your experience the best it can be while using our site as-is. For our part, we will continue to work on supporting longer videos such as yours and to make general site improvements.\n\nThanks in advance for your understanding."));
			}
		}
		
		public static function checkCameraSize(param1:Number) : void
		{
			if(_hasShownCameraWarning)
			{
				return;
			}
			var _loc2_:Number = 60;
			if(param1 < _loc2_)
			{
				_hasShownCameraWarning = true;
				displayPopUp(UtilDict.toDisplay("go","We don\'t recommend zooming this far. It could slow down the video maker and may also prevent you from downloading this video.\n\nSorry for any inconvenience. We are always working to improve your experience with GoAnimate."));
			}
		}
		
		private static function displayPopUp(param1:String) : void
		{
			var _loc2_:ComplexityPopUp = new ComplexityPopUp();
			_loc2_.createDefaultPopUp();
			_loc2_.message = param1;
			_loc2_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
		}
	}
}
