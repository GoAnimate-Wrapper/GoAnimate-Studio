package anifire.component.widgets
{
   import anifire.models.widget.WidgetPartModel;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class CinematicLineChartWidget extends CinematicChartWidget
   {
       
      
      protected var _minBarWidth:Number;
      
      protected var _barWidth:Number;
      
      protected var _barHeight:Number;
      
      protected var _barGap:Number;
      
      protected var _nodeLayer:Sprite;
      
      protected var _lineLayer:Sprite;
      
      public function CinematicLineChartWidget()
      {
         super();
      }
      
      public function get minBarWidth() : Number
      {
         return this._minBarWidth;
      }
      
      public function set minBarWidth(param1:Number) : void
      {
         this._minBarWidth = param1;
         _layoutInvalidateFlag = true;
      }
      
      public function get barWidth() : Number
      {
         return this._barWidth;
      }
      
      public function set barWidth(param1:Number) : void
      {
         this._barWidth = param1;
         _layoutInvalidateFlag = true;
      }
      
      public function get barHeight() : Number
      {
         return this._barHeight;
      }
      
      public function set barHeight(param1:Number) : void
      {
         this._barHeight = param1;
         _layoutInvalidateFlag = true;
      }
      
      public function get barGap() : Number
      {
         return this._barGap;
      }
      
      public function set barGap(param1:Number) : void
      {
         this._barGap = param1;
         _layoutInvalidateFlag = true;
      }
      
      public function get nodeLayer() : Sprite
      {
         return this._nodeLayer;
      }
      
      public function get lineLayer() : Sprite
      {
         return this._lineLayer;
      }
      
      override protected function init() : void
      {
         super.init();
         _bounds = new Rectangle(0,0,320,240);
         this._barWidth = 30;
         this._barGap = 0;
         _minWidth = 150;
         _minHeight = 120;
         _layoutInvalidateFlag = true;
      }
      
      override protected function resetProperties() : void
      {
         super.resetProperties();
         _properties["node"] = "none";
         _properties["lineWeight"] = 2;
         _properties["drawLineWeight"] = 3;
         _properties["overlapRatio"] = 0.5;
      }
      
      override protected function initBasePart() : void
      {
         super.initBasePart();
         this._lineLayer = new Sprite();
         addChild(this._lineLayer);
         this._nodeLayer = new Sprite();
         addChild(this._nodeLayer);
      }
      
      override protected function updateBasePartLayout() : void
      {
         super.updateBasePartLayout();
         this._barHeight = _basePart.contentBounds.height;
      }
      
      override protected function createPart(param1:WidgetPartModel) : WidgetPart
      {
         var _loc2_:WidgetPart = new CinematicLineChartPart();
         _loc2_.text = param1.labelText;
         _loc2_.values = param1.values.concat();
         return _loc2_;
      }
      
      override protected function updateLayout() : void
      {
         if(!_basePart)
         {
            return;
         }
         var _loc1_:Number = 10;
         var _loc2_:Number = _basePart.contentBounds.width;
         var _loc3_:Number = _loc2_ - _loc1_ * 2;
         var _loc4_:Number = _basePart.contentBounds.x + _loc1_;
         var _loc5_:Number = _loc3_ - (_dataPartCount * (this._barWidth + this._barGap) - this._barGap);
         var _loc6_:Number = this._barWidth;
         var _loc7_:Number = this._barGap;
         var _loc8_:Number = this._barWidth / (this._barWidth + this._barGap);
         var _loc9_:Number = 1 - _loc8_;
         var _loc10_:Number = _loc5_ / _dataPartCount;
         _loc6_ = this._barWidth + _loc10_ * _loc8_;
         _loc7_ = this._barGap + _loc10_ * _loc9_;
         if(_loc6_ < this._minBarWidth)
         {
            _loc6_ = this._minBarWidth;
            _loc5_ = _loc3_ - _loc6_ * _dataPartCount;
            _loc7_ = _loc5_ / (_dataPartCount - 1);
         }
         else
         {
            _loc4_ = _loc4_ + _loc10_ * _loc9_ * 0.5;
         }
         var _loc11_:Number = _loc4_;
         var _loc12_:int = _basePart.contentBounds.y;
         var _loc13_:int = 0;
         while(_loc13_ < _dataPartCount)
         {
            _dataParts[_loc13_].bounds = new Rectangle(_loc11_,_loc12_,_loc6_,this._barHeight);
            _loc11_ = _loc11_ + (_loc6_ + _loc7_);
            _loc13_++;
         }
         _basePart.draw();
      }
      
      override protected function postProcessContentBounds() : void
      {
      }
      
      override protected function get displayLabelPadding() : Boolean
      {
         return _displayDataLabel;
      }
      
      override public function setProperty(param1:String, param2:*) : void
      {
         super.setProperty(param1,param2);
         switch(param1)
         {
            case "node":
            case "dataLineWeight":
               invalidateDataParts();
               break;
            case "lineWeight":
               _basePart.invalidate();
         }
      }
   }
}
