package anifire.studio.core
{
   import anifire.studio.events.MovieEvent;
   import anifire.studio.events.SceneDurationEvent;
   import anifire.studio.models.SceneSelection;
   import anifire.util.UtilUnitConvert;
   import flash.events.EventDispatcher;
   import mx.collections.ArrayCollection;
   
   public class MovieData extends EventDispatcher
   {
       
      
      private var _scenes:ArrayCollection;
      
      private var _copyable:Boolean = false;
      
      private var _published:Boolean = false;
      
      private var _privateShared:Boolean = false;
      
      private var _passwordProtected:Boolean = false;
      
      private var _selection:SceneSelection;
      
      public function MovieData()
      {
         this._scenes = new ArrayCollection();
         this._selection = new SceneSelection();
         super();
      }
      
      public function getTotalFrames() : int
      {
         var _loc4_:AnimeScene = null;
         var _loc1_:int = 0;
         var _loc2_:int = this._scenes.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this._scenes.getItemAt(_loc3_) as AnimeScene;
            if(_loc4_)
            {
               _loc1_ = _loc1_ + _loc4_.totalFrames;
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function getModifiedSceneData() : Object
      {
         var _loc5_:AnimeScene = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = this._scenes.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = this._scenes.getItemAt(_loc4_) as AnimeScene;
            if(_loc5_ && _loc5_.modified)
            {
               _loc1_ = _loc1_ + _loc5_.totalFrames;
               _loc2_++;
            }
            _loc4_++;
         }
         return {
            "count":_loc2_,
            "frame":_loc1_
         };
      }
      
      public function clearAllSceneModifiedFlag() : void
      {
         var _loc3_:AnimeScene = null;
         var _loc1_:int = this._scenes.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this._scenes.getItemAt(_loc2_) as AnimeScene;
            if(_loc3_)
            {
               _loc3_.modified = false;
            }
            _loc2_++;
         }
      }
      
      public function getTotalDuration() : Number
      {
         return UtilUnitConvert.frameToDuration(this.getTotalFrames());
      }
      
      public function getTotalFramesFromScene(param1:AnimeScene, param2:int) : int
      {
         var _loc7_:AnimeScene = null;
         var _loc3_:int = 0;
         var _loc4_:int = this._scenes.length;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = this._scenes.getItemAt(_loc6_) as AnimeScene;
            if(_loc7_ == param1 || _loc5_ > 0)
            {
               _loc3_ = _loc3_ + _loc7_.totalFrames;
               _loc5_++;
            }
            if(param2 > 0 && _loc5_ == param2)
            {
               break;
            }
            _loc6_++;
         }
         return _loc3_;
      }
      
      public function getSceneStartFrame(param1:AnimeScene) : int
      {
         var _loc2_:AnimeScene = null;
         var _loc3_:int = 1;
         var _loc4_:int = this._scenes.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this._scenes.getItemAt(_loc5_) as AnimeScene;
            if(_loc2_ && _loc2_ == param1)
            {
               return _loc3_;
            }
            _loc3_ = _loc3_ + _loc2_.totalFrames;
            _loc5_++;
         }
         return 0;
      }
      
      public function getSceneEndFrame(param1:AnimeScene) : int
      {
         var _loc2_:AnimeScene = null;
         var _loc3_:int = 1;
         var _loc4_:int = this._scenes.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this._scenes.getItemAt(_loc5_) as AnimeScene;
            if(_loc2_ && _loc2_ == param1)
            {
               return _loc3_ + _loc2_.totalFrames;
            }
            _loc3_ = _loc3_ + _loc2_.totalFrames;
            _loc5_++;
         }
         return 0;
      }
      
      public function getSceneFromFrame(param1:int) : AnimeScene
      {
         var _loc2_:AnimeScene = null;
         var _loc3_:int = 0;
         var _loc4_:int = this._scenes.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this._scenes.getItemAt(_loc5_) as AnimeScene;
            if(_loc2_)
            {
               _loc3_ = _loc3_ + _loc2_.totalFrames;
            }
            if(_loc3_ >= param1)
            {
               break;
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function addSceneAt(param1:AnimeScene, param2:int) : Boolean
      {
         if(param1 && param2 >= 0)
         {
            this._scenes.addItemAt(param1,param2);
            dispatchEvent(new MovieEvent(MovieEvent.SCENE_ADDED,param2,param1));
            param1.addEventListener(SceneDurationEvent.SCENE_DURATION_CHANGE,this.onSceneDurationChange);
            return true;
         }
         return false;
      }
      
      public function removeSceneAt(param1:int) : AnimeScene
      {
         var _loc2_:AnimeScene = null;
         if(param1 >= 0 && param1 < this._scenes.length)
         {
            _loc2_ = this._scenes.getItemAt(param1) as AnimeScene;
            _loc2_.removeEventListener(SceneDurationEvent.SCENE_DURATION_CHANGE,this.onSceneDurationChange);
            this._scenes.removeItemAt(param1);
            dispatchEvent(new MovieEvent(MovieEvent.SCENE_REMOVED,param1,_loc2_));
         }
         return _loc2_;
      }
      
      private function onSceneDurationChange(param1:SceneDurationEvent) : void
      {
         this.dispatchEvent(param1);
      }
      
      public function removeMultipleScene(param1:int, param2:int = 1) : Array
      {
         var _loc3_:AnimeScene = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         if(param2 > 0)
         {
            _loc4_ = [];
            _loc5_ = 0;
            while(_loc5_ < param2)
            {
               _loc3_ = this.removeSceneAt(param1);
               if(_loc3_)
               {
                  _loc4_.push(_loc3_.id);
               }
               _loc5_++;
            }
         }
         return _loc4_;
      }
      
      public function removeAllScene() : void
      {
         var _loc1_:int = 0;
         var _loc2_:AnimeScene = null;
         while(_loc1_ < this._scenes.length)
         {
            _loc2_ = this._scenes.getItemAt(_loc1_) as AnimeScene;
            if(_loc2_)
            {
               _loc2_.destroy();
            }
            _loc1_++;
         }
         this._scenes.removeAll();
         this._selection.removeAll();
      }
      
      public function moveScene(param1:Number, param2:Number) : void
      {
         var _loc3_:AnimeScene = null;
         var _loc4_:MovieEvent = null;
         if(param1 >= 0 && param1 < this._scenes.length)
         {
            _loc3_ = AnimeScene(this._scenes.removeItemAt(param1));
            if(_loc3_ && param2 >= 0)
            {
               if(param1 < param2)
               {
                  if(param2 - 1 < this._scenes.length)
                  {
                     this._scenes.addItemAt(_loc3_,param2 - 1);
                  }
                  else
                  {
                     this._scenes.addItem(_loc3_);
                  }
               }
               else
               {
                  this._scenes.addItemAt(_loc3_,param2);
               }
               _loc4_ = new MovieEvent(MovieEvent.SCENE_MOVED);
               _loc4_.sourceIndex = param1;
               _loc4_.destIndex = param2;
               dispatchEvent(_loc4_);
               this.currentScene = _loc3_;
            }
         }
      }
      
      public function getSceneAt(param1:int) : AnimeScene
      {
         if(param1 >= 0 && param1 < this._scenes.length)
         {
            return this._scenes.getItemAt(param1) as AnimeScene;
         }
         return null;
      }
      
      public function getSceneById(param1:String) : AnimeScene
      {
         var _loc2_:int = 0;
         var _loc3_:AnimeScene = null;
         while(_loc2_ < this._scenes.length)
         {
            _loc3_ = this._scenes.getItemAt(_loc2_) as AnimeScene;
            if(_loc3_ && _loc3_.id == param1)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getSceneIndex(param1:AnimeScene) : int
      {
         if(param1)
         {
            return this._scenes.getItemIndex(param1);
         }
         return -1;
      }
      
      public function selectSceneAt(param1:int) : AnimeScene
      {
         var _loc2_:AnimeScene = this.getSceneAt(param1);
         if(_loc2_)
         {
            this.currentScene = _loc2_;
            return _loc2_;
         }
         return null;
      }
      
      public function selectSceneById(param1:String) : AnimeScene
      {
         var _loc2_:AnimeScene = this.getSceneById(param1);
         if(_loc2_)
         {
            this.currentScene = _loc2_;
            return _loc2_;
         }
         return null;
      }
      
      public function get selection() : SceneSelection
      {
         return this._selection;
      }
      
      public function set currentIndex(param1:int) : void
      {
         this._selection.currentScene = this.getSceneAt(param1);
      }
      
      public function get currentIndex() : int
      {
         return this.getSceneIndex(this._selection.currentScene);
      }
      
      public function set currentScene(param1:AnimeScene) : void
      {
         this._selection.currentScene = param1;
      }
      
      public function get currentScene() : AnimeScene
      {
         return this._selection.currentScene;
      }
      
      public function get scenes() : Array
      {
         return this._scenes.source.concat();
      }
      
      public function get length() : Number
      {
         return this._scenes.length;
      }
      
      public function set copyable(param1:Boolean) : void
      {
         this._copyable = param1;
      }
      
      public function get copyable() : Boolean
      {
         return this._copyable;
      }
      
      public function set published(param1:Boolean) : void
      {
         this._published = param1;
      }
      
      public function get published() : Boolean
      {
         return this._published;
      }
      
      public function set privateShared(param1:Boolean) : void
      {
         this._privateShared = param1;
      }
      
      public function get privateShared() : Boolean
      {
         return this._privateShared;
      }
      
      public function set passwordProtected(param1:Boolean) : void
      {
         this._passwordProtected = param1;
      }
      
      public function get passwordProtected() : Boolean
      {
         return this._passwordProtected;
      }
      
      public function getNextScene(param1:AnimeScene) : AnimeScene
      {
         var _loc2_:int = this.getSceneIndex(param1);
         return this.getSceneAt(_loc2_ + 1);
      }
      
      public function getPrevScene(param1:AnimeScene) : AnimeScene
      {
         var _loc2_:int = this.getSceneIndex(param1);
         return this.getSceneAt(_loc2_ - 1);
      }
      
      public function isValidIndex(param1:int) : Boolean
      {
         if(param1 >= 0 && param1 < this.length)
         {
            return true;
         }
         return false;
      }
      
      public function get containsChapterBreaks() : Boolean
      {
         var _loc3_:AnimeScene = null;
         var _loc1_:int = this._scenes.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this._scenes.getItemAt(_loc2_) as AnimeScene;
            if(_loc3_.chapterBreak)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function getAssetThemes() : Array
      {
         var _loc5_:* = null;
         var _loc6_:AnimeScene = null;
         var _loc1_:Object = {};
         var _loc2_:int = this._scenes.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc6_ = this._scenes.getItemAt(_loc3_) as AnimeScene;
            _loc6_.appendAssetThemes(_loc1_);
            _loc3_++;
         }
         var _loc4_:Array = [];
         for(_loc5_ in _loc1_)
         {
            _loc4_.push(_loc5_);
         }
         return _loc4_;
      }
   }
}
