package com.jumpeye.flashEff2.text.alpha
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.DisplayObject;
   
   public class FETAlpha extends IFlashEffText
   {
       
      
      protected var tweensNumber:Number = 0;
      
      protected var elements:Array;
      
      protected var tweensFinished:Number = 0;
      
      private var _groupDuration:Number = 0.8;
      
      private var _preset:Number = 18;
      
      public function FETAlpha(param1:JUIComponent = null)
      {
         super();
         this.component = param1;
         this.init();
      }
      
      protected function clearProperties() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:Number = NaN;
         if(this.elements != null)
         {
            _loc1_ = this.elements.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               this.elements[_loc2_].alpha = 1;
               TweenLite.killTweensOf(this.elements[_loc2_],false);
               _loc2_++;
            }
            this.elements = null;
         }
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc6_:* = undefined;
         var _loc7_:uint = 0;
         var _loc12_:Number = NaN;
         var _loc13_:uint = 0;
         var _loc14_:* = undefined;
         var _loc8_:Object = JFETPreset.getAliasPreset(this.preset);
         this.component.drawTextTable(_loc8_.splitter,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         _loc2_ = this.component.absMatrix;
         _loc5_ = JFETPreset.getPresetsArray(_loc8_.preset,_loc2_);
         _loc4_ = _loc5_.timeMatrix;
         var _loc9_:Number = _loc5_.maxItems;
         this.tweensFinished = 0;
         _loc3_ = _loc2_.length;
         var _loc10_:uint = 1;
         var _loc11_:uint = 0;
         if(param1 == true)
         {
            _loc10_ = 0;
            _loc11_ = 1;
         }
         tweensNumber = this.component.textTable.childs.length;
         if(_loc9_ > 1)
         {
            _loc12_ = Math.max((this.tweenDuration - this.groupDuration) / (_loc9_ - 1),0);
         }
         else
         {
            _loc12_ = 0;
         }
         elements = [];
         _loc6_ = 0;
         while(_loc6_ < _loc3_)
         {
            _loc13_ = _loc2_[_loc6_].length;
            _loc7_ = 0;
            while(_loc7_ < _loc13_)
            {
               _loc14_ = _loc2_[_loc6_][_loc7_];
               _loc14_.alpha = _loc10_;
               elements.push(_loc14_);
               TweenLite.to(_loc14_,this.groupDuration,{
                  "ease":this.easeFunc,
                  "delay":_loc4_[_loc6_][_loc7_] * _loc12_,
                  "alpha":_loc11_,
                  "onComplete":this.motionFinish,
                  "onCompleteParams":[param1,_loc14_]
               });
               _loc7_++;
            }
            _loc6_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Quadratic";
         _easeType = "easeOut";
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      protected function motionFinish(param1:Boolean, param2:DisplayObject) : void
      {
         if(param1 == false)
         {
            param2.visible = false;
         }
         tweensFinished++;
         if(tweensNumber == tweensFinished)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition(true);
         }
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
   }
}
