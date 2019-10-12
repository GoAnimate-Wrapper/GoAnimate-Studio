package anifire.studio.models
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class WidgetStyleVariantModel implements IEventDispatcher
   {
       
      
      private var _3355id:String;
      
      private var _1581300792chartType:String;
      
      private var _878349690imageName:String;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function WidgetStyleVariantModel()
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
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
      
      [Bindable(event="propertyChange")]
      public function get chartType() : String
      {
         return this._1581300792chartType;
      }
      
      public function set chartType(param1:String) : void
      {
         var _loc2_:Object = this._1581300792chartType;
         if(_loc2_ !== param1)
         {
            this._1581300792chartType = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"chartType",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageName() : String
      {
         return this._878349690imageName;
      }
      
      public function set imageName(param1:String) : void
      {
         var _loc2_:Object = this._878349690imageName;
         if(_loc2_ !== param1)
         {
            this._878349690imageName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageName",_loc2_,param1));
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
