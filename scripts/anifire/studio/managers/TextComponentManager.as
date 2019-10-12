package anifire.studio.managers
{
   import anifire.constant.ServerConstants;
   import anifire.constant.ThemeConstants;
   import anifire.event.CoreEvent;
   import anifire.event.ServerRequestEvent;
   import anifire.studio.events.TextComponentEvent;
   import anifire.studio.models.TextComponentThumb;
   import anifire.util.ApiRequest;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import mx.collections.ArrayCollection;
   
   public class TextComponentManager extends EventDispatcher
   {
      
      public static const XML_ATTRIBUTE_NAME_COMPONENT_ROLE:String = "componentRole";
      
      public static const COMPONENT_ROLE_TITLE:String = "title";
      
      public static const COMPONENT_ROLE_SUBTITLE:String = "subtitle";
      
      public static const COMPONENT_ROLE_QUOTE:String = "quote";
      
      public static const COMPONENT_ROLE_BODY_TEXT:String = "bodytext";
      
      public static const COMPONENT_ROLE_CAPTION:String = "caption";
      
      public static const COMPONENT_ROLE_TEXT:String = "text";
      
      public static const COMPONENT_ROLE_PROP:String = "prop";
      
      private static var __instance:TextComponentManager;
       
      
      public var textComponents:ArrayCollection;
      
      public function TextComponentManager()
      {
         super();
      }
      
      public static function get instance() : TextComponentManager
      {
         if(!__instance)
         {
            __instance = new TextComponentManager();
         }
         return __instance;
      }
      
      private function loadTextComponentList_completeHandler(param1:ServerRequestEvent) : void
      {
         var _loc5_:Object = null;
         var _loc6_:TextComponentThumb = null;
         var _loc2_:Array = param1.data as Array;
         if(!_loc2_)
         {
            return;
         }
         this.textComponents = new ArrayCollection();
         var _loc3_:int = _loc2_.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_[_loc4_];
            _loc6_ = new TextComponentThumb();
            _loc6_.id = _loc5_.id;
            _loc6_.name = _loc5_.name;
            _loc6_.thumbnail = _loc5_.thumbnail;
            _loc6_.theme = ThemeManager.instance.getTheme(ThemeConstants.BUSINESS_THEME_ID);
            this.textComponents.addItem(_loc6_);
            _loc4_++;
         }
         dispatchEvent(new CoreEvent(CoreEvent.TEXT_COMPONENT_LIST_LOADED,this));
      }
      
      private function loadTextComponentList_failHandler(param1:ServerRequestEvent) : void
      {
      }
      
      public function loadTextComponentList() : void
      {
         var _loc1_:Object = {"theme_code":ThemeConstants.BUSINESS_THEME_ID};
         var _loc2_:ApiRequest = new ApiRequest();
         _loc2_.addEventListener(ServerRequestEvent.COMPLETE,this.loadTextComponentList_completeHandler);
         _loc2_.addEventListener(ServerRequestEvent.FAIL,this.loadTextComponentList_failHandler);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.loadTextComponentList_failHandler);
         _loc2_.post(ServerConstants.ACTION_TEXT_COMPONENT_GET_LIST,_loc1_);
      }
      
      private function removeThumbById(param1:String) : TextComponentThumb
      {
         var _loc3_:TextComponentThumb = null;
         if(!this.textComponents)
         {
            return null;
         }
         var _loc2_:int = this.textComponents.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = this.textComponents.getItemAt(_loc4_) as TextComponentThumb;
            if(_loc3_ && _loc3_.id == param1)
            {
               return this.textComponents.removeItemAt(_loc4_) as TextComponentThumb;
            }
            _loc4_++;
         }
         return null;
      }
      
      public function deleteTextComponent(param1:String) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:Object = {"id":param1};
         var _loc3_:ApiRequest = new ApiRequest();
         _loc3_.addEventListener(ServerRequestEvent.COMPLETE,this.deleteTextComponent_completeHandler);
         _loc3_.addEventListener(ServerRequestEvent.FAIL,this.deleteTextComponent_failHandler);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.deleteTextComponent_failHandler);
         _loc3_.post(ServerConstants.ACTION_TEXT_COMPONENT_DELETE,_loc2_);
         var _loc4_:TextComponentThumb = this.removeThumbById(param1);
         if(_loc4_)
         {
            dispatchEvent(new TextComponentEvent(TextComponentEvent.TEXT_COMPONENT_DELETED,_loc4_));
         }
      }
      
      private function deleteTextComponent_completeHandler(param1:ServerRequestEvent) : void
      {
      }
      
      private function deleteTextComponent_failHandler(param1:ServerRequestEvent) : void
      {
      }
   }
}
