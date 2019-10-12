package anifire.studio.components
{
   import mx.events.PropertyChangeEvent;
   
   public class IconNumericStepper extends NumericStepper
   {
       
      
      private var _3226745icon:Class;
      
      public function IconNumericStepper()
      {
         super();
      }
      
      [Bindable(event="propertyChange")]
      public function get icon() : Class
      {
         return this._3226745icon;
      }
      
      public function set icon(param1:Class) : void
      {
         var _loc2_:Object = this._3226745icon;
         if(_loc2_ !== param1)
         {
            this._3226745icon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"icon",_loc2_,param1));
            }
         }
      }
   }
}
