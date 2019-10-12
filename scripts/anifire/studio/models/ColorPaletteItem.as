package anifire.studio.models
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   
   public class ColorPaletteItem implements IEventDispatcher
   {
       
      
      private var _94842723color:uint;
      
      private var _381049634isAddColorButton:Boolean;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function ColorPaletteItem(param1:uint, param2:Boolean = false)
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
         this.color = param1;
         this.isAddColorButton = param2;
      }
      
      public static function createAddColorButton() : ColorPaletteItem
      {
         return new ColorPaletteItem(uint.MAX_VALUE,true);
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
      public function get isAddColorButton() : Boolean
      {
         return this._381049634isAddColorButton;
      }
      
      public function set isAddColorButton(param1:Boolean) : void
      {
         var _loc2_:Object = this._381049634isAddColorButton;
         if(_loc2_ !== param1)
         {
            this._381049634isAddColorButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"isAddColorButton",_loc2_,param1));
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
