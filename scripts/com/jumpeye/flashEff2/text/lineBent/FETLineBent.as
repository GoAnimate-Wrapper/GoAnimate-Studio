package com.jumpeye.flashEff2.text.lineBent
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.effects.JSwapMap;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.DisplacementMapFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class FETLineBent extends IFlashEffText
   {
       
      
      private var _preset:Number = 2;
      
      private var _yDifference:Number = 50;
      
      private var _blurQuality:Number = 2;
      
      private var _bentAmount:Number = 100;
      
      private var prop:Number = 0;
      
      private var _groupDuration:Number = 0.5;
      
      protected var owner:Object;
      
      public function FETLineBent(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      public function get bentAmount() : Number
      {
         return _bentAmount;
      }
      
      public function set bentAmount(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 100;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1000)
         {
            param1 = 1000;
         }
         this._bentAmount = param1;
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Strong";
         _easeType = "easeInOut";
         this.owner = {};
      }
      
      private function alphaFinish(param1:Object, param2:Sprite) : *
      {
         param1.clip.filters = [];
         if(show == false)
         {
            param1.clip.visible = false;
         }
         owner.tweensFinished++;
         if(owner.tweensNumber == owner.tweensFinished)
         {
            clearProperties();
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function get yDifference() : Number
      {
         return _yDifference;
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:* = undefined;
         var _loc7_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:Object = null;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc16_:* = undefined;
         var _loc17_:* = undefined;
         var _loc18_:* = undefined;
         var _loc19_:* = undefined;
         var _loc8_:Number = Number(Number(this.preset)) || Number(1);
         if(Number(_loc8_) > 5)
         {
            _loc8_ = 1;
         }
         _loc8_ = Math.max(1,_loc8_);
         var _loc9_:String = "lines";
         _loc8_ = _loc8_ + 25;
         this.component.drawTextTable(_loc9_,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         _loc2_ = this.component.absMatrix;
         _loc5_ = JFETPreset.getPresetsArray(_loc8_,_loc2_);
         _loc4_ = _loc5_.timeMatrix;
         owner.maxItems = _loc5_.maxItems;
         owner.tweensFinished = 0;
         _loc3_ = _loc2_.length;
         owner.tweensNumber = this.component.textTable.childs.length;
         if(owner.maxItems <= 1)
         {
            owner.delay = 0;
         }
         else
         {
            owner.delay = Math.max((this.tweenDuration - this.groupDuration) / (owner.maxItems - 1),0);
         }
         var _loc10_:* = !!param1?"show":"hide";
         owner.elements = [];
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc11_ = _loc2_[_loc6_].length;
            owner.elements[_loc6_] = [];
            _loc7_ = 0;
            while(_loc7_ < _loc11_)
            {
               _loc12_ = owner.elements[_loc6_][_loc7_] = {};
               _loc12_.clip = _loc2_[_loc6_][_loc7_];
               _loc13_ = _loc12_.clip.getBounds(_loc12_.clip.parent);
               owner["map" + _loc6_ + "_" + _loc7_] = new JSwapMap(_loc13_.width,_loc13_.height + 256 * bentAmount / 256);
               owner["mapBit" + _loc6_ + "_" + _loc7_] = getBitmap(owner["map" + _loc6_ + "_" + _loc7_]);
               _loc12_.clip.trueY = _loc12_.clip.y;
               _loc14_ = !!param1?_loc12_.clip.y - yDifference:_loc12_.clip.y;
               _loc12_.clip.y = _loc14_;
               _loc15_ = !!param1?_loc12_.clip.trueY:_loc12_.clip.y - yDifference;
               TweenLite.to(_loc12_.clip,this.groupDuration,{
                  "y":_loc15_,
                  "delay":_loc4_[_loc6_][_loc7_] * owner.delay,
                  "ease":this.easeFunc,
                  "overwrite":false
               });
               _loc16_ = !!param1?0:1;
               _loc17_ = !!param1?1:0;
               _loc12_.clip.alpha = _loc16_;
               TweenLite.to(_loc12_.clip,this.groupDuration,{
                  "alpha":_loc17_,
                  "delay":_loc4_[_loc6_][_loc7_] * owner.delay,
                  "ease":this.easeFunc,
                  "onComplete":alphaFinish,
                  "onCompleteParams":[_loc12_,_loc12_.clip],
                  "overwrite":false
               });
               _loc18_ = !!param1?bentAmount:0;
               _loc19_ = !!param1?0:bentAmount;
               _loc12_.bent = _loc18_;
               TweenLite.to(_loc12_,this.groupDuration,{
                  "bent":_loc19_,
                  "delay":_loc4_[_loc6_][_loc7_] * owner.delay,
                  "ease":this.easeFunc,
                  "onUpdate":bentChange,
                  "onUpdateParams":[_loc12_,_loc12_.clip,_loc6_,_loc7_],
                  "overwrite":false
               });
               _loc7_++;
            }
            _loc6_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      private function getBitmap(param1:*) : BitmapData
      {
         var _loc2_:* = new BitmapData(param1.width,param1.height,true,0);
         var _loc3_:* = new Matrix();
         _loc3_.scale(param1.scaleX,param1.scaleY);
         _loc2_.draw(param1,_loc3_);
         return _loc2_;
      }
      
      protected function clearProperties() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:uint = 0;
         var _loc3_:* = undefined;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:Object = null;
         var _loc7_:* = undefined;
         if(owner is Object)
         {
            if(owner.elements is Array)
            {
               _loc1_ = owner.absMatrix;
               _loc2_ = owner.elements.length;
               _loc3_ = 0;
               while(_loc3_ < _loc2_)
               {
                  _loc5_ = owner.elements[_loc3_].length;
                  _loc4_ = 0;
                  while(_loc4_ < _loc5_)
                  {
                     _loc6_ = owner.elements[_loc3_][_loc4_];
                     _loc7_ = _loc6_.clip;
                     TweenLite.killTweensOf(_loc6_.clip,false);
                     TweenLite.killTweensOf(_loc6_,false);
                     if(owner["map" + _loc3_ + "_" + _loc4_])
                     {
                        owner["map" + _loc3_ + "_" + _loc4_] = null;
                     }
                     if(owner["msk" + _loc3_ + "_" + _loc4_])
                     {
                        if(component.targetOwner.contains(owner["msk" + _loc3_ + "_" + _loc4_]))
                        {
                           component.targetOwner.removeChild(owner["msk" + _loc3_ + "_" + _loc4_]);
                        }
                        owner["msk" + _loc3_ + "_" + _loc4_] = null;
                     }
                     if(_loc7_)
                     {
                        _loc7_.mask = null;
                        _loc7_.filters = [];
                     }
                     _loc4_++;
                  }
                  _loc3_++;
               }
            }
         }
         delete owner.elements;
      }
      
      public function set yDifference(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 50;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1000)
         {
            param1 = 1000;
         }
         this._yDifference = param1;
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
      }
      
      private function bentChange(param1:Object, param2:Sprite, param3:*, param4:*) : void
      {
         var _loc5_:* = param1.bent;
         var _loc6_:* = getBent(owner["mapBit" + param3 + "_" + param4],_loc5_,param3,param4);
         param2.filters = [_loc6_];
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition(true);
         }
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      private function getBent(param1:*, param2:*, param3:*, param4:*) : BitmapFilter
      {
         var _loc5_:* = new Point(0,-(param1.height - owner.elements[param3][param4].clip.height));
         var _loc6_:* = BitmapDataChannel.BLUE;
         var _loc7_:* = BitmapDataChannel.BLUE;
         var _loc8_:* = param2;
         var _loc9_:* = new DisplacementMapFilter(param1,_loc5_,_loc6_,_loc7_,_loc8_,_loc8_,"color",0,0);
         return _loc9_;
      }
   }
}
