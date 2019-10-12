package anifire.component.widgets
{
   import flash.geom.Rectangle;
   
   public class CalendarBasePart extends WidgetBasePart
   {
      
      public static const ANIMATION_PHASE_1:Number = 0.2;
      
      public static const ANIMATION_PHASE_2:Number = 0.4;
       
      
      protected var _topOffset:Number;
      
      protected var _lineWeight:Number;
      
      protected var _titleHeight:Number;
      
      protected var _drawStyle:String;
      
      protected var _mainColor:uint;
      
      protected var _subColor:uint;
      
      public function CalendarBasePart()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override public function draw() : void
      {
         var _loc1_:Number = NaN;
         graphics.clear();
         this._mainColor = _style.getColorByIndex(0);
         this._subColor = _style.getColorByIndex(1);
         switch(this._drawStyle)
         {
            case "normal":
            default:
               this.drawNormal();
               break;
            case "round":
               this.drawRound();
               break;
            case "ringnote":
               this.drawRingNote();
               break;
            case "simple":
               this.drawSimple();
         }
         if(_animationFactor < ANIMATION_PHASE_1)
         {
            _loc1_ = _animationFactor / ANIMATION_PHASE_1;
            scaleX = _loc1_ * 1.2;
            scaleY = _loc1_ * 1.2;
            _label.alpha = 0;
         }
         else if(_animationFactor < ANIMATION_PHASE_2)
         {
            _loc1_ = (_animationFactor - ANIMATION_PHASE_1) / (ANIMATION_PHASE_2 - ANIMATION_PHASE_1);
            scaleX = 1.2 - _loc1_ * 0.2;
            scaleY = 1.2 - _loc1_ * 0.2;
            _label.alpha = _loc1_;
         }
         else
         {
            scaleX = 1;
            scaleY = 1;
            _label.alpha = 1;
         }
      }
      
      protected function drawNormal() : void
      {
         graphics.beginFill(this._mainColor);
         graphics.drawRect(_bounds.x,_bounds.y,_bounds.width,this._titleHeight);
         graphics.endFill();
         graphics.beginFill(this._subColor);
         graphics.drawRect(_bounds.x,_bounds.y + this._titleHeight + this._lineWeight,_bounds.width,_bounds.height - this._titleHeight - this._lineWeight);
         graphics.endFill();
      }
      
      protected function drawRound() : void
      {
         var _loc1_:Number = _style.getNumericProperty("corner");
         graphics.beginFill(this._mainColor);
         graphics.drawRoundRect(_bounds.x,_bounds.y,_bounds.width,_bounds.height,_loc1_);
         graphics.endFill();
         graphics.beginFill(this._subColor);
         graphics.drawRoundRectComplex(_bounds.x + this._lineWeight,_contentBounds.y,_bounds.width - this._lineWeight * 2,_contentBounds.height - this._lineWeight,0,0,_loc1_ - this._lineWeight,_loc1_ - this._lineWeight);
         graphics.endFill();
      }
      
      protected function drawRingNote() : void
      {
         var _loc1_:Number = _bounds.width * 0.15;
         var _loc2_:Number = _bounds.width * 0.075;
         var _loc3_:Number = this._topOffset * 2 + this._lineWeight;
         graphics.beginFill(this._subColor);
         graphics.drawRect(_bounds.x,_bounds.y + this._topOffset,_bounds.width,_bounds.height - this._topOffset);
         graphics.drawRect(_bounds.x + this._lineWeight,_bounds.y + this._topOffset + this._lineWeight,_bounds.width - this._lineWeight * 2,this._titleHeight);
         graphics.drawRect(_bounds.x + this._lineWeight,_bounds.y + this._topOffset + this._titleHeight + this._lineWeight * 2,_bounds.width - this._lineWeight * 2,_contentBounds.height - this._lineWeight * 2);
         graphics.drawRect(_bounds.x + _loc1_,_bounds.y + this._topOffset,_loc1_,this._lineWeight);
         graphics.drawRect(_bounds.x + _bounds.width - _loc1_ * 2,_bounds.y + this._topOffset,_loc1_,this._lineWeight);
         graphics.endFill();
         graphics.beginFill(this._mainColor);
         graphics.drawRect(_bounds.x + _loc1_ + (_loc1_ - _loc2_) * 0.5,_bounds.y,_loc2_,_loc3_);
         graphics.endFill();
         graphics.beginFill(this._mainColor);
         graphics.drawRect(_bounds.x + _bounds.width - (_loc1_ + (_loc1_ - _loc2_) * 0.5),_bounds.y,-_loc2_,_loc3_);
         graphics.endFill();
      }
      
      protected function drawSimple() : void
      {
         graphics.beginFill(this._mainColor);
         graphics.drawRect(_bounds.x,_bounds.y,_bounds.width,_bounds.height);
         graphics.endFill();
         graphics.beginFill(this._subColor);
         graphics.drawRect(_contentBounds.x,_contentBounds.y,_contentBounds.width,_contentBounds.height);
         graphics.endFill();
      }
      
      public function updateDrawStyle(param1:String) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         this._drawStyle = param1;
         this._lineWeight = _style.getNumericProperty("lineWeight");
         if(this._drawStyle == "simple")
         {
            _contentBounds = new Rectangle(_bounds.x + _bounds.width * 0.5 + this._lineWeight,_bounds.y + this._lineWeight,_bounds.width * 0.5 - this._lineWeight * 2,_bounds.height - this._lineWeight * 2);
         }
         else
         {
            this._topOffset = 0;
            if(this._drawStyle == "ringnote")
            {
               this._topOffset = _bounds.height * 0.05;
            }
            _loc2_ = _bounds.height;
            if(this._drawStyle == "round")
            {
               _loc2_ = _loc2_ + this._lineWeight;
            }
            this._titleHeight = (_loc2_ - this._topOffset - this._lineWeight) * 0.25;
            _loc3_ = this._topOffset + this._lineWeight + this._titleHeight;
            _contentBounds = new Rectangle(_bounds.x,_bounds.y + _loc3_,_bounds.width,_bounds.height - _loc3_);
         }
         this.updateLabelFormat();
      }
      
      override protected function updateLabelFormat() : void
      {
         super.updateLabelFormat();
         if(this._drawStyle == "ringnote")
         {
            _label.color = _style.dataColor;
         }
      }
      
      override protected function updateLabelLayout() : void
      {
         if(this._drawStyle == "simple")
         {
            _label.enableAutoSize(_contentBounds.width,contentBounds.height,2);
            _label.x = _bounds.x + (_bounds.width * 0.5 - _label.width) * 0.5;
            _label.y = _bounds.y + (_bounds.height - _label.height) * 0.5;
         }
         else
         {
            _label.enableAutoSize(_contentBounds.width - 10,this._titleHeight - 10);
            switch(_style.titlePosition)
            {
               case "left":
                  _label.x = _contentBounds.x + 5;
                  break;
               default:
                  _label.x = _contentBounds.x + (_contentBounds.width - _label.width) * 0.5;
            }
            _label.y = _bounds.y + (_bounds.height - _contentBounds.height - _label.height) * 0.5 + this._topOffset;
         }
      }
   }
}
