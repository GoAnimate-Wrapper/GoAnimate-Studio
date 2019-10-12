package anifire.studio.assets.models
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.interfaces.ICollection;
   import anifire.interfaces.IIterator;
   import anifire.interfaces.IXmlConvertable;
   import anifire.iterators.ArrayIterator;
   import anifire.studio.assets.controllers.AssetTransitionFactory;
   import anifire.studio.events.AssetTransitionEvent;
   import flash.events.Event;
   import mx.collections.ArrayCollection;
   import mx.events.CollectionEvent;
   import mx.events.PropertyChangeEvent;
   
   public class AssetTransitionCollection extends ArrayCollection implements ICollection, IXmlConvertable
   {
       
      
      private var _lastAddedTransition:AssetTransition;
      
      private var _collectionBeforeNarration:ArrayCollection;
      
      private var _collectionWithNarration:ArrayCollection;
      
      private var _collectionAfterNarration:ArrayCollection;
      
      private var _collectionWholeScene:ArrayCollection;
      
      public function AssetTransitionCollection()
      {
         super();
         this.collectionBeforeNarration = new ArrayCollection();
         this.collectionWithNarration = new ArrayCollection();
         this.collectionAfterNarration = new ArrayCollection();
         this.collectionWholeScene = new ArrayCollection();
         this._collectionBeforeNarration.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onCollectionChange);
         this._collectionWithNarration.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onCollectionChange);
         this._collectionAfterNarration.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onCollectionChange);
         this._collectionWholeScene.addEventListener(CollectionEvent.COLLECTION_CHANGE,this.onCollectionChange);
      }
      
      public function get lastAddedTransition() : AssetTransition
      {
         return this._lastAddedTransition;
      }
      
      private function onCollectionChange(param1:CollectionEvent) : void
      {
         var _loc2_:AssetTransition = param1.items[0] as AssetTransition;
         if(_loc2_ && param1.kind == "add")
         {
            switch(param1.currentTarget)
            {
               case this._collectionBeforeNarration:
                  _loc2_.setSection(AssetTransitionConstants.TIMING_BEFORE_NARRATION);
                  break;
               case this._collectionWithNarration:
                  _loc2_.setSection(AssetTransitionConstants.TIMING_WITH_NARRATION);
                  break;
               case this._collectionAfterNarration:
                  _loc2_.setSection(AssetTransitionConstants.TIMING_AFTER_NARRATION);
                  break;
               case this._collectionWholeScene:
                  _loc2_.setSection(AssetTransitionConstants.TIMING_WHOLE_SCENE);
            }
         }
         this.dispatchEvent(new AssetTransitionEvent(AssetTransitionEvent.TIMING_CHANGE));
      }
      
      [Bindable(event="TIMING_CHANGE")]
      public function get totalTransitions() : uint
      {
         return this._collectionBeforeNarration.length + this._collectionWithNarration.length + this._collectionAfterNarration.length + this._collectionWholeScene.length;
      }
      
      [Bindable(event="propertyChange")]
      public function get collectionBeforeNarration() : ArrayCollection
      {
         return this._collectionBeforeNarration;
      }
      
      private function set _404365211collectionBeforeNarration(param1:ArrayCollection) : void
      {
         this._collectionBeforeNarration = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get collectionWithNarration() : ArrayCollection
      {
         return this._collectionWithNarration;
      }
      
      private function set _393897854collectionWithNarration(param1:ArrayCollection) : void
      {
         this._collectionWithNarration = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get collectionAfterNarration() : ArrayCollection
      {
         return this._collectionAfterNarration;
      }
      
      private function set _1943226212collectionAfterNarration(param1:ArrayCollection) : void
      {
         this._collectionAfterNarration = param1;
      }
      
      [Bindable(event="propertyChange")]
      public function get collectionWholeScene() : ArrayCollection
      {
         return this._collectionWholeScene;
      }
      
      private function set _1043996243collectionWholeScene(param1:ArrayCollection) : void
      {
         this._collectionWholeScene = param1;
      }
      
      public function addTransition(param1:AssetTransition) : void
      {
         if(param1)
         {
            switch(param1.section)
            {
               case AssetTransitionConstants.TIMING_BEFORE_NARRATION:
                  this._collectionBeforeNarration.addItem(param1);
                  break;
               case AssetTransitionConstants.TIMING_WITH_NARRATION:
                  this._collectionWithNarration.addItem(param1);
                  break;
               case AssetTransitionConstants.TIMING_AFTER_NARRATION:
                  this._collectionAfterNarration.addItem(param1);
                  break;
               case AssetTransitionConstants.TIMING_WHOLE_SCENE:
                  this._collectionWholeScene.addItem(param1);
            }
            this.addItem(param1);
            param1.addEventListener(AssetTransitionEvent.SECTION_CHANGE,this.onTransitionSectionChange);
            param1.addEventListener(AssetTransitionEvent.TIMING_CHANGE,this.onTransitionTimingChange);
            param1.addEventListener(AssetTransitionEvent.DIRECTION_CHANGE,this.onTransitionDirectionChange);
            param1.addEventListener(AssetTransitionEvent.TYPE_CHANGE,this.onTransitionTypeChange);
            this._lastAddedTransition = param1;
         }
      }
      
      public function addTransitionAt(param1:AssetTransition, param2:int) : void
      {
         if(param1 && param2 >= 0)
         {
            switch(param1.section)
            {
               case AssetTransitionConstants.TIMING_BEFORE_NARRATION:
                  if(param2 <= this._collectionBeforeNarration.length)
                  {
                     this._collectionBeforeNarration.addItemAt(param1,param2);
                  }
                  break;
               case AssetTransitionConstants.TIMING_WITH_NARRATION:
                  if(param2 <= this._collectionWithNarration.length)
                  {
                     this._collectionWithNarration.addItemAt(param1,param2);
                  }
                  break;
               case AssetTransitionConstants.TIMING_AFTER_NARRATION:
                  if(param2 <= this._collectionAfterNarration.length)
                  {
                     this._collectionAfterNarration.addItemAt(param1,param2);
                  }
                  break;
               case AssetTransitionConstants.TIMING_WHOLE_SCENE:
                  if(param2 <= this._collectionWholeScene.length)
                  {
                     this._collectionWholeScene.addItemAt(param1,param2);
                  }
            }
            this.addItem(param1);
            param1.addEventListener(AssetTransitionEvent.SECTION_CHANGE,this.onTransitionSectionChange);
            param1.addEventListener(AssetTransitionEvent.TIMING_CHANGE,this.onTransitionTimingChange);
            param1.addEventListener(AssetTransitionEvent.DIRECTION_CHANGE,this.onTransitionDirectionChange);
            param1.addEventListener(AssetTransitionEvent.TYPE_CHANGE,this.onTransitionTypeChange);
         }
      }
      
      private function onTransitionSectionChange(param1:Event) : void
      {
         var _loc2_:AssetTransition = param1.target as AssetTransition;
         if(_loc2_)
         {
            this.removeTransition(_loc2_);
            this.addTransition(_loc2_);
         }
      }
      
      private function onTransitionTimingChange(param1:AssetTransitionEvent) : void
      {
         this.dispatchEvent(param1);
      }
      
      private function onTransitionDirectionChange(param1:AssetTransitionEvent) : void
      {
         this.dispatchEvent(param1);
      }
      
      private function onTransitionTypeChange(param1:AssetTransitionEvent) : void
      {
         this.dispatchEvent(param1);
      }
      
      public function removeTransition(param1:AssetTransition) : int
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:AssetTransition = null;
         if(param1)
         {
            param1.removeEventListener(AssetTransitionEvent.SECTION_CHANGE,this.onTransitionSectionChange);
            param1.removeEventListener(AssetTransitionEvent.TIMING_CHANGE,this.onTransitionTimingChange);
            param1.removeEventListener(AssetTransitionEvent.DIRECTION_CHANGE,this.onTransitionDirectionChange);
            param1.removeEventListener(AssetTransitionEvent.TYPE_CHANGE,this.onTransitionTypeChange);
            _loc2_ = -1;
            _loc3_ = -1;
            _loc2_ = this._collectionBeforeNarration.getItemIndex(param1);
            if(_loc2_ != -1)
            {
               _loc4_ = this._collectionBeforeNarration.removeItemAt(_loc2_) as AssetTransition;
               _loc3_ = _loc2_;
            }
            _loc2_ = this._collectionWithNarration.getItemIndex(param1);
            if(_loc2_ != -1)
            {
               _loc4_ = this._collectionWithNarration.removeItemAt(_loc2_) as AssetTransition;
               _loc3_ = _loc2_;
            }
            _loc2_ = this._collectionAfterNarration.getItemIndex(param1);
            if(_loc2_ != -1)
            {
               _loc4_ = this._collectionAfterNarration.removeItemAt(_loc2_) as AssetTransition;
               _loc3_ = _loc2_;
            }
            _loc2_ = this._collectionWholeScene.getItemIndex(param1);
            if(_loc2_ != -1)
            {
               _loc4_ = this._collectionWholeScene.removeItemAt(_loc2_) as AssetTransition;
               _loc3_ = _loc2_;
            }
            _loc2_ = this.getItemIndex(param1);
            if(_loc2_ != -1)
            {
               _loc4_ = this.removeItemAt(_loc2_) as AssetTransition;
            }
            return _loc3_;
         }
         return -1;
      }
      
      public function getTransitionIndex(param1:AssetTransition) : int
      {
         var _loc2_:Number = NaN;
         if(param1)
         {
            _loc2_ = -1;
            _loc2_ = this._collectionBeforeNarration.getItemIndex(param1);
            if(_loc2_ != -1)
            {
               return _loc2_;
            }
            _loc2_ = this._collectionWithNarration.getItemIndex(param1);
            if(_loc2_ != -1)
            {
               return _loc2_;
            }
            _loc2_ = this._collectionAfterNarration.getItemIndex(param1);
            if(_loc2_ != -1)
            {
               return _loc2_;
            }
            _loc2_ = this._collectionWholeScene.getItemIndex(param1);
            if(_loc2_ != -1)
            {
               return _loc2_;
            }
         }
         return -1;
      }
      
      public function iterator(param1:String = null) : IIterator
      {
         var _loc2_:Array = new Array();
         _loc2_ = _loc2_.concat(this._collectionBeforeNarration.source);
         _loc2_ = _loc2_.concat(this._collectionWithNarration.source);
         _loc2_ = _loc2_.concat(this._collectionAfterNarration.source);
         _loc2_ = _loc2_.concat(this._collectionWholeScene.source);
         return new ArrayIterator(_loc2_);
      }
      
      public function convertToJsonArray() : Array
      {
         var _loc3_:AssetTransition = null;
         var _loc1_:IIterator = this.iterator();
         var _loc2_:Array = [];
         if(_loc1_.hasNext == false)
         {
            return _loc2_;
         }
         while(_loc1_.hasNext)
         {
            _loc3_ = _loc1_.next as AssetTransition;
            if(_loc3_)
            {
               _loc2_.push(_loc3_.convertToJsonObj());
            }
         }
         return _loc2_;
      }
      
      public function convertToXml() : XML
      {
         var _loc3_:IXmlConvertable = null;
         var _loc1_:IIterator = this.iterator();
         if(_loc1_.hasNext == false)
         {
            return new XML();
         }
         var _loc2_:XML = new XML("<" + AssetTransitionConstants.TAG_NAME_TRANSITION_LIST + "></" + AssetTransitionConstants.TAG_NAME_TRANSITION_LIST + ">");
         while(_loc1_.hasNext)
         {
            _loc3_ = _loc1_.next as IXmlConvertable;
            if(_loc3_)
            {
               _loc2_.appendChild(_loc3_.convertToXml());
            }
         }
         return _loc2_;
      }
      
      public function convertFromJsonObj(param1:Array) : Boolean
      {
         var _loc4_:Object = null;
         var _loc5_:AssetTransition = null;
         if(!param1)
         {
            return false;
         }
         this.removeAll();
         this._collectionBeforeNarration.removeAll();
         this._collectionWithNarration.removeAll();
         this._collectionAfterNarration.removeAll();
         this._collectionWholeScene.removeAll();
         var _loc2_:int = param1.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1[_loc3_];
            _loc5_ = AssetTransitionFactory.create(_loc4_.target,_loc4_.type,_loc4_.atype);
            if(_loc5_)
            {
               _loc5_.convertFromJsonObj(_loc4_);
               this.addTransition(_loc5_);
            }
            _loc3_++;
         }
         return true;
      }
      
      public function convertFromXml(param1:XML) : Boolean
      {
         var _loc2_:XML = null;
         var _loc3_:AssetTransition = null;
         if(param1)
         {
            if(param1.hasOwnProperty(AssetTransitionConstants.TAG_NAME_TRANSITION))
            {
               this.removeAll();
               this._collectionBeforeNarration.removeAll();
               this._collectionWithNarration.removeAll();
               this._collectionAfterNarration.removeAll();
               this._collectionWholeScene.removeAll();
               for each(_loc2_ in param1.child(AssetTransitionConstants.TAG_NAME_TRANSITION))
               {
                  _loc3_ = AssetTransitionFactory.create(String(_loc2_.@target),String(_loc2_.@type),String(_loc2_.@atype));
                  if(_loc3_)
                  {
                     _loc3_.convertFromXml(_loc2_);
                     this.addTransition(_loc3_);
                  }
               }
               return true;
            }
         }
         return false;
      }
      
      public function serialize() : String
      {
         return this.convertToXml().toXMLString();
      }
      
      public function get numOfComplexEffect() : int
      {
         var _loc3_:AssetTransition = null;
         var _loc1_:int = 0;
         var _loc2_:IIterator = this.iterator();
         if(_loc2_.hasNext == false)
         {
            return _loc1_;
         }
         while(_loc2_.hasNext)
         {
            _loc3_ = _loc2_.next as AssetTransition;
            if(_loc3_ && !_loc3_.isHandDrawnTransition)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      public function set collectionAfterNarration(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this.collectionAfterNarration;
         if(_loc2_ !== param1)
         {
            this._1943226212collectionAfterNarration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"collectionAfterNarration",_loc2_,param1));
            }
         }
      }
      
      public function set collectionBeforeNarration(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this.collectionBeforeNarration;
         if(_loc2_ !== param1)
         {
            this._404365211collectionBeforeNarration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"collectionBeforeNarration",_loc2_,param1));
            }
         }
      }
      
      public function set collectionWithNarration(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this.collectionWithNarration;
         if(_loc2_ !== param1)
         {
            this._393897854collectionWithNarration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"collectionWithNarration",_loc2_,param1));
            }
         }
      }
      
      public function set collectionWholeScene(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this.collectionWholeScene;
         if(_loc2_ !== param1)
         {
            this._1043996243collectionWholeScene = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"collectionWholeScene",_loc2_,param1));
            }
         }
      }
   }
}
