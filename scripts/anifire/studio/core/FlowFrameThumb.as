package anifire.studio.core
{
   import anifire.constant.AnimeConstants;
   import anifire.event.CoreEvent;
   import anifire.util.UtilNetwork;
   import anifire.util.UtilURLStream;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   import flash.utils.ByteArray;
   
   public class FlowFrameThumb extends PropThumb
   {
      
      public static const XML_NODE_NAME:String = "flow";
      
      public static const XML_NODE_NAME_COLOR:String = "color";
      
      public static const XML_ATTRIBUTE_NAME_FRAME_WIDTH:String = "width";
      
      public static const XML_ATTRIBUTE_NAME_FRAME_HEIGHT:String = "height";
      
      public static const XML_ATTRIBUTE_NAME_MIN_CONTENT_WIDTH:String = "minWidth";
      
      public static const XML_ATTRIBUTE_NAME_MIN_CONTENT_HEIGHT:String = "minHeight";
      
      public static const XML_ATTRIBUTE_NAME_LEFT:String = "left";
      
      public static const XML_ATTRIBUTE_NAME_TOP:String = "top";
      
      public static const XML_ATTRIBUTE_NAME_RIGHT:String = "right";
      
      public static const XML_ATTRIBUTE_NAME_BOTTOM:String = "bottom";
      
      public static const XML_ATTRIBUTE_NAME_FIT_MODE:String = "fitMode";
      
      public static const XML_ATTRIBUTE_NAME_INNER_LEFT:String = "innerLeft";
      
      public static const XML_ATTRIBUTE_NAME_INNER_RIGHT:String = "innerRight";
      
      public static const XML_ATTRIBUTE_NAME_INNER_TOP:String = "innerTop";
      
      public static const XML_ATTRIBUTE_NAME_INNER_BOTTOM:String = "innerBottom";
       
      
      private var _color:uint = 0;
      
      private var _frameWidth:Number = 0;
      
      private var _frameHeight:Number = 0;
      
      private var _minFrameWidth:Number = 0;
      
      private var _minFrameHeight:Number = 0;
      
      public var gridLeft:Number = 0;
      
      public var gridTop:Number = 0;
      
      public var gridRight:Number = 0;
      
      public var gridBottom:Number = 0;
      
      public var innerOffsetLeft:Number = 0;
      
      public var innerOffsetRight:Number = 0;
      
      public var innerOffsetTop:Number = 0;
      
      public var innerOffsetBottom:Number = 0;
      
      private var _fitMode:int;
      
      public function FlowFrameThumb()
      {
         this._fitMode = FlowFrame.IMAGE_FIT_MODE_FIT_TO_IMAGE;
         super();
      }
      
      override public function loadImageData() : void
      {
         var _loc1_:URLRequest = UtilNetwork.getFlowFrameThumbnailRequest(this.themeId,this.thumbId);
         var _loc2_:UtilURLStream = new UtilURLStream();
         _loc2_.addEventListener(Event.COMPLETE,this.loadImageDataComplete);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.loadImageData_errorHandler);
         _loc2_.load(_loc1_);
      }
      
      override public function loadImageDataComplete(param1:Event) : void
      {
         var _loc2_:URLStream = URLStream(param1.target);
         _loc2_.removeEventListener(Event.COMPLETE,this.loadImageDataComplete);
         _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,this.loadImageData_errorHandler);
         var _loc3_:ByteArray = new ByteArray();
         _loc2_.readBytes(_loc3_,0,_loc2_.bytesAvailable);
         this.imageData = _loc3_;
         this.dispatchEvent(new CoreEvent(CoreEvent.LOAD_THUMB_COMPLETE,this));
      }
      
      protected function loadImageData_errorHandler(param1:Event) : void
      {
      }
      
      override public function deSerialize(param1:XML, param2:Theme) : void
      {
         super.deSerialize(param1,param2);
         if(!param1)
         {
            return;
         }
         this.thumbId = param1.@thumb;
         if(param1.hasOwnProperty(XML_NODE_NAME_COLOR))
         {
            this._color = uint(param1.child(XML_NODE_NAME_COLOR)[0]);
         }
         if(param1.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_LEFT))
         {
            this.gridLeft = Number(param1.attribute(XML_ATTRIBUTE_NAME_LEFT)[0]);
         }
         if(param1.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_TOP))
         {
            this.gridTop = Number(param1.attribute(XML_ATTRIBUTE_NAME_TOP)[0]);
         }
         if(param1.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_RIGHT))
         {
            this.gridRight = Number(param1.attribute(XML_ATTRIBUTE_NAME_RIGHT)[0]);
         }
         if(param1.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_BOTTOM))
         {
            this.gridBottom = Number(param1.attribute(XML_ATTRIBUTE_NAME_BOTTOM)[0]);
         }
         if(param1.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_INNER_LEFT))
         {
            this.innerOffsetLeft = Number(param1.attribute(XML_ATTRIBUTE_NAME_INNER_LEFT)[0]);
         }
         if(param1.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_INNER_RIGHT))
         {
            this.innerOffsetRight = Number(param1.attribute(XML_ATTRIBUTE_NAME_INNER_RIGHT)[0]);
         }
         if(param1.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_INNER_TOP))
         {
            this.innerOffsetTop = Number(param1.attribute(XML_ATTRIBUTE_NAME_INNER_TOP)[0]);
         }
         if(param1.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_INNER_BOTTOM))
         {
            this.innerOffsetBottom = Number(param1.attribute(XML_ATTRIBUTE_NAME_INNER_BOTTOM)[0]);
         }
         if(param1.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_FRAME_WIDTH))
         {
            this._frameWidth = Number(param1.attribute(XML_ATTRIBUTE_NAME_FRAME_WIDTH)[0]);
         }
         if(param1.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_FRAME_HEIGHT))
         {
            this._frameHeight = Number(param1.attribute(XML_ATTRIBUTE_NAME_FRAME_HEIGHT)[0]);
         }
         if(param1.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_MIN_CONTENT_WIDTH))
         {
            this._minFrameWidth = Number(param1.attribute(XML_ATTRIBUTE_NAME_MIN_CONTENT_WIDTH)[0]) + this.gridLeft + this.gridRight;
         }
         if(param1.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_MIN_CONTENT_HEIGHT))
         {
            this._minFrameHeight = Number(param1.attribute(XML_ATTRIBUTE_NAME_MIN_CONTENT_HEIGHT)[0]) + this.gridTop + this.gridBottom;
         }
         if(param1.hasOwnProperty("@" + XML_ATTRIBUTE_NAME_FIT_MODE))
         {
            this._fitMode = int(param1.attribute(XML_ATTRIBUTE_NAME_FIT_MODE)[0]);
         }
         this.placeable = true;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get frameWidth() : Number
      {
         return this._frameWidth;
      }
      
      public function get frameHeight() : Number
      {
         return this._frameHeight;
      }
      
      public function get minFrameWidth() : Number
      {
         return this._minFrameWidth;
      }
      
      public function get minFrameHeight() : Number
      {
         return this._minFrameHeight;
      }
      
      override public function get facing() : String
      {
         return AnimeConstants.FACING_LEFT;
      }
      
      public function get fitMode() : int
      {
         return this._fitMode;
      }
   }
}
