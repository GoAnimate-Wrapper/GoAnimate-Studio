package anifire.models.creator
{
   import anifire.constant.CcLibConstant;
   import anifire.constant.ServerConstants;
   import anifire.managers.AppConfigManager;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   
   public class CCBodyModel extends EventDispatcher
   {
       
      
      public var components:Object;
      
      public var libraries:Object;
      
      public var colors:Object;
      
      public var bodyScale:Object;
      
      public var headScale:Object;
      
      public var headPos:Object;
      
      public var completed:Boolean = false;
      
      public var assetId:String;
      
      public var version:Number;
      
      public var bodyShapeId:String;
      
      public var themeId:String;
      
      public var source:XML;
      
      protected var loader:URLLoader;
      
      public function CCBodyModel(param1:String)
      {
         super();
         this.assetId = param1;
         this.components = {};
         this.libraries = {};
         this.colors = {};
         this.bodyScale = {};
         this.headScale = {};
         this.headPos = {};
         this.version = 1;
      }
      
      public function load() : void
      {
         var _loc1_:URLRequest = null;
         var _loc2_:URLVariables = null;
         if(!this.loader)
         {
            _loc1_ = new URLRequest(ServerConstants.ACTION_GET_CC_CHAR_COMPOSITION_XML);
            _loc1_.method = URLRequestMethod.POST;
            _loc2_ = AppConfigManager.instance.createURLVariables();
            _loc2_["assetId"] = this.assetId;
            _loc1_.data = _loc2_;
            if(this.assetId && this.assetId != "")
            {
               this.loader = new URLLoader();
               this.loader.addEventListener(Event.COMPLETE,this.onLoaderComplete);
               this.loader.addEventListener(IOErrorEvent.IO_ERROR,this.onLoaderError);
               this.loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onLoaderError);
               this.loader.load(_loc1_);
            }
         }
      }
      
      protected function onLoaderComplete(param1:Event) : void
      {
         this.loader.removeEventListener(Event.COMPLETE,this.onLoaderComplete);
         var _loc2_:String = this.loader.data;
         if(_loc2_.charAt(0) == "0")
         {
            this.parse(XML(_loc2_.substr(1)));
         }
         else
         {
            this.dispatchError();
         }
      }
      
      protected function onLoaderError(param1:Event) : void
      {
         this.dispatchError();
      }
      
      protected function dispatchError() : void
      {
         dispatchEvent(new ErrorEvent(ErrorEvent.ERROR));
      }
      
      public function parse(param1:XML) : void
      {
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc7_:CCBodyComponentModel = null;
         var _loc8_:Vector.<CCBodyComponentModel> = null;
         var _loc9_:CCColor = null;
         var _loc5_:XMLList = param1.component;
         var _loc6_:int = _loc5_.length();
         _loc2_ = 0;
         while(_loc2_ < _loc6_)
         {
            _loc7_ = new CCBodyComponentModel();
            _loc7_.parse(_loc5_[_loc2_]);
            if(_loc7_.type == "bodyshape")
            {
               this.bodyShapeId = _loc7_.component_id;
               this.themeId = _loc7_.theme_id;
            }
            if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(_loc7_.type) > -1)
            {
               if(!this.components[_loc7_.type])
               {
                  _loc8_ = this.components[_loc7_.type] = new Vector.<CCBodyComponentModel>();
               }
               else
               {
                  _loc8_ = this.components[_loc7_.type];
               }
               _loc8_.push(_loc7_);
            }
            else
            {
               this.components[_loc7_.type] = _loc7_;
            }
            _loc2_++;
         }
         _loc5_ = param1.library;
         _loc6_ = _loc5_.length();
         _loc2_ = 0;
         while(_loc2_ < _loc6_)
         {
            _loc3_ = _loc5_[_loc2_].@type;
            _loc4_ = _loc5_[_loc2_].@component_id;
            this.libraries[_loc3_] = _loc4_;
            _loc2_++;
         }
         _loc5_ = param1.color;
         _loc6_ = _loc5_.length();
         _loc2_ = 0;
         while(_loc2_ < _loc6_)
         {
            _loc9_ = new CCColor();
            _loc9_.parse(_loc5_[_loc2_]);
            if(_loc9_.targetComponent)
            {
               this.colors[_loc9_.type + _loc9_.targetComponent] = _loc9_;
            }
            else
            {
               this.colors[_loc9_.type] = _loc9_;
            }
            _loc2_++;
         }
         this.bodyScale.scalex = Number(param1.@xscale);
         this.bodyScale.scaley = Number(param1.@yscale);
         this.headScale.scalex = Number(param1.@hxscale);
         this.headScale.scaley = Number(param1.@hyscale);
         this.headPos.dx = Number(param1.@headdx);
         this.headPos.dy = Number(param1.@headdy);
         this.version = Number(param1.@version);
         this.source = param1;
         this.completed = true;
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function getColor(param1:String) : CCColor
      {
         return this.colors[param1];
      }
      
      public function getComponentId(param1:String) : Object
      {
         return this.components[param1];
      }
      
      public function getLibraryId(param1:String) : String
      {
         return this.libraries[param1];
      }
   }
}
