package anifire.studio.assets.views
{
   import anifire.studio.core.Console;
   import anifire.studio.core.FlowFrame;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.FlowFrameEvent;
   import anifire.studio.skins.FlowFrameAddImageButtonSkin;
   import flash.events.MouseEvent;
   import mx.events.FlexEvent;
   import spark.components.Button;
   
   public class FlowFrameEditor extends AssetEditor
   {
      
      private static const MIN_SIZE_TO_SHOW_BUTTON:Number = 80;
      
      private static const BUTTON_SIZE:Number = 56;
      
      private static const TOOLTIP_WIDTH:Number = 100;
      
      private static const TOOLTIP_HEIGHT:Number = 50;
      
      private static const TOOLTIP_OFFSET_Y:Number = -40;
       
      
      private var _button:Button;
      
      private var _toolTip:FlowFrameAddImageToolTip;
      
      private var _drawingScale:Number = 1;
      
      public function FlowFrameEditor(param1:AssetView)
      {
         super(param1);
         this.addButton();
         this.addToolTip();
         this.updateDoubleClickAbility();
         if(this.asset)
         {
            this.asset.addEventListener(AssetEvent.ASSET_MOVED,this.asset_assetMovedHandler);
            this.asset.addEventListener(AssetEvent.ASSET_RESIZED,this.asset_assetResizedHandler);
            this.asset.addEventListener(AssetEvent.STATE_CHANGE,this.asset_stateChangeHandler);
            this.asset.addEventListener(FlowFrameEvent.FRAME_RESIZE,this.asset_frameResizeHandler);
            this.asset.addEventListener(FlowFrameEvent.IMAGE_CHANGE,this.asset_assetImageChangeHandler);
         }
      }
      
      private function doubleClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:Console = Console.getConsole();
         _loc2_.openFlowFrameImageEditor(this.asset as FlowFrame);
      }
      
      override public function destroy(param1:String = "rip") : void
      {
         if(this.asset)
         {
            this.asset.removeEventListener(AssetEvent.ASSET_MOVED,this.asset_assetMovedHandler);
            this.asset.removeEventListener(AssetEvent.ASSET_RESIZED,this.asset_assetResizedHandler);
            this.asset.removeEventListener(AssetEvent.STATE_CHANGE,this.asset_stateChangeHandler);
            this.asset.removeEventListener(FlowFrameEvent.FRAME_RESIZE,this.asset_frameResizeHandler);
            this.asset.removeEventListener(FlowFrameEvent.IMAGE_CHANGE,this.asset_assetImageChangeHandler);
         }
         this._button = null;
         this._toolTip = null;
         super.destroy(param1);
      }
      
      private function addToolTip() : void
      {
         this._toolTip = new FlowFrameAddImageToolTip();
         this._toolTip.width = TOOLTIP_WIDTH;
         this._toolTip.height = TOOLTIP_HEIGHT;
         this._toolTip.visible = false;
         this.addChild(this._toolTip);
      }
      
      private function addButton() : void
      {
         this._button = new Button();
         this._button.buttonMode = true;
         this._button.setStyle("skinClass",FlowFrameAddImageButtonSkin);
         this._button.addEventListener(FlexEvent.CREATION_COMPLETE,this.button_CreationCompleteHandler);
         this._button.addEventListener(MouseEvent.MOUSE_DOWN,this.button_MouseDownHandler);
         this._button.width = BUTTON_SIZE;
         this._button.height = BUTTON_SIZE;
         this.addChild(this._button);
      }
      
      private function button_MouseDownHandler(param1:MouseEvent) : void
      {
         var _loc2_:FlowFrame = this.asset as FlowFrame;
         _loc2_.isAddButtonClicked = true;
         super.onAssetViewMouseDown(param1);
      }
      
      override protected function onAssetViewMouseDown(param1:MouseEvent) : void
      {
         var _loc2_:FlowFrame = this.asset as FlowFrame;
         _loc2_.isAddButtonClicked = false;
         super.onAssetViewMouseDown(param1);
      }
      
      private function button_CreationCompleteHandler(param1:FlexEvent) : void
      {
         this.updateButtonPosition();
         this.updateButtonVisibility();
      }
      
      private function asset_assetMovedHandler(param1:AssetEvent) : void
      {
         this.updateButtonPosition();
      }
      
      private function updateButtonPosition() : void
      {
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:Number = _loc1_.gridLeft - _loc1_.innerOffsetLeft - (_loc1_.gridRight - _loc1_.innerOffsetRight);
         var _loc3_:Number = _loc1_.gridTop - _loc1_.innerOffsetTop - (_loc1_.gridBottom - _loc1_.innerOffsetBottom);
         if(this._button)
         {
            this._button.x = _loc1_.x - (this._button.width - _loc2_) * this._drawingScale / 2;
            this._button.y = _loc1_.y - (this._button.height - _loc3_) * this._drawingScale / 2;
         }
         if(this._toolTip)
         {
            this._toolTip.x = _loc1_.x - (this._toolTip.width - _loc2_) * this._drawingScale / 2;
            this._toolTip.y = _loc1_.y - (this._toolTip.height - _loc3_) * this._drawingScale / 2 + TOOLTIP_OFFSET_Y * this._drawingScale;
         }
      }
      
      private function asset_assetResizedHandler(param1:AssetEvent) : void
      {
         this.updateButtonVisibility();
      }
      
      private function asset_assetImageChangeHandler(param1:FlowFrameEvent) : void
      {
         this.updateButtonVisibility();
         this.updateDoubleClickAbility();
      }
      
      private function asset_frameResizeHandler(param1:FlowFrameEvent) : void
      {
         this.updateButtonVisibility();
         this.updateButtonPosition();
      }
      
      private function asset_stateChangeHandler(param1:AssetEvent) : void
      {
         this.updateButtonPosition();
      }
      
      private function updateDoubleClickAbility() : void
      {
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_ || _loc1_.isShadow)
         {
            return;
         }
         if(_loc1_.innerImageId)
         {
            mouseChildren = false;
            this.doubleClickEnabled = true;
            addEventListener(MouseEvent.DOUBLE_CLICK,this.doubleClickHandler);
         }
         else
         {
            mouseChildren = true;
            this.doubleClickEnabled = false;
            removeEventListener(MouseEvent.DOUBLE_CLICK,this.doubleClickHandler);
         }
      }
      
      private function updateButtonVisibility() : void
      {
         var _loc1_:FlowFrame = this.asset as FlowFrame;
         if(!_loc1_)
         {
            return;
         }
         if(this._button)
         {
            this._button.visible = !_loc1_.innerImageId && !_loc1_.innerImageHasBeenChanged && _loc1_.scaleX * _loc1_.width / this.drawingScale > MIN_SIZE_TO_SHOW_BUTTON && _loc1_.scaleY * _loc1_.height / this.drawingScale > MIN_SIZE_TO_SHOW_BUTTON;
            if(this._toolTip)
            {
               this._toolTip.visible = this._button.visible;
            }
         }
      }
      
      public function get drawingScale() : Number
      {
         return this._drawingScale;
      }
      
      public function set drawingScale(param1:Number) : void
      {
         if(this._drawingScale == param1 || param1 <= 0)
         {
            return;
         }
         this._drawingScale = param1;
         if(this._button)
         {
            this._button.scaleX = param1;
            this._button.scaleY = param1;
         }
         if(this._toolTip)
         {
            this._toolTip.scaleX = param1;
            this._toolTip.scaleY = param1;
         }
         this.updateButtonPosition();
         this.updateButtonVisibility();
      }
   }
}
