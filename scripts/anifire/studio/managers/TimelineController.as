package anifire.studio.managers
{
   import anifire.constant.AnimeConstants;
   import anifire.interfaces.ICollection;
   import anifire.interfaces.IIterator;
   import anifire.studio.commands.ChangeSceneDurationCommand;
   import anifire.studio.commands.ClearSceneCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.commands.MoveSceneCommand;
   import anifire.studio.commands.MoveSoundCommand;
   import anifire.studio.commands.RemoveSceneCommand;
   import anifire.studio.components.AlertPopUp;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.MovieData;
   import anifire.studio.core.sound.SoundSelection;
   import anifire.studio.events.MovieEvent;
   import anifire.studio.events.SceneDurationEvent;
   import anifire.studio.events.SceneEvent;
   import anifire.studio.events.TimelineEvent;
   import anifire.util.UtilUnitConvert;
   import flash.events.EventDispatcher;
   
   public class TimelineController extends EventDispatcher
   {
      
      public static const LABEL_ALERT_REPLACE_SCENE:String = "Please remove the sound(s) in this scene before replacing it.";
      
      public static const LABEL_ALERT_REMOVE_SCENE:String = "Please remove the sound(s) in this scene before deleting it.";
       
      
      private var _movie:MovieData;
      
      private var _soundsController:SoundCollectionController;
      
      private var _voicesController:SoundCollectionController;
      
      private var _soundsToBeMoved:SoundSelection;
      
      private var _voicesToBeMoved:SoundSelection;
      
      private var _oldSoundFirstFrame:int;
      
      private var _oldVoiceFirstFrame:int;
      
      private var _oldTotalFrame:int;
      
      private var _maxSoundOffset:int;
      
      private var _command:ChangeSceneDurationCommand;
      
      private var _autoMoveSounds:Boolean = true;
      
      public var autoResolveSoundOverlap:Boolean = true;
      
      public function TimelineController(param1:MovieData, param2:SoundCollectionController, param3:SoundCollectionController)
      {
         super();
         this._movie = param1;
         this._movie.addEventListener(SceneDurationEvent.SCENE_DURATION_CHANGE,this.onSceneDurationChange);
         this._movie.addEventListener(MovieEvent.SCENE_ADDED,this.onSceneAdded);
         this._movie.addEventListener(MovieEvent.SCENE_REMOVED,this.onSceneRemoved);
         this._soundsController = param2;
         this._voicesController = param3;
      }
      
      private function doBeforeResizeScene(param1:AnimeScene, param2:int) : void
      {
         if(param1)
         {
            this._soundsToBeMoved = this._soundsController.getAllSoundStartAfterFrame(param2);
            this._voicesToBeMoved = this._voicesController.getAllSoundStartAfterFrame(param2);
            this._oldSoundFirstFrame = StudioSoundManager.getFirstFrame(this._soundsToBeMoved);
            this._oldVoiceFirstFrame = StudioSoundManager.getFirstFrame(this._voicesToBeMoved);
            this._maxSoundOffset = Math.min(this._soundsController.getMaxLeftOffset(this._soundsToBeMoved),this._voicesController.getMaxLeftOffset(this._voicesToBeMoved));
            this._oldTotalFrame = param1.totalFrames;
            if(this._soundsController.wrapEnabled)
            {
               this._soundsController.refreshOrder();
            }
            if(this._voicesController.wrapEnabled)
            {
               this._voicesController.refreshOrder();
            }
         }
      }
      
      public function changeSceneDuration(param1:AnimeScene, param2:int) : void
      {
         var _loc3_:ChangeSceneDurationCommand = null;
         if(param1)
         {
            _loc3_ = new ChangeSceneDurationCommand(param1);
            _loc3_.executeNow(param2,AnimeScene.DURATION_MODE_CUSTOM);
         }
      }
      
      private function onSceneAdded(param1:MovieEvent) : void
      {
         var _loc2_:AnimeScene = null;
         var _loc3_:int = 0;
         if(param1.scene)
         {
            _loc2_ = param1.scene;
            _loc2_.addEventListener(SceneEvent.DURATION_CHANGE,this.onTimelineSceneDurationChange);
            if(this._autoMoveSounds)
            {
               _loc3_ = this.getGlobalStartFrame(_loc2_);
               this.doBeforeResizeScene(_loc2_,_loc3_ - 1);
               if(this._soundsToBeMoved)
               {
                  this._soundsController.moveSoundCollection(this._soundsToBeMoved,this._oldSoundFirstFrame + _loc2_.totalFrames);
               }
               if(this._voicesToBeMoved)
               {
                  this._voicesController.moveSoundCollection(this._voicesToBeMoved,this._oldVoiceFirstFrame + _loc2_.totalFrames);
               }
            }
         }
      }
      
      private function onSceneRemoved(param1:MovieEvent) : void
      {
         var _loc2_:AnimeScene = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1.scene)
         {
            param1.scene.removeEventListener(SceneEvent.DURATION_CHANGE,this.onTimelineSceneDurationChange);
         }
         if(!this._autoMoveSounds)
         {
            return;
         }
         if(param1.index >= 0 && param1.scene)
         {
            _loc2_ = this._movie.getSceneAt(param1.index - 1);
            if(_loc2_)
            {
               _loc3_ = this.getGlobalStartFrame(_loc2_);
               this.doBeforeResizeScene(param1.scene,_loc3_ + _loc2_.totalFrames - 1);
            }
            else
            {
               this.doBeforeResizeScene(param1.scene,0);
            }
            if(this._soundsToBeMoved || this._voicesToBeMoved)
            {
               _loc4_ = -param1.scene.totalFrames;
               this._soundsController.moveSoundCollection(this._soundsToBeMoved,this._oldSoundFirstFrame + _loc4_);
               this._voicesController.moveSoundCollection(this._voicesToBeMoved,this._oldVoiceFirstFrame + _loc4_);
               this._soundsController.resolveOverlap(this._soundsToBeMoved);
               this._voicesController.resolveOverlap(this._voicesToBeMoved);
            }
         }
      }
      
      private function onTimelineSceneDurationChange(param1:SceneEvent) : void
      {
         dispatchEvent(new TimelineEvent(TimelineEvent.SCENE_DURATION_CHANGE));
      }
      
      private function onSceneDurationChange(param1:SceneDurationEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!this._autoMoveSounds)
         {
            return;
         }
         var _loc2_:AnimeScene = param1.scene;
         if(_loc2_)
         {
            _loc3_ = this.getGlobalStartFrame(_loc2_);
            _loc4_ = param1.offset;
            this.doBeforeResizeScene(_loc2_,_loc3_ + _loc2_.totalFrames - 1 - _loc4_);
            if(this._soundsToBeMoved)
            {
               this._soundsController.moveSoundCollection(this._soundsToBeMoved,this._oldSoundFirstFrame + _loc4_);
            }
            if(this._voicesToBeMoved)
            {
               this._voicesController.moveSoundCollection(this._voicesToBeMoved,this._oldVoiceFirstFrame + _loc4_);
            }
            if(this.autoResolveSoundOverlap)
            {
               this.resolveAllSoundOverlap();
            }
         }
      }
      
      public function resolveAllSoundOverlap() : void
      {
         if(this._soundsToBeMoved)
         {
            this._soundsController.resolveOverlap(this._soundsToBeMoved);
         }
         if(this._voicesToBeMoved)
         {
            this._voicesController.resolveOverlap(this._voicesToBeMoved);
         }
      }
      
      public function startResizingScene(param1:AnimeScene, param2:int) : void
      {
         this._command = new ChangeSceneDurationCommand(param1);
         this.doBeforeResizeScene(param1,param2);
         this._movie.removeEventListener(SceneDurationEvent.SCENE_DURATION_CHANGE,this.onSceneDurationChange);
      }
      
      public function resizingScene(param1:AnimeScene, param2:int) : Boolean
      {
         var _loc3_:Boolean = true;
         if(this._autoMoveSounds)
         {
            if(this._soundsToBeMoved)
            {
               param2 = Math.max(param2,AnimeConstants.SCENE_FRAME_MINIMUM - this._oldTotalFrame);
               if(!this._soundsController.wrapEnabled)
               {
                  param2 = Math.max(param2,this._maxSoundOffset);
                  if(param2 == this._maxSoundOffset)
                  {
                     _loc3_ = false;
                  }
               }
            }
            if(this._voicesToBeMoved)
            {
               param2 = Math.max(param2,AnimeConstants.SCENE_FRAME_MINIMUM - this._oldTotalFrame);
               if(!this._voicesController.wrapEnabled)
               {
                  param2 = Math.max(param2,this._maxSoundOffset);
                  if(param2 == this._maxSoundOffset)
                  {
                     _loc3_ = false;
                  }
               }
            }
         }
         if(param1)
         {
            param1.durationMode = AnimeScene.DURATION_MODE_CUSTOM;
            param1.customTotalFrames = this._oldTotalFrame + param2;
         }
         if(this._autoMoveSounds)
         {
            if(this._soundsToBeMoved)
            {
               this._soundsController.moveSoundCollection(this._soundsToBeMoved,this._oldSoundFirstFrame + param2);
            }
            if(this._voicesToBeMoved)
            {
               this._voicesController.moveSoundCollection(this._voicesToBeMoved,this._oldVoiceFirstFrame + param2);
            }
         }
         return _loc3_;
      }
      
      public function endResizingScene(param1:AnimeScene, param2:int) : void
      {
         if(param2 != 0)
         {
            this._command.executeNow(param1.totalFrames,AnimeScene.DURATION_MODE_CUSTOM);
            if(this._autoMoveSounds)
            {
               if(this._soundsController.wrapEnabled && this._soundsToBeMoved)
               {
                  this._soundsController.resolveOverlap(this._soundsToBeMoved);
               }
               if(this._voicesController.wrapEnabled && this._voicesToBeMoved)
               {
                  this._voicesController.resolveOverlap(this._voicesToBeMoved);
               }
            }
         }
         this._movie.addEventListener(SceneDurationEvent.SCENE_DURATION_CHANGE,this.onSceneDurationChange);
      }
      
      public function getGlobalStartFrame(param1:AnimeScene) : int
      {
         return this._movie.getSceneStartFrame(param1);
      }
      
      public function checkAudioOverlapping(param1:AnimeScene) : Boolean
      {
         var _loc3_:SoundSelection = null;
         var _loc4_:SoundSelection = null;
         var _loc2_:int = this.getGlobalStartFrame(param1);
         _loc3_ = this._soundsController.getAllSoundStartBetweenFrame(_loc2_,_loc2_ + param1.totalFrames - 1);
         _loc4_ = this._voicesController.getAllSoundStartBetweenFrame(_loc2_,_loc2_ + param1.totalFrames - 1);
         if(_loc3_ || _loc4_)
         {
            return true;
         }
         return false;
      }
      
      public function removeSceneAt(param1:int) : AnimeScene
      {
         var _loc3_:ICommand = null;
         var _loc2_:AnimeScene = this._movie.getSceneAt(param1);
         if(_loc2_)
         {
            if(!this.checkAudioOverlapping(_loc2_))
            {
               if(this._movie.length > 1)
               {
                  _loc3_ = new RemoveSceneCommand(this._movie,_loc2_,this._movie.getSceneIndex(_loc2_));
               }
               else
               {
                  _loc3_ = new ClearSceneCommand(_loc2_);
               }
               _loc3_.execute();
               return _loc2_;
            }
            AlertPopUp.openDefaultPopUpWithLocale(LABEL_ALERT_REMOVE_SCENE);
         }
         return null;
      }
      
      public function moveScene(param1:int, param2:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:SoundSelection = null;
         var _loc10_:IIterator = null;
         var _loc11_:AnimeSound = null;
         var _loc12_:ICommand = null;
         var _loc13_:int = 0;
         var _loc14_:AnimeSound = null;
         var _loc15_:MoveSoundCommand = null;
         if(param1 == param2)
         {
            return;
         }
         var _loc3_:AnimeScene = this._movie.getSceneAt(param1);
         var _loc4_:AnimeScene = param1 < param2?this._movie.getSceneAt(param2 - 1):this._movie.getSceneAt(param2);
         if(_loc3_ && _loc4_)
         {
            _loc5_ = this.getGlobalStartFrame(_loc3_);
            _loc6_ = _loc5_ + _loc3_.totalFrames - 1;
            _loc7_ = this.getGlobalStartFrame(_loc4_);
            _loc8_ = _loc7_ + _loc4_.totalFrames - 1;
            _loc9_ = this._soundsController.getAllSoundStartBetweenFrame(_loc5_,_loc6_);
            if(_loc9_)
            {
               AlertPopUp.openDefaultPopUpWithLocale("Please remove the sound(s) in this scene before moving it.");
               return;
            }
            _loc9_ = this._voicesController.getAllSoundStartBetweenFrame(_loc5_,_loc6_);
            if(_loc9_)
            {
               _loc10_ = _loc9_.iterator();
               while(_loc10_.hasNext)
               {
                  _loc11_ = _loc10_.next as AnimeSound;
                  if(_loc11_ && !_loc11_.scene)
                  {
                     AlertPopUp.openDefaultPopUpWithLocale("Please remove the sound(s) in this scene before moving it.");
                     return;
                  }
               }
            }
            _loc12_ = new MoveSceneCommand(this._movie,param1,param2);
            _loc12_.execute();
            if(this._autoMoveSounds)
            {
               if(_loc5_ < _loc7_)
               {
                  this._soundsToBeMoved = this._soundsController.getAllSoundStartBetweenFrame(_loc5_,_loc8_);
                  this._voicesToBeMoved = this._voicesController.getAllSoundStartBetweenFrame(_loc5_,_loc8_);
               }
               else
               {
                  this._soundsToBeMoved = this._soundsController.getAllSoundStartBetweenFrame(_loc7_,_loc5_);
                  this._voicesToBeMoved = this._voicesController.getAllSoundStartBetweenFrame(_loc7_,_loc5_);
               }
               this._oldSoundFirstFrame = StudioSoundManager.getFirstFrame(this._soundsToBeMoved);
               this._oldVoiceFirstFrame = StudioSoundManager.getFirstFrame(this._voicesToBeMoved);
               if(this._soundsToBeMoved)
               {
                  _loc13_ = _loc5_ < _loc7_?int(-_loc3_.totalFrames):int(_loc3_.totalFrames);
                  this._soundsController.moveSoundCollection(this._soundsToBeMoved,this._oldSoundFirstFrame + _loc13_);
                  this._soundsController.resolveOverlap(this._soundsToBeMoved);
               }
               if(this._voicesToBeMoved)
               {
                  _loc13_ = _loc5_ < _loc7_?int(-_loc3_.totalFrames):int(_loc3_.totalFrames);
                  this._voicesController.moveSoundCollection(this._voicesToBeMoved,this._oldVoiceFirstFrame + _loc13_);
                  this._voicesController.resolveOverlap(this._voicesToBeMoved);
               }
               _loc14_ = _loc3_.speech;
               if(_loc14_)
               {
                  _loc4_ = param1 < param2?this._movie.getSceneAt(param2 - 1):this._movie.getSceneAt(param2);
                  _loc7_ = this.getGlobalStartFrame(_loc4_);
                  _loc15_ = new MoveSoundCommand(_loc14_,this._voicesController.sounds,false);
                  _loc15_.executeNow(_loc7_,_loc14_.totalFrame,_loc14_.trackNum);
               }
            }
         }
      }
      
      public function moveSoundCollectionByFrame(param1:ICollection, param2:int) : void
      {
         this._soundsController.moveSoundCollectionByFrame(param1,param2);
      }
      
      public function getSceneAtFrame(param1:int) : AnimeScene
      {
         return this._movie.getSceneFromFrame(param1);
      }
      
      public function get movieTotalFrame() : int
      {
         return this._movie.getTotalFrames();
      }
      
      public function get movieTotalDuration() : Number
      {
         return UtilUnitConvert.frameToDuration(this._movie.getTotalFrames());
      }
      
      public function getTotalFrameFromScene(param1:AnimeScene, param2:int = 0) : int
      {
         return this._movie.getTotalFramesFromScene(param1,param2);
      }
      
      public function set autoMoveSounds(param1:Boolean) : void
      {
         if(this._autoMoveSounds != param1)
         {
            this._autoMoveSounds = param1;
         }
      }
   }
}
