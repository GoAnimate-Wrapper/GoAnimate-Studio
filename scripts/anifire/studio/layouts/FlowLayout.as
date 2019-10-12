package anifire.studio.layouts
{
   import flash.geom.Point;
   import mx.core.ILayoutElement;
   import spark.components.supportClasses.GroupBase;
   import spark.layouts.VerticalAlign;
   import spark.layouts.supportClasses.LayoutBase;
   
   public class FlowLayout extends LayoutBase
   {
       
      
      private var lastWidth:Number = -1;
      
      private var _horizontalGap:Number = 6;
      
      private var _verticalGap:Number = 6;
      
      private var _verticalAlign:String = "top";
      
      private var _paddingLeft:Number = 0;
      
      private var _paddingRight:Number = 0;
      
      private var _paddingTop:Number = 0;
      
      private var _paddingBottom:Number = 0;
      
      public function FlowLayout()
      {
         super();
      }
      
      public function get horizontalGap() : Number
      {
         return this._horizontalGap;
      }
      
      public function set horizontalGap(param1:Number) : void
      {
         if(param1 == this._horizontalGap)
         {
            return;
         }
         this._horizontalGap = param1;
         this.invalidateTargetSizeAndDisplayList();
      }
      
      public function get verticalGap() : Number
      {
         return this._verticalGap;
      }
      
      public function set verticalGap(param1:Number) : void
      {
         if(param1 == this._verticalGap)
         {
            return;
         }
         this._verticalGap = param1;
         this.invalidateTargetSizeAndDisplayList();
      }
      
      public function get verticalAlign() : String
      {
         return this._verticalAlign;
      }
      
      public function set verticalAlign(param1:String) : void
      {
         if(this._verticalAlign == param1)
         {
            return;
         }
         this._verticalAlign = param1;
         this.invalidateTargetSizeAndDisplayList();
      }
      
      public function get paddingLeft() : Number
      {
         return this._paddingLeft;
      }
      
      public function set paddingLeft(param1:Number) : void
      {
         if(this._paddingLeft == param1)
         {
            return;
         }
         this._paddingLeft = param1;
         this.invalidateTargetSizeAndDisplayList();
      }
      
      public function get paddingRight() : Number
      {
         return this._paddingRight;
      }
      
      public function set paddingRight(param1:Number) : void
      {
         if(this._paddingRight == param1)
         {
            return;
         }
         this._paddingRight = param1;
         this.invalidateTargetSizeAndDisplayList();
      }
      
      public function get paddingTop() : Number
      {
         return this._paddingTop;
      }
      
      public function set paddingTop(param1:Number) : void
      {
         if(this._paddingTop == param1)
         {
            return;
         }
         this._paddingTop = param1;
         this.invalidateTargetSizeAndDisplayList();
      }
      
      public function get paddingBottom() : Number
      {
         return this._paddingBottom;
      }
      
      public function set paddingBottom(param1:Number) : void
      {
         if(this._paddingBottom == param1)
         {
            return;
         }
         this._paddingBottom = param1;
         this.invalidateTargetSizeAndDisplayList();
      }
      
      override public function measure() : void
      {
         var _loc7_:ILayoutElement = null;
         var _loc8_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:int = 0;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         if(this.lastWidth == -1)
         {
            return;
         }
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:GroupBase = target;
         var _loc6_:int = _loc5_.numElements;
         var _loc9_:Number = _loc5_.explicitWidth;
         if(isNaN(_loc9_) && this.lastWidth != -1)
         {
            _loc9_ = this.lastWidth;
         }
         if(isNaN(_loc9_))
         {
            _loc8_ = 0;
            while(_loc8_ < _loc6_)
            {
               _loc7_ = _loc5_.getElementAt(_loc8_);
               if(!_loc7_ || !_loc7_.includeInLayout)
               {
                  _loc8_++;
                  continue;
               }
               _loc1_ = Math.ceil(_loc7_.getPreferredBoundsWidth());
               _loc3_ = Math.ceil(_loc7_.getPreferredBoundsHeight());
               break;
            }
            _loc2_ = _loc1_;
            _loc4_ = _loc3_;
         }
         else
         {
            _loc10_ = 0;
            _loc11_ = 0;
            _loc12_ = 1;
            _loc8_ = 0;
            while(_loc8_ < _loc6_)
            {
               _loc7_ = _loc5_.getElementAt(_loc8_);
               if(!(!_loc7_ || !_loc7_.includeInLayout))
               {
                  _loc13_ = _loc9_ - this._paddingLeft - this._paddingRight;
                  _loc14_ = Math.ceil(_loc7_.getPreferredBoundsWidth());
                  if(_loc10_ == 0 || _loc10_ + this._horizontalGap + _loc14_ <= _loc13_)
                  {
                     _loc10_ = _loc10_ + (_loc14_ + (_loc10_ == 0?0:this._horizontalGap));
                     _loc11_ = Math.max(_loc11_,Math.ceil(_loc7_.getPreferredBoundsHeight()));
                  }
                  else
                  {
                     _loc3_ = _loc3_ + _loc11_;
                     _loc12_++;
                     _loc10_ = _loc14_;
                     _loc11_ = Math.ceil(_loc7_.getPreferredBoundsHeight());
                  }
               }
               _loc8_++;
            }
            _loc3_ = _loc3_ + _loc11_;
            if(_loc12_ > 1)
            {
               _loc3_ = _loc3_ + this._verticalGap * (_loc12_ - 1);
            }
            _loc8_ = 0;
            while(_loc8_ < _loc6_)
            {
               _loc7_ = _loc5_.getElementAt(_loc8_);
               if(!_loc7_ || !_loc7_.includeInLayout)
               {
                  _loc8_++;
                  continue;
               }
               _loc1_ = _loc2_ = Math.ceil(_loc7_.getPreferredBoundsWidth());
               break;
            }
            _loc4_ = _loc3_;
         }
         _loc5_.measuredWidth = _loc1_ + this._paddingLeft + this._paddingRight;
         _loc5_.measuredMinWidth = _loc2_ + this._paddingLeft + this._paddingRight;
         _loc5_.measuredHeight = _loc3_ + this._paddingTop + this._paddingBottom;
         _loc5_.measuredMinHeight = _loc4_ + this._paddingTop + this._paddingBottom;
      }
      
      override public function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc5_:ILayoutElement = null;
         var _loc6_:int = 0;
         var _loc14_:Number = NaN;
         var _loc15_:Point = null;
         var _loc3_:GroupBase = target;
         var _loc4_:int = _loc3_.numElements;
         var _loc7_:Number = this._paddingLeft;
         var _loc8_:Number = this._paddingTop;
         var _loc9_:Number = 0;
         var _loc10_:int = 0;
         var _loc11_:Vector.<Point> = new Vector.<Point>(_loc4_);
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_ = _loc3_.getElementAt(_loc6_);
            if(!(!_loc5_ || !_loc5_.includeInLayout))
            {
               _loc14_ = Math.ceil(_loc5_.getPreferredBoundsWidth());
               if(_loc7_ == this._paddingLeft || _loc7_ + this._horizontalGap + _loc14_ <= param1 - this._paddingRight)
               {
                  if(_loc10_ > 0)
                  {
                     _loc7_ = _loc7_ + this._horizontalGap;
                  }
                  _loc11_[_loc6_] = new Point(_loc7_,_loc8_);
                  _loc5_.setLayoutBoundsSize(NaN,NaN);
                  _loc9_ = Math.max(_loc9_,Math.ceil(_loc5_.getPreferredBoundsHeight()));
               }
               else
               {
                  _loc7_ = this._paddingLeft;
                  _loc8_ = _loc8_ + (this._verticalGap + _loc9_);
                  _loc9_ = Math.ceil(_loc5_.getPreferredBoundsHeight());
                  _loc11_[_loc6_] = new Point(_loc7_,_loc8_);
                  _loc5_.setLayoutBoundsSize(NaN,NaN);
               }
               _loc7_ = _loc7_ + _loc14_;
               _loc10_++;
            }
            _loc6_++;
         }
         var _loc12_:Number = 0;
         var _loc13_:Number = param2 - (_loc8_ + _loc9_ + this._paddingBottom);
         if(this._verticalAlign == VerticalAlign.MIDDLE)
         {
            _loc12_ = Math.round(_loc13_ / 2);
         }
         else if(this._verticalAlign == VerticalAlign.BOTTOM)
         {
            _loc12_ = Math.round(_loc13_);
         }
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_ = _loc3_.getElementAt(_loc6_);
            if(!(!_loc5_ || !_loc5_.includeInLayout))
            {
               _loc15_ = _loc11_[_loc6_];
               _loc15_.y = _loc15_.y + _loc12_;
               _loc5_.setLayoutBoundsPosition(_loc15_.x,_loc15_.y);
            }
            _loc6_++;
         }
         if(this.lastWidth == -1 || this.lastWidth != param1)
         {
            this.lastWidth = param1;
            this.invalidateTargetSizeAndDisplayList();
         }
      }
      
      private function invalidateTargetSizeAndDisplayList() : void
      {
         var _loc1_:GroupBase = target;
         if(!_loc1_)
         {
            return;
         }
         _loc1_.invalidateSize();
         _loc1_.invalidateDisplayList();
      }
   }
}
