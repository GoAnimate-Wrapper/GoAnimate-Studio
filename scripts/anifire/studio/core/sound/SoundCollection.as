package anifire.studio.core.sound
{
   import anifire.interfaces.ICollection;
   import anifire.interfaces.IIterator;
   import anifire.interfaces.IXmlConvertable;
   import anifire.iterators.ArrayIterator;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.managers.SoundPlaybackManager;
   import anifire.util.UtilHashArray;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class SoundCollection extends EventDispatcher implements IXmlConvertable, ICollection
   {
       
      
      private var _sounds:UtilHashArray;
      
      public function SoundCollection(param1:IEventDispatcher = null)
      {
         this._sounds = new UtilHashArray();
         super(param1);
      }
      
      public function addSound(param1:AnimeSound) : void
      {
         if(!param1)
         {
            return;
         }
         this._sounds.push(param1.getID(),param1);
         param1.addEventListener(AnimeSoundEvent.START_FRAME_CHANGE,this.sound_startFrameChangeHandler);
         this.dispatchEvent(new Event(Event.CHANGE));
         this.dispatchEvent(new SoundCollectionEvent(SoundCollectionEvent.SOUND_ADDED));
      }
      
      public function get length() : int
      {
         return this._sounds.length;
      }
      
      public function getSoundById(param1:String) : AnimeSound
      {
         return this._sounds.getValueByKey(param1);
      }
      
      public function removeSoundById(param1:String) : AnimeSound
      {
         SoundPlaybackManager.stop();
         var _loc2_:AnimeSound = this.getSoundById(param1);
         if(!_loc2_)
         {
            return null;
         }
         this._sounds.removeByKey(param1);
         _loc2_.removeEventListener(AnimeSoundEvent.START_FRAME_CHANGE,this.sound_startFrameChangeHandler);
         this.dispatchEvent(new Event(Event.CHANGE));
         this.dispatchEvent(new SoundCollectionEvent(SoundCollectionEvent.SOUND_REMOVED));
         return _loc2_;
      }
      
      private function sound_startFrameChangeHandler(param1:AnimeSoundEvent) : void
      {
         this.dispatchEvent(new SoundCollectionEvent(SoundCollectionEvent.SOUND_MOVED));
      }
      
      public function removeAll() : void
      {
         var _loc1_:AnimeSound = null;
         SoundPlaybackManager.stop();
         var _loc2_:uint = 0;
         while(_loc2_ < this._sounds.length)
         {
            _loc1_ = this._sounds.getValueByIndex(_loc2_) as AnimeSound;
            _loc1_.removeEventListener(AnimeSoundEvent.START_FRAME_CHANGE,this.sound_startFrameChangeHandler);
            _loc2_++;
         }
         this._sounds.removeAll();
         this.dispatchEvent(new Event(Event.CHANGE));
         this.dispatchEvent(new SoundCollectionEvent(SoundCollectionEvent.SOUND_REMOVED));
      }
      
      public function convertToXml() : XML
      {
         var _loc1_:XML = new XML();
         return _loc1_;
      }
      
      public function convertFromXml(param1:XML) : Boolean
      {
         return false;
      }
      
      public function iterator(param1:String = null) : IIterator
      {
         return new ArrayIterator(this._sounds.getArray());
      }
      
      public function get memento() : SoundCollectionMemento
      {
         var _loc1_:SoundCollectionMemento = new SoundCollectionMemento();
         _loc1_.saveState(this);
         return _loc1_;
      }
      
      public function set memento(param1:SoundCollectionMemento) : void
      {
         if(param1)
         {
            param1.restoreState(this);
         }
      }
      
      public function getSoundOrder(param1:AnimeSound) : int
      {
         if(param1)
         {
            return this._sounds.getIndex(param1.getID());
         }
         return -1;
      }
      
      public function reorderSound(param1:AnimeSound) : void
      {
         if(param1)
         {
            this._sounds.removeByKey(param1.getID());
            this._sounds.push(param1.getID(),param1);
         }
      }
   }
}
