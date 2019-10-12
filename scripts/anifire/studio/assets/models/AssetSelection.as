package anifire.studio.assets.models
{
   import anifire.interfaces.IIterator;
   import anifire.iterators.ArrayIterator;
   import anifire.studio.core.Asset;
   import anifire.studio.core.BubbleAsset;
   import anifire.studio.core.Character;
   import anifire.studio.core.ProgramEffectAsset;
   import anifire.studio.core.Prop;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class AssetSelection extends EventDispatcher
   {
       
      
      private var _assets:Array;
      
      public function AssetSelection(param1:IEventDispatcher = null)
      {
         super(param1);
         this._assets = new Array();
      }
      
      public function iterator(param1:String = null) : IIterator
      {
         return new ArrayIterator(this._assets);
      }
      
      private function isGroupable(param1:Asset) : Boolean
      {
         if(param1 is ProgramEffectAsset && ProgramEffectAsset(param1).getExactType() == "zoom")
         {
            return true;
         }
         if(param1)
         {
            return param1 is Character || param1 is Prop || param1 is BubbleAsset;
         }
         return false;
      }
      
      public function isInCollection(param1:Asset) : Boolean
      {
         return this._assets.indexOf(param1) != -1;
      }
      
      public function get selectedAsset() : Asset
      {
         if(this._assets.length == 1)
         {
            return this._assets[0] as Asset;
         }
         return null;
      }
      
      public function set selectedAsset(param1:Asset) : void
      {
         if(!param1)
         {
            this.clearCollection();
            return;
         }
         if(param1 != this.selectedAsset)
         {
            this._assets.splice(0,this._assets.length);
            if(param1)
            {
               this._assets.push(param1);
               dispatchEvent(new Event(Event.CHANGE));
            }
         }
      }
      
      public function get length() : Number
      {
         return this._assets.length;
      }
      
      public function addAsset(param1:Asset) : Boolean
      {
         if(param1 && !this.isInCollection(param1))
         {
            if(!this.isGroupable(param1))
            {
               this._assets.splice(0,this._assets.length);
            }
            if(this.selectedAsset && !this.isGroupable(this.selectedAsset))
            {
               this._assets.splice(0,this._assets.length);
            }
            this._assets.push(param1);
            this.dispatchEvent(new Event(Event.CHANGE));
            return true;
         }
         return false;
      }
      
      public function addAssets(param1:Vector.<Asset>) : Boolean
      {
         var _loc2_:Asset = null;
         var _loc3_:uint = 0;
         if(param1 && param1.length > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < param1.length)
            {
               _loc2_ = param1[_loc3_] as Asset;
               if(_loc2_ && !this.isInCollection(_loc2_))
               {
                  if(!this.isGroupable(_loc2_))
                  {
                     this._assets.splice(0,this._assets.length);
                  }
                  if(this.selectedAsset && !this.isGroupable(this.selectedAsset))
                  {
                     this._assets.splice(0,this._assets.length);
                  }
                  this._assets.push(_loc2_);
               }
               _loc3_++;
            }
            dispatchEvent(new Event(Event.CHANGE));
            return true;
         }
         return false;
      }
      
      public function removeAsset(param1:Asset) : Boolean
      {
         if(param1 && this.isInCollection(param1))
         {
            this._assets.splice(this._assets.indexOf(param1),1);
            this.dispatchEvent(new Event(Event.CHANGE));
            return true;
         }
         return false;
      }
      
      public function clearCollection() : void
      {
         if(this._assets.length > 0)
         {
            this._assets.splice(0,this._assets.length);
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
   }
}
