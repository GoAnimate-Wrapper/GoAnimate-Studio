package com.jumpeye.flashEff2.symbol.brightSquares
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffSymbol;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class FESBrightSquares extends IFlashEffSymbol
   {
       
      
      private var _squareHeight:Number = 25;
      
      private var _preset:Number = 11;
      
      private var tweenCounter:uint = 0;
      
      private var dest:Sprite;
      
      private var _hAlign:String = "left";
      
      private var _scaleXAmount:Number = 1;
      
      private var tweenObjects:Array;
      
      private var oJFESBrightSquaresPresets:JFESBrightSquaresPresets;
      
      private var _groupDuration:Number = 1.1;
      
      private var presetArray:Array;
      
      private var isShow:Boolean;
      
      private var sortedIndexArray:Array;
      
      private var _smooth:Boolean = false;
      
      private var intervals:Object;
      
      private var _vAlign:String = "middle";
      
      private var columns:uint = 0;
      
      private var startEventTriggered:Boolean = false;
      
      private var mcArray:Array;
      
      private var _scaleYAmount:Number = 1;
      
      private var bitmapDataArray:Array;
      
      private var _squareWidth:Number = 25;
      
      private var posArr:Array;
      
      private var _brightness:Number = 255;
      
      private var destContent:Sprite;
      
      private var lines:uint = 0;
      
      public function FESBrightSquares(param1:JUIComponent = null)
      {
         presetArray = new Array();
         bitmapDataArray = new Array();
         mcArray = new Array();
         posArr = new Array();
         sortedIndexArray = new Array();
         intervals = new Object();
         oJFESBrightSquaresPresets = new JFESBrightSquaresPresets();
         super();
         this.component = param1;
         this.init();
      }
      
      private function removeBitmaps() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         var _loc3_:* = undefined;
         startEventTriggered = false;
         _loc1_ = 0;
         while(_loc1_ < lines)
         {
            _loc2_ = 0;
            while(_loc2_ < columns)
            {
               if(mcArray[_loc1_][_loc2_] is Sprite)
               {
                  TweenLite.killTweensOf(mcArray[_loc1_][_loc2_],false);
               }
               clearInterval(this.intervals["int_" + _loc1_ + "_" + _loc2_]);
               _loc2_++;
            }
            _loc1_++;
         }
         if(tweenObjects != null)
         {
            _loc1_ = 0;
            while(_loc1_ < tweenObjects.length)
            {
               TweenLite.killTweensOf(tweenObjects[_loc1_],false);
               _loc1_++;
            }
            tweenObjects = null;
         }
         tweenCounter = 0;
         for(_loc3_ in bitmapDataArray)
         {
            if(bitmapDataArray[_loc3_] != null)
            {
               bitmapDataArray[_loc3_].bitmapData.dispose();
               bitmapDataArray[_loc3_] = null;
            }
         }
         bitmapDataArray = [];
         if(dest is Sprite)
         {
            this.component.targetOwner.removeChild(dest);
         }
         dest = null;
         sortedIndexArray = [];
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      private function hideEffect(param1:*, param2:*, param3:*) : void
      {
         var _loc4_:Object = {"prop":100};
         tweenObjects.push(_loc4_);
         clearInterval(this.intervals["int_" + param2 + "_" + param3]);
         if(tweenCounter == 0 && startEventTriggered == false)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
            startEventTriggered = true;
         }
         TweenLite.to(_loc4_,2 * groupDuration / 6,{
            "prop":0,
            "ease":this.easeFunc,
            "overwrite":false,
            "onUpdate":this.changeBrightness,
            "onUpdateParams":[posArr[param2][param3],param1,hAlign,vAlign,param2,param3,_loc4_],
            "onComplete":this.hideSquares
         });
         TweenLite.to(param1,groupDuration / 6,{
            "scaleX":this._scaleXAmount,
            "scaleY":this._scaleYAmount,
            "ease":this.easeFunc,
            "overwrite":false,
            "onUpdate":this.changeSquarePosition,
            "onUpdateParams":[posArr[param2][param3],param1,hAlign,vAlign,param2,param3],
            "onComplete":this.hideSquares,
            "onCompleteParams":[posArr[param2][param3],param1,hAlign,vAlign,param2,param3]
         });
      }
      
      override public function show() : void
      {
         applyTransition("show");
         isShow = true;
      }
      
      public function get scaleYAmount() : Number
      {
         return this._scaleYAmount;
      }
      
      override public function remove() : void
      {
         removeBitmaps();
         if(this.target != null)
         {
            this.target.visible = true;
         }
      }
      
      public function set scaleXAmount(param1:Number) : void
      {
         this._scaleXAmount = param1;
      }
      
      private function sortIndexArr(param1:Array, param2:String) : *
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:* = undefined;
         var _loc6_:Object = null;
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = 0;
            while(_loc4_ < param1.length - 1)
            {
               _loc6_ = new Object();
               if(param1[_loc4_].depthCoef > param1[_loc4_ + 1].depthCoef)
               {
                  _loc6_ = param1[_loc4_];
                  param1[_loc4_] = param1[_loc4_ + 1];
                  param1[_loc4_ + 1] = _loc6_;
               }
               _loc4_++;
            }
            _loc3_++;
         }
         for(_loc5_ in param1)
         {
            _loc3_ = 0;
            while(_loc3_ < lines)
            {
               _loc4_ = 0;
               while(_loc4_ < columns)
               {
                  if(sortedIndexArray[_loc5_].i == _loc3_ && sortedIndexArray[_loc5_].j == _loc4_)
                  {
                     if(param2 == "show")
                     {
                        destContent.setChildIndex(mcArray[_loc3_][_loc4_],_loc5_);
                     }
                     else if(param2 == "hide")
                     {
                        destContent.setChildIndex(mcArray[_loc3_][_loc4_],lines * columns - 1 - _loc5_);
                     }
                  }
                  _loc4_++;
               }
               _loc3_++;
            }
         }
      }
      
      private function showEffect(param1:*, param2:*, param3:*) : void
      {
         var _loc4_:Object = {"prop":100};
         tweenObjects.push(_loc4_);
         clearInterval(this.intervals["int_" + param2 + "_" + param3]);
         if(tweenCounter == 0 && startEventTriggered == false)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
            startEventTriggered = true;
         }
         TweenLite.to(param1,3 * groupDuration / 6,{
            "scaleX":this._scaleXAmount,
            "scaleY":this._scaleYAmount,
            "ease":this.easeFunc,
            "overwrite":false,
            "onUpdate":this.changeSquarePosition,
            "onUpdateParams":[posArr[param2][param3],param1,hAlign,vAlign,param2,param3],
            "onComplete":this.resizeSquares,
            "onCompleteParams":[posArr[param2][param3],param1,hAlign,vAlign,param2,param3]
         });
         TweenLite.to(param1,2 * groupDuration / 6,{
            "alpha":1,
            "delay":groupDuration / 6,
            "ease":this.easeFunc,
            "overwrite":false
         });
         TweenLite.to(_loc4_,2 * groupDuration / 6,{
            "prop":0,
            "ease":this.easeFunc,
            "overwrite":false,
            "delay":2 * groupDuration / 6,
            "onUpdate":this.changeBrightness,
            "onUpdateParams":[posArr[param2][param3],param1,hAlign,vAlign,param2,param3,_loc4_]
         });
      }
      
      private function transitionEndTrigger() : void
      {
         tweenCounter++;
         if(tweenCounter == lines * columns)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
            removeBitmaps();
            if(isShow)
            {
               if(this.target != null)
               {
                  this.target.visible = true;
               }
            }
         }
      }
      
      public function set scaleYAmount(param1:Number) : void
      {
         this._scaleYAmount = param1;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _easeType = "easeInOut";
         _tweenType = "Quadratic";
      }
      
      private function changeBrightness(... rest) : void
      {
         var _loc3_:ColorMatrixFilter = null;
         var _loc2_:Array = new Array();
         var _loc4_:Number = 0;
         if(rest[6].prop > 50)
         {
            _loc4_ = (100 - rest[6].prop) * this._brightness / 50;
         }
         else
         {
            _loc4_ = rest[6].prop * this._brightness / 50;
         }
         _loc2_ = [1,0,0,0,_loc4_,0,1,0,0,_loc4_,0,0,1,0,_loc4_,0,0,0,1,0];
         _loc3_ = new ColorMatrixFilter(_loc2_);
         rest[1].filters = new Array(_loc3_);
      }
      
      public function get squareHeight() : Number
      {
         return this._squareHeight;
      }
      
      public function get smooth() : Boolean
      {
         return this._smooth;
      }
      
      public function get vAlign() : String
      {
         return this._vAlign;
      }
      
      public function get squareWidth() : Number
      {
         return this._squareWidth;
      }
      
      private function changeSquarePosition(... rest) : void
      {
         switch(rest[2])
         {
            default:
               rest[1].x = rest[0].xPos;
               break;
            case "center":
               rest[1].x = rest[0].xPos - rest[1].width / 2;
               break;
            case "right":
               rest[1].x = rest[0].xPos - rest[1].width;
         }
         switch(rest[3])
         {
            default:
               rest[1].y = rest[0].yPos;
               break;
            case "middle":
               rest[1].y = rest[0].yPos - rest[1].height / 2;
               break;
            case "bottom":
               rest[1].y = rest[0].yPos - rest[1].height;
         }
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      public function set preset(param1:Number) : void
      {
         if(param1 > 0 && param1 < 21)
         {
            this._preset = param1;
         }
      }
      
      public function set squareHeight(param1:Number) : void
      {
         if(param1 <= 0)
         {
            param1 = 50;
         }
         this._squareHeight = param1;
      }
      
      override public function hide() : void
      {
         applyTransition("hide");
         isShow = false;
      }
      
      private function createBitmapImage(param1:*, param2:*, param3:*, param4:*) : Array
      {
         var _loc6_:Bitmap = null;
         var _loc7_:BitmapData = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:uint = 0;
         var _loc17_:uint = 0;
         var _loc18_:Matrix = null;
         var _loc19_:Sprite = null;
         var _loc5_:Array = new Array();
         this._squareWidth = param4.width * param1.scaleX / param3;
         this._squareHeight = param4.height * param1.scaleY / param2;
         _loc8_ = Math.round(this._squareWidth);
         _loc9_ = Math.round(this._squareHeight);
         _loc11_ = 0;
         _loc13_ = 0;
         if(this._component.targetOwner.getChildByName("destClip") is Sprite)
         {
            this._component.targetOwner.removeChild(this._component.targetOwner.getChildByName("destClip"));
         }
         dest = new Sprite();
         dest.name = "dest";
         this._component.targetOwner["destClip"] = dest;
         this._component.targetOwner.addChild(dest);
         dest.cacheAsBitmap = true;
         param1.visible = false;
         destContent = new Sprite();
         dest.addChild(destContent);
         if(component.target is TextField)
         {
            destContent.x = Math.round(param4.x * param1.scaleX) + 2;
            destContent.y = Math.round(param4.y * param1.scaleY) + 2;
         }
         else
         {
            destContent.x = Math.round(param4.x * param1.scaleX);
            destContent.y = Math.round(param4.y * param1.scaleY);
         }
         dest.rotation = param1.rotation;
         _loc16_ = 0;
         while(_loc16_ < param2)
         {
            _loc10_ = 0;
            _loc12_ = 0;
            _loc5_[_loc16_] = [];
            _loc15_ = Math.floor(_loc13_);
            if(_loc16_ == param2 - 1)
            {
               _loc15_ = Math.round(_loc13_ + this._squareHeight - _loc9_);
            }
            _loc17_ = 0;
            while(_loc17_ < param3)
            {
               _loc14_ = Math.floor(_loc12_);
               if(_loc17_ == param3 - 1)
               {
                  _loc14_ = Math.round(_loc12_ + this._squareWidth - _loc8_);
               }
               _loc19_ = new Sprite();
               _loc19_.name = "mat" + _loc16_ + "_" + _loc17_;
               destContent.addChild(_loc19_);
               _loc5_[_loc16_][_loc17_] = _loc19_;
               _loc19_.x = _loc10_;
               _loc19_.y = _loc11_;
               _loc7_ = new BitmapData(_loc8_ + _loc14_,_loc9_ + _loc15_,true,0);
               _loc18_ = new Matrix();
               _loc18_.tx = -_loc10_ - param4.x * param1.scaleX;
               _loc18_.ty = -_loc11_ - param4.y * param1.scaleY;
               _loc18_.a = param1.scaleX;
               _loc18_.d = param1.scaleY;
               _loc7_.draw(param1,_loc18_);
               _loc6_ = new Bitmap(_loc7_);
               bitmapDataArray.push(_loc6_);
               _loc6_.smoothing = this._smooth;
               _loc19_.addChild(_loc6_);
               _loc10_ = _loc10_ + _loc8_ + _loc14_;
               _loc12_ = _loc12_ + this._squareWidth - _loc8_ - _loc14_;
               _loc17_++;
            }
            _loc11_ = _loc11_ + _loc9_ + _loc15_;
            _loc13_ = _loc13_ + this._squareHeight - _loc9_ - _loc15_;
            _loc16_++;
         }
         return _loc5_;
      }
      
      public function get brightness() : Number
      {
         return this._brightness;
      }
      
      public function set squareWidth(param1:Number) : void
      {
         if(param1 <= 0)
         {
            param1 = 50;
         }
         this._squareWidth = param1;
      }
      
      public function set brightness(param1:Number) : void
      {
         this._brightness = param1;
      }
      
      public function set smooth(param1:Boolean) : void
      {
         this._smooth = param1;
      }
      
      public function set vAlign(param1:String) : void
      {
         this._vAlign = param1;
      }
      
      private function setRegPoints(param1:String, param2:String, param3:Array) : Array
      {
         var _loc6_:Number = NaN;
         var _loc7_:Object = null;
         var _loc4_:Array = [];
         var _loc5_:Number = 0;
         while(_loc5_ < lines)
         {
            _loc4_[_loc5_] = [];
            _loc6_ = 0;
            while(_loc6_ < columns)
            {
               _loc7_ = new Object();
               switch(param1)
               {
                  default:
                     _loc7_.xPos = param3[_loc5_][_loc6_].x;
                     break;
                  case "center":
                     _loc7_.xPos = param3[_loc5_][_loc6_].x + param3[_loc5_][_loc6_].width / 2;
                     break;
                  case "right":
                     _loc7_.xPos = param3[_loc5_][_loc6_].x + param3[_loc5_][_loc6_].width;
               }
               switch(param2)
               {
                  default:
                     _loc7_.yPos = param3[_loc5_][_loc6_].y;
                     break;
                  case "middle":
                     _loc7_.yPos = param3[_loc5_][_loc6_].y + param3[_loc5_][_loc6_].height / 2;
                     break;
                  case "bottom":
                     _loc7_.yPos = param3[_loc5_][_loc6_].y + param3[_loc5_][_loc6_].height;
               }
               _loc4_[_loc5_][_loc6_] = _loc7_;
               _loc6_++;
            }
            _loc5_++;
         }
         return _loc4_;
      }
      
      private function hideSquares(... rest) : void
      {
         TweenLite.to(rest[1],2 * groupDuration / 6,{
            "alpha":0,
            "ease":this.easeFunc,
            "overwrite":false
         });
         TweenLite.to(rest[1],3 * groupDuration / 6,{
            "scaleX":0,
            "scaleY":0,
            "ease":this.easeFunc,
            "overwrite":false,
            "onUpdate":this.changeSquarePosition,
            "onUpdateParams":[rest[0],rest[1],rest[2],rest[3],rest[4],rest[5]],
            "onComplete":this.transitionEndTrigger
         });
      }
      
      private function applyTransition(param1:String) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc7_:Object = null;
         var _loc2_:Rectangle = new Rectangle();
         var _loc5_:Object = new Object();
         var _loc6_:Number = 0;
         tweenObjects = [];
         if(this._tweenDuration < this._groupDuration)
         {
            this._tweenDuration = this._groupDuration;
         }
         if(this.squareWidth > this._target.width)
         {
            this.squareWidth = this._target.width;
         }
         if(this._squareHeight > this._target.height)
         {
            this._squareHeight = this._target.height;
         }
         _loc2_ = this.target.getBounds(this.target);
         columns = Math.round(_loc2_.width * this._target.scaleX / this._squareWidth);
         lines = Math.round(_loc2_.height * this.target.scaleY / this._squareHeight);
         columns = columns > 30?uint(30):uint(columns);
         lines = lines > 30?uint(30):uint(lines);
         mcArray = createBitmapImage(this._target,lines,columns,_loc2_);
         posArr = setRegPoints(hAlign,vAlign,mcArray);
         _loc5_ = oJFESBrightSquaresPresets.getPresetsArray(this._preset,lines,columns);
         presetArray = _loc5_.arr;
         _loc3_ = 0;
         while(_loc3_ < lines)
         {
            _loc4_ = 0;
            while(_loc4_ < columns)
            {
               _loc7_ = new Object();
               _loc7_.depthCoef = presetArray[_loc3_][_loc4_];
               _loc7_.i = _loc3_;
               _loc7_.j = _loc4_;
               sortedIndexArray.push(_loc7_);
               if(param1 == "show")
               {
                  mcArray[_loc3_][_loc4_].alpha = 0;
                  mcArray[_loc3_][_loc4_].scaleX = mcArray[_loc3_][_loc4_].scaleY = 0;
               }
               _loc4_++;
            }
            _loc3_++;
         }
         _loc6_ = lines * columns != 1?Number((this._tweenDuration - this._groupDuration) / _loc5_.max):Number(0);
         if(param1 == "show")
         {
            sortIndexArr(sortedIndexArray,"show");
         }
         else if(param1 == "hide")
         {
            sortIndexArr(sortedIndexArray,"hide");
         }
         _loc3_ = 0;
         while(_loc3_ < lines)
         {
            _loc4_ = 0;
            while(_loc4_ < columns)
            {
               mcArray[_loc3_][_loc4_].name = "clip_" + _loc3_ + "_" + _loc4_;
               if(param1 == "show")
               {
                  intervals["int_" + _loc3_ + "_" + _loc4_] = setInterval(showEffect,presetArray[_loc3_][_loc4_] * _loc6_ * 1000,mcArray[_loc3_][_loc4_],_loc3_,_loc4_);
               }
               else if(param1 == "hide")
               {
                  intervals["int_" + _loc3_ + "_" + _loc4_] = setInterval(hideEffect,presetArray[_loc3_][_loc4_] * _loc6_ * 1000,mcArray[_loc3_][_loc4_],_loc3_,_loc4_);
               }
               _loc4_++;
            }
            _loc3_++;
         }
      }
      
      public function get scaleXAmount() : Number
      {
         return this._scaleXAmount;
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 <= 0)
         {
            param1 = 0.001;
         }
         this._groupDuration = param1;
      }
      
      private function resizeSquares(... rest) : void
      {
         TweenLite.to(rest[1],groupDuration / 6,{
            "scaleX":1,
            "scaleY":1,
            "ease":this.easeFunc,
            "overwrite":false,
            "onUpdate":this.changeSquarePosition,
            "onUpdateParams":[rest[0],rest[1],rest[2],rest[3],rest[4],rest[5]],
            "onComplete":this.transitionEndTrigger
         });
      }
      
      public function set hAlign(param1:String) : void
      {
         this._hAlign = param1;
      }
      
      public function get hAlign() : String
      {
         return this._hAlign;
      }
   }
}
