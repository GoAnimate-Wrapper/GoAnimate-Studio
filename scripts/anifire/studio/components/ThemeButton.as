package anifire.studio.components
{
   import anifire.studio.skins.ThemeButtonSkin;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   
   public class ThemeButton extends Button
   {
       
      
      [SkinPart(required="false")]
      public var themeIcon:ThemeIcon;
      
      protected var _themeId:String;
      
      public function ThemeButton()
      {
         super();
         buttonMode = true;
         setStyle("skinClass",ThemeButtonSkin);
      }
      
      [Bindable(event="propertyChange")]
      public function get themeId() : String
      {
         return this._themeId;
      }
      
      private function set _1349701436themeId(param1:String) : void
      {
         if(this._themeId != param1)
         {
            this._themeId = param1;
            if(this.themeIcon)
            {
               this.themeIcon.themeId = this.themeId;
            }
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.themeIcon)
         {
            this.themeIcon.themeId = this.themeId;
         }
      }
      
      public function set themeId(param1:String) : void
      {
         var _loc2_:Object = this.themeId;
         if(_loc2_ !== param1)
         {
            this._1349701436themeId = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"themeId",_loc2_,param1));
            }
         }
      }
   }
}
