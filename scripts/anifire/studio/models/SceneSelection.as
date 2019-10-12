package anifire.studio.models
{
   import anifire.interfaces.ICollection;
   import anifire.interfaces.IIterator;
   import anifire.iterators.ArrayIterator;
   import anifire.iterators.ReverseArrayIterator;
   import anifire.studio.core.AnimeScene;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.collections.ArrayCollection;
   
   public class SceneSelection extends EventDispatcher implements ICollection
   {
       
      
      private var _scenesArray:Array;
      
      private var _scenes:ArrayCollection;
      
      public function SceneSelection(param1:IEventDispatcher = null)
      {
         this._scenesArray = new Array();
         this._scenes = new ArrayCollection(this._scenesArray);
         super(param1);
      }
      
      public function iterator(param1:String = null) : IIterator
      {
         if(param1 == "reverse")
         {
            return new ReverseArrayIterator(this._scenes.source);
         }
         return new ArrayIterator(this._scenes.source);
      }
      
      public function get length() : Number
      {
         return this._scenes.length;
      }
      
      public function get currentScene() : AnimeScene
      {
         if(this._scenes.length > 0)
         {
            return this._scenes.getItemAt(0) as AnimeScene;
         }
         return null;
      }
      
      public function set currentScene(param1:AnimeScene) : void
      {
         var _loc2_:int = 0;
         var _loc3_:AnimeScene = null;
         if(this.currentScene == param1)
         {
         }
         if(param1)
         {
            _loc2_ = 0;
            while(_loc2_ < this._scenes.length)
            {
               _loc3_ = this._scenes.getItemAt(_loc2_) as AnimeScene;
               if(_loc3_)
               {
                  _loc3_.selectedAsset = null;
               }
               _loc2_++;
            }
            this._scenes.removeAll();
            this._scenes.addItem(param1);
            param1.loadAllAssets();
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function isSelected(param1:AnimeScene) : Boolean
      {
         if(param1)
         {
            return this._scenes.getItemIndex(param1) >= 0;
         }
         return false;
      }
      
      public function addScene(param1:AnimeScene) : Boolean
      {
         if(param1)
         {
            if(this._scenes.getItemIndex(param1) == -1)
            {
               this._scenes.addItem(param1);
               this.dispatchEvent(new Event(Event.CHANGE));
               return true;
            }
         }
         return false;
      }
      
      public function removeScene(param1:AnimeScene) : Boolean
      {
         var _loc2_:int = 0;
         if(param1 && this._scenes.length > 1)
         {
            _loc2_ = this._scenes.getItemIndex(param1);
            if(_loc2_ >= 0)
            {
               this._scenes.removeItemAt(_loc2_);
               this.dispatchEvent(new Event(Event.CHANGE));
               return true;
            }
         }
         return false;
      }
      
      public function removeAll() : void
      {
         var _loc2_:AnimeScene = null;
         var _loc1_:int = 0;
         while(_loc1_ < this._scenes.length)
         {
            _loc2_ = this._scenes.getItemAt(_loc1_) as AnimeScene;
            if(_loc2_)
            {
               this.currentScene.selectedAsset = null;
            }
            _loc1_++;
         }
         this._scenes.removeAll();
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function clone() : SceneSelection
      {
         var _loc3_:AnimeScene = null;
         var _loc1_:SceneSelection = new SceneSelection();
         var _loc2_:IIterator = this.iterator();
         while(_loc2_.hasNext)
         {
            _loc3_ = _loc2_.next as AnimeScene;
            _loc1_.addScene(_loc3_);
         }
         return _loc1_;
      }
   }
}
