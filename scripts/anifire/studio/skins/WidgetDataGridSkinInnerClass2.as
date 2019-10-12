package anifire.studio.skins
{
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import spark.primitives.Line;
   
   public class WidgetDataGridSkinInnerClass2 extends Line
   {
       
      
      private var _88844982outerDocument:WidgetDataGridSkin;
      
      public function WidgetDataGridSkinInnerClass2()
      {
         super();
         this.stroke = this._WidgetDataGridSkinInnerClass2_SolidColorStroke1_c();
      }
      
      private function _WidgetDataGridSkinInnerClass2_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 15132390;
         _loc1_.weight = 1;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get outerDocument() : WidgetDataGridSkin
      {
         return this._88844982outerDocument;
      }
      
      public function set outerDocument(param1:WidgetDataGridSkin) : void
      {
         var _loc2_:Object = this._88844982outerDocument;
         if(_loc2_ !== param1)
         {
            this._88844982outerDocument = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"outerDocument",_loc2_,param1));
            }
         }
      }
   }
}
