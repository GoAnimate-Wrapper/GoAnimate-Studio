package anifire.studio.components
{
   import anifire.studio.skins.TransitionListSkin;
   import flash.events.MouseEvent;
   import spark.components.List;
   
   public class TransitionList extends List
   {
       
      
      public var ctrlKey:Boolean;
      
      public var shiftKey:Boolean;
      
      public function TransitionList()
      {
         super();
         this.allowMultipleSelection = true;
         dragEnabled = true;
         dropEnabled = true;
         dragMoveEnabled = true;
         setStyle("skinClass",TransitionListSkin);
      }
      
      override protected function item_mouseDownHandler(param1:MouseEvent) : void
      {
         this.ctrlKey = param1.ctrlKey;
         this.shiftKey = param1.shiftKey;
         super.item_mouseDownHandler(param1);
      }
   }
}
