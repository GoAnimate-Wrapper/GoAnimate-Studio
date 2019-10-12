package anifire.util
{
   import anifire.constant.ServerConstants;
   import anifire.managers.AppConfigManager;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   
   public class UtilGettext
   {
      
      private static var resources:Object = {};
      
      private static var slocale:String;
      
      private static var ref:Object = {};
       
      
      public function UtilGettext()
      {
         super();
      }
      
      public static function initAggregate(param1:String, param2:String, param3:String, param4:Function) : void
      {
         var _loc5_:String = null;
         init([param1],param2,param3,param4);
         for each(_loc5_ in ServerConstants.getPOList(param1))
         {
            ref[_loc5_] = param1;
         }
      }
      
      public static function init(param1:Array, param2:String, param3:String, param4:Function) : void
      {
         var apiserver:String = null;
         var domain:String = null;
         var domains:Array = param1;
         var themeCode:String = param2;
         var locale:String = param3;
         var callback:Function = param4;
         slocale = locale;
         var needsLoad:Boolean = false;
         var _configManager:AppConfigManager = AppConfigManager.instance;
         apiserver = _configManager.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_PATH) as String;
         for each(domain in domains)
         {
            function():void
            {
               var _domain:* = undefined;
               var gt:* = undefined;
               var gt2:* = undefined;
               _domain = domain;
               if(resources[[domain,locale].join("|")] == null)
               {
                  needsLoad = true;
                  gt = new GetText();
                  gt.addEventListener(Event.COMPLETE,function(param1:Event):void
                  {
                     var e:Event = param1;
                     resources[[_domain,locale].join("|")] = gt;
                     if(domains.every(function(param1:*, param2:int, param3:Array):Boolean
                     {
                        return resources[[String(param1),locale].join("|")] != null;
                     }))
                     {
                        callback(null);
                     }
                  });
                  gt.addEventListener(IOErrorEvent.IO_ERROR,function(param1:Event):void
                  {
                     callback(null);
                  });
                  gt.translation(domain,apiserver + "/static/client_theme/locale/" + themeCode + "/",locale);
                  gt.install();
                  if(locale != "en_US")
                  {
                     gt2 = new GetText();
                     gt2.addEventListener(Event.COMPLETE,function(param1:Event):void
                     {
                        resources[[_domain,"en_US"].join("|")] = gt2;
                     });
                     gt2.translation(domain,apiserver + "/static/client_theme/locale/" + themeCode + "/","en_US");
                     gt2.install();
                  }
               }
            }();
         }
         if(!needsLoad)
         {
            callback(null);
         }
      }
      
      public static function translateAggregate(param1:String, param2:String) : String
      {
         return translate(ref[param1],[param1,param2].join("|"));
      }
      
      public static function translate(param1:String, param2:String) : String
      {
         var _loc6_:GetText = null;
         var _loc3_:GetText = resources[[param1,slocale].join("|")];
         var _loc4_:GetText = null;
         var _loc5_:String = null;
         if(param2 == null || param2 == "")
         {
            return "";
         }
         if(slocale != "en_US")
         {
            _loc4_ = resources[[param1,"en_US"].join("|")];
         }
         for each(_loc6_ in [_loc3_,_loc4_])
         {
            try
            {
               if(_loc6_ != null)
               {
                  _loc5_ = _loc6_.translate(param2,true);
                  break;
               }
            }
            catch(ex:TypeError)
            {
               continue;
            }
         }
         return _loc5_;
      }
   }
}
