package anifire.studio.components
{
   import anifire.studio.skins.IconButtonSkin;
   import spark.components.Button;
   
   public class IconButton extends Button
   {
       
      
      public function IconButton()
      {
         super();
         buttonMode = true;
         setStyle("skinClass",IconButtonSkin);
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == iconDisplay)
         {
            this.updateIcon();
         }
      }
      
      override public function styleChanged(param1:String) : void
      {
         super.styleChanged(param1);
         if(!param1 || param1 == "styleName" || param1 == "icon" || param1 == "iconOver" || param1 == "iconDisabled")
         {
            this.updateIcon();
         }
      }
      
      override protected function stateChanged(param1:String, param2:String, param3:Boolean) : void
      {
         super.stateChanged(param1,param2,param3);
         this.updateIcon();
      }
      
      protected function updateIcon() : void
      {
         var _loc1_:String = null;
         var _loc2_:Class = null;
         var _loc3_:Class = null;
         var _loc4_:Class = null;
         if(iconDisplay)
         {
            _loc1_ = getCurrentSkinState();
            _loc2_ = getStyle("icon");
            if(_loc1_ == "up")
            {
               iconDisplay.source = _loc2_;
            }
            else if(_loc1_ == "disabled")
            {
               _loc3_ = getStyle("iconDisabled");
               iconDisplay.source = !!_loc3_?_loc3_:_loc2_;
               if(!_loc3_)
               {
                  iconDisplay.alpha = 0.5;
               }
            }
            else if(_loc1_ == "over" || _loc1_ == "down")
            {
               _loc4_ = getStyle("iconOver");
               iconDisplay.source = !!_loc4_?_loc4_:_loc2_;
            }
         }
      }
   }
}
