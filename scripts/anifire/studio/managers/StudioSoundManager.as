package anifire.studio.managers
{
   import anifire.constant.AnimeConstants;
   import anifire.interfaces.ICollection;
   import anifire.interfaces.IIterator;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.sound.SoundCollection;
   import anifire.studio.core.sound.SoundSelection;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class StudioSoundManager extends EventDispatcher
   {
       
      
      public function StudioSoundManager(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public static function validateStartFrame(param1:int) : int
      {
         param1 = Math.round((param1 - 1) / AnimeConstants.SOUND_FRAME_INTERVAL) * AnimeConstants.SOUND_FRAME_INTERVAL + 1;
         if(param1 < 1)
         {
            param1 = 1;
         }
         return param1;
      }
      
      public static function validateTotalFrame(param1:int) : int
      {
         param1 = Math.round(param1 / AnimeConstants.SOUND_FRAME_INTERVAL) * AnimeConstants.SOUND_FRAME_INTERVAL;
         if(param1 < AnimeConstants.SOUND_FRAME_MINIMUM)
         {
            param1 = AnimeConstants.SOUND_FRAME_MINIMUM;
         }
         return param1;
      }
      
      public static function validateFadingDuration(param1:int) : int
      {
         param1 = Math.round(param1 / AnimeConstants.SOUND_FADING_DURATION_SNAP_INTERVAL) * AnimeConstants.SOUND_FADING_DURATION_SNAP_INTERVAL;
         if(param1 < 0)
         {
            param1 = 0;
         }
         return param1;
      }
      
      public static function validateTrack(param1:int) : int
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         return param1;
      }
      
      public static function validateVolume(param1:Number) : Number
      {
         if(isNaN(param1))
         {
            param1 = 1;
         }
         param1 = Math.round(param1 / AnimeConstants.SOUND_VOLUME_SNAP_INTERVAL) * AnimeConstants.SOUND_VOLUME_SNAP_INTERVAL;
         if(param1 < 0)
         {
            param1 = 0;
         }
         return param1;
      }
      
      public static function getFirstSoundAfterFrameOnTrack(param1:SoundCollection, param2:int, param3:int, param4:AnimeSound = null) : AnimeSound
      {
         var _loc5_:IIterator = null;
         var _loc6_:AnimeSound = null;
         var _loc7_:AnimeSound = null;
         if(param1)
         {
            _loc5_ = param1.iterator();
            while(_loc5_.hasNext)
            {
               _loc6_ = _loc5_.next as AnimeSound;
               if(_loc6_ && _loc6_ != param4 && _loc6_.trackNum == param3 && _loc6_.startFrame > param2)
               {
                  if(_loc7_)
                  {
                     if(_loc7_.startFrame > _loc6_.startFrame)
                     {
                        _loc7_ = _loc6_;
                     }
                  }
                  else
                  {
                     _loc7_ = _loc6_;
                  }
               }
            }
            return _loc7_;
         }
         return null;
      }
      
      public static function getLastSoundBeforeFrameOnTrack(param1:SoundCollection, param2:int, param3:int, param4:AnimeSound = null) : AnimeSound
      {
         var _loc5_:IIterator = null;
         var _loc6_:AnimeSound = null;
         var _loc7_:AnimeSound = null;
         if(param1)
         {
            _loc5_ = param1.iterator();
            while(_loc5_.hasNext)
            {
               _loc6_ = _loc5_.next as AnimeSound;
               if(_loc6_ && _loc6_ != param4 && _loc6_.trackNum == param3 && _loc6_.endFrame < param2)
               {
                  if(_loc7_)
                  {
                     if(_loc7_.endFrame < _loc6_.endFrame)
                     {
                        _loc7_ = _loc6_;
                     }
                  }
                  else
                  {
                     _loc7_ = _loc6_;
                  }
               }
            }
            return _loc7_;
         }
         return null;
      }
      
      public static function getSoundStartAtFrameOnTrack(param1:SoundCollection, param2:int, param3:int, param4:AnimeSound = null) : AnimeSound
      {
         var _loc5_:IIterator = null;
         var _loc6_:AnimeSound = null;
         if(param1)
         {
            _loc5_ = param1.iterator();
            while(_loc5_.hasNext)
            {
               _loc6_ = _loc5_.next as AnimeSound;
               if(_loc6_ && _loc6_.trackNum == param3 && _loc6_.startFrame == param2)
               {
                  return _loc6_;
               }
            }
         }
         return null;
      }
      
      public static function getSoundAtFrameOnTrack(param1:SoundCollection, param2:int, param3:int, param4:AnimeSound = null) : AnimeSound
      {
         var _loc5_:IIterator = null;
         var _loc6_:AnimeSound = null;
         var _loc7_:AnimeSound = null;
         if(param1)
         {
            _loc5_ = param1.iterator();
            while(_loc5_.hasNext)
            {
               _loc6_ = _loc5_.next as AnimeSound;
               if(_loc6_ && _loc6_ != param4 && _loc6_.trackNum == param3 && _loc6_.startFrame <= param2)
               {
                  if(_loc7_)
                  {
                     if(_loc7_.startFrame < _loc6_.startFrame)
                     {
                        _loc7_ = _loc6_;
                     }
                  }
                  else
                  {
                     _loc7_ = _loc6_;
                  }
               }
            }
            if(_loc7_ && _loc7_.endFrame >= param2)
            {
               return _loc7_;
            }
         }
         return null;
      }
      
      public static function getAllSoundStartAfterFrame(param1:SoundCollection, param2:int) : SoundSelection
      {
         var _loc3_:SoundSelection = null;
         var _loc4_:IIterator = null;
         var _loc5_:AnimeSound = null;
         if(param1)
         {
            _loc4_ = param1.iterator();
            while(_loc4_.hasNext)
            {
               _loc5_ = _loc4_.next as AnimeSound;
               if(_loc5_ && _loc5_.startFrame > param2)
               {
                  if(!_loc3_)
                  {
                     _loc3_ = new SoundSelection();
                  }
                  _loc3_.addSound(_loc5_);
               }
            }
         }
         return _loc3_;
      }
      
      public static function getAllSoundStartBetweenFrame(param1:SoundCollection, param2:int, param3:int) : SoundSelection
      {
         var _loc4_:SoundSelection = null;
         var _loc5_:IIterator = null;
         var _loc6_:AnimeSound = null;
         if(param1)
         {
            _loc5_ = param1.iterator();
            while(_loc5_.hasNext)
            {
               _loc6_ = _loc5_.next as AnimeSound;
               if(_loc6_)
               {
                  if(_loc6_.startFrame >= param2 && _loc6_.startFrame <= param3)
                  {
                     if(!_loc4_)
                     {
                        _loc4_ = new SoundSelection();
                     }
                     _loc4_.addSound(_loc6_);
                  }
               }
            }
         }
         return _loc4_;
      }
      
      public static function getAllSoundBetweenFrame(param1:SoundCollection, param2:int, param3:int) : Array
      {
         var _loc4_:Array = null;
         var _loc5_:IIterator = null;
         var _loc6_:AnimeSound = null;
         if(param1)
         {
            _loc5_ = param1.iterator();
            while(_loc5_.hasNext)
            {
               _loc6_ = _loc5_.next as AnimeSound;
               if(_loc6_)
               {
                  if(!(_loc6_.endFrame < param2 || _loc6_.startFrame > param3))
                  {
                     if(!_loc4_)
                     {
                        _loc4_ = new Array();
                     }
                     _loc4_.push(_loc6_);
                  }
               }
            }
         }
         return _loc4_;
      }
      
      public static function getFirstFrame(param1:ICollection) : int
      {
         var _loc2_:IIterator = null;
         var _loc3_:AnimeSound = null;
         var _loc4_:int = 0;
         if(param1)
         {
            _loc2_ = param1.iterator();
            _loc4_ = 0;
            while(_loc2_.hasNext)
            {
               _loc3_ = _loc2_.next as AnimeSound;
               if(_loc3_)
               {
                  if(_loc4_ == 0)
                  {
                     _loc4_ = _loc3_.startFrame;
                  }
                  else if(_loc4_ > _loc3_.startFrame)
                  {
                     _loc4_ = _loc3_.startFrame;
                  }
               }
            }
            return _loc4_;
         }
         return 0;
      }
      
      public static function isSoundCollision(param1:AnimeSound, param2:AnimeSound) : Boolean
      {
         if(param1.endFrame < param2.startFrame || param1.startFrame > param2.endFrame)
         {
            return false;
         }
         return true;
      }
   }
}
