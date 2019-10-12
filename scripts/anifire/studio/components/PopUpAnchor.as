package anifire.studio.components
{
   import anifire.studio.events.MenuItemEvent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.core.mx_internal;
   import mx.events.SandboxMouseEvent;
   import mx.utils.MatrixUtil;
   
   public class PopUpAnchor extends spark.components.PopUpAnchor
   {
      
      public static const ABOVE_RIGHT:String = "aboveRight";
      
      public static const ABOVE_CENTER:String = "aboveCenter";
      
      public static const BELOW_RIGHT:String = "belowRight";
      
      public static const BELOW_CENTER:String = "belowCenter";
       
      
      protected var _autoClose:Boolean = true;
      
      protected var hasCloseTrigger:Boolean;
      
      public function PopUpAnchor()
      {
         super();
      }
      
      public function get autoClose() : Boolean
      {
         return this._autoClose;
      }
      
      public function set autoClose(param1:Boolean) : void
      {
         if(this._autoClose != param1)
         {
            this._autoClose = param1;
            if(!this._autoClose)
            {
               this.removeCloseTrigger();
            }
            else if(displayPopUp)
            {
               this.addCloseTrigger();
            }
         }
      }
      
      override public function set popUpPosition(param1:String) : void
      {
         super.popUpPosition = param1;
      }
      
      override public function set displayPopUp(param1:Boolean) : void
      {
         super.displayPopUp = param1;
         if(this.autoClose)
         {
            if(param1)
            {
               this.addCloseTrigger();
            }
            else
            {
               this.removeCloseTrigger();
            }
         }
         if(!param1)
         {
            dispatchEvent(new MenuItemEvent(MenuItemEvent.POPUP_ANCHOR_CLOSE,null));
         }
      }
      
      protected function addCloseTrigger() : void
      {
         if(!this.hasCloseTrigger)
         {
            systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_UP,this.systemManager_mouseHandler);
            systemManager.getSandboxRoot().addEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,this.systemManager_mouseHandler);
            this.hasCloseTrigger = true;
         }
      }
      
      protected function removeCloseTrigger() : void
      {
         if(this.hasCloseTrigger)
         {
            systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_UP,this.systemManager_mouseHandler);
            systemManager.getSandboxRoot().removeEventListener(SandboxMouseEvent.MOUSE_UP_SOMEWHERE,this.systemManager_mouseHandler);
            this.hasCloseTrigger = false;
         }
      }
      
      private function systemManager_mouseHandler(param1:Event) : void
      {
         this.displayPopUp = false;
      }
      
      override mx_internal function determinePosition(param1:String, param2:Number, param3:Number, param4:Matrix, param5:Point, param6:Rectangle) : void
      {
         switch(param1)
         {
            case BELOW_RIGHT:
               param5.x = unscaledWidth - param2;
               param5.y = unscaledHeight;
               break;
            case ABOVE_RIGHT:
               param5.x = unscaledWidth - param2;
               param5.y = -param3;
               break;
            case BELOW_CENTER:
               param5.x = (unscaledWidth - param2) / 2;
               param5.y = unscaledHeight;
               break;
            case ABOVE_CENTER:
               param5.x = (unscaledWidth - param2) / 2;
               param5.y = -param3;
               break;
            default:
               super.determinePosition(param1,param2,param3,param4,param5,param6);
               return;
         }
         var _loc7_:DisplayObject = popUp as DisplayObject;
         var _loc8_:Point = param5.clone();
         var _loc9_:Point = MatrixUtil.transformBounds(_loc7_.width,_loc7_.height,param4,_loc8_);
         param6.left = _loc8_.x;
         param6.top = _loc8_.y;
         param6.width = _loc9_.x;
         param6.height = _loc9_.y;
      }
   }
}
