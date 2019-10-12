package anifire.component.widgets
{
   import flash.display.Graphics;
   import flash.display.Sprite;
   
   public class CinematicLegendPart extends WidgetLegendPart
   {
      
      public static const ITEM_SLIDE_IN_RATIO:Number = 0.15;
      
      public static const ITEM_SLIDE_OUT_DELAY:Number = 0.05;
      
      public static const ITEM_SLIDE_OUT_RATIO:Number = 0.2;
       
      
      protected var _rangeIndex:int;
      
      protected var _maskLayer:Sprite;
      
      protected var _baseInvalidateFlag:Boolean;
      
      protected var _halfWidth:Number;
      
      protected var _centerX:Number;
      
      public function CinematicLegendPart()
      {
         super();
      }
      
      public function get rangeIndex() : int
      {
         return this._rangeIndex;
      }
      
      public function set rangeIndex(param1:int) : void
      {
         if(this._rangeIndex != param1)
         {
            this._rangeIndex = param1;
            _invalidateFlag = true;
         }
      }
      
      override protected function init() : void
      {
         super.init();
         this._maskLayer = new Sprite();
         addChild(this._maskLayer);
         _itemLayer.mask = this._maskLayer;
         this._baseInvalidateFlag = true;
      }
      
      override protected function createLegendItem() : WidgetLegendItem
      {
         return new CinematicLegendItem();
      }
      
      override public function updateLayout() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:WidgetLegendItem = null;
         if(_basePart)
         {
            _loc1_ = _basePart.bounds.width - _widgetMaker.innerPaddingLeft - _widgetMaker.innerPaddingRight;
            _loc2_ = _widgetMaker.getLegendLayoutHeight();
            updateBounds(_basePart.bounds.left + _widgetMaker.innerPaddingLeft,_basePart.contentBounds.top - _loc2_ - _widgetMaker.innerPaddingTop,_loc1_,_loc2_);
            this._halfWidth = _bounds.width * 0.5;
            this._centerX = _bounds.x + this._halfWidth;
            _loc3_ = 0;
            while(_loc3_ < _numRanges)
            {
               _loc4_ = _legendItems[_loc3_];
               _loc4_.visible = _loc3_ == 0;
               _loc4_.updateBounds(_bounds.x,_bounds.y,_bounds.width,_bounds.height);
               _loc4_.y = _bounds.top;
               _loc4_.invalidate();
               _loc3_++;
            }
            this._baseInvalidateFlag = true;
         }
      }
      
      protected function drawBase() : void
      {
         var _loc1_:Number = WidgetConstants.CINEMATIC_LEGEND_LINE_WEIGHT;
         var _loc2_:Graphics = graphics;
         var _loc3_:Number = _bounds.top + CinematicLegendItem.LEGEND_LINE_OFFSET;
         _loc2_.clear();
         _loc2_.moveTo(_bounds.x,_loc3_);
         _loc2_.lineStyle(_loc1_,_style.lineColor,1,false,"normal","none");
         _loc2_.lineTo(_bounds.right,_loc3_);
         _loc2_ = this._maskLayer.graphics;
         _loc2_.clear();
         _loc2_.beginFill(16711680,0.1);
         _loc2_.drawRect(_bounds.x,_bounds.y,_bounds.width,_bounds.height);
         _loc2_.endFill();
         this._baseInvalidateFlag = false;
      }
      
      override public function draw() : void
      {
         var _loc1_:CinematicLegendItem = null;
         var _loc2_:Number = NaN;
         visible = _widgetMaker.displayLegend && (this._rangeIndex > 0 || _animationFactor > 0);
         var _loc3_:int = 0;
         while(_loc3_ < _numRanges)
         {
            _loc1_ = _legendItems[_loc3_] as CinematicLegendItem;
            if(_loc3_ == this._rangeIndex - 1)
            {
               _loc1_.visible = true;
               _loc2_ = (_animationFactor - ITEM_SLIDE_OUT_DELAY) / ITEM_SLIDE_OUT_RATIO;
               if(_loc2_ > 1)
               {
                  _loc2_ = 1;
               }
               else if(_loc2_ < 0)
               {
                  _loc2_ = 0;
               }
               _loc1_.x = bounds.x + (1 - _widgetMaker.easeOutQuad(_loc2_)) * (this._halfWidth + _loc1_.halfWidth) - _loc1_.halfWidth;
            }
            else if(_loc3_ == this._rangeIndex)
            {
               _legendItems[_loc3_].visible = true;
               _loc2_ = _animationFactor / ITEM_SLIDE_IN_RATIO;
               if(_loc2_ > 1)
               {
                  _loc2_ = 1;
               }
               _loc1_.x = this._centerX + (1 - _widgetMaker.easeOutQuad(_loc2_)) * (this._halfWidth + _loc1_.halfWidth);
            }
            else
            {
               _legendItems[_loc3_].visible = false;
            }
            _loc3_++;
         }
         if(this._baseInvalidateFlag)
         {
            this.drawBase();
         }
      }
   }
}
