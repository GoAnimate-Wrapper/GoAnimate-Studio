package anifire.studio.models
{
   import anifire.constant.ServerConstants;
   import anifire.event.CoreEvent;
   import anifire.event.LoadMgrEvent;
   import anifire.event.ServerRequestEvent;
   import anifire.managers.AppConfigManager;
   import anifire.studio.core.Prop;
   import anifire.studio.core.PropThumb;
   import anifire.studio.core.State;
   import anifire.studio.core.Thumb;
   import anifire.util.ApiRequest;
   import anifire.util.UtilLoadMgr;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   
   public class TextComponentThumb extends Thumb
   {
      
      public static const DRAG_DATA_FORMAT:String = "TextComponentThumb";
      
      public static const LOAD_COMPONENTS_IMAGE_DATA_COMPLETE:String = "loadComponentsImageDataComplete";
      
      protected static const PATH_PREFIX:String = "go/img/text_component/";
       
      
      public var isAllComponentImageDataReady:Boolean;
      
      private var _thumbnail:String;
      
      public var thumbnailUrl:String;
      
      public var content:Object;
      
      public function TextComponentThumb()
      {
         super();
      }
      
      public function get thumbnail() : String
      {
         return this._thumbnail;
      }
      
      public function set thumbnail(param1:String) : void
      {
         if(this._thumbnail == param1)
         {
            return;
         }
         this._thumbnail = param1;
         var _loc2_:String = AppConfigManager.instance.getValue(ServerConstants.FLASHVAR_CLIENT_THEME_PATH);
         this.thumbnailUrl = _loc2_.replace(ServerConstants.FLASHVAR_CLIENT_THEME_PLACEHOLDER,PATH_PREFIX + this._thumbnail);
      }
      
      public function loadComponentsImageData() : void
      {
         if(this.content)
         {
            this.loadComponentsImageDataFunc();
         }
         else
         {
            this.loadSceneData();
         }
      }
      
      private function loadComponentsImageDataCompleteHandler(param1:Event) : void
      {
         var _loc2_:UtilLoadMgr = param1.target as UtilLoadMgr;
         _loc2_.removeEventListener(LoadMgrEvent.ALL_COMPLETE,this.loadComponentsImageDataCompleteHandler);
         this.isAllComponentImageDataReady = true;
         this.dispatchEvent(new Event(LOAD_COMPONENTS_IMAGE_DATA_COMPLETE));
      }
      
      private function loadSceneData_completeHandler(param1:ServerRequestEvent) : void
      {
         var event:ServerRequestEvent = param1;
         var responseData:Object = event.data;
         if(!responseData.content)
         {
            return;
         }
         try
         {
            this.content = com.adobe.serialization.json.JSON.decode(responseData.content);
         }
         catch(e:Error)
         {
            content = null;
            return;
         }
         this.loadComponentsImageDataFunc();
      }
      
      private function loadComponentsImageDataFunc() : void
      {
         var _loc4_:int = 0;
         var _loc5_:Object = null;
         var _loc6_:PropThumb = null;
         var _loc7_:State = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(!this.content || !this.content.assets)
         {
            return;
         }
         var _loc1_:int = this.content.assets.length;
         var _loc2_:UtilLoadMgr = new UtilLoadMgr();
         var _loc3_:Boolean = true;
         _loc4_ = 0;
         while(_loc4_ < _loc1_)
         {
            _loc5_ = this.content.assets[_loc4_];
            if(_loc5_.type == Prop.ASSET_TYPE)
            {
               _loc6_ = Prop.getThumbByJsonObj(_loc5_);
               if(_loc6_.states && _loc6_.states.length > 0)
               {
                  _loc8_ = _loc6_.states.length;
                  _loc9_ = 0;
                  while(_loc9_ < _loc8_)
                  {
                     _loc7_ = _loc6_.states[_loc9_];
                     if(!_loc7_.imageData && _loc6_.theme.isStateExists(_loc6_.xml,_loc7_))
                     {
                        _loc3_ = false;
                        _loc2_.addEventDispatcher(_loc7_,CoreEvent.LOAD_STATE_COMPLETE);
                        _loc6_.loadState(_loc7_);
                     }
                     _loc9_++;
                  }
               }
               else if(!_loc6_.imageData)
               {
                  _loc3_ = false;
                  _loc2_.addEventDispatcher(_loc6_,CoreEvent.LOAD_THUMB_COMPLETE);
                  _loc6_.loadImageData();
               }
            }
            _loc4_++;
         }
         if(_loc3_)
         {
            this.isAllComponentImageDataReady = true;
            this.dispatchEvent(new Event(LOAD_COMPONENTS_IMAGE_DATA_COMPLETE));
         }
         else
         {
            _loc2_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.loadComponentsImageDataCompleteHandler);
            _loc2_.commit();
         }
      }
      
      private function loadSceneData_failHandler(param1:ServerRequestEvent) : void
      {
      }
      
      private function loadSceneData() : void
      {
         var _loc1_:Object = {"id":id};
         var _loc2_:ApiRequest = new ApiRequest();
         _loc2_.addEventListener(ServerRequestEvent.COMPLETE,this.loadSceneData_completeHandler);
         _loc2_.addEventListener(ServerRequestEvent.FAIL,this.loadSceneData_failHandler);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.loadSceneData_failHandler);
         _loc2_.post(ServerConstants.ACTION_TEXT_COMPONENT_GET,_loc1_);
      }
   }
}
