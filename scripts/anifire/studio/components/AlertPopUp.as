package anifire.studio.components
{
   import anifire.util.UtilDict;
   import flash.display.DisplayObjectContainer;
   import mx.core.FlexGlobals;
   import spark.events.PopUpEvent;
   
   public class AlertPopUp extends ConfirmPopUp
   {
       
      
      public function AlertPopUp()
      {
         super();
      }
      
      public static function openDefaultPopUpWithLocale(param1:String, param2:String = null, param3:DisplayObjectContainer = null, param4:Boolean = true, param5:Function = null) : AlertPopUp
      {
         if(param1)
         {
            param1 = UtilDict.toDisplay("go",param1);
         }
         if(param2)
         {
            param2 = UtilDict.toDisplay("go",param2);
         }
         return openDefaultPopUp(param1,param2,param3,param4,param5);
      }
      
      public static function openDefaultPopUp(param1:String, param2:String = null, param3:DisplayObjectContainer = null, param4:Boolean = true, param5:Function = null) : AlertPopUp
      {
         var _loc6_:AlertPopUp = new AlertPopUp();
         _loc6_.createDefaultPopUp();
         _loc6_.message = param1;
         if(param2)
         {
            _loc6_.title = param2;
         }
         if(param5 != null)
         {
            _loc6_.addEventListener(PopUpEvent.CLOSE,param5);
         }
         if(!param3)
         {
            param3 = FlexGlobals.topLevelApplication as DisplayObjectContainer;
         }
         _loc6_.open(param3,param4);
         return _loc6_;
      }
      
      override public function createDefaultPopUp() : void
      {
         showCancelButton = false;
         showCloseButton = false;
         iconType = ConfirmPopUp.CONFIRM_POPUP_ERROR;
         title = UtilDict.toDisplay("go","Error");
         confirmText = UtilDict.toDisplay("go","OK");
      }
   }
}
