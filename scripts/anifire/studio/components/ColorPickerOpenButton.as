package anifire.studio.components
{
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   
   public class ColorPickerOpenButton extends Button
   {
       
      
      private var _color:uint;
      
      [SkinPart(required="false")]
      public var colorDisplay:ColorDisplayGroup;
      
      private var _colorChanged:Boolean;
      
      public function ColorPickerOpenButton()
      {
         super();
      }
      
      [Bindable(event="propertyChange")]
      public function get color() : uint
      {
         return this._color;
      }
      
      private function set _94842723color(param1:uint) : void
      {
         if(this._color != param1)
         {
            this._color = param1;
            this._colorChanged = true;
            invalidateProperties();
         }
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this._colorChanged && this.colorDisplay)
         {
            this._colorChanged = false;
            this.colorDisplay.color = this._color;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.colorDisplay)
         {
            this.colorDisplay.color = this._color;
         }
      }
      
      public function set color(param1:uint) : void
      {
         var _loc2_:Object = this.color;
         if(_loc2_ !== param1)
         {
            this._94842723color = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"color",_loc2_,param1));
            }
         }
      }
   }
}
