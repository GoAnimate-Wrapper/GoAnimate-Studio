package anifire.studio.components
{
   import anifire.util.UtilDict;
   
   public class ComplexityPopUp extends ConfirmPopUp
   {
       
      
      public function ComplexityPopUp()
      {
         super();
         setStyle("fontSize",13);
      }
      
      override public function createDefaultPopUp() : void
      {
         title = UtilDict.toDisplay("go","Video Complexity Warning");
         confirmText = UtilDict.toDisplay("go","OK");
         iconType = ConfirmPopUp.CONFIRM_POPUP_ALERT;
         showCancelButton = false;
         showCloseButton = false;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == panel)
         {
            panel.width = 500;
         }
      }
   }
}
