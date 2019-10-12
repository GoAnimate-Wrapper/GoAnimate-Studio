package anifire.component.widgets
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class IconWidgetPart extends WidgetPart
   {
      
      public static const FILL_DIRECTION_LEFT_TO_RIGHT:int = 0;
      
      public static const FILL_DIRECTION_BOTTOM_TO_TOP:int = 1;
      
      public static const FILL_DIRECTION_RIGHT_TO_LEFT:int = 2;
      
      public static const FILL_DIRECTION_TOP_TO_BOTTOM:int = 3;
      
      public static const FILL_DIRECTION_TO_TOP_RIGHT:int = 4;
      
      public static const FILL_DIRECTION_TO_BOTTOM_RIGHT:int = 5;
      
      public static const FILL_DIRECTION_TO_BOTTOM_LEFT:int = 6;
      
      public static const FILL_DIRECTION_TO_TOP_LEFT:int = 7;
       
      
      protected var _gridLayer:Sprite;
      
      protected var _maskLayer:Sprite;
      
      protected var _fillDirection:int;
      
      protected var _gridWidth:Number;
      
      protected var _gridHeight:Number;
      
      protected var _gridGap:Number;
      
      protected var _row:int;
      
      protected var _column:int;
      
      protected var _loader:Loader;
      
      protected var _iconRect:Rectangle;
      
      protected var _iconColor:uint;
      
      protected var _iconColorTransform:ColorTransform;
      
      protected var _colorTransform:ColorTransform;
      
      protected var _identityColorTransform:ColorTransform;
      
      protected var _maskRatio:Number;
      
      public function IconWidgetPart()
      {
         super();
      }
      
      public function get fillDirection() : int
      {
         return this._fillDirection;
      }
      
      public function set fillDirection(param1:int) : void
      {
         if(this._fillDirection != param1)
         {
            this._fillDirection = param1;
            _invalidateFlag = true;
         }
      }
      
      public function get gridWidth() : Number
      {
         return this._gridWidth;
      }
      
      public function set gridWidth(param1:Number) : void
      {
         if(this._gridWidth != param1)
         {
            this._gridWidth = param1;
            this.updateGridPosition();
         }
      }
      
      public function get gridHeight() : Number
      {
         return this._gridHeight;
      }
      
      public function set gridHeight(param1:Number) : void
      {
         if(this._gridHeight != param1)
         {
            this._gridHeight = param1;
            this.updateGridPosition();
         }
      }
      
      public function get gridGap() : Number
      {
         return this._gridGap;
      }
      
      public function set gridGap(param1:Number) : void
      {
         if(this._gridGap != param1)
         {
            this._gridGap = param1;
            this.updateGridPosition();
         }
      }
      
      public function get row() : int
      {
         return this._row;
      }
      
      public function set row(param1:int) : void
      {
         if(this._row != param1)
         {
            this._row = param1;
         }
         this.updateGridPosition();
      }
      
      public function get column() : int
      {
         return this._column;
      }
      
      public function set column(param1:int) : void
      {
         if(this._column != param1)
         {
            this._column = param1;
         }
         this.updateGridPosition();
      }
      
      override protected function init() : void
      {
         super.init();
         this._row = 0;
         this._column = 0;
         this._iconColor = uint.MAX_VALUE;
         this._iconColorTransform = new ColorTransform();
         this._colorTransform = new ColorTransform();
         this._identityColorTransform = new ColorTransform();
         this._gridLayer = new Sprite();
         addChild(this._gridLayer);
         this._maskLayer = new Sprite();
         this._maskRatio = 0;
      }
      
      public function removeMask() : void
      {
         if(this._gridLayer.contains(this._maskLayer))
         {
            this._gridLayer.removeChild(this._maskLayer);
         }
         mask = null;
      }
      
      public function applyMask(param1:Number) : void
      {
         this._maskRatio = param1;
         if(!this._gridLayer.contains(this._maskLayer))
         {
            this._gridLayer.addChild(this._maskLayer);
         }
         this._gridLayer.mask = this._maskLayer;
         _invalidateFlag = true;
      }
      
      public function removeColorTransform() : void
      {
         visible = true;
         transform.colorTransform = this._identityColorTransform;
      }
      
      public function applyColorTransform(param1:uint) : void
      {
         if(param1 == uint.MAX_VALUE)
         {
            visible = false;
         }
         else
         {
            visible = true;
            this._colorTransform.color = param1;
            transform.colorTransform = this._colorTransform;
         }
      }
      
      public function get iconColor() : uint
      {
         return this._iconColor;
      }
      
      public function set iconColor(param1:uint) : void
      {
         if(this._iconColor != param1)
         {
            this._iconColor = param1;
            if(this._iconColor == uint.MAX_VALUE)
            {
               this._iconColorTransform.color = 0;
               this._iconColorTransform.redMultiplier = 1;
               this._iconColorTransform.greenMultiplier = 1;
               this._iconColorTransform.blueMultiplier = 1;
            }
            else
            {
               this._iconColorTransform.color = this._iconColor;
            }
            if(this._loader && this._loader.content)
            {
               this.applyIconColorTransform(this._loader.content);
            }
         }
      }
      
      protected function applyIconColorTransform(param1:DisplayObject) : void
      {
         var _loc4_:int = 0;
         var _loc2_:String = param1.name;
         if(_loc2_.indexOf("theColor_") > -1)
         {
            param1.transform.colorTransform = this._iconColorTransform;
         }
         var _loc3_:DisplayObjectContainer = param1 as DisplayObjectContainer;
         if(_loc3_)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_.numChildren)
            {
               this.applyIconColorTransform(_loc3_.getChildAt(_loc4_));
               _loc4_++;
            }
         }
      }
      
      public function loadIcon(param1:ByteArray) : void
      {
         this.cancelLoading();
         this.removeIcon();
         if(param1)
         {
            this._loader = new Loader();
            this._gridLayer.addChild(this._loader);
            this._loader.contentLoaderInfo.addEventListener(Event.INIT,this.onIconLoaderInit);
            this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onIconLoaderError);
            this._loader.loadBytes(param1);
         }
      }
      
      protected function cancelLoading() : void
      {
         if(this._loader)
         {
            this._loader.contentLoaderInfo.removeEventListener(Event.INIT,this.onIconLoaderInit);
            this._loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.onIconLoaderError);
         }
      }
      
      protected function removeIcon() : void
      {
         if(this._loader)
         {
            this._gridLayer.removeChild(this._loader);
            this._loader = null;
         }
      }
      
      protected function onIconLoaderInit(param1:Event) : void
      {
         this.cancelLoading();
         this.updateIconPosition();
         this.applyIconColorTransform(this._loader.content);
         this.updateMask();
      }
      
      protected function onIconLoaderError(param1:Event) : void
      {
         this.cancelLoading();
         this.removeIcon();
      }
      
      protected function updateGridPosition() : void
      {
         this._gridLayer.x = _bounds.x + this._column * (this._gridGap + this._gridWidth);
         this._gridLayer.y = _bounds.y + this._row * (this._gridGap + this._gridHeight);
         this.updateIconPosition();
      }
      
      protected function updateIconPosition() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this._loader && this._loader.content)
         {
            _loc1_ = this._gridWidth / this._loader.content.width;
            _loc2_ = this._gridHeight / this._loader.content.height;
            _loc3_ = Math.min(_loc1_,_loc2_);
            this._loader.content.scaleX = this._loader.content.scaleX * _loc3_;
            this._loader.content.scaleY = this._loader.content.scaleY * _loc3_;
            this._iconRect = this._loader.getBounds(this._loader);
            this._maskLayer.x = (this._gridWidth - this._iconRect.width) * 0.5;
            this._maskLayer.y = (this._gridHeight - this._iconRect.height) * 0.5;
            this._loader.x = this._maskLayer.x - this._iconRect.x;
            this._loader.y = this._maskLayer.y - this._iconRect.y;
         }
      }
      
      protected function updateMask() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         if(this._iconRect && contains(this._maskLayer))
         {
            this._maskLayer.graphics.clear();
            switch(this._fillDirection)
            {
               case FILL_DIRECTION_LEFT_TO_RIGHT:
                  _loc1_ = 0;
                  _loc2_ = 0;
                  _loc3_ = this._iconRect.width * this._maskRatio;
                  _loc4_ = this._iconRect.height;
                  break;
               case FILL_DIRECTION_RIGHT_TO_LEFT:
                  _loc3_ = this._iconRect.width * this._maskRatio;
                  _loc1_ = this._iconRect.width - _loc3_;
                  _loc2_ = 0;
                  _loc4_ = this._iconRect.height;
                  break;
               case FILL_DIRECTION_BOTTOM_TO_TOP:
                  _loc1_ = 0;
                  _loc4_ = this._iconRect.height * this._maskRatio;
                  _loc2_ = this._iconRect.height - _loc4_;
                  _loc3_ = this._iconRect.width;
                  break;
               case FILL_DIRECTION_TOP_TO_BOTTOM:
                  _loc1_ = 0;
                  _loc2_ = 0;
                  _loc4_ = this._iconRect.height * this._maskRatio;
                  _loc3_ = this._iconRect.width;
                  break;
               case FILL_DIRECTION_TO_TOP_RIGHT:
                  _loc5_ = true;
                  _loc1_ = 0;
                  _loc2_ = this._iconRect.height;
                  _loc3_ = this._iconRect.width;
                  _loc4_ = -this._iconRect.height;
                  break;
               case FILL_DIRECTION_TO_TOP_LEFT:
                  _loc5_ = true;
                  _loc1_ = this._iconRect.width;
                  _loc2_ = this._iconRect.height;
                  _loc3_ = -this._iconRect.width;
                  _loc4_ = -this._iconRect.height;
                  break;
               case FILL_DIRECTION_TO_BOTTOM_RIGHT:
                  _loc5_ = true;
                  _loc1_ = 0;
                  _loc2_ = 0;
                  _loc3_ = this._iconRect.width;
                  _loc4_ = this._iconRect.height;
                  break;
               case FILL_DIRECTION_TO_BOTTOM_LEFT:
                  _loc5_ = true;
                  _loc1_ = this._iconRect.width;
                  _loc2_ = 0;
                  _loc3_ = -this._iconRect.width;
                  _loc4_ = this._iconRect.height;
            }
            this._maskLayer.graphics.beginFill(0);
            if(_loc5_)
            {
               _loc3_ = _loc3_ * this._maskRatio * 2;
               _loc4_ = _loc4_ * this._maskRatio * 2;
               this._maskLayer.graphics.moveTo(_loc1_,_loc2_);
               this._maskLayer.graphics.lineTo(_loc1_ + _loc3_,_loc2_);
               this._maskLayer.graphics.lineTo(_loc1_,_loc2_ + _loc4_);
               this._maskLayer.graphics.lineTo(_loc1_,_loc2_);
            }
            else
            {
               this._maskLayer.graphics.drawRect(_loc1_,_loc2_,_loc3_,_loc4_);
            }
            this._maskLayer.graphics.endFill();
         }
      }
      
      override public function draw() : void
      {
         this.updateMask();
      }
   }
}
