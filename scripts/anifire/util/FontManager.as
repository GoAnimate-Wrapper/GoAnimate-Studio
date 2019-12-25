package anifire.util
{
	import anifire.constant.ThemeConstants;
	import anifire.event.CoreEvent;
	import anifire.event.FontEvent;
	import anifire.event.LoadMgrEvent;
	import anifire.managers.FontVariantManager;
	import anifire.models.FontModel;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.system.SecurityDomain;
	import flash.text.Font;
	import flash.text.FontType;
	import flash.utils.ByteArray;
	import mx.events.StyleEvent;
	import mx.styles.IStyleManager2;
	import mx.styles.StyleManager;
	
	public class FontManager extends EventDispatcher
	{
		
		public static const FONT_NAME_ACCIDENTAL_PRESIDENCY:String = "Accidental Presidency";
		
		public static const FONT_NAME_ALEGREYA_SANS_SC:String = "Alegreya Sans SC";
		
		public static const FONT_NAME_ARIAL:String = "Arial";
		
		public static const FONT_NAME_BANGERS:String = "Bangers";
		
		public static const FONT_NAME_BARRIO:String = "Barrio";
		
		public static const FONT_NAME_BLAMBOT_CASUAL:String = "Blambot Casual";
		
		public static const FONT_NAME_BODONIXT:String = "BodoniXT";
		
		public static const FONT_NAME_BRAWLER:String = "Brawler";
		
		public static const FONT_NAME_BUDMO_JIGGLER:String = "Budmo Jiggler";
		
		public static const FONT_NAME_BUDMO_JIGGLISH:String = "Budmo Jigglish";
		
		public static const FONT_NAME_BUNGEE_INLINE:String = "Bungee Inline";
		
		public static const FONT_NAME_BUNGEE_SHADE:String = "Bungee Shade";
		
		public static const FONT_NAME_CLAIRE_HAND:String = "Claire Hand";
		
		public static const FONT_NAME_COMIC_BOOK:String = "Comic Book";
		
		public static const FONT_NAME_COMING_SOON:String = "Coming Soon";
		
		public static const FONT_NAME_CREEPSTER:String = "Creepster";
		
		public static const FONT_NAME_EXISTENCE_LIGHT:String = "Existence Light";
		
		public static const FONT_NAME_GLEGOO:String = "Glegoo";
		
		public static const FONT_NAME_GOCHI_HAND:String = "Gochi Hand";
		
		public static const FONT_NAME_HEARTLAND_REGULAR:String = "HeartlandRegular";
		
		public static const FONT_NAME_HONEY_SCRIPT:String = "Honey Script";
		
		public static const FONT_NAME_I_HATE_COMIC_SANS:String = "I hate Comic Sans";
		
		public static const FONT_NAME_IM_FELL_ENGLISH_SC:String = "IM Fell English SC";
		
		public static const FONT_NAME_IMPACT_LABEL:String = "Impact Label";
		
		public static const FONT_NAME_JOSEFIN:String = "Josefin";
		
		public static const FONT_NAME_KAUSHAN:String = "Kaushan";
		
		public static const FONT_NAME_LILITA_ONE:String = "Lilita One";
		
		public static const FONT_NAME_LOBSTER:String = "Lobster";
		
		public static const FONT_NAME_LOCO_TV:String = "loco tv";
		
		public static const FONT_NAME_MAIL_RAY_STUFF:String = "Mail Ray Stuff";
		
		public static const FONT_NAME_MONTSERRAT:String = "Montserrat";
		
		public static const FONT_NAME_MOUSE_MEMOIRS:String = "Mouse Memoirs";
		
		public static const FONT_NAME_OSWALD:String = "Oswald";
		
		public static const FONT_NAME_PATRICK_HAND:String = "Patrick Hand";
		
		public static const FONT_NAME_PERMANENT_MARKER:String = "Permanent Marker";
		
		public static const FONT_NAME_POIRET_ONE:String = "Poiret One";
		
		public static const FONT_NAME_RALEWAY:String = "Raleway";
		
		public static const FONT_NAME_SATISFY:String = "Satisfy";
		
		public static const FONT_NAME_SHANGHAI:String = "Shanghai";
		
		public static const FONT_NAME_SRIRACHA:String = "Sriracha";
		
		public static const FONT_NAME_TEKO:String = "Teko";
		
		public static const FONT_NAME_TELEX_REGULAR:String = "Telex Regular";
		
		public static const FONT_NAME_TOKYO:String = "Tokyo Robot Intl BB";
		
		public static const FONT_NAME_VIDALOKA:String = "Vidaloka";
		
		public static const FONT_NAME_WOOD_STAMP:String = "Wood Stamp";
		
		public static const FONT_NAME_BLACKOUT_MIDNIGHT:String = "BlackoutMidnight";
		
		public static const FONT_NAME_BLACKOUT_SUNRISE:String = "BlackoutSunrise";
		
		public static const FONT_NAME_JUNCTION:String = "Junction";
		
		public static const FONT_NAME_LEAGUE_GOTHIC:String = "LeagueGothic";
		
		public static const FONT_NAME_LEAGUE_SPARTAN:String = "LeagueSpartan";
		
		public static const FONT_NAME_OSTRICH_SANS_MEDIUM:String = "OstrichSansMedium";
		
		public static const FONT_NAME_PROCIONO:String = "Prociono";
		
		public static const FONT_NAME_LATO:String = "Lato";
		
		public static const FONT_NAME_BERKSHIRE:String = "Berkshire";
		
		public static const FONT_NAME_CAVEAT:String = "Caveat";
		
		public static const FONT_NAME_WALTER:String = "Walter";
		
		public static const FONT_NAME_NOTO:String = "Noto";
		
		public static const FONT_TYPE_SYSTEM:String = "system";
		
		public static const FONT_TYPE_GO:String = "go";
		
		public static const FONT_TYPE_GOOGLE:String = "ggoogle";
		
		public static const FONT_TYPE_USER:String = "ugc";
		
		public static const CUSTOM_FONT_ID_REGEXP:RegExp = /^ugc\.([0-9]+)$/;
		
		public static const CUSTOM_FONT_CLASS_PREFIX:String = "FontFileCustom";
		
		private static const FONT_FILE_NAME_PREFIX:String = "FontFile";
		
		private static const CFF_FONT_FILE_NAME_PREFIX:String = "CffFontFile";
		
		private static var _fontManager:FontManager;
		 
		
		private var _fontBytes:UtilHashArray;
		
		private var _fontLookup:Object;
		
		private var _fontIndexArray:Array;
		
		private var _cffFonts:Object;
		
		private var _cffQueue:Array;
		
		private var _currentCffFontName:String;
		
		private var _batchMode:Boolean;
		
		private var _logger:UtilErrorLogger;
		
		private var _customQueue:Array;
		
		private var _customFontModelLookUp:Object;
		
		private var applicationDomain:ApplicationDomain;
		
		private var loaderContext:LoaderContext;
		
		private var _fontNotSupportBold:Array;
		
		public function FontManager()
		{
			super();
			this.init();
		}
		
		public static function get instance() : FontManager
		{
			if(!_fontManager)
			{
				_fontManager = new FontManager();
			}
			return _fontManager;
		}
		
		public static function getFontManager() : FontManager
		{
			return instance;
		}
		
		public function getFonts() : UtilHashArray
		{
			return this._fontBytes;
		}
		
		public function get customQueue() : Array
		{
			return this._customQueue;
		}
		
		public function init() : void
		{
			this._logger = UtilErrorLogger.getInstance();
			this._fontBytes = new UtilHashArray();
			this._fontLookup = {};
			this._cffFonts = {};
			this._cffQueue = [];
			this._customQueue = [];
			this._customFontModelLookUp = {};
			this._fontNotSupportBold = [FONT_NAME_LEAGUE_SPARTAN,FONT_NAME_BLACKOUT_MIDNIGHT,FONT_NAME_BLACKOUT_SUNRISE,FONT_NAME_IMPACT_LABEL,FONT_NAME_OSTRICH_SANS_MEDIUM,FONT_NAME_PROCIONO,FONT_NAME_WOOD_STAMP,FONT_NAME_BERKSHIRE,FONT_NAME_CAVEAT,FONT_NAME_WALTER,FONT_NAME_GLEGOO,FONT_NAME_BARRIO,FONT_NAME_BUNGEE_INLINE,FONT_NAME_BUNGEE_SHADE,FONT_NAME_GOCHI_HAND,FONT_NAME_IM_FELL_ENGLISH_SC,FONT_NAME_KAUSHAN,FONT_NAME_LOBSTER,FONT_NAME_MOUSE_MEMOIRS,FONT_NAME_PATRICK_HAND,FONT_NAME_PERMANENT_MARKER,FONT_NAME_SATISFY,FONT_NAME_SRIRACHA,FONT_NAME_VIDALOKA,FontVariantManager.FONT_VARIANT_NOTO_CJK_TC];
			this.applicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
			this.loaderContext = new LoaderContext(true,this.applicationDomain);
			try
			{
				this.loaderContext.securityDomain = SecurityDomain.currentDomain;
				return;
			}
			catch(e:Error)
			{
				return;
			}
		}
		
		public function getFontModelByFontId(param1:String) : FontModel
		{
			return this._customFontModelLookUp[param1];
		}
		
		public function isFontLoaded(param1:String) : Boolean
		{
			return this._fontLookup[param1] != null;
		}
		
		public function isCffFontLoaded(param1:String) : Boolean
		{
			return this._cffFonts[param1] != null;
		}
		
		public function loadFontsByMovieZip(param1:Vector.<String>, param2:Vector.<ByteArray>) : void
		{
			var _loc4_:int = 0;
			var _loc5_:Loader = null;
			var _loc6_:String = null;
			var _loc7_:ByteArray = null;
			var _loc3_:UtilLoadMgr = new UtilLoadMgr();
			while(_loc4_ < param1.length)
			{
				_loc5_ = new Loader();
				_loc3_.addEventDispatcher(_loc5_.contentLoaderInfo,Event.INIT);
				_loc6_ = this.fileNameToName(param1[_loc4_]);
				_loc7_ = param2[_loc4_];
				this._fontBytes.push(_loc6_,_loc7_,false);
				_loc5_.loadBytes(_loc7_);
				_loc4_++;
			}
			_loc3_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onMovieFontsLoaded);
			_loc3_.commit();
		}
		
		private function onMovieFontsLoaded(param1:LoadMgrEvent) : void
		{
			this.updateFontList();
			(param1.target as UtilLoadMgr).removeEventListener(LoadMgrEvent.ALL_COMPLETE,this.onMovieFontsLoaded);
			dispatchEvent(new CoreEvent(CoreEvent.MOVIE_FONT_LOADED,this));
		}
		
		public function setFontAsLoaded(param1:String, param2:ByteArray) : void
		{
			this._fontBytes.push(param1,param2,false);
		}
		
		public function loadFontIfRequired(param1:String, param2:Function = null) : Boolean
		{
			if(this.isFontLoaded(param1))
			{
				if(param2 != null)
				{
					param2(null,param1);
				}
				return false;
			}
			this.loadFont(param1,param2);
			return true;
		}
		
		public function loadFont(param1:String, param2:Function = null) : void
		{
			var _loc3_:* = null;
			var _loc7_:String = null;
			var _loc8_:FontModel = null;
			var _loc9_:URLRequest = null;
			var _loc4_:Loader = new Loader();
			var _loc5_:UtilLoadMgr = new UtilLoadMgr();
			_loc5_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onFontCallBack);
			_loc5_.addEventDispatcher(_loc4_.contentLoaderInfo,Event.COMPLETE);
			_loc4_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onFontLoaded);
			var _loc6_:Object = CUSTOM_FONT_ID_REGEXP.exec(param1);
			if(_loc6_)
			{
				_loc7_ = _loc6_[1];
				_loc8_ = this.getFontModelByFontId(_loc7_);
				_loc9_ = new URLRequest();
				_loc9_.url = _loc8_.fontPathURI;
				_loc4_.name = CUSTOM_FONT_CLASS_PREFIX + _loc7_;
				_loc4_.load(_loc9_,this.loaderContext);
			}
			else
			{
				_loc4_.name = param1;
				_loc3_ = this.nameToFileName(param1) + ".swf";
				_loc4_.load(new URLRequest(UtilNetwork.getFont(_loc3_)));
			}
			_loc5_.setExtraData(new Array(param1,param2));
			_loc5_.commit();
		}
		
		private function onFontLoaded(param1:Event) : void
		{
			var _loc6_:* = undefined;
			var _loc2_:Loader = param1.target.loader as Loader;
			_loc2_.removeEventListener(Event.COMPLETE,this.onFontLoaded);
			var _loc3_:ApplicationDomain = param1.target.applicationDomain;
			try
			{
				_loc6_ = _loc3_.getDefinition(_loc2_.name) as Class;
				if(_loc6_)
				{
					Font.registerFont(_loc6_.getFont());
					dispatchEvent(new CoreEvent(CoreEvent.FONT_LOADED,this));
				}
			}
			catch(e:Error)
			{
			}
			var _loc4_:String = _loc2_.name;
			var _loc5_:ByteArray = new ByteArray();
			_loc5_.writeBytes(param1.target.bytes as ByteArray);
			this._fontBytes.push(_loc4_,_loc5_,true);
			this.updateFontList();
		}
		
		private function onFontCallBack(param1:LoadMgrEvent) : void
		{
			var _loc2_:UtilLoadMgr = param1.target as UtilLoadMgr;
			_loc2_.removeEventListener(LoadMgrEvent.ALL_COMPLETE,this.onFontCallBack);
			var _loc3_:String = (_loc2_.getExtraData() as Array)[0] as String;
			var _loc4_:Function = (_loc2_.getExtraData() as Array)[1] as Function;
			if(_loc4_ != null)
			{
				_loc4_(param1,_loc3_);
			}
		}
		
		public function addCustomFontList(param1:Array, param2:Boolean = false) : void
		{
			var _loc4_:FontModel = null;
			var _loc6_:Object = null;
			if(!param1)
			{
				return;
			}
			var _loc3_:int = param1.length;
			var _loc5_:int = 0;
			while(_loc5_ < _loc3_)
			{
				_loc6_ = param1[_loc5_];
				if(_loc6_)
				{
					_loc4_ = this.createFontModel(_loc6_);
					if(param2)
					{
						_loc4_.enabled = false;
					}
					this.addFontModel(_loc4_);
				}
				_loc5_++;
			}
			this.dispatchEvent(new FontEvent(FontEvent.USER_FONT_LIST_LOADED));
		}
		
		public function addCustomFontListByXML(param1:XMLList, param2:Boolean = false) : void
		{
			var _loc4_:FontModel = null;
			var _loc6_:XML = null;
			if(!param1)
			{
				return;
			}
			var _loc3_:int = param1.length();
			var _loc5_:int = 0;
			while(_loc5_ < _loc3_)
			{
				_loc6_ = param1[_loc5_];
				if(_loc6_)
				{
					_loc4_ = this.createFontModelByXML(_loc6_);
					if(param2)
					{
						_loc4_.enabled = false;
					}
					this.addFontModel(_loc4_);
				}
				_loc5_++;
			}
		}
		
		public function createFontModelByXML(param1:XML) : FontModel
		{
			var _loc2_:FontModel = null;
			var _loc3_:String = null;
			var _loc4_:String = null;
			if(param1)
			{
				_loc3_ = param1.@title;
				_loc4_ = ThemeConstants.UGC_THEME_ID + "." + param1.@id;
				_loc2_ = new FontModel(_loc3_,_loc4_,"",FONT_TYPE_USER);
				_loc2_.id = param1.@id;
				_loc2_.tags = param1.tags;
				_loc2_.published = param1.@published == "1";
				_loc2_.fontPathURI = param1.@fontPath;
				_loc2_.fontCffPathURI = param1.@fontCffPath;
				_loc2_.trayImageURI = param1.@trayImage;
				_loc2_.listImageURI = param1.@listImage;
				_loc2_.encAssetId = param1.@enc_asset_id;
			}
			return _loc2_;
		}
		
		public function createFontModel(param1:Object) : FontModel
		{
			var _loc2_:FontModel = null;
			var _loc3_:String = null;
			var _loc4_:String = null;
			if(param1)
			{
				_loc3_ = param1[FontModel.RESULT_TITLE];
				_loc4_ = ThemeConstants.UGC_THEME_ID + "." + param1[FontModel.RESULT_ASSETID];
				_loc2_ = new FontModel(_loc3_,_loc4_,"",FONT_TYPE_USER);
				_loc2_.id = param1[FontModel.RESULT_ASSETID];
				_loc2_.encAssetId = param1[FontModel.RESULT_ENCRYPTED_ASSET_ID];
				_loc2_.tags = param1[FontModel.RESULT_TAGS];
				_loc2_.published = param1[FontModel.RESULT_PUBLISHED] as Boolean;
				_loc2_.fontPathURI = param1[FontModel.RESULT_FONT_PATH];
				_loc2_.fontCffPathURI = param1[FontModel.RESULT_FONT_CFF_PATH];
				_loc2_.trayImageURI = param1[FontModel.RESULT_TRAY_IMAGE_PATH];
				_loc2_.listImageURI = param1[FontModel.RESULT_LIST_IMAGE_PATH];
			}
			return _loc2_;
		}
		
		public function addFontModel(param1:FontModel) : void
		{
			if(!param1)
			{
				return;
			}
			if(this._customQueue.indexOf(param1.id) == -1)
			{
				this._customQueue.push(param1.id);
				this._customFontModelLookUp[param1.id] = param1;
			}
		}
		
		public function loadCffFontList(param1:Vector.<String>) : void
		{
			this._batchMode = true;
			var _loc2_:int = param1.length;
			this._logger.info("FontManager: Load CFF Fonts (" + _loc2_ + ")");
			var _loc3_:int = 0;
			while(_loc3_ < _loc2_)
			{
				this._cffQueue.push(param1[_loc3_]);
				_loc3_++;
			}
			this.loadNextCffFont();
		}
		
		public function loadCffFont(param1:String) : void
		{
			if(this.isCffFontLoaded(param1))
			{
				this.dispatchCffFontLoaded(param1);
			}
			if(!this._currentCffFontName)
			{
				this.loadCffFontImpl(param1);
			}
			else
			{
				this._cffQueue.push(param1);
			}
		}
		
		private function loadCffFontImpl(param1:String) : void
		{
			var _loc3_:String = null;
			var _loc6_:String = null;
			var _loc7_:FontModel = null;
			var _loc8_:String = null;
			this._currentCffFontName = param1;
			var _loc2_:IStyleManager2 = StyleManager.getStyleManager(null);
			var _loc4_:Object = CUSTOM_FONT_ID_REGEXP.exec(param1);
			if(_loc4_)
			{
				_loc6_ = _loc4_[1];
				_loc7_ = this.getFontModelByFontId(_loc6_);
				_loc3_ = _loc7_.fontCffPathURI;
			}
			else
			{
				_loc8_ = this.getCffFileName(param1);
				_loc3_ = UtilNetwork.getCffFont(_loc8_ + ".swf");
			}
			var _loc5_:IEventDispatcher = _loc2_.loadStyleDeclarations(_loc3_,false,false,this.applicationDomain,SecurityDomain.currentDomain);
			_loc5_.addEventListener(StyleEvent.COMPLETE,this.onCffFontComplete);
			_loc5_.addEventListener(StyleEvent.ERROR,this.onCffFontError);
		}
		
		private function loadNextCffFont() : void
		{
			var _loc1_:String = null;
			var _loc2_:CoreEvent = null;
			while(this._cffQueue.length > 0)
			{
				_loc1_ = this._cffQueue.pop();
				if(!this.isCffFontLoaded(_loc1_))
				{
					this.loadCffFontImpl(_loc1_);
					return;
				}
			}
			if(this._batchMode)
			{
				this._batchMode = false;
				_loc2_ = new CoreEvent(CoreEvent.CFF_FONT_LIST_LOADED,this);
				dispatchEvent(_loc2_);
			}
		}
		
		private function onCffFontComplete(param1:Event) : void
		{
			param1.currentTarget.removeEventListener(StyleEvent.COMPLETE,this.onCffFontComplete);
			this._cffFonts[this._currentCffFontName] = this._currentCffFontName;
			this._logger.info("Font loaded: " + this._currentCffFontName);
			if(!this._batchMode)
			{
				this.dispatchCffFontLoaded(this._currentCffFontName);
			}
			this._currentCffFontName = null;
			this.loadNextCffFont();
		}
		
		private function onCffFontError(param1:Event) : void
		{
			this._logger.appendCustomError("FontManager#cffFontError: " + this._currentCffFontName);
			if(!this._batchMode)
			{
				this.dispatchCffFontError(this._currentCffFontName);
			}
			this._currentCffFontName = null;
			this.loadNextCffFont();
		}
		
		private function dispatchCffFontLoaded(param1:String) : void
		{
			var _loc2_:CoreEvent = new CoreEvent(CoreEvent.CFF_FONT_LOADED,this,param1);
			dispatchEvent(_loc2_);
		}
		
		private function dispatchCffFontError(param1:String) : void
		{
			var _loc2_:CoreEvent = new CoreEvent(CoreEvent.CFF_FONT_ERROR,this,param1);
			dispatchEvent(_loc2_);
		}
		
		private function fileNameToName(param1:String) : String
		{
			switch(param1)
			{
				case "FontFileCasual":
					return "Blambot Casual";
				case "FontFileBoom":
					return "BadaBoom BB";
				case "FontFileEntrails":
					return "Entrails BB";
				case "FontFileTokyo":
					return "Tokyo Robot Intl BB";
				case "FontFileAccidental":
					return "Accidental Presidency";
				case "FontFileBodoniXT":
					return "BodoniXT";
				case "FontFileBJiggler":
					return "Budmo Jiggler";
				case "FontFileBJigglish":
					return "Budmo Jigglish";
				case "FontFileExistence":
					return "Existence Light";
				case "FontFileHeartland":
					return "HeartlandRegular";
				case "FontFileHoney":
					return "Honey Script";
				case "FontFileIHate":
					return "I hate Comic Sans";
				case "FontFileImpactLabel":
					return "Impact Label";
				case "FontFileLocotv":
					return "loco tv";
				case "FontFileMailRay":
					return "Mail Ray Stuff";
				case "FontFileMia":
					return "Mia\'s Scribblings ~";
				case "FontFileShanghai":
					return "Shanghai";
				case "FontFileComicBook":
					return "Comic Book";
				case "FontFileWoodStamp":
					return "Wood Stamp";
				case "FontFileBrawler":
					return "Brawler";
				case "FontFileCSoon":
					return "Coming Soon";
				case "FontFileGlegoo":
					return "Glegoo";
				case "FontFileLOne":
					return "Lilita One";
				case "FontFileTelexx":
					return "FontFileTelex";
				case "FontFileClaireHand":
					return "Claire Hand";
				case "FontFileOswald":
					return "Oswald";
				case "FontFilePoiretOne":
					return "Poiret One";
				case "FontFileRaleway":
					return "Raleway";
				case "FontFileBangers":
					return "Bangers";
				case "FontFileCreepster":
					return "Creepster";
				case "FontFileBlackoutMidnight":
					return "BlackoutMidnight";
				case "FontFileBlackoutSunrise":
					return "BlackoutSunrise";
				case "FontFileJunction":
					return "Junction";
				case "FontFileLeagueGothic":
					return "LeagueGothic";
				case "FontFileLeagueSpartan":
					return "LeagueSpartan";
				case "FontFileOstrichSansMedium":
					return "OstrichSansMedium";
				case "FontFileProciono":
					return "Prociono";
				case "FontFileLato":
					return "Lato";
				case "FontFileAlegreyaSansSC":
					return "Alegreya Sans SC";
				case "FontFileBarrio":
					return "Barrio";
				case "FontFileBungeeInline":
					return "Bungee Inline";
				case "FontFileBungeeShade":
					return "Bungee Shade";
				case "FontFileGochiHand":
					return "Gochi Hand";
				case "FontFileIMFellEnglishSC":
					return "IM Fell English SC";
				case "FontFileJosefin":
					return "Josefin";
				case "FontFileKaushan":
					return "Kaushan";
				case "FontFileLobster":
					return "Lobster";
				case "FontFileMontserrat":
					return "Montserrat";
				case "FontFileMouseMemoirs":
					return "Mouse Memoirs";
				case "FontFilePatrickHand":
					return "Patrick Hand";
				case "FontFilePermanentMarker":
					return "Permanent Marker";
				case "FontFileSatisfy":
					return "Satisfy";
				case "FontFileSriracha":
					return "Sriracha";
				case "FontFileTeko":
					return "Teko";
				case "FontFileVidaloka":
					return "Vidaloka";
				default:
					if(param1 && param1.indexOf(FONT_FILE_NAME_PREFIX) == 0 && param1.length > FONT_FILE_NAME_PREFIX.length)
					{
						return param1.substring(FONT_FILE_NAME_PREFIX.length);
					}
					return "";
			}
		}
		
		public function nameToFileName(param1:String) : String
		{
			switch(param1)
			{
				case "Blambot Casual":
					return "FontFileCasual";
				case "BadaBoom BB":
					return "FontFileBoom";
				case "Entrails BB":
					return "FontFileEntrails";
				case "Tokyo Robot Intl BB":
					return "FontFileTokyo";
				case "Accidental Presidency":
					return "FontFileAccidental";
				case "BodoniXT":
					return "FontFileBodoniXT";
				case "Budmo Jiggler":
					return "FontFileBJiggler";
				case "Budmo Jigglish":
					return "FontFileBJigglish";
				case "Existence Light":
					return "FontFileExistence";
				case "HeartlandRegular":
					return "FontFileHeartland";
				case "Honey Script":
					return "FontFileHoney";
				case "I hate Comic Sans":
					return "FontFileIHate";
				case "Impact Label":
					return "FontFileImpactLabel";
				case "loco tv":
					return "FontFileLocotv";
				case "Mail Ray Stuff":
					return "FontFileMailRay";
				case "Mia\'s Scribblings ~":
					return "FontFileMia";
				case "Shanghai":
					return "FontFileShanghai";
				case "Comic Book":
					return "FontFileComicBook";
				case "Wood Stamp":
					return "FontFileWoodStamp";
				case "Brawler":
					return "FontFileBrawler";
				case "Coming Soon":
					return "FontFileCSoon";
				case "Glegoo":
					return "FontFileGlegoo";
				case "Lilita One":
					return "FontFileLOne";
				case "Telex Regular":
					return "FontFileTelex";
				case "Claire Hand":
					return "FontFileClaireHand";
				case "Oswald":
					return "FontFileOswald";
				case "Poiret One":
					return "FontFilePoiretOne";
				case "Raleway":
					return "FontFileRaleway";
				case "Bangers":
					return "FontFileBangers";
				case "Creepster":
					return "FontFileCreepster";
				case "BlackoutMidnight":
					return "FontFileBlackoutMidnight";
				case "BlackoutSunrise":
					return "FontFileBlackoutSunrise";
				case "Junction":
					return "FontFileJunction";
				case "LeagueGothic":
					return "FontFileLeagueGothic";
				case "LeagueSpartan":
					return "FontFileLeagueSpartan";
				case "OstrichSansMedium":
					return "FontFileOstrichSansMedium";
				case "Prociono":
					return "FontFileProciono";
				case "Lato":
					return "FontFileLato";
				case "Alegreya Sans SC":
					return "FontFileAlegreyaSansSC";
				case "Barrio":
					return "FontFileBarrio";
				case "Bungee Inline":
					return "FontFileBungeeInline";
				case "Bungee Shade":
					return "FontFileBungeeShade";
				case "Gochi Hand":
					return "FontFileGochiHand";
				case "IM Fell English SC":
					return "FontFileIMFellEnglishSC";
				case "Josefin":
					return "FontFileJosefin";
				case "Kaushan":
					return "FontFileKaushan";
				case "Lobster":
					return "FontFileLobster";
				case "Montserrat":
					return "FontFileMontserrat";
				case "Mouse Memoirs":
					return "FontFileMouseMemoirs";
				case "Patrick Hand":
					return "FontFilePatrickHand";
				case "Permanent Marker":
					return "FontFilePermanentMarker";
				case "Satisfy":
					return "FontFileSatisfy";
				case "Sriracha":
					return "FontFileSriracha";
				case "Teko":
					return "FontFileTeko";
				case "Vidaloka":
					return "FontFileVidaloka";
				default:
					if(param1)
					{
						return FONT_FILE_NAME_PREFIX + param1;
					}
					return "";
			}
		}
		
		public function getCffFileName(param1:String) : String
		{
			switch(param1)
			{
				case "Arial":
					return "arial";
				case "Blambot Casual":
					return "causal";
				case "BadaBoom BB":
					return "boom";
				case "Entrails BB":
					return "entrails";
				case "Tokyo Robot Intl BB":
					return "tokyo";
				case "Accidental Presidency":
					return "accidental";
				case "BodoniXT":
					return "bodoni_xt";
				case "Budmo Jiggler":
					return "bjiggler";
				case "Budmo Jigglish":
					return "bjigglish";
				case "Existence Light":
					return "existence";
				case "HeartlandRegular":
					return "heartland";
				case "Honey Script":
					return "honey";
				case "I hate Comic Sans":
					return "ihate";
				case "Impact Label":
					return "impact_label";
				case "loco tv":
					return "locotv";
				case "Mail Ray Stuff":
					return "mail_ray";
				case "Mia\'s Scribblings ~":
					return "mia";
				case "Shanghai":
					return "shanghai";
				case "Comic Book":
					return "comic_book";
				case "Wood Stamp":
					return "wood_stamp";
				case "Brawler":
					return "brawler";
				case "Coming Soon":
					return "coming_soon";
				case "Glegoo":
					return "glegoo";
				case "Lilita One":
					return "lilita_one";
				case "Telex Regular":
					return "telex";
				case "Claire Hand":
					return "claire_hand";
				case "Oswald":
					return "oswald";
				case "Poiret One":
					return "poiretone";
				case "Raleway":
					return "raleway";
				case "Bangers":
					return "bangers";
				case "Creepster":
					return "creepster";
				case "BlackoutMidnight":
					return "blackoutmidnight";
				case "BlackoutSunrise":
					return "backoutsunrise";
				case "Junction":
					return "junction";
				case "LeagueGothic":
					return "leaguegothic";
				case "LeagueSpartan":
					return "leaguespartan";
				case "OstrichSansMedium":
					return "ostrichsansmedium";
				case "Prociono":
					return "prociono";
				case "Lato":
					return "lato";
				case "Alegreya Sans SC":
					return "alegreyasanssc";
				case "Barrio":
					return "barrio";
				case "Bungee Inline":
					return "bungeeinline";
				case "Bungee Shade":
					return "bungeeshade";
				case "Gochi Hand":
					return "gochihand";
				case "IM Fell English SC":
					return "imfellenglishsc";
				case "Josefin":
					return "josefin";
				case "Kaushan":
					return "kaushan";
				case "Lobster":
					return "lobster";
				case "Montserrat":
					return "montserrat";
				case "Mouse Memoirs":
					return "mousememoirs";
				case "Patrick Hand":
					return "patrickhand";
				case "Permanent Marker":
					return "permanentmarker";
				case "Satisfy":
					return "satisfy";
				case "Sriracha":
					return "sriracha";
				case "Teko":
					return "teko";
				case "Vidaloka":
					return "vidaloka";
				default:
					if(param1)
					{
						return CFF_FONT_FILE_NAME_PREFIX + param1;
					}
					return "";
			}
		}
		
		public function getFontByName(param1:String) : Font
		{
			return this._fontLookup[param1];
		}
		
		private function updateFontList() : void
		{
			var _loc2_:int = 0;
			var _loc3_:int = 0;
			var _loc4_:Font = null;
			var _loc1_:Array = Font.enumerateFonts();
			if(_loc1_)
			{
				_loc2_ = _loc1_.length;
				_loc3_ = 0;
				while(_loc3_ < _loc2_)
				{
					_loc4_ = _loc1_[_loc3_];
					if(_loc4_.fontType == FontType.EMBEDDED)
					{
						this._fontLookup[_loc4_.fontName] = _loc4_;
					}
					_loc3_++;
				}
			}
		}
		
		public function isUserFont(param1:String) : Boolean
		{
			var _loc2_:Object = null;
			if(param1)
			{
				_loc2_ = CUSTOM_FONT_ID_REGEXP.exec(param1);
				return _loc2_ != null;
			}
			return false;
		}
		
		public function supportBold(param1:String) : Boolean
		{
			if(param1)
			{
				return this._fontNotSupportBold.indexOf(param1) < 0;
			}
			return false;
		}
	}
}
