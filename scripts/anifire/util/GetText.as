package anifire.util
{
   import anifire.constant.ServerConstants;
   import anifire.managers.AppConfigManager;
   import flash.net.URLRequest;
   
   public class GetText extends com.adobe.webapis.gettext.GetText
   {
       
      
      public function GetText()
      {
         super();
      }
      
      override protected function composeURLRequest() : URLRequest
      {
         var _loc8_:URLRequest = null;
         var _loc1_:AppConfigManager = AppConfigManager.instance;
         var _loc2_:String = _loc1_.getValue("v");
         var _loc3_:String = _loc1_.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_CODE);
         if(_loc3_ == null)
         {
            _loc3_ = "go";
         }
         var _loc4_:String = _loc1_.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_PATH) as String;
         if(_loc4_ == "" || _loc4_ == null)
         {
            _loc8_ = new URLRequest(this.getUrl() + this.getLocale() + "/" + this.getName() + ".mo?v=" + _loc2_);
            return _loc8_;
         }
         var _loc5_:RegExp = new RegExp(ServerConstants.FLASHVAR_CLIENT_THEME_PLACEHOLDER,"g");
         var _loc6_:* = "client_theme/locale/" + _loc3_ + "/" + this.getLocale() + "/" + this.getName() + ".mo";
         _loc4_ = _loc4_.replace(_loc5_,_loc6_);
         var _loc7_:URLRequest = new URLRequest(_loc4_);
         return _loc7_;
      }
   }
}
