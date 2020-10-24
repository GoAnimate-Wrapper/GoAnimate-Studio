package anifire.studio.components
{
	import anifire.constant.ThemeConstants;
	import anifire.models.FontModel;
	import anifire.util.FontManager;
	import mx.binding.BindingManager;
	import mx.core.IFlexModuleFactory;
	import mx.events.PropertyChangeEvent;
	import spark.primitives.BitmapImage;
	
	public class BubbleThumbSparkImage extends ThumbImageBase
	{
		
		private static const imgAccidental:Class = BubbleThumbSparkImage_imgAccidental;
		
		private static const imgArial:Class = BubbleThumbSparkImage_imgArial;
		
		private static const imgBangers:Class = BubbleThumbSparkImage_imgBangers;
		
		private static const imgBodoniXT:Class = BubbleThumbSparkImage_imgBodoniXT;
		
		private static const imgBrawler:Class = BubbleThumbSparkImage_imgBrawler;
		
		private static const imgBudmoJiggler:Class = BubbleThumbSparkImage_imgBudmoJiggler;
		
		private static const imgBudmoJigglish:Class = BubbleThumbSparkImage_imgBudmoJigglish;
		
		private static const imgBlackoutMidnight:Class = BubbleThumbSparkImage_imgBlackoutMidnight;
		
		private static const imgBlackoutSunrise:Class = BubbleThumbSparkImage_imgBlackoutSunrise;
		
		private static const imgBlambotCasual:Class = BubbleThumbSparkImage_imgBlambotCasual;
		
		private static const imgClaireHand:Class = BubbleThumbSparkImage_imgClaireHand;
		
		private static const imgComicBook:Class = BubbleThumbSparkImage_imgComicBook;
		
		private static const imgComingSoon:Class = BubbleThumbSparkImage_imgComingSoon;
		
		private static const imgCreepster:Class = BubbleThumbSparkImage_imgCreepster;
		
		private static const imgExistenceLight:Class = BubbleThumbSparkImage_imgExistenceLight;
		
		private static const imgGlegoo:Class = BubbleThumbSparkImage_imgGlegoo;
		
		private static const imgHeartlandRegular:Class = BubbleThumbSparkImage_imgHeartlandRegular;
		
		private static const imgHoney:Class = BubbleThumbSparkImage_imgHoney;
		
		private static const imgIHate:Class = BubbleThumbSparkImage_imgIHate;
		
		private static const imgImpactLabel:Class = BubbleThumbSparkImage_imgImpactLabel;
		
		private static const imgJunction:Class = BubbleThumbSparkImage_imgJunction;
		
		private static const imgLato:Class = BubbleThumbSparkImage_imgLato;
		
		private static const imgLeagueGothic:Class = BubbleThumbSparkImage_imgLeagueGothic;
		
		private static const imgLeagueSpartan:Class = BubbleThumbSparkImage_imgLeagueSpartan;
		
		private static const imgLilitaOne:Class = BubbleThumbSparkImage_imgLilitaOne;
		
		private static const imgLocoTV:Class = BubbleThumbSparkImage_imgLocoTV;
		
		private static const imgMailRayStuff:Class = BubbleThumbSparkImage_imgMailRayStuff;
		
		private static const imgOswald:Class = BubbleThumbSparkImage_imgOswald;
		
		private static const imgOstrichSansMedium:Class = BubbleThumbSparkImage_imgOstrichSansMedium;
		
		private static const imgPoiretOne:Class = BubbleThumbSparkImage_imgPoiretOne;
		
		private static const imgProciono:Class = BubbleThumbSparkImage_imgProciono;
		
		private static const imgRaleway:Class = BubbleThumbSparkImage_imgRaleway;
		
		private static const imgShanghai:Class = BubbleThumbSparkImage_imgShanghai;
		
		private static const imgTelexRegular:Class = BubbleThumbSparkImage_imgTelexRegular;
		
		private static const imgTokyo:Class = BubbleThumbSparkImage_imgTokyo;
		
		private static const imgWoodStamp:Class = BubbleThumbSparkImage_imgWoodStamp;
		
		private static const imgBerkshire:Class = BubbleThumbSparkImage_imgBerkshire;
		
		private static const imgCaveat:Class = BubbleThumbSparkImage_imgCaveat;
		
		private static const imgWalter:Class = BubbleThumbSparkImage_imgWalter;
		
		private static const imgNoto:Class = BubbleThumbSparkImage_imgNoto;
		
		private static const imgBubbleBlambotCasual:Class = BubbleThumbSparkImage_imgBubbleBlambotCasual;
		
		private static const imgBubbleClaireHand:Class = BubbleThumbSparkImage_imgBubbleClaireHand;
		
		private static const imgBubbleComingSoon:Class = BubbleThumbSparkImage_imgBubbleComingSoon;
		
		private static const imgSpeech1:Class = BubbleThumbSparkImage_imgSpeech1;
		
		private static const imgSpeech2:Class = BubbleThumbSparkImage_imgSpeech2;
		
		private static const imgSpeech3:Class = BubbleThumbSparkImage_imgSpeech3;
		
		private static const imgSpeech4:Class = BubbleThumbSparkImage_imgSpeech4;
		
		private static const imgSpeech5:Class = BubbleThumbSparkImage_imgSpeech5;
		
		private static const imgSpeech6:Class = BubbleThumbSparkImage_imgSpeech6;
		
		private static const imgSpeech7:Class = BubbleThumbSparkImage_imgSpeech7;
		
		private static const imgSpeech8:Class = BubbleThumbSparkImage_imgSpeech8;
		
		private static const imgSpeech9:Class = BubbleThumbSparkImage_imgSpeech9;
		
		private static const imgSpeech10:Class = BubbleThumbSparkImage_imgSpeech10;
		
		private static const imgSpeech11:Class = BubbleThumbSparkImage_imgSpeech11;
		
		private static const imgSpeech12:Class = BubbleThumbSparkImage_imgSpeech12;
		
		private static var _imageClassLookup:Object;
		 
		
		private var _2024940825imageDisplay:BitmapImage;
		
		private var __moduleFactoryInitialized:Boolean = false;
		
		public function BubbleThumbSparkImage()
		{
			super();
			mx_internal::_document = this;
			this.mxmlContent = [this._BubbleThumbSparkImage_BitmapImage1_i()];
		}
		
		override public function set moduleFactory(param1:IFlexModuleFactory) : void
		{
			super.moduleFactory = param1;
			if(this.__moduleFactoryInitialized)
			{
				return;
			}
			this.__moduleFactoryInitialized = true;
		}
		
		override public function initialize() : void
		{
			super.initialize();
		}
		
		protected function getImageClass(param1:String) : Class
		{
			switch(param1)
			{
				case "blank2":
					return imgWoodStamp;
				case "blank3":
					return imgGlegoo;
				case "blank4":
					return imgHoney;
				case "blank5":
					return imgIHate;
				case "blank6":
					return imgNoto;
				case "blank7":
					return imgLilitaOne;
				case "blank8":
					return imgCaveat;
				case "blank9":
					return imgBubbleClaireHand;
				case "blank10":
					return imgBubbleBlambotCasual;
				case "blank11":
					return imgOstrichSansMedium;
				case "blank12":
					return imgTelexRegular;
				case "blank13":
					return imgLato;
				case "blank14":
					return imgRaleway;
				case "ellipse":
					return imgSpeech1;
				case "roundRect":
					return imgSpeech3;
				case "rect":
					return imgSpeech2;
				case "cloud":
					return imgSpeech4;
				case "heart":
					return imgSpeech6;
				case "boom":
					return imgSpeech5;
				case "blanktail":
					return imgSpeech12;
				case "ellipse2":
					return imgSpeech9;
				case "roundRect2":
					return imgSpeech7;
				case "rect2":
					return imgSpeech11;
				case "cloud2":
					return imgSpeech8;
				case "heart2":
					return imgSpeech10;
				default:
					return null;
			}
		}
		
		protected function getImageClassByFontName(param1:String) : Class
		{
			if(!_imageClassLookup)
			{
				_imageClassLookup = {};
				_imageClassLookup[FontManager.FONT_NAME_ACCIDENTAL_PRESIDENCY] = imgAccidental;
				_imageClassLookup[FontManager.FONT_NAME_ARIAL] = imgArial;
				_imageClassLookup[FontManager.FONT_NAME_BANGERS] = imgBangers;
				_imageClassLookup[FontManager.FONT_NAME_BLAMBOT_CASUAL] = imgBlambotCasual;
				_imageClassLookup[FontManager.FONT_NAME_BODONIXT] = imgBodoniXT;
				_imageClassLookup[FontManager.FONT_NAME_BRAWLER] = imgBrawler;
				_imageClassLookup[FontManager.FONT_NAME_BUDMO_JIGGLER] = imgBudmoJiggler;
				_imageClassLookup[FontManager.FONT_NAME_BUDMO_JIGGLISH] = imgBudmoJigglish;
				_imageClassLookup[FontManager.FONT_NAME_CLAIRE_HAND] = imgClaireHand;
				_imageClassLookup[FontManager.FONT_NAME_COMIC_BOOK] = imgComicBook;
				_imageClassLookup[FontManager.FONT_NAME_COMING_SOON] = imgComingSoon;
				_imageClassLookup[FontManager.FONT_NAME_CREEPSTER] = imgCreepster;
				_imageClassLookup[FontManager.FONT_NAME_EXISTENCE_LIGHT] = imgExistenceLight;
				_imageClassLookup[FontManager.FONT_NAME_GLEGOO] = imgGlegoo;
				_imageClassLookup[FontManager.FONT_NAME_HEARTLAND_REGULAR] = imgHeartlandRegular;
				_imageClassLookup[FontManager.FONT_NAME_HONEY_SCRIPT] = imgHoney;
				_imageClassLookup[FontManager.FONT_NAME_I_HATE_COMIC_SANS] = imgIHate;
				_imageClassLookup[FontManager.FONT_NAME_IMPACT_LABEL] = imgImpactLabel;
				_imageClassLookup[FontManager.FONT_NAME_LILITA_ONE] = imgLilitaOne;
				_imageClassLookup[FontManager.FONT_NAME_LOCO_TV] = imgLocoTV;
				_imageClassLookup[FontManager.FONT_NAME_MAIL_RAY_STUFF] = imgMailRayStuff;
				_imageClassLookup[FontManager.FONT_NAME_OSWALD] = imgOswald;
				_imageClassLookup[FontManager.FONT_NAME_POIRET_ONE] = imgPoiretOne;
				_imageClassLookup[FontManager.FONT_NAME_RALEWAY] = imgRaleway;
				_imageClassLookup[FontManager.FONT_NAME_SHANGHAI] = imgShanghai;
				_imageClassLookup[FontManager.FONT_NAME_TELEX_REGULAR] = imgTelexRegular;
				_imageClassLookup[FontManager.FONT_NAME_TOKYO] = imgTokyo;
				_imageClassLookup[FontManager.FONT_NAME_WOOD_STAMP] = imgWoodStamp;
				_imageClassLookup[FontManager.FONT_NAME_BLACKOUT_MIDNIGHT] = imgBlackoutMidnight;
				_imageClassLookup[FontManager.FONT_NAME_BLACKOUT_SUNRISE] = imgBlackoutSunrise;
				_imageClassLookup[FontManager.FONT_NAME_JUNCTION] = imgJunction;
				_imageClassLookup[FontManager.FONT_NAME_LATO] = imgLato;
				_imageClassLookup[FontManager.FONT_NAME_LEAGUE_GOTHIC] = imgLeagueGothic;
				_imageClassLookup[FontManager.FONT_NAME_LEAGUE_SPARTAN] = imgLeagueSpartan;
				_imageClassLookup[FontManager.FONT_NAME_OSTRICH_SANS_MEDIUM] = imgOstrichSansMedium;
				_imageClassLookup[FontManager.FONT_NAME_PROCIONO] = imgProciono;
				_imageClassLookup[FontManager.FONT_NAME_BERKSHIRE] = imgBerkshire;
				_imageClassLookup[FontManager.FONT_NAME_CAVEAT] = imgCaveat;
				_imageClassLookup[FontManager.FONT_NAME_WALTER] = imgWalter;
				_imageClassLookup[FontManager.FONT_NAME_NOTO] = imgNoto;
			}
			return _imageClassLookup[param1];
		}
		
		override protected function loadProductImage() : void
		{
			var _loc1_:Object = null;
			var _loc2_:String = null;
			var _loc3_:FontModel = null;
			var _loc4_:Class = null;
			if(_product.theme && _product.theme.id == ThemeConstants.UGC_THEME_ID)
			{
				_loc1_ = FontManager.CUSTOM_FONT_ID_REGEXP.exec(_product.id);
				if(_loc1_)
				{
					_loc2_ = _loc1_[1];
					_loc3_ = FontManager.getFontManager().getFontModelByFontId(_loc2_);
					this.imageDisplay.source = _loc3_.trayImageURI;
				}
			}
			else
			{
				_loc4_ = this.getImageClass(_product.id);
				if(!_loc4_)
				{
					_loc4_ = this.getImageClassByFontName(_product.id);
				}
				this.imageDisplay.source = _loc4_;
			}
		}
		
		override protected function removeImage() : void
		{
			this.imageDisplay.source = null;
		}
		
		private function _BubbleThumbSparkImage_BitmapImage1_i() : BitmapImage
		{
			var _loc1_:BitmapImage = new BitmapImage();
			_loc1_.left = 0;
			_loc1_.right = 0;
			_loc1_.top = 0;
			_loc1_.bottom = 0;
			_loc1_.initialized(this,"imageDisplay");
			this.imageDisplay = _loc1_;
			BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
			return _loc1_;
		}
		
		[Bindable(event="propertyChange")]
		public function get imageDisplay() : BitmapImage
		{
			return this._2024940825imageDisplay;
		}
		
		public function set imageDisplay(param1:BitmapImage) : void
		{
			var _loc2_:Object = this._2024940825imageDisplay;
			if(_loc2_ !== param1)
			{
				this._2024940825imageDisplay = param1;
				if(this.hasEventListener("propertyChange"))
				{
					this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDisplay",_loc2_,param1));
				}
			}
		}
	}
}
