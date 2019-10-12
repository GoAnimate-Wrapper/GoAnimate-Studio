package anifire.studio.components
{
   import anifire.studio.skins.ArrowTipMenuItemListSkin;
   import mx.events.PropertyChangeEvent;
   
   public class ArrowTipMenuItemList extends MenuItemList
   {
       
      
      private var _1019779949offset:int = 10;
      
      private var _2092294475targetWidth:int = 15;
      
      private var _1205996828tipPosition:String = "below";
      
      public function ArrowTipMenuItemList()
      {
         super();
         setStyle("skinClass",ArrowTipMenuItemListSkin);
      }
      
      [Bindable(event="propertyChange")]
      public function get offset() : int
      {
         return this._1019779949offset;
      }
      
      public function set offset(param1:int) : void
      {
         var _loc2_:Object = this._1019779949offset;
         if(_loc2_ !== param1)
         {
            this._1019779949offset = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"offset",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get targetWidth() : int
      {
         return this._2092294475targetWidth;
      }
      
      public function set targetWidth(param1:int) : void
      {
         var _loc2_:Object = this._2092294475targetWidth;
         if(_loc2_ !== param1)
         {
            this._2092294475targetWidth = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"targetWidth",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tipPosition() : String
      {
         return this._1205996828tipPosition;
      }
      
      public function set tipPosition(param1:String) : void
      {
         var _loc2_:Object = this._1205996828tipPosition;
         if(_loc2_ !== param1)
         {
            this._1205996828tipPosition = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tipPosition",_loc2_,param1));
            }
         }
      }
   }
}
