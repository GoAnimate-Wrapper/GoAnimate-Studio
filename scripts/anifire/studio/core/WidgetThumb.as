package anifire.studio.core
{
   import anifire.event.CoreEvent;
   import anifire.util.UtilDict;
   import anifire.util.UtilNetwork;
   import anifire.util.UtilURLStream;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   
   public class WidgetThumb extends PropThumb
   {
      
      public static const XML_NODE_NAME:String = "widget";
      
      public static const MAX_DATA_ROWS:int = 20;
      
      public static const MIN_DATA_ROWS:int = 1;
      
      public static const MIN_NUM_RANGES:int = 1;
      
      public static const MAX_NUM_RANGES:int = 20;
       
      
      private var _chartType:String = "barChart";
      
      private var _thumbnailId:String = "layoutThumbnail.png";
      
      public function WidgetThumb()
      {
         super();
         this.placeable = true;
      }
      
      override public function deSerialize(param1:XML, param2:Theme) : void
      {
         this.id = param1.@id;
         this.aid = param1.@aid;
         this.theme = param2;
         subType = XML_NODE_NAME;
         if(param1)
         {
            if(param1.hasOwnProperty("@name"))
            {
               this.name = UtilDict.toDisplay("store",param1.@name);
            }
            if(param1.hasOwnProperty("@type"))
            {
               this._chartType = String(param1.@type);
            }
            if(param1.hasOwnProperty("@thumb"))
            {
               this._thumbnailId = String(param1.@thumb);
            }
         }
      }
      
      override public function loadImageData() : void
      {
         var _loc1_:URLRequest = null;
         var _loc2_:UtilURLStream = null;
         if(this.theme)
         {
            _loc1_ = UtilNetwork.getGetThemeAssetRequest(this.theme.id,this._thumbnailId,"widget");
            _loc2_ = new UtilURLStream();
            _loc2_.addEventListener(Event.COMPLETE,this.loadImageDataComplete);
            _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.onLoadImageDataFail);
            _loc2_.load(_loc1_);
         }
      }
      
      override public function loadImageDataComplete(param1:Event) : void
      {
         var _loc2_:URLStream = URLStream(param1.target);
         _loc2_.removeEventListener(Event.COMPLETE,this.loadImageDataComplete);
         _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,this.onLoadImageDataFail);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_,0,_loc2_.bytesAvailable);
         var _loc4_:ByteArray = _loc3_;
         this.imageData = _loc4_;
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
      }
      
      private function onLoadImageDataFail(param1:Event) : void
      {
      }
      
      public function get chartType() : String
      {
         return this._chartType;
      }
      
      public function set chartType(param1:String) : void
      {
         this._chartType = param1;
      }
   }
}
