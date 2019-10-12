package anifire.studio.core
{
   import anifire.constant.AnimeConstants;
   import anifire.errors.SerializeError;
   import anifire.studio.commands.MoveSoundCommand;
   import anifire.studio.components.SoundContainer;
   import anifire.studio.core.sound.AnimeSoundEvent;
   import anifire.studio.core.sound.ISoundable;
   import anifire.studio.core.sound.SoundMemento;
   import anifire.studio.managers.SoundCollectionController;
   import anifire.studio.managers.SoundPlaybackManager;
   import anifire.studio.managers.StudioSoundFactory;
   import anifire.studio.managers.StudioSoundManager;
   import anifire.studio.managers.ThemeManager;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilUnitConvert;
   import anifire.util.UtilXmlInfo;
   import flash.display.DisplayObjectContainer;
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   
   public class AnimeSound extends EventDispatcher
   {
      
      public static const DRAG_DATA_FORMAT:String = "AnimeSound";
      
      private static var _existIDs:UtilHashArray = new UtilHashArray();
      
      public static const XML_NODE_NAME:String = "sound";
      
      public static const XML_NODE_NAME_START_FRAME:String = "start";
      
      public static const XML_NODE_NAME_STOP_FRAME:String = "stop";
      
      public static const XML_NODE_NAME_SOUND_FILE:String = "sfile";
      
      public static const XML_NODE_NAME_TRIM_START:String = "trimStart";
      
      public static const XML_NODE_NAME_TRIM_END:String = "trimEnd";
      
      public static const XML_NODE_NAME_FADE_IN:String = "fadein";
      
      public static const XML_NODE_NAME_FADE_OUT:String = "fadeout";
      
      public static const XML_ATTRIBUTE_NAME_FADE_DURATION:String = "duration";
      
      public static const XML_ATTRIBUTE_NAME_FADE_VOLUME:String = "vol";
      
      public static const DURATION_TYPE_RESET:String = "reset";
      
      public static const DURATION_TYPE_FULL:String = "full";
      
      public static const FADING_DURATION_FOR_VOICE:int = 12;
      
      public static const FADING_DURATION_FOR_MUSIC:int = 48;
      
      public static const MAX_VOLUME_LEVEL:Number = 8;
       
      
      private var _soundThumb:SoundThumb;
      
      private var _sound:ISoundable;
      
      private var _id:String;
      
      private var _startFrame:int;
      
      private var _totalFrame:int;
      
      private var _defaultTotalFrame:int;
      
      private var _trimStartFrame:int = 1;
      
      private var _trimEndFrame:int = -1;
      
      private var _fadeInDuration:int = 0;
      
      private var _fadeOutDuration:int = 0;
      
      private var _fadeInVolume:Number = 0;
      
      private var _fadeOutVolume:Number = 0;
      
      private var _hasFading:Boolean;
      
      private var _trackNum:int;
      
      private var _soundContainer:SoundContainer;
      
      private var _volume:Number;
      
      private var _scene:AnimeScene;
      
      private var _soundsController:SoundCollectionController;
      
      private var _waveformDelay:int = 0;
      
      private var _overlap:Boolean;
      
      protected var _textColor:uint;
      
      protected var _waveformColor:uint;
      
      protected var _volumeLineColor:uint;
      
      protected var _backgroundColor:uint;
      
      protected var _hoverColor:uint;
      
      protected var _borderColor:uint;
      
      public function AnimeSound()
      {
         this._volume = AnimeConstants.DEFAULT_INNER_VOLUME;
         super();
         this.setID(this.uniqueId);
      }
      
      private function get index() : int
      {
         var _loc1_:int = this._soundsController.sounds.getSoundOrder(this);
         if(_loc1_ == -1)
         {
            _loc1_ = Console.getConsole().speechManager.ttsManager.sounds.getIndex(this.getID());
         }
         return _loc1_;
      }
      
      public function getID() : String
      {
         return this._id;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      private function setID(param1:String) : void
      {
         if(param1)
         {
            this._id = param1;
            _existIDs.push(param1,param1);
         }
      }
      
      public function get startFrame() : int
      {
         return this._startFrame;
      }
      
      public function set startFrame(param1:int) : void
      {
         param1 = StudioSoundManager.validateStartFrame(param1);
         if(this._startFrame != param1)
         {
            this._startFrame = param1;
            this.dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.START_FRAME_CHANGE));
         }
      }
      
      public function get trimStartFrame() : int
      {
         return this._trimStartFrame;
      }
      
      public function set trimStartFrame(param1:int) : void
      {
         param1 = StudioSoundManager.validateStartFrame(param1);
         if(this._trimStartFrame != param1)
         {
            this._trimStartFrame = param1;
            this.dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.TRIMMED_START_FRAME_CHANGE));
            this.updateDefaultTotalFrame();
         }
      }
      
      public function get trimEndFrame() : int
      {
         return this._trimEndFrame;
      }
      
      public function set trimEndFrame(param1:int) : void
      {
         if(this._trimEndFrame != param1)
         {
            this._trimEndFrame = param1;
            this.dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.TRIMMED_END_FRAME_CHANGE));
            this.updateDefaultTotalFrame();
         }
      }
      
      public function get isTrimmed() : Boolean
      {
         return this._trimStartFrame > 1 || this._trimEndFrame > 1;
      }
      
      public function removeTrimming() : void
      {
         this.trimStartFrame = 1;
         this.trimEndFrame = -1;
      }
      
      public function get endFrame() : int
      {
         return this._startFrame + this._totalFrame - 1;
      }
      
      public function set endFrame(param1:int) : void
      {
         this.totalFrame = param1 - this.startFrame + 1;
      }
      
      public function get totalFrame() : int
      {
         return this._totalFrame;
      }
      
      public function set totalFrame(param1:int) : void
      {
         param1 = StudioSoundManager.validateTotalFrame(param1);
         if(this._totalFrame != param1)
         {
            this._totalFrame = param1;
            this.dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.TOTAL_FRAME_CHANGE));
         }
      }
      
      public function get defaultTotalFrame() : int
      {
         return this._defaultTotalFrame;
      }
      
      public function set defaultTotalFrame(param1:int) : void
      {
         if(this._defaultTotalFrame != param1)
         {
            this._defaultTotalFrame = param1;
            this.dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.DEFAULT_TOTAL_FRAME_CHANGE));
         }
      }
      
      private function updateDefaultTotalFrame() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(!this._soundThumb)
         {
            return;
         }
         if(this.isTrimmed)
         {
            _loc1_ = this._trimStartFrame;
            _loc2_ = this._trimEndFrame > 1?int(this._trimEndFrame):int(this._soundThumb.totalFrame);
            this.defaultTotalFrame = _loc2_ - _loc1_ + 1;
         }
         else
         {
            this.defaultTotalFrame = this._soundThumb.totalFrame;
         }
      }
      
      public function set leftFrame(param1:int) : void
      {
         param1 = StudioSoundManager.validateStartFrame(param1);
         var _loc2_:int = this.endFrame - param1 + 1;
         _loc2_ = StudioSoundManager.validateTotalFrame(_loc2_);
         this.startFrame = this.endFrame - _loc2_ + 1;
         this.totalFrame = _loc2_;
      }
      
      public function getLabel() : String
      {
         return !!this._soundThumb?this._soundThumb.name:"";
      }
      
      public function get sound#1() : ISoundable
      {
         return this._sound;
      }
      
      private function set sound#593(param1:ISoundable) : void
      {
         this._sound = param1;
      }
      
      public function get trackNum() : int
      {
         return this._trackNum;
      }
      
      public function set trackNum(param1:int) : void
      {
         param1 = StudioSoundManager.validateTrack(param1);
         if(param1 != this._trackNum)
         {
            this._trackNum = param1;
            this.dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.TRACK_CHANGE));
         }
      }
      
      public function get volume() : Number
      {
         return this._volume;
      }
      
      public function set volume(param1:Number) : void
      {
         param1 = StudioSoundManager.validateVolume(param1);
         if(param1 != this._volume)
         {
            this._volume = param1;
            this.dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.VOLUME_CHANGE));
         }
      }
      
      public function set soundContainer(param1:SoundContainer) : void
      {
         this._soundContainer = param1;
      }
      
      public function get soundContainer() : SoundContainer
      {
         return this._soundContainer;
      }
      
      public function get soundThumb() : SoundThumb
      {
         return this._soundThumb;
      }
      
      public function set soundThumb(param1:SoundThumb) : void
      {
         if(this._soundThumb != param1)
         {
            this._soundThumb = param1;
            this.updateDefaultTotalFrame();
            this.updateColors();
            this.dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.SOUND_THUMB_CHANGE));
         }
      }
      
      public function previewSound() : void
      {
         this.playSound(0,true);
      }
      
      public function playSound(param1:Number = 0, param2:Boolean = true) : void
      {
         var _loc4_:Number = NaN;
         if(this.scene)
         {
            _loc4_ = UtilUnitConvert.frameToDuration(this._waveformDelay) * 1000;
            param1 = param1 - _loc4_;
            if(param1 < 0)
            {
               param1 = 0;
            }
         }
         if(this.trimStartFrame > 1)
         {
            param1 = param1 + UtilUnitConvert.frameToTime(this.trimStartFrame) * 1000;
         }
         var _loc3_:Number = -1;
         if(this.trimEndFrame > 0)
         {
            _loc3_ = UtilUnitConvert.frameToTime(this.trimEndFrame) * 1000;
         }
         else
         {
            _loc3_ = UtilUnitConvert.frameToTime(this.endFrame) * 1000;
         }
         SoundPlaybackManager.playSoundThumb(this._soundThumb,param1,this.soundContainer,this.volume,_loc3_,this.fadeInDuration,this.fadeInVolume,this.fadeOutDuration,this.fadeOutVolume,!this._scene && !param2);
      }
      
      public function stopSound() : void
      {
         SoundPlaybackManager.stop();
      }
      
      private function get uniqueId() : String
      {
         var _loc1_:int = _existIDs.length;
         var _loc2_:String = "SOUND" + _loc1_;
         while(_existIDs.containsKey(_loc2_))
         {
            _loc1_++;
            _loc2_ = "SOUND" + _loc1_;
         }
         return _loc2_;
      }
      
      public function init(param1:SoundThumb, param2:Number, param3:Number, param4:String = null, param5:Number = 0, param6:Number = 1, param7:Number = 0) : void
      {
         this.soundThumb = param1;
         if(param4)
         {
            this.setID(param4);
         }
         this.startFrame = param2;
         this.endFrame = param3;
         this.trackNum = param5;
         this.volume = param6;
      }
      
      public function convertToXml() : XML
      {
         var childXml:XML = null;
         var realStartFrame:int = 0;
         var realEndFrame:int = 0;
         var sceneEnd:int = 0;
         var xml:XML = <sound/>;
         try
         {
            if(this.endFrame > this.startFrame)
            {
               xml.@id = this.getID();
               xml.@index = this.index;
               xml.@track = this.trackNum;
               xml.@vol = this.volume;
               xml.sfile = this._soundThumb.theme.id + "." + this._soundThumb.id;
               if(this._scene)
               {
                  realStartFrame = this.startFrame + this._scene.totalFrameOfTransitionBeforeNarration;
                  realEndFrame = realStartFrame + this._defaultTotalFrame - 1;
                  sceneEnd = this.startFrame + this._scene.totalFrames - 1;
                  if(realEndFrame > sceneEnd)
                  {
                     realEndFrame = sceneEnd;
                  }
                  xml.start = realStartFrame;
                  xml.stop = realEndFrame;
               }
               else
               {
                  xml.start = this.startFrame;
                  xml.stop = this.endFrame;
               }
               if(this.trimStartFrame > 1)
               {
                  xml.trimStart = this.trimStartFrame;
               }
               if(this.trimEndFrame > 1)
               {
                  xml.trimEnd = this.trimEndFrame;
               }
               childXml = <fadein/>;
               childXml[XML_ATTRIBUTE_NAME_FADE_DURATION] = !!this.hasFading?this.fadeInDuration:0;
               childXml[XML_ATTRIBUTE_NAME_FADE_VOLUME] = this.fadeInVolume;
               xml.appendChild(childXml);
               childXml = <fadeout/>;
               childXml[XML_ATTRIBUTE_NAME_FADE_DURATION] = !!this.hasFading?this.fadeOutDuration:0;
               childXml[XML_ATTRIBUTE_NAME_FADE_VOLUME] = this.fadeOutVolume;
               xml.appendChild(childXml);
               if(this.soundThumb.ttsData)
               {
                  childXml = new XML(this.soundThumb.ttsData.serialize());
                  if(childXml.toXMLString() != "")
                  {
                     xml.appendChild(childXml);
                  }
               }
               if(this.soundThumb)
               {
                  childXml = this.soundThumb.infoXml;
                  if(childXml.toXMLString() != "")
                  {
                     xml.appendChild(childXml);
                  }
               }
            }
         }
         catch(e:Error)
         {
            xml = SerializeError.createErrorNode("Failed to serialize anime sound: " + _soundThumb.id);
         }
         return xml;
      }
      
      public function serialize(param1:Boolean, param2:Boolean = false, param3:Object = null) : String
      {
         var xmlStr:String = null;
         var stockdata:Boolean = param1;
         var isTTS:Boolean = param2;
         var log:Object = param3;
         var xml:XML = this.convertToXml();
         xmlStr = "";
         try
         {
            xml.@tts = !!isTTS?"1":"0";
            xmlStr = xml.toXMLString();
            if(this.endFrame > this.startFrame)
            {
               if(stockdata)
               {
                  Console.getConsole().putData(this._soundThumb.theme.id + ".sound." + this._soundThumb.id,ByteArray(this._soundThumb.imageData));
               }
            }
         }
         catch(e:Error)
         {
            throw new SerializeError("Failed to serialize sound " + _soundThumb.id,xmlStr,e);
         }
         return xmlStr;
      }
      
      public function deSerialize(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc6_:int = 0;
         var _loc3_:String = UtilXmlInfo.getZipFileNameOfSound(param1[XML_NODE_NAME_SOUND_FILE].toString());
         var _loc4_:String = UtilXmlInfo.getThumbIdFromFileName(_loc3_);
         var _loc5_:String = UtilXmlInfo.getThemeIdFromFileName(_loc3_);
         this.init(ThemeManager.instance.getTheme(_loc5_).getSoundThumbById(_loc4_),Number(param1[XML_NODE_NAME_START_FRAME].toString()),Number(param1[XML_NODE_NAME_STOP_FRAME].toString()),param1.@id,param1.@track,param1.@vol);
         if(param1.@tts == 1 && param1.ttsdata.length() > 0)
         {
            this.soundThumb.ttsData = new SpeechData();
            this.soundThumb.ttsData.deserialize(param1.ttsdata[0]);
         }
         if(param1.hasOwnProperty(XML_NODE_NAME_TRIM_START))
         {
            this.trimStartFrame = int(param1.trimStart);
         }
         if(param1.hasOwnProperty(XML_NODE_NAME_TRIM_END))
         {
            this.trimEndFrame = int(param1.trimEnd);
         }
         if(param1.hasOwnProperty(XML_NODE_NAME_FADE_IN))
         {
            _loc2_ = param1.child(XML_NODE_NAME_FADE_IN)[0] as XML;
            if(_loc2_.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_FADE_DURATION))
            {
               this.fadeInDuration = int(_loc2_.attribute(XML_ATTRIBUTE_NAME_FADE_DURATION));
            }
            if(_loc2_.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_FADE_VOLUME))
            {
               this.fadeInVolume = Number(_loc2_.attribute(XML_ATTRIBUTE_NAME_FADE_VOLUME));
            }
         }
         else
         {
            _loc6_ = 12;
            if(this.soundThumb && this.soundThumb.subType == AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC && this.totalFrame > _loc6_ * 2)
            {
               this.fadeInDuration = _loc6_;
               this.fadeOutDuration = _loc6_;
            }
         }
         if(param1.hasOwnProperty(XML_NODE_NAME_FADE_OUT))
         {
            _loc2_ = param1.child(XML_NODE_NAME_FADE_OUT)[0] as XML;
            if(_loc2_.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_FADE_DURATION))
            {
               this.fadeOutDuration = int(_loc2_.attribute(XML_ATTRIBUTE_NAME_FADE_DURATION));
            }
            if(_loc2_.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_FADE_VOLUME))
            {
               this.fadeOutVolume = Number(_loc2_.attribute(XML_ATTRIBUTE_NAME_FADE_VOLUME));
            }
         }
         if(this.fadeInDuration > 0 || this.fadeOutDuration > 0)
         {
            this._hasFading = true;
         }
      }
      
      protected function getSceneCanvas() : DisplayObjectContainer
      {
         return Console.getConsole().timeline;
      }
      
      public function changeDurationByType(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:MoveSoundCommand = new MoveSoundCommand(this,this._soundsController.sounds);
         var _loc5_:int = 0;
         if(param1 == DURATION_TYPE_RESET)
         {
            if(this.soundThumb)
            {
               _loc3_ = this.startFrame + UtilUnitConvert.durationToFrame(this.soundThumb.duration / 1000) - 1;
               if(_loc3_ > 0)
               {
                  _loc5_ = this._soundsController.resizeSound(this,this.startFrame,_loc3_,false,true);
                  _loc4_.executeNow(this.startFrame,this.totalFrame,this.trackNum);
                  if(_loc5_)
                  {
                     this._soundsController.showOverlapConfirmation();
                  }
               }
            }
         }
         else if(param1 == DURATION_TYPE_FULL)
         {
            _loc3_ = Console.getConsole().timelineController.movieTotalFrame;
            if(_loc3_ > 0)
            {
               _loc5_ = this._soundsController.resizeSound(this,1,_loc3_,false,true);
               _loc4_.executeNow(this.startFrame,this.totalFrame,this.trackNum);
               if(_loc5_)
               {
                  this._soundsController.showOverlapConfirmation();
               }
            }
         }
      }
      
      public function changeDurationByScene(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:MoveSoundCommand = new MoveSoundCommand(this,this._soundsController.sounds);
         var _loc5_:int = 0;
         var _loc6_:AnimeScene = Console.getConsole().timelineController.getSceneAtFrame(this.startFrame);
         if(_loc6_)
         {
            _loc2_ = Console.getConsole().timelineController.getGlobalStartFrame(_loc6_);
            _loc3_ = Console.getConsole().timelineController.getTotalFrameFromScene(_loc6_,param1);
            if(_loc2_ > 0 && _loc3_ > 0)
            {
               _loc5_ = this._soundsController.resizeSound(this,_loc2_,_loc2_ + _loc3_ - 1,false,true);
               _loc4_.executeNow(this.startFrame,this.totalFrame,this.trackNum);
               if(_loc5_)
               {
                  this._soundsController.showOverlapConfirmation();
               }
            }
         }
      }
      
      public function clone() : AnimeSound
      {
         var _loc1_:AnimeSound = StudioSoundFactory.createSound(this.soundThumb);
         _loc1_.init(this.soundThumb,this.startFrame,this.endFrame,null,this.trackNum,this.volume);
         _loc1_.trimStartFrame = this.trimStartFrame;
         _loc1_.trimEndFrame = this.trimEndFrame;
         if(this.hasFading)
         {
            _loc1_.addFading(this.fadeInDuration,this.fadeOutDuration,this.fadeInVolume,this.fadeOutVolume);
         }
         return _loc1_;
      }
      
      public function get memento() : SoundMemento
      {
         var _loc1_:SoundMemento = new SoundMemento();
         _loc1_.saveState(this);
         return _loc1_;
      }
      
      public function set memento(param1:SoundMemento) : void
      {
         if(param1)
         {
            param1.restoreState(this);
         }
      }
      
      public function get subType() : String
      {
         if(this.soundThumb)
         {
            return this.soundThumb.subType;
         }
         return AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC;
      }
      
      public function get scene() : AnimeScene
      {
         return this._scene;
      }
      
      public function set scene(param1:AnimeScene) : void
      {
         if(this._scene != param1)
         {
            this._scene = param1;
            this.updateColors();
            this.dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.SCENE_ATTACHMENT_CHANGE));
         }
      }
      
      public function get isVoice() : Boolean
      {
         if(this.soundThumb)
         {
            return this.soundThumb.isVoice;
         }
         return false;
      }
      
      public function get isLooping() : Boolean
      {
         if(this._soundThumb)
         {
            return this._totalFrame > this._soundThumb.totalFrame;
         }
         return false;
      }
      
      public function get soundsController() : SoundCollectionController
      {
         return this._soundsController;
      }
      
      public function set soundsController(param1:SoundCollectionController) : void
      {
         this._soundsController = param1;
      }
      
      public function get waveformDelay() : int
      {
         return this._waveformDelay;
      }
      
      public function set waveformDelay(param1:int) : void
      {
         if(param1 != this._waveformDelay)
         {
            this._waveformDelay = param1;
            this.dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.WAVEFORM_DELAY_CHANGE));
         }
      }
      
      public function get overlap() : Boolean
      {
         return this._overlap;
      }
      
      public function set overlap(param1:Boolean) : void
      {
         if(this._overlap != param1)
         {
            this._overlap = param1;
            this.dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.OVERLAP_CHANGE));
         }
      }
      
      public function get fadeInDuration() : int
      {
         return this._fadeInDuration;
      }
      
      public function set fadeInDuration(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this._fadeInDuration == param1)
         {
            return;
         }
         this._fadeInDuration = param1;
      }
      
      public function get fadeOutDuration() : int
      {
         return this._fadeOutDuration;
      }
      
      public function set fadeOutDuration(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(this._fadeOutDuration == param1)
         {
            return;
         }
         this._fadeOutDuration = param1;
      }
      
      public function get fadeInVolume() : Number
      {
         return this._fadeInVolume;
      }
      
      public function set fadeInVolume(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > MAX_VOLUME_LEVEL)
         {
            param1 = MAX_VOLUME_LEVEL;
         }
         if(this._fadeInVolume == param1)
         {
            return;
         }
         this._fadeInVolume = param1;
      }
      
      public function get fadeOutVolume() : Number
      {
         return this._fadeOutVolume;
      }
      
      public function set fadeOutVolume(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > MAX_VOLUME_LEVEL)
         {
            param1 = MAX_VOLUME_LEVEL;
         }
         if(this._fadeOutVolume == param1)
         {
            return;
         }
         this._fadeOutVolume = param1;
      }
      
      public function get effectiveFadeInDuration() : int
      {
         if(this._totalFrame >= this._fadeInDuration + this._fadeOutDuration)
         {
            return this._fadeInDuration;
         }
         return 0;
      }
      
      public function get effectiveFadeOutDuration() : int
      {
         if(this._totalFrame >= this._fadeOutDuration)
         {
            return this._fadeOutDuration;
         }
         return 0;
      }
      
      public function get hasFading() : Boolean
      {
         return this._hasFading;
      }
      
      public function set hasFading(param1:Boolean) : void
      {
         this._hasFading = param1;
      }
      
      public function addDefaultFading() : void
      {
         if(this._hasFading)
         {
            return;
         }
         this._hasFading = true;
         var _loc1_:int = FADING_DURATION_FOR_VOICE;
         var _loc2_:int = FADING_DURATION_FOR_VOICE;
         if(this.soundThumb)
         {
            if(this.soundThumb.subType == AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC)
            {
               _loc1_ = FADING_DURATION_FOR_MUSIC;
               _loc2_ = FADING_DURATION_FOR_MUSIC;
            }
         }
         if(this.totalFrame <= _loc1_ + _loc2_)
         {
            _loc1_ = StudioSoundManager.validateFadingDuration(this.totalFrame / 2);
            _loc2_ = this.totalFrame - _loc1_;
         }
         this.fadeInDuration = _loc1_;
         this.fadeOutDuration = _loc2_;
         this.fadeInVolume = 0;
         this.fadeOutVolume = 0;
         dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.FADING_CHANGE));
      }
      
      public function addFading(param1:int, param2:int, param3:Number, param4:Number) : void
      {
         if(this._hasFading)
         {
            return;
         }
         this.updateFading(param1,param2,param3,param4);
      }
      
      public function updateFading(param1:int, param2:int, param3:Number, param4:Number) : void
      {
         this.fadeInDuration = param1;
         this.fadeOutDuration = param2;
         this.fadeInVolume = param3;
         this.fadeOutVolume = param4;
         this._hasFading = this.fadeInDuration != 0 || this.fadeOutDuration != 0;
         dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.FADING_CHANGE));
      }
      
      public function removeFading() : void
      {
         if(!this._hasFading)
         {
            return;
         }
         this._hasFading = false;
         this.fadeInDuration = 0;
         this.fadeOutDuration = 0;
         this.fadeInVolume = 0;
         this.fadeOutVolume = 0;
         dispatchEvent(new AnimeSoundEvent(AnimeSoundEvent.FADING_CHANGE));
      }
      
      public function getVolumeAt(param1:int) : Number
      {
         var _loc3_:int = 0;
         var _loc2_:Number = this.volume;
         if(param1 <= 0 || param1 > this.totalFrame)
         {
            _loc2_ = 0;
         }
         else if(this.hasFading)
         {
            if(this.fadeInDuration > 0 && param1 <= this.fadeInDuration)
            {
               _loc2_ = (param1 - 1) * (this.volume - this.fadeInVolume) / this.fadeInDuration + this.fadeInVolume;
            }
            else if(this.fadeOutDuration > 0)
            {
               _loc3_ = this.totalFrame - this.fadeOutDuration + 1;
               if(param1 >= _loc3_)
               {
                  _loc2_ = (param1 - _loc3_ + 1) * (this.fadeOutVolume - this.volume) / this.fadeOutDuration + this.volume;
               }
            }
         }
         _loc2_ = StudioSoundManager.validateVolume(_loc2_);
         return _loc2_;
      }
      
      public function get hasActualFading() : Boolean
      {
         if(this._fadeInVolume != 1 && this._fadeInDuration > 0)
         {
            return true;
         }
         if(this._fadeOutVolume != 1 && this._fadeOutDuration > 0)
         {
            return true;
         }
         if(this._volume != 1)
         {
            return true;
         }
         return false;
      }
      
      protected function updateColors() : void
      {
         if(this._scene != null)
         {
            this._backgroundColor = 15988732;
            this._waveformColor = 2145192;
            this._borderColor = 87622;
            this._hoverColor = 16777215;
            this._textColor = 87622;
            this._volumeLineColor = 87622;
            return;
         }
         if(this._soundThumb)
         {
            switch(this._soundThumb.subType)
            {
               default:
               case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC:
               case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_TRIBE_OF_NOISE:
                  this._backgroundColor = 4956612;
                  this._waveformColor = 1198169;
                  this._borderColor = 1198169;
                  this._hoverColor = 45016;
                  this._textColor = 16777215;
                  this._volumeLineColor = 16777215;
                  break;
               case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_SOUND_EFFECT:
                  this._backgroundColor = 9664439;
                  this._waveformColor = 3811668;
                  this._borderColor = 3811668;
                  this._hoverColor = 10053324;
                  this._textColor = 16777215;
                  this._volumeLineColor = 16777215;
                  break;
               case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_VOICE_OVER:
               case AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_TTS:
                  this._backgroundColor = 3129768;
                  this._waveformColor = 87622;
                  this._borderColor = 87622;
                  this._hoverColor = 52370;
                  this._textColor = 16777215;
                  this._volumeLineColor = 16777215;
            }
         }
      }
      
      public function get waveformColor() : uint
      {
         return this._waveformColor;
      }
      
      public function get volumeLineColor() : uint
      {
         return this._volumeLineColor;
      }
      
      public function get backgroundColor() : uint
      {
         return this._backgroundColor;
      }
      
      public function get borderColor() : uint
      {
         return this._borderColor;
      }
      
      public function get textColor() : uint
      {
         return this._textColor;
      }
      
      public function get hoverColor() : uint
      {
         return this._hoverColor;
      }
   }
}
