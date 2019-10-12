package anifire.studio.core.sound
{
   import anifire.interfaces.ICollection;
   import anifire.interfaces.IIterator;
   import anifire.iterators.ArrayIterator;
   import anifire.studio.core.AnimeSound;
   import anifire.studio.core.Console;
   import anifire.util.UtilHashArray;
   
   public class SoundCollectionMemento implements ICollection
   {
       
      
      private var _mementos:UtilHashArray;
      
      private var _oldSelection:SoundSelection;
      
      public function SoundCollectionMemento()
      {
         this._mementos = new UtilHashArray();
         this._oldSelection = new SoundSelection();
         super();
      }
      
      public function saveState(param1:SoundCollection) : void
      {
         var _loc2_:IIterator = null;
         var _loc3_:AnimeSound = null;
         var _loc4_:SoundMemento = null;
         if(param1)
         {
            this._mementos.removeAll();
            this._oldSelection.removeAll();
            _loc2_ = param1.iterator();
            while(_loc2_.hasNext)
            {
               _loc3_ = _loc2_.next as AnimeSound;
               if(_loc3_)
               {
                  _loc4_ = _loc3_.memento;
                  this._mementos.push(_loc3_.getID(),_loc4_);
                  this._oldSelection.addSound(_loc3_);
               }
            }
         }
      }
      
      public function restoreState(param1:SoundCollection) : void
      {
         var _loc2_:SoundSelection = null;
         var _loc3_:IIterator = null;
         var _loc4_:AnimeSound = null;
         var _loc5_:SoundMemento = null;
         if(param1 && this._oldSelection)
         {
            _loc2_ = new SoundSelection();
            _loc3_ = param1.iterator();
            while(_loc3_.hasNext)
            {
               _loc4_ = _loc3_.next as AnimeSound;
               if(_loc4_)
               {
                  _loc2_.addSound(_loc4_);
                  if(this._oldSelection.isSelected(_loc4_) == false)
                  {
                     Console.getConsole().removeSoundById(_loc4_.id);
                  }
               }
            }
            _loc3_ = this._oldSelection.iterator();
            while(_loc3_.hasNext)
            {
               _loc4_ = _loc3_.next as AnimeSound;
               if(_loc4_)
               {
                  if(_loc2_.isSelected(_loc4_) == false)
                  {
                     Console.getConsole().addSound(_loc4_);
                  }
               }
            }
            _loc3_.reset();
            while(_loc3_.hasNext)
            {
               _loc4_ = _loc3_.next as AnimeSound;
               if(_loc4_)
               {
                  _loc5_ = this._mementos.getValueByKey(_loc4_.id);
                  if(_loc5_)
                  {
                     _loc4_.memento = _loc5_;
                  }
               }
            }
         }
      }
      
      public function iterator(param1:String = null) : IIterator
      {
         return new ArrayIterator(this._mementos.getArray());
      }
   }
}
