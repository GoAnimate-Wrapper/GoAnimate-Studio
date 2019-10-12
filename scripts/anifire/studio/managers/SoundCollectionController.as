package anifire.studio.managers
{
   import anifire.constant.AnimeConstants;
   import anifire.interfaces.ICollection;
   import anifire.interfaces.IIterator;
   import anifire.studio.components.SoundAlertPopUp;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   import anifire.studio.core.sound.SoundCollection;
   import anifire.studio.core.sound.SoundSelection;
   import anifire.util.UtilDict;
   import anifire.util.UtilMath;
   import flash.display.DisplayObjectContainer;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.core.FlexGlobals;
   import mx.utils.StringUtil;
   import spark.events.PopUpEvent;
   
   public class SoundCollectionController extends EventDispatcher
   {
      
      public static const DEFAULT_MAX_SOUND_TRACK_NUM:int = 3;
      
      public static const DEFAULT_MAX_VOICE_TRACK_NUM:int = 2;
       
      
      private var _sounds:SoundCollection;
      
      private var _wrapEnabled:Boolean = true;
      
      private var _permutations:Array;
      
      private var _maxSoundTrackNum:int = 3;
      
      public function SoundCollectionController(param1:SoundCollection, param2:IEventDispatcher = null)
      {
         var _loc4_:uint = 0;
         super(param2);
         this._sounds = param1;
         var _loc3_:Array = new Array();
         while(_loc4_ < this._maxSoundTrackNum)
         {
            _loc3_.push(_loc4_);
            _loc4_++;
         }
         this._permutations = UtilMath.permutate(_loc3_);
      }
      
      public function get wrapEnabled() : Boolean
      {
         return this._wrapEnabled;
      }
      
      public function set wrapEnabled(param1:Boolean) : void
      {
         if(this._wrapEnabled != param1)
         {
            this._wrapEnabled = param1;
            if(param1)
            {
               this.refreshOrder();
               this.wrapSoundCollection();
            }
         }
      }
      
      public function addSound(param1:AnimeSound) : void
      {
         if(!param1)
         {
            return;
         }
         if(this._sounds)
         {
            param1.soundsController = this;
            this._sounds.addSound(param1);
         }
         if(this.wrapEnabled)
         {
            this.wrapSoundCollection();
         }
      }
      
      public function removeSoundById(param1:String) : AnimeSound
      {
         var _loc2_:AnimeSound = null;
         if(this._sounds)
         {
            _loc2_ = this._sounds.removeSoundById(param1);
            if(this.wrapEnabled)
            {
               this.wrapSoundCollection();
            }
         }
         return _loc2_;
      }
      
      private function checkSoundOverlap(param1:AnimeSound) : int
      {
         var _loc3_:IIterator = null;
         var _loc4_:AnimeSound = null;
         var _loc2_:int = 0;
         if(this._sounds && param1)
         {
            _loc3_ = this._sounds.iterator();
            while(_loc3_.hasNext)
            {
               _loc4_ = _loc3_.next as AnimeSound;
               _loc2_ = this.getOverlappedFrame(_loc4_,param1);
               if(_loc2_ != 0)
               {
                  break;
               }
            }
         }
         return _loc2_;
      }
      
      public function checkOverlap() : int
      {
         var _loc2_:IIterator = null;
         var _loc3_:AnimeSound = null;
         var _loc1_:int = 0;
         if(this._sounds)
         {
            _loc2_ = this._sounds.iterator();
            while(_loc2_.hasNext)
            {
               _loc3_ = _loc2_.next as AnimeSound;
               _loc1_ = this.checkSoundOverlap(_loc3_);
               if(_loc1_ != 0)
               {
                  break;
               }
            }
         }
         return _loc1_;
      }
      
      private function getCategory(param1:AnimeSound) : String
      {
         return AnimeConstants.ASSET_TYPE_SOUND_SUBTYPE_BG_MUSIC;
      }
      
      private function getOverlappedFrame(param1:AnimeSound, param2:AnimeSound) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 && param2 && param1 != param2 && param1.trackNum == param2.trackNum && this.getCategory(param1) == this.getCategory(param2))
         {
            if(!(param1.endFrame + _loc4_ < param2.startFrame || param2.endFrame + _loc4_ < param1.startFrame))
            {
               _loc3_ = Math.min(param1.endFrame,param2.endFrame) - Math.max(param1.startFrame,param2.startFrame) + _loc4_;
            }
         }
         return _loc3_;
      }
      
      private function resolveSoundOverlap(param1:AnimeSound, param2:Boolean = false) : int
      {
         var _loc3_:int = 0;
         var _loc4_:IIterator = null;
         var _loc5_:AnimeSound = null;
         var _loc6_:int = 0;
         if(this._sounds && param1)
         {
            _loc3_ = 0;
            _loc4_ = this._sounds.iterator();
            _loc6_ = 0;
            while(_loc4_.hasNext)
            {
               _loc5_ = _loc4_.next as AnimeSound;
               if(_loc5_ && _loc5_ != param1)
               {
                  _loc3_ = this.getOverlappedFrame(_loc5_,param1);
                  if(_loc3_ != 0)
                  {
                     if(this.wrapEnabled)
                     {
                        if(this._sounds.getSoundOrder(param1) > this._sounds.getSoundOrder(_loc5_))
                        {
                           if(param1.trackNum < this._maxSoundTrackNum - 1)
                           {
                              param1.trackNum++;
                              return this.resolveSoundOverlap(param1,param2);
                           }
                           if(param2)
                           {
                              Console.getConsole().removeSoundById(param1.getID());
                              return 0;
                           }
                           return _loc3_;
                        }
                        if(_loc5_.trackNum < this._maxSoundTrackNum - 1)
                        {
                           _loc5_.trackNum++;
                        }
                     }
                     else if(param1.startFrame - _loc6_ >= _loc5_.startFrame + AnimeConstants.SOUND_FRAME_MINIMUM)
                     {
                        _loc5_.endFrame = param1.startFrame - _loc6_ - 1;
                     }
                     else
                     {
                        Console.getConsole().removeSoundById(_loc5_.getID());
                     }
                  }
               }
            }
         }
         return 0;
      }
      
      public function wrapSoundCollection(param1:Boolean = false) : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:IIterator = null;
         var _loc5_:AnimeSound = null;
         if(this.wrapEnabled && this._sounds)
         {
            _loc2_ = 0;
            _loc3_ = 0;
            _loc4_ = this._sounds.iterator();
            while(_loc4_.hasNext)
            {
               _loc5_ = _loc4_.next as AnimeSound;
               if(_loc5_)
               {
                  _loc5_.trackNum = 0;
                  _loc2_ = this.resolveSoundOverlap(_loc5_,param1);
                  _loc3_ = Math.max(_loc3_,_loc2_);
               }
            }
            return _loc3_;
         }
         return 0;
      }
      
      private function reorderSounds(param1:SoundSelection) : void
      {
         var _loc2_:AnimeSound = null;
         var _loc3_:IIterator = null;
         if(param1)
         {
            _loc3_ = param1.iterator();
            while(_loc3_.hasNext)
            {
               _loc2_ = _loc3_.next as AnimeSound;
               if(_loc2_)
               {
                  this._sounds.reorderSound(_loc2_);
               }
            }
         }
      }
      
      private function selectSoundsByTrack(param1:int, param2:ICollection, param3:SoundSelection) : SoundSelection
      {
         var _loc4_:AnimeSound = null;
         var _loc5_:IIterator = null;
         if(param2)
         {
            _loc5_ = param2.iterator();
            while(_loc5_.hasNext)
            {
               _loc4_ = _loc5_.next as AnimeSound;
               if(_loc4_ && _loc4_.trackNum == param1)
               {
                  param3.addSound(_loc4_);
               }
            }
         }
         return param3;
      }
      
      private function selectSpeechByTrack(param1:int, param2:ICollection, param3:SoundSelection) : SoundSelection
      {
         var _loc4_:AnimeSound = null;
         var _loc5_:IIterator = null;
         if(param2)
         {
            _loc5_ = param2.iterator();
            while(_loc5_.hasNext)
            {
               _loc4_ = _loc5_.next as AnimeSound;
               if(_loc4_ && _loc4_.trackNum == param1 && _loc4_.scene)
               {
                  param3.addSound(_loc4_);
               }
            }
         }
         return param3;
      }
      
      public function refreshOrder(param1:AnimeSound = null) : void
      {
         var _loc2_:Vector.<SoundSelection> = null;
         var _loc3_:SoundSelection = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this.wrapEnabled)
         {
            _loc2_ = new Vector.<SoundSelection>();
            _loc4_ = 0;
            while(_loc4_ < this._maxSoundTrackNum)
            {
               _loc3_ = new SoundSelection();
               _loc3_ = this.selectSpeechByTrack(_loc4_,this._sounds,_loc3_);
               if(param1 && param1.trackNum == _loc4_)
               {
                  _loc3_.addSound(param1);
               }
               _loc3_ = this.selectSoundsByTrack(_loc4_,this._sounds,_loc3_);
               _loc2_.push(_loc3_);
               _loc4_++;
            }
            _loc5_ = 0;
            while(_loc5_ < this._maxSoundTrackNum)
            {
               this.reorderSounds(_loc2_[_loc5_]);
               _loc5_++;
            }
         }
      }
      
      public function resolveOverlap(param1:SoundSelection) : int
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:SoundSelection = null;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:IIterator = null;
         var _loc9_:AnimeSound = null;
         if(this.wrapEnabled)
         {
            _loc2_ = this.wrapSoundCollection();
            if(_loc2_ == 0)
            {
               return 0;
            }
            _loc3_ = new Array();
            _loc5_ = 0;
            while(_loc5_ < this._maxSoundTrackNum)
            {
               _loc4_ = new SoundSelection();
               _loc4_ = this.selectSoundsByTrack(_loc5_,param1,_loc4_);
               _loc3_.push(_loc4_);
               _loc5_++;
            }
            _loc5_ = 0;
            while(_loc5_ < this._permutations.length)
            {
               _loc6_ = this._permutations[_loc5_];
               _loc7_ = 0;
               while(_loc7_ < _loc6_.length)
               {
                  _loc4_ = _loc3_[int(_loc6_[_loc7_])] as SoundSelection;
                  this.reorderSounds(_loc4_);
                  _loc7_++;
               }
               _loc2_ = this.wrapSoundCollection();
               if(_loc2_ == 0)
               {
                  return 0;
               }
               _loc5_++;
            }
            this.showOverlapConfirmation();
            return _loc2_;
         }
         if(param1)
         {
            _loc8_ = param1.iterator();
            while(_loc8_.hasNext)
            {
               _loc9_ = _loc8_.next as AnimeSound;
               if(_loc9_)
               {
                  this.resolveSoundOverlap(_loc9_);
               }
            }
         }
         return 0;
      }
      
      public function moveSound(param1:AnimeSound, param2:int, param3:int) : int
      {
         if(param1)
         {
            param1.startFrame = param2;
            param1.trackNum = param3;
            if(this.wrapEnabled)
            {
               return this.wrapSoundCollection();
            }
            return this.checkSoundOverlap(param1);
         }
         return 0;
      }
      
      public function moveSoundCollection(param1:ICollection, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:IIterator = null;
         var _loc6_:AnimeSound = null;
         if(param1)
         {
            _loc3_ = StudioSoundManager.getFirstFrame(param1);
            _loc4_ = param2 - _loc3_;
            _loc5_ = param1.iterator();
            while(_loc5_.hasNext)
            {
               _loc6_ = _loc5_.next as AnimeSound;
               if(_loc6_)
               {
                  _loc6_.startFrame = _loc6_.startFrame + _loc4_;
               }
            }
         }
         if(this.wrapEnabled)
         {
            this.wrapSoundCollection();
         }
      }
      
      public function moveSoundCollectionByFrame(param1:ICollection, param2:int) : void
      {
         var _loc3_:IIterator = null;
         var _loc4_:AnimeSound = null;
         if(param1)
         {
            _loc3_ = param1.iterator();
            while(_loc3_.hasNext)
            {
               _loc4_ = _loc3_.next as AnimeSound;
               if(_loc4_)
               {
                  _loc4_.startFrame = _loc4_.startFrame + param2;
               }
            }
         }
      }
      
      public function resizeSound(param1:AnimeSound, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false) : int
      {
         var _loc6_:AnimeSound = null;
         var _loc7_:AnimeSound = null;
         if(param1)
         {
            if(this.wrapEnabled)
            {
               if(param5)
               {
                  this.refreshOrder(param1);
               }
               param1.leftFrame = param2;
               param1.endFrame = param3;
               return this.wrapSoundCollection();
            }
            if(this._sounds)
            {
               _loc6_ = StudioSoundManager.getLastSoundBeforeFrameOnTrack(this._sounds,param1.startFrame,param1.trackNum,param1);
               _loc7_ = StudioSoundManager.getFirstSoundAfterFrameOnTrack(this._sounds,param1.startFrame,param1.trackNum,param1);
               if(_loc6_)
               {
                  param2 = Math.max(param2,_loc6_.endFrame + 1);
               }
               if(_loc7_)
               {
                  param3 = Math.min(param3,_loc7_.startFrame - 1);
               }
            }
            param1.leftFrame = param2;
            param1.endFrame = param3;
         }
         return 0;
      }
      
      public function getAllSoundStartAfterFrame(param1:int) : SoundSelection
      {
         return StudioSoundManager.getAllSoundStartAfterFrame(this._sounds,param1);
      }
      
      public function getAllSoundStartBetweenFrame(param1:int, param2:int) : SoundSelection
      {
         return StudioSoundManager.getAllSoundStartBetweenFrame(this._sounds,param1,param2);
      }
      
      public function getAllSoundBetweenFrame(param1:int, param2:int) : Array
      {
         return StudioSoundManager.getAllSoundBetweenFrame(this._sounds,param1,param2);
      }
      
      public function getMaxLeftOffset(param1:ICollection) : int
      {
         var _loc2_:int = 0;
         var _loc3_:IIterator = null;
         var _loc4_:AnimeSound = null;
         var _loc5_:AnimeSound = null;
         var _loc6_:int = 0;
         if(param1)
         {
            _loc3_ = param1.iterator();
            _loc6_ = -1;
            while(_loc3_.hasNext)
            {
               _loc4_ = _loc3_.next as AnimeSound;
               if(_loc4_)
               {
                  _loc5_ = StudioSoundManager.getLastSoundBeforeFrameOnTrack(this._sounds,_loc4_.startFrame,_loc4_.trackNum,_loc4_);
                  if(_loc5_ && param1 is SoundSelection && SoundSelection(param1).isSelected(_loc5_) == false)
                  {
                     _loc2_ = _loc4_.startFrame - _loc5_.endFrame - 1;
                  }
                  else
                  {
                     _loc2_ = _loc4_.startFrame - 1;
                  }
                  if(_loc6_ == -1)
                  {
                     _loc6_ = _loc2_;
                  }
                  else
                  {
                     _loc6_ = Math.min(_loc2_,_loc6_);
                  }
               }
            }
            return -_loc6_;
         }
         return 0;
      }
      
      public function get sounds() : SoundCollection
      {
         return this._sounds;
      }
      
      public function showOverlapConfirmation() : void
      {
         var _loc1_:SoundAlertPopUp = new SoundAlertPopUp();
         _loc1_.title = UtilDict.toDisplay("go","Sound Clip Overlapping");
         var _loc2_:String = UtilDict.toDisplay("go","Following your latest change, some sound clips are overlapping in your timeline. This happened because you cannot have more than {0} sounds clips playing at the same time.");
         _loc2_ = StringUtil.substitute(_loc2_,this._maxSoundTrackNum);
         _loc1_.message = _loc2_;
         _loc1_.confirmText = UtilDict.toDisplay("go","Undo Changes");
         _loc1_.showCancelButton = false;
         _loc1_.showCloseButton = false;
         _loc1_.addEventListener(PopUpEvent.CLOSE,this.undoPopUp_closeHandler);
         _loc1_.open(FlexGlobals.topLevelApplication as DisplayObjectContainer,true);
      }
      
      private function undoPopUp_closeHandler(param1:PopUpEvent) : void
      {
         StudioManager.instance.undo(false);
      }
      
      public function get maxSoundTrackNum() : int
      {
         return this._maxSoundTrackNum;
      }
      
      public function set maxSoundTrackNum(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         if(this._maxSoundTrackNum != param1)
         {
            this._maxSoundTrackNum = param1;
            _loc2_ = new Array();
            while(_loc3_ < this._maxSoundTrackNum)
            {
               _loc2_.push(_loc3_);
               _loc3_++;
            }
            this._permutations = UtilMath.permutate(_loc2_);
         }
      }
   }
}
