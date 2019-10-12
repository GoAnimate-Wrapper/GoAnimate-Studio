package com.jumpeye.flashEff2.text.lineBurnAndFlow
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.effects.JMaskDistort;
   import com.jumpeye.effects.JSkewMap;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.DisplacementMapFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class FETLineBurnAndFlow extends IFlashEffText
   {
       
      
      private var _flowAmount:Number = 150;
      
      private var _preset:Number = 1;
      
      private var _glowColor:Number = 16777215;
      
      private var _blurQuality:Number = 2;
      
      private var prop:Number = 0;
      
      private var _glowAmount:Number = 20;
      
      private var transitionType:String;
      
      protected var owner:Object;
      
      private var _groupDuration:Number = 1;
      
      public function FETLineBurnAndFlow(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      private function getSkew(param1:*, param2:*) : BitmapFilter
      {
         var _loc3_:* = new Point(0,0);
         var _loc4_:* = 0;
         var _loc5_:* = 1;
         var _loc6_:* = param2;
         var _loc7_:* = new DisplacementMapFilter(param1,_loc3_,_loc4_,_loc5_,0,_loc6_,"color",0,0);
         return _loc7_;
      }
      
      private function getGlow(param1:*) : BitmapFilter
      {
         var _loc2_:Number = glowColor;
         var _loc3_:Number = 1;
         var _loc4_:Number = param1;
         var _loc5_:Number = param1;
         var _loc6_:Number = param1 / 3;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Number = BitmapFilterQuality.HIGH;
         return new GlowFilter(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc9_,_loc7_,_loc8_);
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      private function glowFinish(param1:Object, param2:Sprite) : *
      {
         if(transitionType == "false")
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
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      public function set flowAmount(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 200;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 10000)
         {
            param1 = 10000;
         }
         this._flowAmount = param1;
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.6;
         _tweenType = "Strong";
         _easeType = "easeOut";
         this.owner = {};
      }
      
      public function set glowAmount(param1:Number) : void
      {
         if(isNaN(Number(param1)))
         {
            param1 = 30;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 100)
         {
            param1 = 100;
         }
         this._glowAmount = param1;
      }
      
      public function get glowAmount() : Number
      {
         return _glowAmount;
      }
      
      public function get glowColor() : uint
      {
         return this._glowColor;
      }
      
      private function skewChange(param1:Object, param2:Sprite, param3:*, param4:*) : void
      {
         var _loc9_:* = undefined;
         var _loc5_:* = param1.flow;
         var _loc6_:* = getSkew(owner["mapBit" + param3 + "_" + param4],_loc5_);
         var _loc7_:* = param2.filters;
         var _loc8_:* = [];
         _loc8_.push(_loc6_);
         for(_loc9_ in _loc7_)
         {
            if(_loc7_[_loc9_] is GlowFilter)
            {
               _loc8_.push(_loc7_[_loc9_]);
            }
         }
         param2.filters = _loc8_;
      }
      
      private function glowChange(param1:Object, param2:Sprite) : void
      {
         var _loc7_:* = undefined;
         var _loc3_:* = param1.glow;
         var _loc4_:* = param2.filters;
         var _loc5_:* = getGlow(_loc3_);
         var _loc6_:* = [];
         for(_loc7_ in _loc4_)
         {
            if(_loc4_[_loc7_] is DisplacementMapFilter)
            {
               _loc6_.push(_loc4_[_loc7_]);
            }
         }
         _loc6_.push(_loc5_);
         param2.filters = _loc6_;
      }
      
      public function get preset() : Number
      {
         return this._preset;
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
                     _loc6_.flow = 0;
                     TweenLite.killTweensOf(_loc6_.clip,false);
                     TweenLite.killTweensOf(_loc6_,false);
                     if(_loc7_)
                     {
                        _loc7_.filters = [];
                     }
                     if(owner["map" + _loc3_ + "_" + _loc4_])
                     {
                        owner["mapBit" + _loc3_ + "_" + _loc4_].dispose();
                        owner["map" + _loc3_ + "_" + _loc4_] = null;
                     }
                     if(owner["msk" + _loc3_ + "_" + _loc4_])
                     {
                        _loc7_.visible = transitionType == "show"?true:false;
                        if(component.targetOwner.contains(owner["msk" + _loc3_ + "_" + _loc4_]))
                        {
                           component.targetOwner.removeChild(owner["msk" + _loc3_ + "_" + _loc4_]);
                           owner["msk" + _loc3_ + "_" + _loc4_] = null;
                        }
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
      
      private function getBitmap(param1:*) : BitmapData
      {
         var _loc2_:* = new BitmapData(param1.width,param1.height,true,0);
         var _loc3_:* = new Matrix();
         _loc3_.scale(param1.scaleX,param1.scaleY);
         _loc2_.draw(param1,_loc3_);
         return _loc2_;
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
      }
      
      public function set glowColor(param1:uint) : void
      {
         this._glowColor = param1;
      }
      
      public function get flowAmount() : Number
      {
         return _flowAmount;
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:* = undefined;
         var _loc7_:uint = 0;
         var _loc13_:uint = 0;
         var _loc14_:Object = null;
         var _loc15_:* = undefined;
         var _loc16_:* = undefined;
         var _loc17_:* = undefined;
         var _loc18_:* = undefined;
         var _loc19_:* = undefined;
         var _loc20_:* = undefined;
         var _loc8_:Number = Number(Number(this.preset)) || Number(1);
         if(Number(_loc8_) > 55)
         {
            _loc8_ = 1;
         }
         clearProperties();
         var _loc9_:String = "lines";
         transitionType = !!param1?"show":"hide";
         if(Number(_loc8_) > 5)
         {
            _loc8_ = 1;
         }
         _loc8_ = Math.max(1,_loc8_);
         if(_loc8_ <= 3)
         {
            _loc8_ = _loc8_ + 18;
         }
         else
         {
            _loc8_ = _loc8_ + 50;
         }
         var _loc10_:Object = JFETPreset.getAliasPreset(_loc8_);
         this.component.drawTextTable(_loc9_,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         _loc2_ = this.component.absMatrix;
         _loc5_ = JFETPreset.getPresetsArray(_loc10_.preset,_loc2_);
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
         var _loc11_:* = "non_radial:)";
         var _loc12_:* = !!param1?"show":"hide";
         owner.elements = [];
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc13_ = _loc2_[_loc6_].length;
            owner.elements[_loc6_] = [];
            _loc7_ = 0;
            while(_loc7_ < _loc13_)
            {
               _loc14_ = owner.elements[_loc6_][_loc7_] = {};
               _loc14_.clip = _loc2_[_loc6_][_loc7_];
               _loc15_ = _loc14_.clip.getBounds(_loc14_.clip.parent);
               owner["map" + _loc6_ + "_" + _loc7_] = new JSkewMap(_loc15_.width * component.target.scaleX,_loc15_.height * component.target.scaleY + 256 * (flowAmount / 2) / 256);
               owner["mapBit" + _loc6_ + "_" + _loc7_] = getBitmap(owner["map" + _loc6_ + "_" + _loc7_]);
               owner["msk" + _loc6_ + "_" + _loc7_] = new JMaskDistort(_loc12_,_loc11_,_loc15_.width * component.target.scaleX + 5,_loc15_.height * component.target.scaleY,7,7,{
                  "blur":true,
                  "blurX":5,
                  "blurY":5
               });
               component.targetOwner.addChild(owner["msk" + _loc6_ + "_" + _loc7_]);
               _loc14_.clip.cacheAsBitmap = true;
               owner["msk" + _loc6_ + "_" + _loc7_].cacheAsBitmap = true;
               owner["msk" + _loc6_ + "_" + _loc7_].x = _loc15_.x * component.target.scaleX;
               owner["msk" + _loc6_ + "_" + _loc7_].y = _loc15_.y * component.target.scaleY;
               owner["msk" + _loc6_ + "_" + _loc7_].value = 100;
               owner["msk" + _loc6_ + "_" + _loc7_].visible = false;
               _loc14_.clip.mask = owner["msk" + _loc6_ + "_" + _loc7_];
               _loc7_++;
            }
            _loc6_++;
         }
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc13_ = _loc2_[_loc6_].length;
            owner.elements[_loc6_] = [];
            _loc7_ = 0;
            while(_loc7_ < _loc13_)
            {
               _loc14_ = owner.elements[_loc6_][_loc7_] = {};
               _loc14_.clip = _loc2_[_loc6_][_loc7_];
               _loc14_.clip.filters = [];
               _loc16_ = Math.max(0,_loc4_[_loc6_][_loc7_] * owner.delay);
               TweenLite.to(owner["msk" + _loc6_ + "_" + _loc7_],this.groupDuration,{
                  "value":0,
                  "delay":_loc16_,
                  "ease":this.easeFunc,
                  "overwrite":true
               });
               _loc17_ = !!param1?-flowAmount:0;
               _loc18_ = !!param1?0:-flowAmount;
               _loc14_.flow = _loc17_;
               TweenLite.to(_loc14_,this.groupDuration,{
                  "flow":_loc18_,
                  "delay":_loc16_,
                  "ease":this.easeFunc,
                  "onUpdate":skewChange,
                  "onStart":kaka,
                  "onStartParams":[_loc14_,_loc14_.clip,_loc6_,_loc7_],
                  "onUpdateParams":[_loc14_,_loc14_.clip,_loc6_,_loc7_],
                  "overwrite":true
               });
               _loc19_ = !!param1?glowAmount:0;
               _loc20_ = !!param1?0:glowAmount;
               _loc14_.glow = _loc19_;
               TweenLite.to(_loc14_,this.groupDuration,{
                  "glow":_loc20_,
                  "delay":_loc16_,
                  "ease":this.easeFunc,
                  "onUpdate":glowChange,
                  "onUpdateParams":[_loc14_,_loc14_.clip],
                  "onComplete":glowFinish,
                  "onCompleteParams":[_loc14_,_loc14_.clip],
                  "overwrite":false
               });
               _loc7_++;
            }
            _loc6_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      private function kaka(param1:Object, param2:Sprite, param3:*, param4:*) : void
      {
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
   }
}
