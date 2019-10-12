package anifire.studio.core.sound
{
   import anifire.interfaces.ICollection;
   import anifire.interfaces.IIterator;
   import anifire.iterators.ArrayIterator;
   import anifire.iterators.ReverseArrayIterator;
   import anifire.studio.core.AnimeSound;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.collections.ArrayCollection;
   
   public class SoundSelection extends EventDispatcher implements ICollection
   {
       
      
      private var _soundArray:Array;
      
      private var _sounds:ArrayCollection;
      
      public function SoundSelection(param1:IEventDispatcher = null)
      {
         this._soundArray = new Array();
         this._sounds = new ArrayCollection(this._soundArray);
         super(param1);
      }
      
      public function iterator(param1:String = null) : IIterator
      {
         if(param1 == "reverse")
         {
            return new ReverseArrayIterator(this._sounds.source);
         }
         return new ArrayIterator(this._sounds.source);
      }
      
      public function get length() : Number
      {
         return this._sounds.length;
      }
      
      public function get currentSound() : AnimeSound
      {
         if(this._sounds.length > 0)
         {
            return this._sounds.getItemAt(0) as AnimeSound;
         }
         return null;
      }
      
      public function set currentSound(param1:AnimeSound) : void
      {
         if(param1)
         {
            this._sounds.removeAll();
            this._sounds.addItem(param1);
            this.traceSound();
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function isSelected(param1:AnimeSound) : Boolean
      {
         if(param1)
         {
            return this._sounds.getItemIndex(param1) >= 0;
         }
         return false;
      }
      
      public function addSound(param1:AnimeSound) : Boolean
      {
         if(param1)
         {
            if(this._sounds.getItemIndex(param1) == -1)
            {
               this._sounds.addItem(param1);
               this.traceSound();
               this.dispatchEvent(new Event(Event.CHANGE));
               return true;
            }
         }
         return false;
      }
      
      private function traceSound() : void
      {
      }
      
      public function removeAll() : void
      {
         this._sounds.removeAll();
         this.dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function clone() : SoundSelection
      {
         var _loc3_:AnimeSound = null;
         var _loc1_:SoundSelection = new SoundSelection();
         var _loc2_:IIterator = this.iterator();
         while(_loc2_.hasNext)
         {
            _loc3_ = _loc2_.next as AnimeSound;
            _loc1_.addSound(_loc3_);
         }
         return _loc1_;
      }
   }
}
