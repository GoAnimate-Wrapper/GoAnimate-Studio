package anifire.studio.components
{
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   
   public class OpacitySliderTrack extends Button
   {
       
      
      private var _1842425070baseColor:uint;
      
      public function OpacitySliderTrack()
      {
         super();
      }
      
      [Bindable(event="propertyChange")]
      public function get baseColor() : uint
      {
         return this._1842425070baseColor;
      }
      
      public function set baseColor(param1:uint) : void
      {
         var _loc2_:Object = this._1842425070baseColor;
         if(_loc2_ !== param1)
         {
            this._1842425070baseColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"baseColor",_loc2_,param1));
            }
         }
      }
   }
}
