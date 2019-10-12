package anifire.studio.models
{
   import anifire.studio.interfaces.ILanguageModel;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.collections.ArrayCollection;
   import mx.events.PropertyChangeEvent;
   
   public class LanguageModel implements ILanguageModel, IEventDispatcher
   {
       
      
      private var _3355id:String;
      
      protected var _desc:String;
      
      private var _voices:ArrayCollection;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function LanguageModel(param1:XML)
      {
         var _loc4_:int = 0;
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this.id = param1.@id;
         this._desc = param1.@desc;
         this._voices = new ArrayCollection();
         var _loc2_:XMLList = param1.child("voice");
         var _loc3_:int = _loc2_.length();
         while(_loc4_ < _loc3_)
         {
            this._voices.addItem(new VoiceModel(_loc2_[_loc4_],this.id));
            _loc4_++;
         }
      }
      
      public function get voices() : ArrayCollection
      {
         var _loc2_:int = 0;
         var _loc1_:ArrayCollection = new ArrayCollection();
         while(_loc2_ < this._voices.length)
         {
            _loc1_.addItem(this._voices.getItemAt(_loc2_));
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get iconName() : String
      {
         return this.id;
      }
      
      public function get desc() : String
      {
         return this._desc;
      }
      
      public function toString() : String
      {
         return this._desc;
      }
      
      [Bindable(event="propertyChange")]
      public function get id() : String
      {
         return this._3355id;
      }
      
      public function set id(param1:String) : void
      {
         var _loc2_:Object = this._3355id;
         if(_loc2_ !== param1)
         {
            this._3355id = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"id",_loc2_,param1));
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
   }
}
