package anifire.studio.models
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class ColorPartModel implements IEventDispatcher
   {
       
      
      private var _995410834partId:String;
      
      private var _94842723color:uint;
      
      private var _1521440183allowTransparent:Boolean;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function ColorPartModel(param1:String = null)
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this.partId = param1;
      }
      
      public function toString() : String
      {
         return this.partId;
      }
      
      [Bindable(event="propertyChange")]
      public function get partId() : String
      {
         return this._995410834partId;
      }
      
      public function set partId(param1:String) : void
      {
         var _loc2_:Object = this._995410834partId;
         if(_loc2_ !== param1)
         {
            this._995410834partId = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"partId",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get color() : uint
      {
         return this._94842723color;
      }
      
      public function set color(param1:uint) : void
      {
         var _loc2_:Object = this._94842723color;
         if(_loc2_ !== param1)
         {
            this._94842723color = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"color",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get allowTransparent() : Boolean
      {
         return this._1521440183allowTransparent;
      }
      
      public function set allowTransparent(param1:Boolean) : void
      {
         var _loc2_:Object = this._1521440183allowTransparent;
         if(_loc2_ !== param1)
         {
            this._1521440183allowTransparent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"allowTransparent",_loc2_,param1));
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
