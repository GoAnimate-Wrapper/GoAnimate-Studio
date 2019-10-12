package anifire.bubble
{
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class ImageBubble extends Bubble
   {
       
      
      private var _imageBodyClass:Class;
      
      private var _tailImageClass:Class;
      
      private var _leftMargin:Number;
      
      private var _rightMargin:Number;
      
      public function ImageBubble()
      {
         super();
         type = BubbleMgr.IMAGE;
      }
      
      public function set image(param1:Class) : void
      {
         this._imageBodyClass = param1;
      }
      
      public function set tailImage(param1:Class) : void
      {
         this._tailImageClass = param1;
      }
      
      override protected function drawBody() : void
      {
         if(super.body != null)
         {
            content.removeChild(super.body);
         }
         var _loc1_:Sprite = new this._imageBodyClass() as Sprite;
         _loc1_.width = width;
         _loc1_.height = height;
         var _loc2_:Sprite = new Sprite();
         _loc2_.addChild(_loc1_);
         _loc2_.name = "body";
         _loc2_.x = x;
         _loc2_.y = y;
         if(_loc1_ is MovieClip)
         {
         }
         var _loc3_:ColorTransform = _loc2_.transform.colorTransform;
         _loc3_.color = fillRgb;
         _loc2_.transform.colorTransform = _loc3_;
         super.body = content.addChild(_loc2_) as Sprite;
      }
      
      override protected function drawTail() : void
      {
         var _loc1_:Sprite = null;
         var _loc2_:Sprite = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:ColorTransform = null;
         var _loc21_:Sprite = null;
         if(super.tail != null && content.contains(super.tail))
         {
            content.removeChild(super.tail);
         }
         if(tailEnable)
         {
            _loc2_ = new Sprite();
            _loc2_.name = "tail";
            _loc3_ = width / 2 + super.x;
            _loc4_ = height / 2 + super.y;
            _loc5_ = Math.sqrt(Math.pow(taily - _loc4_,2) + Math.pow(tailx - _loc3_,2));
            _loc6_ = tailx - _loc3_;
            _loc7_ = taily - _loc4_;
            _loc8_ = Math.atan2(_loc7_,_loc6_);
            _loc9_ = GMath.rad2Deg(_loc8_);
            _loc14_ = 2 / 3;
            if(tailx != _loc3_)
            {
               _loc10_ = (taily - _loc4_) / (tailx - _loc3_);
               _loc11_ = Math.sqrt(Math.pow(width / 2,2) * Math.pow(height / 2,2) / (Math.pow(height / 2,2) + Math.pow(width / 2,2) * Math.pow(_loc10_,2))) * _loc14_;
               if(tailx < _loc3_)
               {
                  _loc11_ = _loc11_ * -1;
               }
               _loc13_ = taily - tailx * _loc10_;
               _loc12_ = _loc11_ * _loc10_;
            }
            else if(taily > 0)
            {
               _loc10_ = Infinity;
               _loc11_ = 0;
               _loc12_ = height / 2;
               _loc13_ = 0;
            }
            else if(taily < 0)
            {
               _loc10_ = -Infinity;
               _loc11_ = 0;
               _loc12_ = -height / 2;
               _loc13_ = 0;
            }
            _loc15_ = Math.sqrt(Math.pow(_loc12_,2) + Math.pow(_loc11_,2));
            _loc11_ = _loc11_ + _loc3_;
            _loc12_ = _loc12_ + _loc4_;
            _loc16_ = width / 6;
            _loc17_ = height / 6;
            _loc18_ = _loc11_ + (tailx - _loc11_) * 3.5 / 9;
            if(isFinite(_loc10_))
            {
               _loc19_ = _loc18_ * _loc10_ + _loc13_;
            }
            else if(_loc10_ == Infinity)
            {
               _loc19_ = _loc12_ + (taily - _loc12_) * 3.5 / 9;
            }
            else if(_loc10_ == -Infinity)
            {
               _loc19_ = _loc12_ - (Math.abs(taily) - Math.abs(_loc12_)) * 3.5 / 9;
            }
            _loc1_ = new this._tailImageClass() as Sprite;
            _loc1_.name = "tail1";
            _loc1_.width = _loc16_;
            _loc1_.height = _loc17_;
            _loc1_.x = _loc18_ - _loc16_ / 2;
            _loc1_.y = _loc19_ - _loc17_ / 2;
            _loc2_.addChild(_loc1_);
            _loc16_ = _loc16_ * 2 / 3;
            _loc17_ = _loc17_ * 2 / 3;
            _loc18_ = _loc11_ + (tailx - _loc11_) * 6.5 / 9;
            if(isFinite(_loc10_))
            {
               _loc19_ = _loc18_ * _loc10_ + _loc13_;
            }
            else if(_loc10_ == Infinity)
            {
               _loc19_ = _loc12_ + (taily - _loc12_) * 6.5 / 9;
            }
            else if(_loc10_ == -Infinity)
            {
               _loc19_ = _loc12_ - (Math.abs(taily) - Math.abs(_loc12_)) * 6.5 / 9;
            }
            _loc1_ = new this._tailImageClass() as Sprite;
            _loc1_.name = "tail2";
            _loc1_.width = _loc16_;
            _loc1_.height = _loc17_;
            _loc1_.x = _loc18_ - _loc16_ / 2;
            _loc1_.y = _loc19_ - _loc17_ / 2;
            _loc2_.addChild(_loc1_);
            _loc16_ = _loc16_ * 2 / 3;
            _loc17_ = _loc17_ * 2 / 3;
            _loc18_ = tailx;
            _loc19_ = taily;
            _loc1_ = new this._tailImageClass() as Sprite;
            _loc1_.name = "tail3";
            _loc1_.width = _loc16_;
            _loc1_.height = _loc17_;
            _loc1_.x = _loc18_ - _loc16_ / 2;
            _loc1_.y = _loc19_ - _loc17_ / 2;
            _loc2_.addChild(_loc1_);
            _loc20_ = _loc2_.transform.colorTransform;
            _loc20_.color = fillRgb;
            _loc2_.transform.colorTransform = _loc20_;
            super.tail = content.addChild(_loc2_) as Sprite;
         }
         else
         {
            _loc21_ = new Sprite();
            _loc21_.name = "tail";
            tail = content.addChild(_loc21_) as Sprite;
         }
      }
      
      public function set leftMargin(param1:Number) : void
      {
         this._leftMargin = param1;
      }
      
      public function set rightMargin(param1:Number) : void
      {
         this._rightMargin = param1;
      }
      
      override protected function drawLabel() : void
      {
         var _loc5_:Object = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.numChildren)
         {
            _loc5_ = this.getChildAt(_loc1_);
            if(_loc5_ is FlashEff2Flex)
            {
               return;
            }
            _loc1_++;
         }
         if(mver >= 2)
         {
            super.drawLabel();
         }
         var _loc2_:DisplayObject = content.getChildByName("body");
         if(super.label != null)
         {
            if(super.label.parent)
            {
               super.label.parent.removeChild(super.label);
            }
         }
         var _loc3_:TextField = super.returnLabel(null,this._leftMargin,this._rightMargin);
         var _loc4_:Rectangle = GMath.getBubbleBounds(width,height,type,_loc2_);
         _loc3_.x = _loc4_.x + x;
         _loc3_.y = _loc4_.y + y;
         _loc3_.width = _loc4_.width;
         _loc3_.height = _loc4_.height;
         boundHeight = _loc4_.height;
         boundWidth = _loc4_.width;
         super.label = addChild(_loc3_) as TextField;
         if(mver >= 2)
         {
            updateVerticalAlign();
         }
         else
         {
            super.drawLabel();
         }
      }
      
      override public function redraw() : void
      {
         this.drawTail();
         this.drawBody();
         this.drawLabel();
         drawOutline(content);
         if(stopAfterRedraw)
         {
            stopBubble();
         }
      }
   }
}
