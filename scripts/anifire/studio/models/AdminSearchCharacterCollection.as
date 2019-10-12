package anifire.studio.models
{
   import anifire.constant.ServerConstants;
   import anifire.managers.AppConfigManager;
   import anifire.studio.core.CharThumb;
   import anifire.studio.core.Theme;
   import anifire.studio.managers.ThemeManager;
   import anifire.util.UtilURLStream;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLStream;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   
   public class AdminSearchCharacterCollection extends SearchCollection
   {
       
      
      public function AdminSearchCharacterCollection(param1:String, param2:String)
      {
         super(param1);
         _themeId = param2;
      }
      
      override public function search(param1:String) : void
      {
         source = [];
         this.keyword = param1;
         var _loc2_:URLVariables = AppConfigManager.instance.createURLVariables();
         var _loc3_:UtilURLStream = new UtilURLStream();
         _loc3_.addEventListener(Event.COMPLETE,this.onSearchComplete);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.onSearchError);
         _loc3_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSearchError);
         _loc2_["themeId"] = _themeId;
         _loc2_["keywords"] = param1;
         var _loc4_:URLRequest = new URLRequest(ServerConstants.ACTION_SEARCH_TEMPLATE_CC);
         _loc4_.data = _loc2_;
         _loc4_.method = URLRequestMethod.POST;
         _loc3_.load(_loc4_);
      }
      
      private function onSearchComplete(param1:Event) : void
      {
         var _loc7_:CharThumb = null;
         var _loc8_:XML = null;
         var _loc2_:URLStream = param1.currentTarget as URLStream;
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_);
         var _loc4_:XML = new XML(_loc3_);
         var _loc5_:XMLList = _loc4_.children();
         var _loc6_:int = _loc5_.length();
         var _loc9_:Theme = ThemeManager.instance.userTheme;
         var _loc10_:int = 0;
         while(_loc10_ < _loc6_)
         {
            _loc8_ = _loc5_[_loc10_];
            _loc7_ = new CharThumb();
            _loc7_.deSerialize(_loc8_,_loc9_);
            _loc7_.xml = _loc8_;
            _loc7_.editable = true;
            addProduct(new ThumbModel(_loc7_));
            _loc10_++;
         }
         completeSearch();
      }
      
      private function onSearchError(param1:Event) : void
      {
         completeSearch();
      }
   }
}
