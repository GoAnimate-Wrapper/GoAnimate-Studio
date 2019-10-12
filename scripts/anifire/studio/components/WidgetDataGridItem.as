package anifire.studio.components
{
   import anifire.studio.core.Widget;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class WidgetDataGridItem implements IEventDispatcher
   {
       
      
      private var _102727412label:String;
      
      private var _111972721value:String;
      
      private var _823812830values:Vector.<Number>;
      
      private var _94842723color:uint;
      
      private var _1388625249colorPickerVisible:Boolean;
      
      private var _788047292widget:Widget;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function WidgetDataGridItem()
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
      }
      
      [Bindable(event="propertyChange")]
      public function get label() : String
      {
         return this._102727412label;
      }
      
      public function set label(param1:String) : void
      {
         var _loc2_:Object = this._102727412label;
         if(_loc2_ !== param1)
         {
            this._102727412label = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get value() : String
      {
         return this._111972721value;
      }
      
      public function set value(param1:String) : void
      {
         var _loc2_:Object = this._111972721value;
         if(_loc2_ !== param1)
         {
            this._111972721value = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"value",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get values() : Vector.<Number>
      {
         return this._823812830values;
      }
      
      public function set values(param1:Vector.<Number>) : void
      {
         var _loc2_:Object = this._823812830values;
         if(_loc2_ !== param1)
         {
            this._823812830values = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"values",_loc2_,param1));
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
      public function get colorPickerVisible() : Boolean
      {
         return this._1388625249colorPickerVisible;
      }
      
      public function set colorPickerVisible(param1:Boolean) : void
      {
         var _loc2_:Object = this._1388625249colorPickerVisible;
         if(_loc2_ !== param1)
         {
            this._1388625249colorPickerVisible = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorPickerVisible",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get widget() : Widget
      {
         return this._788047292widget;
      }
      
      public function set widget(param1:Widget) : void
      {
         var _loc2_:Object = this._788047292widget;
         if(_loc2_ !== param1)
         {
            this._788047292widget = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"widget",_loc2_,param1));
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
