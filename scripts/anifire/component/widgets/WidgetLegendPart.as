package anifire.component.widgets
{
   import flash.display.Sprite;
   
   public class WidgetLegendPart extends WidgetPart
   {
       
      
      protected var _itemLayer:Sprite;
      
      protected var _basePart:WidgetBasePart;
      
      protected var _rangeNames:Vector.<String>;
      
      protected var _legendItems:Vector.<WidgetLegendItem>;
      
      public function WidgetLegendPart()
      {
         super();
         visible = false;
      }
      
      override protected function init() : void
      {
         super.init();
         _numRanges = -1;
         this._legendItems = new Vector.<WidgetLegendItem>();
         this._itemLayer = new Sprite();
         addChild(this._itemLayer);
      }
      
      public function get basePart() : WidgetBasePart
      {
         return this._basePart;
      }
      
      public function set basePart(param1:WidgetBasePart) : void
      {
         if(this._basePart != param1)
         {
            this._basePart = param1;
            _widgetMaker = this._basePart.widgetMaker;
         }
      }
      
      protected function createLegendItem() : WidgetLegendItem
      {
         var _loc1_:WidgetLegendItem = new WidgetLegendItem();
         return _loc1_;
      }
      
      public function get rangeNames() : Vector.<String>
      {
         return this._rangeNames;
      }
      
      public function set rangeNames(param1:Vector.<String>) : void
      {
         var _loc2_:int = 0;
         var _loc3_:WidgetLegendItem = null;
         this._rangeNames = param1;
         if(this._rangeNames)
         {
            _numRanges = this._rangeNames.length;
            _loc2_ = 0;
            while(_loc2_ < _numRanges)
            {
               if(_loc2_ < this._legendItems.length)
               {
                  _loc3_ = this._legendItems[_loc2_];
               }
               else
               {
                  _loc3_ = this.createLegendItem();
                  _loc3_.widgetMaker = _widgetMaker;
                  _loc3_.itemIndex = _loc2_;
                  this._itemLayer.addChild(_loc3_);
                  this._legendItems.push(_loc3_);
               }
               _loc3_.text = this._rangeNames[_loc2_];
               _loc2_++;
            }
            _loc2_ = this._legendItems.length - 1;
            while(_loc2_ >= _numRanges)
            {
               _loc3_ = this._legendItems.pop();
               this._itemLayer.removeChild(_loc3_);
               _loc2_--;
            }
         }
         _invalidateFlag = true;
      }
      
      public function updateLayout() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:WidgetLegendItem = null;
         if(this._basePart)
         {
            _loc1_ = widgetMaker.getLegendLayoutWidth();
            _loc2_ = this._basePart.contentBounds.height;
            updateBounds(this._basePart.bounds.right - _loc1_,this._basePart.contentBounds.top,_loc1_,_loc2_);
            _loc3_ = _bounds.top;
            _loc4_ = WidgetLegendItem.LEGEND_ITEM_HEIGHT;
            _loc5_ = 0;
            while(_loc5_ < _numRanges)
            {
               _loc6_ = this._legendItems[_loc5_];
               _loc6_.visible = _loc2_ > 0;
               _loc6_.updateBounds(_bounds.x,_loc3_,_bounds.width,_loc4_);
               if(_loc6_.visible)
               {
                  _loc6_.invalidate();
               }
               _loc3_ = _loc3_ + _loc4_;
               _loc2_ = _loc2_ - _loc4_;
               _loc5_++;
            }
         }
      }
      
      override public function validate() : void
      {
         if(_invalidateFlag)
         {
            this.draw();
            _invalidateFlag = false;
         }
         var _loc1_:int = 0;
         while(_loc1_ < _numRanges)
         {
            this._legendItems[_loc1_].validate();
            _loc1_++;
         }
      }
      
      override public function updateStyle() : void
      {
         super.updateStyle();
         var _loc1_:int = 0;
         while(_loc1_ < _numRanges)
         {
            this._legendItems[_loc1_].updateStyle();
            _loc1_++;
         }
      }
      
      override public function draw() : void
      {
         visible = _widgetMaker.displayLegend;
      }
      
      override public function set animationFactor(param1:Number) : void
      {
         super.animationFactor = param1;
         var _loc2_:int = 0;
         while(_loc2_ < _numRanges)
         {
            this._legendItems[_loc2_].animationFactor = _animationFactor;
            _loc2_++;
         }
      }
   }
}
