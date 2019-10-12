package anifire.studio.core
{
   import anifire.constant.AnimeConstants;
   import anifire.constant.ProductConstants;
   import anifire.constant.ServerConstants;
   import anifire.constant.ThemeConstants;
   import anifire.errors.SerializeError;
   import anifire.event.CoreEvent;
   import anifire.studio.core.sound.EmbedSound;
   import anifire.studio.core.sound.ISoundable;
   import anifire.studio.core.sound.ProgressiveSound;
   import anifire.studio.core.sound.SoundEvent;
   import anifire.studio.core.sound.SoundWaveformData;
   import anifire.studio.core.sound.StreamSound;
   import anifire.studio.managers.AccessRightManager;
   import anifire.studio.managers.SearchManager;
   import anifire.studio.managers.StudioSoundManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.util.UtilNetwork;
   import anifire.util.UtilSite;
   import anifire.util.UtilUnitConvert;
   import anifire.util.UtilUser;
   import anifire.util.UtilXmlInfo;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.ProgressEvent;
   import flash.utils.ByteArray;
   import mx.events.PropertyChangeEvent;
   
   public class SoundThumb extends Thumb
   {
      
      public static const DRAG_DATA_FORMAT:String = "soundThumb";
      
      public static const XML_NODE_NAME:String = "sound";
      
      public static const XML_NODE_VARIATION_NAME:String = "variation";
      
      public static const VALUE_ISGOTEAM_TRUE:String = "1";
       
      
      private var _sound:ISoundable;
      
      private var _lengthFrame:Number = -1;
      
      private var _subType:String;
      
      private var _isLoading:Boolean = false;
      
      private var _downloadType:String;
      
      private var _totalFrame:int = 0;
      
      private var _ttsData:SpeechData;
      
      private var _waveform:SoundWaveformData;
      
      private var _previewOnly:Boolean;
      
      private var _goTeamOnly:Boolean;
      
      private var _variations:Vector.<String>;
      
      private var _isVariation:Boolean;
      
      private var _isVariationListOpen:Boolean;
      
      public function SoundThumb()
      {
         this._variations = new Vector.<String>();
         super();
      }
      
      private static function createSoundObj(param1:SoundThumb) : ISoundable
      {
         if(param1.downloadType == AnimeConstants.DOWNLOAD_TYPE_PROGRESSIVE)
         {
            return new ProgressiveSound();
         }
         if(param1.downloadType == AnimeConstants.DOWNLOAD_TYPE_EMBED)
         {
            return new EmbedSound();
         }
         if(param1.downloadType == AnimeConstants.DOWNLOAD_TYPE_STREAM)
         {
            return new StreamSound();
         }
         return null;
      }
      
      public static function initSoundObj(param1:ISoundable, param2:SoundThumb) : void
      {
         var _loc3_:ProgressiveSound = null;
         var _loc4_:StreamSound = null;
         var _loc5_:EmbedSound = null;
         if(param2.downloadType == AnimeConstants.DOWNLOAD_TYPE_PROGRESSIVE)
         {
            _loc3_ = param1 as ProgressiveSound;
            _loc3_.init(UtilNetwork.getGetSoundAssetRequest(param2.theme.id,param2.theme.id == ThemeConstants.UGC_THEME_ID?param2.encAssetId:param2.id,param2.downloadType,param2.signature),param2.duration,param2.subType);
         }
         else if(param2.downloadType == AnimeConstants.DOWNLOAD_TYPE_STREAM)
         {
            _loc4_ = param1 as StreamSound;
            _loc4_.init(ServerConstants.ACTION_GET_STREAM_SOUND,param2.id,param2.duration);
         }
         else if(param2.downloadType == AnimeConstants.DOWNLOAD_TYPE_EMBED)
         {
            _loc5_ = param1 as EmbedSound;
            if(param2.imageData != null)
            {
               _loc5_.initByByteArray(param2.imageData as ByteArray);
            }
            else
            {
               _loc5_.addEventListener(ProgressEvent.PROGRESS,Console.getConsole().showProgress);
               _loc5_.initByUrl(UtilNetwork.getGetSoundAssetRequest(param2.theme.id,param2.theme.id == ThemeConstants.UGC_THEME_ID?param2.encAssetId:param2.id,param2.downloadType,param2.signature),false,param2.theme.id != "ugc");
            }
         }
      }
      
      public function get isVariationListOpen() : Boolean
      {
         return this._isVariationListOpen;
      }
      
      public function set isVariationListOpen(param1:Boolean) : void
      {
         this._isVariationListOpen = param1;
      }
      
      public function set previewOnly(param1:Boolean) : void
      {
         this._previewOnly = param1;
      }
      
      public function get variations() : Vector.<String>
      {
         return this._variations;
      }
      
      public function get isVariation() : Boolean
      {
         return this._isVariation;
      }
      
      [Bindable(event="propertyChange")]
      public function get goTeamOnly() : Boolean
      {
         return this._goTeamOnly;
      }
      
      private function set _865888433goTeamOnly(param1:Boolean) : void
      {
         this._goTeamOnly = param1;
      }
      
      public function get previewOnly() : Boolean
      {
         return this._previewOnly;
      }
      
      public function get ttsData() : SpeechData
      {
         return this._ttsData;
      }
      
      public function set ttsData(param1:SpeechData) : void
      {
         this._ttsData = param1;
      }
      
      public function get downloadType() : String
      {
         return this._downloadType;
      }
      
      public function set downloadType(param1:String) : void
      {
         this._downloadType = param1;
      }
      
      public function get duration() : Number
      {
         return 1000 * UtilUnitConvert.frameToDuration(this._totalFrame);
      }
      
      public function set duration(param1:Number) : void
      {
         this._totalFrame = StudioSoundManager.validateTotalFrame(UtilUnitConvert.durationToFrame(param1 / 1000));
      }
      
      public function get totalFrame() : int
      {
         return this._totalFrame;
      }
      
      public function get lengthFrame() : Number
      {
         return this._lengthFrame;
      }
      
      public function get sound#1() : ISoundable
      {
         return this._sound;
      }
      
      public function get subType() : String
      {
         return this._subType;
      }
      
      public function set subType(param1:String) : void
      {
         this._subType = param1;
      }
      
      public function get isLoading() : Boolean
      {
         return this._isLoading;
      }
      
      public function set isLoading(param1:Boolean) : void
      {
         this._isLoading = param1;
      }
      
      override public function deSerialize(param1:XML, param2:Theme) : void
      {
         var _loc3_:int = 0;
         var _loc7_:String = null;
         var _loc8_:Number = NaN;
         var _loc9_:XML = null;
         this.id = param1.@id;
         this.aid = param1.@aid;
         this.encAssetId = param1.@enc_asset_id;
         this.name = param1.@name;
         this.signature = param1.@signature;
         this.theme = param2;
         this.enable = param1.@enable != "N";
         if(Console.getConsole().excludedIds.containsKey(this.aid))
         {
            this.enable = false;
         }
         if(param1.@downloadtype == AnimeConstants.DOWNLOAD_TYPE_PROGRESSIVE || param1.@downloadtype == AnimeConstants.DOWNLOAD_TYPE_STREAM)
         {
            this._downloadType = param1.@downloadtype;
         }
         else
         {
            this._downloadType = AnimeConstants.DOWNLOAD_TYPE_EMBED;
         }
         this.duration = parseInt(param1.@duration);
         this.subType = param1.@subtype != null?param1.@subtype:AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC;
         if(this.theme.id == "ugc")
         {
            this.tags = param1.tags;
            this.isPublished = param1.@published == "1";
         }
         var _loc4_:XMLList = param1.child("tag");
         var _loc5_:int = _loc4_.length();
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc7_ = _loc4_[_loc3_];
            sysTags.push(_loc7_);
            if(ThemeManager.instance.supportSearchSuggestion(theme.id))
            {
               SearchManager.instance.addAssetTag(themeId,ProductConstants.PRODUCT_TYPE_SOUND,_loc7_,this.aid);
            }
            _loc3_++;
         }
         this._variations = new Vector.<String>();
         if(UtilSite.isGoAnimate)
         {
            if(param1.@team != VALUE_ISGOTEAM_TRUE)
            {
               if(param1.@min_ut && UtilUser.userType < Number(param1.@min_ut))
               {
                  this._previewOnly = true;
               }
            }
            else
            {
               this._goTeamOnly = true;
               if(!AccessRightManager.instance.getAccess(AccessRightManager.ACCESS_TEAM_ONLY_PREMIUM_TRACK))
               {
                  this._previewOnly = true;
               }
            }
            _loc8_ = param1.variation.length();
            _loc3_ = 0;
            while(_loc3_ < _loc8_)
            {
               _loc9_ = param1.variation[_loc3_];
               this._variations.push(_loc9_.@id);
               _loc3_++;
            }
         }
         else if(UtilSite.isG4S)
         {
            if(param1.@team == VALUE_ISGOTEAM_TRUE || param1.@min_ut && UtilUser.userType < Number(param1.@min_ut))
            {
               this.enable = false;
            }
         }
         var _loc6_:String = param1.name().localName;
         if(_loc6_ == XML_NODE_VARIATION_NAME)
         {
            this._isVariation = true;
            this._previewOnly = !AccessRightManager.instance.getAccess(AccessRightManager.ACCESS_TEAM_ONLY_PREMIUM_TRACK);
         }
      }
      
      public function deSerializeByUserAssetXML(param1:XML, param2:Theme) : void
      {
         this.id = param1.child("file")[0].toString();
         this.name = param1.child("title")[0].toString();
         this.theme = param2;
         this.subType = param1.child("subtype").length() > 0?param1.child("subtype")[0].toString():AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC;
         this._downloadType = param1.child("downloadtype")[0].toString();
         this.duration = parseInt(param1.child("duration")[0].toString());
         if(this.theme.id == "ugc")
         {
            this.tags = param1.tags;
            this.isPublished = param1.published == "1";
         }
         this.encAssetId = param1.child("enc_asset_id")[0].toString();
         this.signature = param1.child("signature")[0].toString();
         this.mergeIntoTheme(param2);
      }
      
      public function mergeIntoTheme(param1:Theme) : void
      {
         var _loc2_:XML = new XML("<theme id=\"ugc\"><sound id=\"" + this.id + "\" name=\"" + UtilXmlInfo.xmlEscape(this.name) + "\" enable=\"Y\" downloadtype=\"" + this._downloadType + "\" enc_asset_id=\"" + this.encAssetId + "\" signature=\"" + this.signature + "\" subtype=\"" + this.subType + "\" duration=\"" + this.duration + "\" /></theme>");
         param1.mergeThemeXML(_loc2_);
      }
      
      private function getSubTypeLabel(param1:String) : String
      {
         var _loc2_:String = "";
         if(param1 == AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC)
         {
            _loc2_ = "(music)";
         }
         else if(param1 == AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_SOUND_EFFECT)
         {
            _loc2_ = "(effect)";
         }
         else if(param1 == AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER)
         {
            _loc2_ = "(voice)";
         }
         return _loc2_;
      }
      
      public function initSoundFromNetwork() : void
      {
         if(!this._isLoading)
         {
            this._isLoading = true;
            this._sound = createSoundObj(this);
            this._sound.addEventListener(SoundEvent.READY_TO_PLAY,this.doSayLoadThumbComplete);
            initSoundObj(this._sound,this);
         }
      }
      
      public function initSoundByByteArray(param1:ByteArray) : void
      {
         if(!this._isLoading)
         {
            this._isLoading = true;
            this.imageData = param1;
            this._sound = createSoundObj(this);
            this._sound.addEventListener(SoundEvent.READY_TO_PLAY,this.doSayLoadThumbComplete);
            initSoundObj(this._sound,this);
         }
      }
      
      public function loadWaveform() : void
      {
         if(this._waveform)
         {
            if(this._waveform.samples)
            {
               this.dispatchEvent(new SoundEvent(SoundEvent.WAVEFORM_LOADED,this));
            }
            else
            {
               this.dispatchEvent(new SoundEvent(SoundEvent.WAVEFORM_LOAD_ERROR,this));
            }
         }
         else
         {
            this._waveform = new SoundWaveformData();
            this._waveform.addEventListener(Event.COMPLETE,this.onLoadWaveformComplete);
            this._waveform.loadWaveform(this.id,this.themeId,this.aid);
         }
      }
      
      private function onLoadWaveformComplete(param1:Event) : void
      {
         if(this._waveform && this._waveform.samples)
         {
            this.dispatchEvent(new SoundEvent(SoundEvent.WAVEFORM_LOADED,this));
         }
         else if(this.sound#1 is ProgressiveSound)
         {
            this.sound#1.addEventListener(SoundEvent.SOUND_LOADED,this.onSoundLoaded);
            (this.sound#1 as ProgressiveSound).loadSound();
         }
         else
         {
            this.initSoundFromNetwork();
            this.dispatchEvent(new SoundEvent(SoundEvent.WAVEFORM_LOAD_ERROR,this));
         }
      }
      
      private function onSoundLoaded(param1:Event) : void
      {
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onSoundLoaded);
         this.generateWaveform();
      }
      
      private function generateWaveform() : void
      {
         if(this._sound is ProgressiveSound)
         {
            this._waveform.init(ProgressiveSound(this._sound).sound#1);
         }
         if(this._waveform && this._waveform.samples)
         {
            this.dispatchEvent(new SoundEvent(SoundEvent.WAVEFORM_LOADED,this));
            if(this.themeId == "ugc")
            {
               this._waveform.saveWaveform(this._waveform.samples,this.id,this.themeId,this.aid);
            }
         }
      }
      
      private function doSayLoadThumbComplete(param1:Event) : void
      {
         var _loc2_:EmbedSound = null;
         if(param1 != null)
         {
            (param1.target as IEventDispatcher).removeEventListener(param1.type,this.doSayLoadThumbComplete);
         }
         if(this.sound#1 is EmbedSound)
         {
            _loc2_ = this.sound#1 as EmbedSound;
            this.imageData = _loc2_.byteArray;
         }
         this._lengthFrame = UtilUnitConvert.secToFrame(this.sound#1.getDuration() / 1000);
         this.duration = this.sound#1.getDuration();
         this._isLoading = false;
         if(this._waveform && !this._waveform.samples)
         {
            if(this.sound#1 is ProgressiveSound)
            {
               this.sound#1.addEventListener(SoundEvent.SOUND_LOADED,this.onSoundLoaded);
               (this.sound#1 as ProgressiveSound).loadSound();
            }
         }
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
      }
      
      public function get infoXml() : XML
      {
         var xml:XML = new XML();
         try
         {
            if(this.subType == "tribeofnoise")
            {
               xml = <info/>;
               xml.title = this.name;
               xml.author = SoundStore.dbTribeOfNoise.sound.(@aid == this.aid).@author;
            }
         }
         catch(e:Error)
         {
            xml = SerializeError.createErrorNode("Failed to serialize sound info");
         }
         return xml;
      }
      
      public function get info() : String
      {
         return this.infoXml.toXMLString();
      }
      
      public function get waveform() : SoundWaveformData
      {
         return this._waveform;
      }
      
      public function get isWaveformDataReady() : Boolean
      {
         if(this._waveform && this._waveform.samples)
         {
            return true;
         }
         return false;
      }
      
      public function get displayName() : String
      {
         var _loc1_:String = null;
         if(this._ttsData)
         {
            _loc1_ = this._ttsData.title;
         }
         if(_loc1_ && _loc1_.length > 0)
         {
            return _loc1_;
         }
         return name;
      }
      
      public function get isVoice() : Boolean
      {
         if(this.subType == AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER || this.subType == AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_TTS)
         {
            return true;
         }
         return false;
      }
      
      public function set goTeamOnly(param1:Boolean) : void
      {
         var _loc2_:Object = this.goTeamOnly;
         if(_loc2_ !== param1)
         {
            this._865888433goTeamOnly = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"goTeamOnly",_loc2_,param1));
            }
         }
      }
   }
}
