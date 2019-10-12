package anifire.component.flowFrames
{
   import anifire.constants.FlowConstants;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class FlowFramePart extends Sprite
   {
       
      
      public var partId:String;
      
      public var gridId:String;
      
      public var container:FlowFrameMaker;
      
      protected var _layoutRect:Rectangle;
      
      protected var _scaleMode:String;
      
      protected var _anchorMode:String;
      
      protected var _imageRef:String;
      
      protected var _imageReady:Boolean;
      
      protected var _imageDisplay:DisplayObject;
      
      public function FlowFramePart()
      {
         super();
      }
      
      public function readNode(param1:XML) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         this.partId = param1.@id;
         this.gridId = FlowConstants.getFlowValue(param1.@grid);
         if(param1.hasOwnProperty("@scale"))
         {
            _loc2_ = param1.@scale;
         }
         switch(_loc2_)
         {
            case "w":
               this._scaleMode = FlowConstants.FLOW_SCALE_WIDTH;
               break;
            case "h":
               this._scaleMode = FlowConstants.FLOW_SCALE_HEIGHT;
               break;
            case "b":
               this._scaleMode = FlowConstants.FLOW_SCALE_ALL;
               break;
            case "n":
            default:
               this._scaleMode = FlowConstants.FLOW_SCALE_NONE;
         }
         if(param1.hasOwnProperty("@anchor"))
         {
            _loc3_ = param1.@anchor;
         }
         this._anchorMode = FlowConstants.getFlowValue(_loc3_);
         this._imageRef = param1.@src;
      }
      
      public function loadImage() : void
      {
         if(!this._imageRef)
         {
            return;
         }
         var _loc1_:Class = this.container.getPartImgae(this._imageRef);
         if(_loc1_)
         {
            this._imageReady = true;
            this._imageDisplay = new _loc1_() as DisplayObject;
            addChildAt(this._imageDisplay,0);
            this.draw();
         }
      }
      
      public function updateLayoutRect() : void
      {
         if(this.container)
         {
            this._layoutRect = this.container.getLayoutRect(this.gridId);
         }
         this.x = this._layoutRect.x;
         this.y = this._layoutRect.y;
      }
      
      public function draw() : void
      {
         this.updateLayoutRect();
         if(this._imageReady && this._layoutRect)
         {
            if(this._scaleMode == FlowConstants.FLOW_SCALE_ALL || this._scaleMode == FlowConstants.FLOW_SCALE_WIDTH)
            {
               this._imageDisplay.width = this._layoutRect.width;
            }
            if(this._scaleMode == FlowConstants.FLOW_SCALE_ALL || this._scaleMode == FlowConstants.FLOW_SCALE_HEIGHT)
            {
               this._imageDisplay.height = this._layoutRect.height;
            }
            switch(this._anchorMode)
            {
               case FlowConstants.FLOW_TOP_LEFT:
               default:
                  this._imageDisplay.x = 0;
                  this._imageDisplay.y = 0;
                  break;
               case FlowConstants.FLOW_TOP:
                  this._imageDisplay.x = this._layoutRect.width * 0.5;
                  this._imageDisplay.y = 0;
                  break;
               case FlowConstants.FLOW_TOP_RIGHT:
                  this._imageDisplay.x = this._layoutRect.width - this._imageDisplay.width;
                  this._imageDisplay.y = 0;
                  break;
               case FlowConstants.FLOW_LEFT:
                  this._imageDisplay.x = 0;
                  this._imageDisplay.y = this._layoutRect.height * 0.5;
                  break;
               case FlowConstants.FLOW_CENTER:
                  this._imageDisplay.x = this._layoutRect.width * 0.5;
                  this._imageDisplay.y = this._layoutRect.height * 0.5;
                  break;
               case FlowConstants.FLOW_RIGHT:
                  this._imageDisplay.x = this._layoutRect.width - this._imageDisplay.width;
                  this._imageDisplay.y = this._layoutRect.height * 0.5;
                  break;
               case FlowConstants.FLOW_BOTTOM_LEFT:
                  this._imageDisplay.x = 0;
                  this._imageDisplay.y = this._layoutRect.height - this._imageDisplay.height;
                  break;
               case FlowConstants.FLOW_BOTTOM:
                  this._imageDisplay.x = this._layoutRect.width * 0.5;
                  this._imageDisplay.y = this._layoutRect.height - this._imageDisplay.height;
                  break;
               case FlowConstants.FLOW_BOTTOM_RIGHT:
                  this._imageDisplay.x = this._layoutRect.width - this._imageDisplay.width;
                  this._imageDisplay.y = this._layoutRect.height - this._imageDisplay.height;
            }
         }
      }
   }
}
