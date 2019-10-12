package anifire.studio.assets.views
{
   import anifire.interfaces.IIterator;
   import anifire.interfaces.IPlayable;
   import anifire.iterators.ArrayIterator;
   import anifire.studio.core.BubbleAsset;
   import anifire.studio.core.Character;
   import anifire.studio.core.ProgramEffectAsset;
   import anifire.studio.core.Prop;
   import anifire.studio.interfaces.IAssetCollection;
   import anifire.studio.interfaces.IAssetView;
   import anifire.util.UtilUser;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.geom.Rectangle;
   
   public class AssetViewCollection extends EventDispatcher implements IAssetCollection
   {
       
      
      private var _assets:Array;
      
      private var _containsBubbleViewOnly:Boolean;
      
      private var _containsCharacterViewOnly:Boolean;
      
      private var _invalidProperties:Boolean;
      
      public function AssetViewCollection(param1:IEventDispatcher = null)
      {
         super(param1);
         this._assets = new Array();
         this._invalidProperties = false;
         this._containsBubbleViewOnly = false;
      }
      
      public function iterator(param1:String = null) : IIterator
      {
         return new ArrayIterator(this._assets);
      }
      
      private function isGroupable(param1:IAssetView) : Boolean
      {
         if(param1.asset is ProgramEffectAsset && ProgramEffectAsset(param1.asset).getExactType() == "zoom")
         {
            return true;
         }
         if(param1.asset)
         {
            return param1.asset is Character || param1.asset is Prop || param1.asset is BubbleAsset;
         }
         return false;
      }
      
      public function intersects(param1:IAssetCollection) : Boolean
      {
         var _loc3_:Object = null;
         var _loc2_:IIterator = param1.iterator();
         while(_loc2_.hasNext)
         {
            _loc3_ = _loc2_.next;
            if(this._assets.indexOf(_loc3_) >= 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public function isInCollection(param1:IAssetView) : Boolean
      {
         return this._assets.indexOf(param1) != -1;
      }
      
      public function get selectedAsset() : IAssetView
      {
         if(this._assets.length == 1)
         {
            return this._assets[0] as IAssetView;
         }
         return null;
      }
      
      public function get length() : Number
      {
         return this._assets.length;
      }
      
      private function updateProperties() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:IAssetView = null;
         if(this._invalidProperties)
         {
            this._invalidProperties = false;
            _loc1_ = this._assets.length;
            this._containsBubbleViewOnly = _loc1_ > 0;
            this._containsCharacterViewOnly = _loc1_ > 0;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this._assets[_loc2_] as IAssetView;
               if(_loc3_)
               {
                  if(!(_loc3_.asset is BubbleAsset))
                  {
                     this._containsBubbleViewOnly = false;
                  }
                  if(!(_loc3_.asset is Character))
                  {
                     this._containsCharacterViewOnly = false;
                  }
               }
               _loc2_++;
            }
         }
      }
      
      public function get containsBubbleViewOnly() : Boolean
      {
         this.updateProperties();
         return this._containsBubbleViewOnly;
      }
      
      public function get containsCharacterViewOnly() : Boolean
      {
         this.updateProperties();
         return this._containsCharacterViewOnly;
      }
      
      public function addAsset(param1:IAssetCollection) : Boolean
      {
         var _loc2_:IIterator = null;
         var _loc3_:Boolean = false;
         var _loc4_:IAssetView = null;
         if(UtilUser.userType == UtilUser.BASIC_USER)
         {
         }
         if(param1)
         {
            _loc2_ = param1.iterator();
            _loc3_ = false;
            while(_loc2_.hasNext)
            {
               _loc4_ = _loc2_.next as IAssetView;
               if(_loc4_ && !this.isInCollection(_loc4_))
               {
                  this.addView(_loc4_);
                  _loc3_ = true;
               }
            }
            if(_loc3_)
            {
               this.dispatchEvent(new Event(Event.CHANGE));
               return true;
            }
         }
         return false;
      }
      
      public function replaceAllAssets(param1:Array) : void
      {
         var _loc3_:IAssetView = null;
         var _loc4_:uint = 0;
         this._invalidProperties = true;
         var _loc2_:IIterator = this.iterator();
         while(_loc2_.hasNext)
         {
            _loc3_ = IAssetView(_loc2_.next);
            if(_loc3_ is IPlayable)
            {
               IPlayable(_loc3_).resume();
            }
         }
         this._assets = new Array();
         if(param1 && param1.length > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               _loc3_ = param1[_loc4_] as IAssetView;
               if(_loc3_ && !this.isInCollection(_loc3_))
               {
                  this.addView(_loc3_);
               }
               _loc4_++;
            }
         }
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function addView(param1:IAssetView) : Boolean
      {
         this._invalidProperties = true;
         if(param1 && !this.isInCollection(param1))
         {
            if(!this.isGroupable(param1))
            {
               this.clearCollection();
            }
            if(this.selectedAsset && !this.isGroupable(this.selectedAsset))
            {
               this.clearCollection();
            }
            this._assets.push(param1);
            if(param1 is IPlayable)
            {
               IPlayable(param1).pause();
            }
            return true;
         }
         return false;
      }
      
      public function removeAsset(param1:IAssetCollection) : Boolean
      {
         var _loc4_:IAssetView = null;
         var _loc2_:IIterator = param1.iterator();
         var _loc3_:Boolean = false;
         while(_loc2_.hasNext)
         {
            _loc4_ = _loc2_.next as IAssetView;
            if(_loc4_)
            {
               this.removeView(_loc4_);
               _loc3_ = true;
            }
         }
         if(_loc3_)
         {
            this.dispatchEvent(new Event(Event.CHANGE));
            return true;
         }
         return false;
      }
      
      private function removeView(param1:IAssetView) : Boolean
      {
         this._invalidProperties = true;
         if(param1 && this.isInCollection(param1))
         {
            this._assets.splice(this._assets.indexOf(param1),1);
            if(param1 is IPlayable)
            {
               IPlayable(param1).resume();
            }
            return true;
         }
         return false;
      }
      
      public function clearCollection() : void
      {
         var _loc2_:IAssetView = null;
         var _loc1_:IIterator = this.iterator();
         while(_loc1_.hasNext)
         {
            _loc2_ = IAssetView(_loc1_.next);
            if(_loc2_ is IPlayable)
            {
               IPlayable(_loc2_).resume();
            }
         }
         this._assets = new Array();
         this._invalidProperties = true;
         this._containsBubbleViewOnly = false;
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function getBounds(param1:DisplayObject) : Rectangle
      {
         var _loc2_:Rectangle = null;
         var _loc3_:DisplayObject = null;
         var _loc4_:uint = 0;
         while(_loc4_ < this._assets.length)
         {
            _loc3_ = this._assets[_loc4_] as DisplayObject;
            if(_loc3_)
            {
               if(_loc2_)
               {
                  _loc2_ = _loc2_.union(_loc3_.getBounds(param1));
               }
               else
               {
                  _loc2_ = _loc3_.getBounds(param1);
               }
            }
            _loc4_++;
         }
         return _loc2_;
      }
   }
}
