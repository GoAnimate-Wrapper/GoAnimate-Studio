package anifire.studio.assets.control
{
   import anifire.constant.LicenseConstants;
   import anifire.studio.assets.controllers.CameraController;
   import anifire.studio.core.Console;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.interfaces.IAssetControl;
   import anifire.studio.interfaces.IResizable;
   import flash.events.IEventDispatcher;
   import flash.geom.Rectangle;
   import mx.core.UIComponent;
   
   public class AssetControl extends UIComponent implements IAssetControl
   {
      
      public static const BORDER_WIDTH:Number = 3;
      
      public static const BORDER_ALPHA:Number = 1;
      
      public static const BORDER_COLOR:uint = 16290304;
      
      public static const BORDER_COLOR_LIGHT:uint = 11979662;
      
      public static const BORDER_COLOR_DARK:uint = 5405190;
      
      public static const MULTI_SELECT_BORDER_COLOR:uint = 16492449;
       
      
      private var _borderColor:uint = 5405190;
      
      private var _asset:IEventDispatcher;
      
      private var _border:UIComponent;
      
      private var _drawingScale:Number = 1;
      
      private var _undoableAction:Boolean;
      
      public function AssetControl(param1:IEventDispatcher)
      {
         super();
         this._border = new UIComponent();
         this.addChild(this._border);
         this.asset = param1;
      }
      
      public function get borderWidth() : Number
      {
         return this._drawingScale * BORDER_WIDTH;
      }
      
      public function set drawingScale(param1:Number) : void
      {
         if(param1 > 0)
         {
            this._drawingScale = param1;
            this.redraw();
         }
      }
      
      public function get drawingScale() : Number
      {
         return this._drawingScale;
      }
      
      public function set asset(param1:IEventDispatcher) : void
      {
         this.removeAssetEventListeners(this._asset);
         this._asset = param1;
         this.redraw();
         this.addAssetEventListeners(param1);
      }
      
      public function get asset() : IEventDispatcher
      {
         if(this._asset == null)
         {
            throw new Error("This object has been destroyed, but this is still being referred and used somewhere else, find it out!!!");
         }
         return this._asset;
      }
      
      private function addAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.addEventListener(AssetEvent.ASSET_RESIZED,this.onAssetResize);
         }
      }
      
      private function removeAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(AssetEvent.ASSET_RESIZED,this.onAssetResize);
         }
      }
      
      public function get border() : UIComponent
      {
         return this._border;
      }
      
      public function set borderColor(param1:uint) : void
      {
         this._borderColor = param1;
         this.redraw();
      }
      
      private function redraw() : void
      {
         var _loc1_:Rectangle = null;
         var _loc2_:Number = NaN;
         if(this.asset is IResizable)
         {
            this._border.graphics.clear();
            this._border.graphics.lineStyle(this.borderWidth,BORDER_COLOR_LIGHT,BORDER_ALPHA);
            _loc1_ = new Rectangle();
            if(this.asset is CameraController)
            {
               if(Console.getConsole().metaData.mver > 3)
               {
                  this._border.alpha = 0;
               }
               _loc2_ = LicenseConstants.getScreenRatio();
               _loc1_.width = IResizable(this.asset).width + this.borderWidth;
               _loc1_.height = IResizable(this.asset).width / _loc2_ + this.borderWidth;
               _loc1_.x = -IResizable(this.asset).width / 2 - this.borderWidth / 2;
               _loc1_.y = -(IResizable(this.asset).width / _loc2_) / 2 - this.borderWidth / 2;
            }
            else
            {
               _loc1_.x = -IResizable(this.asset).width / 2 - this.borderWidth / 2;
               _loc1_.y = -IResizable(this.asset).height / 2 - this.borderWidth / 2;
               _loc1_.width = IResizable(this.asset).width + this.borderWidth;
               _loc1_.height = IResizable(this.asset).height + this.borderWidth;
            }
            this._border.graphics.drawRect(_loc1_.x,_loc1_.y,_loc1_.width,_loc1_.height);
            this._border.graphics.lineStyle(this.borderWidth / 3,this._borderColor,BORDER_ALPHA);
            this._border.graphics.drawRect(_loc1_.x,_loc1_.y,_loc1_.width,_loc1_.height);
            this._border.graphics.endFill();
         }
      }
      
      private function onAssetResize(param1:AssetEvent) : void
      {
         this.redraw();
      }
      
      public function destroy(param1:String = "rip") : void
      {
         this.removeAssetEventListeners(this.asset);
         this.removeChild(this._border);
         this._border = null;
         this._asset = null;
      }
      
      public function set showReferencePoint(param1:Boolean) : void
      {
      }
      
      public function get undoableAction() : Boolean
      {
         return this._undoableAction;
      }
      
      public function set undoableAction(param1:Boolean) : void
      {
         this._undoableAction = param1;
      }
   }
}
