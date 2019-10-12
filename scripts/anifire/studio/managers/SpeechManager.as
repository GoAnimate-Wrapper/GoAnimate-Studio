package anifire.studio.managers
{
   import anifire.core.AssetLinkage;
   import anifire.errors.SerializeError;
   import anifire.studio.commands.AddSpeechAllCommand;
   import anifire.studio.commands.AddSpeechCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Character;
   import anifire.studio.core.Console;
   import anifire.studio.core.EffectAsset;
   import anifire.studio.core.SoundThumb;
   import anifire.studio.core.SpeechData;
   import anifire.studio.core.sound.SoundEvent;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilUnitConvert;
   import flash.events.EventDispatcher;
   import flash.utils.ByteArray;
   
   public class SpeechManager extends EventDispatcher
   {
       
      
      private var _ttsManager:TTSManager;
      
      private var _micRecordingManager:MicRecordingManager;
      
      private var _voiceFileManager:VoiceFileManager;
      
      public function SpeechManager()
      {
         this._ttsManager = new TTSManager();
         this._micRecordingManager = new MicRecordingManager();
         this._voiceFileManager = new VoiceFileManager();
         super();
      }
      
      public function get ttsManager() : TTSManager
      {
         return this._ttsManager;
      }
      
      public function get micRecordingManager() : MicRecordingManager
      {
         return this._micRecordingManager;
      }
      
      public function get voiceFileManager() : VoiceFileManager
      {
         return this._voiceFileManager;
      }
      
      public function serializeSound(param1:Boolean = true, param2:Object = null) : String
      {
         var xml:String = null;
         var stockdata:Boolean = param1;
         var log:Object = param2;
         try
         {
            xml = "";
            log.phase = "Speech manager began";
            xml = xml + this.ttsManager.serializeSound(stockdata,log);
            xml = xml + this.micRecordingManager.serializeSound(stockdata,log);
            xml = xml + this.voiceFileManager.serializeSound(stockdata,log);
            log.phase = "Speech manager ended";
         }
         catch(e:SerializeError)
         {
            throw new SerializeError("Failed to serialize sounds in SpeechManager",xml,e);
         }
         return xml;
      }
      
      public function getValueByKey(param1:String) : AnimeSound
      {
         if(this.ttsManager.sounds.containsKey(param1))
         {
            return this.ttsManager.sounds.getValueByKey(param1) as AnimeSound;
         }
         if(this.micRecordingManager.sounds.containsKey(param1))
         {
            return this.micRecordingManager.sounds.getValueByKey(param1) as AnimeSound;
         }
         if(this.voiceFileManager.sounds.containsKey(param1))
         {
            return this.voiceFileManager.sounds.getValueByKey(param1) as AnimeSound;
         }
         return null;
      }
      
      public function createSoundThumbByByte(param1:ByteArray, param2:XML) : SoundThumb
      {
         var _loc3_:SoundThumb = new SoundThumb();
         _loc3_.deSerializeByUserAssetXML(param2,ThemeManager.instance.userTheme);
         _loc3_.enable = true;
         _loc3_.initSoundByByteArray(param1);
         return _loc3_;
      }
      
      public function addSoundByThumb(param1:SoundThumb, param2:AnimeScene, param3:Character = null, param4:Boolean = false, param5:Boolean = false, param6:Number = -1) : void
      {
         var _loc7_:AnimeSound = null;
         var _loc8_:ICommand = null;
         if(param1 && param2)
         {
            _loc7_ = new AnimeSound();
            _loc7_.init(param1,1,param1.totalFrame);
            _loc8_ = new AddSpeechCommand(_loc7_,!!param3?param3.id:null,param4,param5,param6);
            _loc8_.execute();
         }
      }
      
      public function addSoundAtAllScene(param1:AnimeSound, param2:String = null) : void
      {
         var _loc3_:AddSpeechAllCommand = new AddSpeechAllCommand(param1,param2);
         _loc3_.execute();
      }
      
      public function addSoundBySound(param1:AnimeSound, param2:String, param3:String = null, param4:Boolean = false, param5:Boolean = false, param6:Boolean = true, param7:Number = -1) : void
      {
         var _loc8_:AnimeScene = null;
         var _loc9_:Character = null;
         var _loc10_:SoundThumb = null;
         var _loc11_:Object = null;
         var _loc12_:SoundEvent = null;
         var _loc13_:Boolean = false;
         var _loc14_:UtilHashArray = null;
         var _loc15_:int = 0;
         var _loc16_:Boolean = false;
         var _loc17_:EffectAsset = null;
         var _loc18_:AssetLinkage = null;
         var _loc19_:String = null;
         if(param1 && param2)
         {
            _loc8_ = Console.getConsole().getScenebyId(param2);
            if(_loc8_ && param3)
            {
               _loc9_ = _loc8_.getCharacterById(param3);
            }
            if(_loc9_)
            {
               param1.volume = param7 == -1?Number(_loc9_.speakingVolume):Number(param7);
               _loc13_ = false;
               _loc14_ = Console.getConsole().currentScene.effects;
               _loc15_ = _loc14_.length - 1;
               while(_loc15_ >= 0)
               {
                  _loc17_ = _loc14_.getValueByIndex(_loc15_) as EffectAsset;
                  if(_loc17_.fromSpeech)
                  {
                     _loc13_ = true;
                  }
                  _loc15_--;
               }
               if(param4 && !_loc13_)
               {
                  Console.getConsole().addCutEffectonChar(_loc9_);
               }
               _loc9_.demoSpeech = true;
               _loc16_ = false;
               if(param5)
               {
                  _loc16_ = _loc9_.changeActionAsTalk();
               }
               if(!_loc16_)
               {
                  _loc9_.reloadAssetImage();
               }
            }
            else if(param7 != -1)
            {
               param1.volume = param7;
            }
            _loc10_ = param1.soundThumb;
            if(_loc10_ && _loc10_.ttsData)
            {
               if(_loc10_.ttsData.type == SpeechData.SOURCE_TYPE_MIC_RECORDING)
               {
                  this.micRecordingManager.addSoundBySound(param1,param6);
               }
               else if(_loc10_.ttsData.type == SpeechData.SOURCE_TYPE_VOICE_FILE)
               {
                  this.voiceFileManager.addSoundBySound(param1,param6);
               }
               else if(_loc10_.ttsData.type == SpeechData.SOURCE_TYPE_TTS)
               {
                  this.ttsManager.addSoundBySound(param1,param6);
                  if(_loc9_)
                  {
                     _loc9_.speechVoice = _loc10_.ttsData.voice;
                  }
               }
               else if(_loc10_.ttsData.type == SpeechData.SOURCE_TYPE_LIB)
               {
               }
            }
            if(_loc8_)
            {
               _loc18_ = new AssetLinkage();
               _loc18_.addLinkage(param1.getID());
               _loc19_ = _loc8_.id + AssetLinkage.LINK;
               if(_loc9_)
               {
                  _loc19_ = AssetLinkage.LINK + _loc9_.id;
               }
               _loc18_.addLinkage(_loc19_);
               Console.getConsole().linkageController.addLinkage(_loc18_);
            }
            if(_loc8_)
            {
               _loc8_.doUpdateTimelineLength();
            }
            _loc11_ = new Object();
            _loc11_["id"] = param1.getID();
            _loc11_["duration"] = param1.soundThumb.duration / 1000;
            _loc12_ = new SoundEvent(SoundEvent.ADDED,this,_loc11_);
            this.dispatchEvent(_loc12_);
         }
      }
      
      public function removeSoundById(param1:String, param2:Boolean = false, param3:Boolean = false) : AnimeSound
      {
         var _loc4_:AnimeSound = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         var _loc8_:SoundEvent = null;
         var _loc9_:String = null;
         var _loc10_:AnimeScene = null;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         var _loc13_:String = null;
         var _loc14_:Character = null;
         if(param1 && param1 != "")
         {
            if(this.ttsManager.sounds.containsKey(param1))
            {
               _loc4_ = this.ttsManager.removeSoundById(param1);
            }
            else if(this.micRecordingManager.sounds.containsKey(param1))
            {
               _loc4_ = this.micRecordingManager.removeSoundById(param1);
            }
            else if(this.voiceFileManager.sounds.containsKey(param1))
            {
               _loc4_ = this.voiceFileManager.removeSoundById(param1);
            }
            if(_loc4_)
            {
               _loc5_ = Console.getConsole().linkageController.getSceneIdBySoundId(param1);
               _loc6_ = 0;
               while(_loc6_ < _loc5_.length)
               {
                  _loc9_ = _loc5_[_loc6_];
                  _loc10_ = Console.getConsole().getScenebyId(_loc9_);
                  _loc11_ = Console.getConsole().linkageController.getCharIdBySoundIdSceneId(param1,_loc9_);
                  Console.getConsole().linkageController.deleteLinkageById(param1);
                  if(_loc10_)
                  {
                     _loc10_.doUpdateTimelineLength();
                     _loc12_ = 0;
                     while(_loc12_ < _loc11_.length)
                     {
                        _loc13_ = _loc11_[_loc12_];
                        if(_loc13_ && _loc13_ != "")
                        {
                           _loc14_ = _loc10_.getCharacterById(_loc13_);
                           if(_loc14_)
                           {
                              if(param3)
                              {
                                 _loc14_.restoreActionFromTalk();
                              }
                              _loc14_.demoSpeech = false;
                           }
                        }
                        _loc12_++;
                     }
                  }
                  _loc6_++;
               }
               Console.getConsole().currentScene.refreshEffectTray();
               _loc7_ = new Object();
               _loc7_["id"] = _loc4_.getID();
               _loc7_["duration"] = _loc4_.soundThumb.duration / 1000;
               _loc8_ = new SoundEvent(SoundEvent.REMOVED,this,_loc7_);
               this.dispatchEvent(_loc8_);
            }
         }
         return _loc4_;
      }
      
      public function getSoundById(param1:String) : AnimeSound
      {
         return this.getValueByKey(param1);
      }
      
      public function getNumOfSpeech() : Number
      {
         return this.ttsManager.sounds.length + this.micRecordingManager.sounds.length + this.voiceFileManager.sounds.length;
      }
      
      public function getSpeech(param1:AnimeScene) : AnimeSound
      {
         var _loc2_:AnimeSound = null;
         var _loc3_:String = null;
         if(param1)
         {
            _loc3_ = Console.getConsole().linkageController.getSpeechSoundIdByScene(param1);
            if(_loc3_)
            {
               _loc2_ = Console.getConsole().speechManager.getValueByKey(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function getSpeechTotalFrame(param1:AnimeScene) : int
      {
         var _loc2_:int = 0;
         var _loc3_:AnimeSound = this.getSpeech(param1);
         if(_loc3_)
         {
            if(_loc3_ && _loc3_.soundThumb)
            {
               _loc2_ = UtilUnitConvert.secToFrame(_loc3_.soundThumb.duration / 1000);
            }
         }
         return _loc2_;
      }
   }
}
