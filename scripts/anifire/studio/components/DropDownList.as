package anifire.studio.components
{
   import mx.events.PropertyChangeEvent;
   import spark.events.RendererExistenceEvent;
   
   public class DropDownList extends spark.components.DropDownList
   {
       
      
      private var _30941675popUpPosition:String;
      
      protected var _reverse:Boolean;
      
      public function DropDownList()
      {
         super();
         this.popUpPosition = "below";
      }
      
      [Bindable(event="propertyChange")]
      public function get reverse() : Boolean
      {
         return this._reverse;
      }
      
      private function set _1099846370reverse(param1:Boolean) : void
      {
         if(this._reverse != param1)
         {
            this._reverse = param1;
            if(dataGroup)
            {
               this.updateReverse();
            }
         }
      }
      
      protected function updateReverse() : void
      {
         var _loc3_:AssetTransitionDestinationItemRenderer = null;
         var _loc1_:int = dataGroup.numElements;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = dataGroup.getElementAt(_loc2_) as AssetTransitionDestinationItemRenderer;
            if(_loc3_)
            {
               _loc3_.reverse = this._reverse;
            }
            _loc2_++;
         }
      }
      
      override protected function dataGroup_rendererAddHandler(param1:RendererExistenceEvent) : void
      {
         super.dataGroup_rendererAddHandler(param1);
         var _loc2_:AssetTransitionDestinationItemRenderer = param1.renderer as AssetTransitionDestinationItemRenderer;
         if(_loc2_)
         {
            _loc2_.reverse = this._reverse;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == dataGroup)
         {
            this.updateReverse();
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get popUpPosition() : String
      {
         return this._30941675popUpPosition;
      }
      
      public function set popUpPosition(param1:String) : void
      {
         var _loc2_:Object = this._30941675popUpPosition;
         if(_loc2_ !== param1)
         {
            this._30941675popUpPosition = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUpPosition",_loc2_,param1));
            }
         }
      }
      
      public function set reverse(param1:Boolean) : void
      {
         var _loc2_:Object = this.reverse;
         if(_loc2_ !== param1)
         {
            this._1099846370reverse = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"reverse",_loc2_,param1));
            }
         }
      }
   }
}
