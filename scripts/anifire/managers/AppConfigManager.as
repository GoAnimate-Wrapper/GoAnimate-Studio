package anifire.managers
{
   import flash.net.URLVariables;
   import mx.core.FlexGlobals;
   
   public class AppConfigManager
   {
      
      private static var __instance:AppConfigManager;
       
      
      protected var _properties:Object;
      
      public function AppConfigManager()
      {
         super();
         this.init();
      }
      
      public static function get instance() : AppConfigManager
      {
         if(!__instance)
         {
            __instance = new AppConfigManager();
         }
         return __instance;
      }
      
      protected function init() : void
      {
         this._properties = {};
         this.processAppParams();
      }
      
      public function processAppParams() : void
      {
         var _loc1_:Object = FlexGlobals.topLevelApplication;
         this.setParamters(_loc1_.parameters);
      }
      
      public function setParamters(param1:Object) : void
      {
         var _loc2_:* = null;
         for(_loc2_ in param1)
         {
            this._properties[_loc2_] = param1[_loc2_];
         }
      }
      
      public function getValue(param1:String) : String
      {
         return this._properties[param1];
      }
      
      public function setValue(param1:String, param2:String) : void
      {
         this._properties[param1] = param2;
      }
      
      public function createURLVariables() : URLVariables
      {
         var _loc2_:* = null;
         var _loc1_:URLVariables = new URLVariables();
         for(_loc2_ in this._properties)
         {
            _loc1_[_loc2_] = this._properties[_loc2_];
         }
         return _loc1_;
      }
      
      public function appendURLVariables(param1:URLVariables) : void
      {
         var _loc2_:* = null;
         for(_loc2_ in this._properties)
         {
            param1[_loc2_] = this._properties[_loc2_];
         }
      }
   }
}
