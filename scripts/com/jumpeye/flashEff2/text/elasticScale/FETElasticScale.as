package com.jumpeye.flashEff2.text.elasticScale
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import com.jumpeye.txeff.patterns.elasticScale.JScaleElement;
   import com.jumpeye.txeff.patterns.patternsPresets.JTXTERandomPreset;
   import flash.filters.BlurFilter;
   import flash.geom.Point;
   
   public class FETElasticScale extends IFlashEffText
   {
       
      
      private var col:uint;
      
      private var presetObject:Object;
      
      private var _preset:Number = 12;
      
      private var objMatrix:Array;
      
      private var _initScale:Number = 0.1;
      
      private var _groupSize:Number = 4;
      
      private var dim1;
      
      private var dim2;
      
      private var tweenArray:Array;
      
      private var transitionType:String;
      
      private var owner:Object;
      
      private var _groupDuration:Number = 1.1;
      
      private var maxItems:Number;
      
      private var _blurAmount:Number = 6;
      
      private var mij;
      
      private var _blurQuality:Number = 3;
      
      private var axe1;
      
      private var _alignment:String = "left";
      
      private var _alphaPercentage:Number = 30;
      
      private var i;
      
      private var timeMatrix:Array;
      
      private var j:Number;
      
      private var axe2:String;
      
      private var isLines:Boolean = false;
      
      private var tweensFinished:Number = 0;
      
      protected var endEvent:Boolean = false;
      
      public function FETElasticScale(param1:JUIComponent = null)
      {
         presetObject = {};
         transitionType = new String();
         tweenArray = new Array();
         owner = {};
         super();
         this.component = param1;
         this.init();
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      function motionChange(param1:*, param2:*, param3:*) : *
      {
         motionChangeBlur(param1);
         param1.setPosition();
      }
      
      private function setOrientation() : *
      {
         var _loc1_:* = this.target.getBounds(this.target);
         if(!isLines)
         {
            dim1 = "width";
            dim2 = "height";
            axe1 = "x";
            axe2 = "y";
            mij = _loc1_.x + _loc1_.width / 2;
         }
         else
         {
            dim1 = "height";
            dim2 = "width";
            axe1 = "y";
            axe2 = "x";
            mij = _loc1_.y + _loc1_.height / 2;
         }
      }
      
      protected function init() : void
      {
         _tweenDuration = 1.5;
         _tweenType = "Strong";
         _easeType = "easeOut";
      }
      
      function motionChangeBlur(param1:*) : *
      {
         var _loc2_:* = param1.blur;
         blurEffect(param1,Math.min(_loc2_,25),Math.min(_loc2_,25));
      }
      
      public function get initScale() : Number
      {
         return this._initScale;
      }
      
      public function get blurQuality() : Number
      {
         return this._blurQuality;
      }
      
      public function get groupSize() : Number
      {
         return this._groupSize;
      }
      
      public function get blurAmount() : Number
      {
         return this._blurAmount;
      }
      
      public function get alphaPercentage() : Number
      {
         return this._alphaPercentage;
      }
      
      public function set blurQuality(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._blurQuality = param1;
      }
      
      private function startTween(param1:*, param2:*, param3:*, param4:*, param5:*) : *
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:* = undefined;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:* = undefined;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         var _loc6_:* = param2;
         if(transitionType == "show")
         {
            _loc7_ = 1;
            _loc6_.alpha = 0;
            _loc8_ = param1;
            _loc6_.prop = 0;
            _loc9_ = 1;
         }
         else
         {
            _loc7_ = 0;
            _loc6_.alpha = 1;
            _loc8_ = param1 + this.groupDuration - this.groupDuration * this.alphaPercentage / 100;
            _loc6_.prop = 1;
            _loc9_ = 0;
         }
         if(!_loc6_.lastProp)
         {
            _loc6_.lastProp = _loc6_.prop;
            _loc10_ = {};
            _loc10_.el = param2;
            _loc10_.i = param3;
            _loc10_.j = param4;
            _loc11_ = transitionType == "show"?blurAmount:0;
            _loc12_ = transitionType == "show"?0:blurAmount;
            _loc13_ = transitionType == "show"?initScale:1;
            _loc14_ = transitionType == "show"?1:initScale;
            _loc6_.blur = _loc11_;
            _loc6_.scaleX = _loc13_;
            _loc6_.scaleY = _loc13_;
            if(_loc8_ < 0)
            {
               _loc8_ = 0;
            }
            if(param1 < 0)
            {
               param1 = 0;
            }
            TweenLite.killTweensOf(_loc6_,true);
            TweenLite.to(_loc6_,this.groupDuration,{
               "prop":_loc9_,
               "scaleX":_loc14_,
               "scaleY":_loc14_,
               "blur":_loc12_,
               "overwrite":true,
               "delay":param1,
               "ease":this.easeFunc,
               "onComplete":motionFinish,
               "onCompleteParams":[_loc6_],
               "onUpdateParams":[_loc6_,param3,param4],
               "onUpdate":motionChange,
               "overwrite":true
            });
            TweenLite.to(_loc6_,this.groupDuration * this.alphaPercentage / 100,{
               "alpha":_loc7_,
               "overwrite":false,
               "delay":_loc8_
            });
         }
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      public function set initScale(param1:Number) : void
      {
         this._initScale = param1;
      }
      
      public function set alphaPercentage(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > 100)
         {
            param1 = 100;
         }
         this._alphaPercentage = param1;
      }
      
      public function set groupSize(param1:Number) : void
      {
         this._groupSize = param1;
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition("hide");
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      public function set alignment(param1:String) : void
      {
         this._alignment = param1;
      }
      
      public function set blurAmount(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0.8;
         }
         this._blurAmount = param1;
      }
      
      protected function startTransition(param1:String) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:Object = null;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc9_:Number = NaN;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         var _loc15_:* = undefined;
         var _loc16_:* = undefined;
         var _loc17_:* = undefined;
         var _loc18_:Point = null;
         var _loc19_:* = undefined;
         var _loc20_:* = undefined;
         tweensFinished = 0;
         endEvent = false;
         transitionType = param1;
         var _loc2_:Number = Number(Number(this.preset)) || Number(12);
         var _loc3_:String = "chars";
         if(_loc2_ > 9)
         {
            if(_loc2_ < 19)
            {
               _loc3_ = "words";
               _loc2_ = _loc2_ - 9;
            }
            else if(_loc2_ < 22)
            {
               _loc3_ = "lines";
               isLines = true;
               _loc2_ = _loc2_ + 7;
            }
            else if(_loc2_ < 38)
            {
               _loc3_ = "chars";
               _loc2_ = _loc2_ - 12;
            }
            else if(_loc2_ < 54)
            {
               _loc3_ = "words";
               _loc2_ = _loc2_ - 28;
            }
            else if(_loc2_ < 56)
            {
               _loc3_ = "lines";
               isLines = true;
               _loc2_ = _loc2_ - 25;
            }
            else if(_loc2_ < 57)
            {
               _loc3_ = "chars";
            }
            else if(_loc2_ < 58)
            {
               _loc3_ = "words";
            }
            else
            {
               _loc3_ = "lines";
               isLines = true;
            }
         }
         setOrientation();
         this.component.drawTextTable(_loc3_,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         objMatrix = this.component.absMatrix;
         if(_loc2_ < 54)
         {
            presetObject = JFETPreset.getPresetsArray(_loc2_,objMatrix);
         }
         else
         {
            presetObject = JTXTERandomPreset.getPresetsArray(1,objMatrix,groupSize);
         }
         timeMatrix = presetObject.timeMatrix;
         maxItems = this.component.textTable.childs.length;
         if(presetObject.maxItems > 1)
         {
            _loc14_ = Math.max((this.tweenDuration - this.groupDuration) / (presetObject.maxItems - 1),0);
         }
         else
         {
            _loc14_ = 0;
         }
         owner.elements = [];
         parseGroups();
         var _loc12_:* = timeMatrix.length;
         _loc13_ = 0;
         while(_loc13_ < _loc12_)
         {
            col = timeMatrix[_loc13_].length;
            owner.elements[_loc13_] = [];
            _loc15_ = !isLines?_loc13_:0;
            j = 0;
            while(j < col)
            {
               _loc6_ = !isLines?j:_loc13_;
               _loc7_ = !isLines?_loc13_:j;
               _loc8_ = !isLines?col:_loc12_;
               _loc9_ = !isLines?Number(_loc12_):Number(col);
               _loc5_ = owner.elements[_loc13_][j] = {};
               _loc5_.clip = objMatrix[_loc13_][j];
               _loc5_.clip.i = _loc13_;
               if(_loc6_ != 0)
               {
                  _loc11_ = !isLines?objMatrix[_loc13_]:objMatrix;
                  if(alignment == "left" || alignment == "top")
                  {
                     _loc5_.clip.face.difX = _loc5_.clip.face[axe1] - (_loc4_[axe1] + _loc4_[dim1]);
                  }
                  if(alignment == "right" || alignment == "bottom")
                  {
                     _loc4_.difX = owner["clip" + _loc13_ + "_" + j][axe1] - (_loc4_[axe1] + _loc4_[dim1]);
                     _loc10_ = !isLines?objMatrix[_loc13_][_loc8_ - 1].face:objMatrix[_loc8_ - 1][j].face;
                     _loc11_.isMoving = false;
                  }
                  if(alignment == "center" || alignment == "middle")
                  {
                     if(owner["clip" + _loc13_ + "_" + j][axe1] <= mij)
                     {
                        _loc4_.difX = owner["clip" + _loc13_ + "_" + j][axe1] - (_loc4_[axe1] + _loc4_[dim1]);
                        _loc4_.position = "left";
                     }
                     else
                     {
                        owner["clip" + _loc13_ + "_" + j].difX = owner["clip" + _loc13_ + "_" + j][axe1] - (_loc4_[axe1] + _loc4_[dim1]);
                        owner["clip" + _loc13_ + "_" + j].position = "right";
                     }
                     if(_loc5_.clip.face[axe1] <= mij && _loc5_.clip.face[axe1] + _loc5_.clip.face[dim1] >= mij)
                     {
                        owner["clip" + _loc13_ + "_" + j].isMoving = false;
                        owner["clip" + _loc13_ + "_" + j].position = "right";
                        owner["clip" + _loc13_ + "_" + j].difX = owner["clip" + _loc13_ + "_" + j][axe1] - (_loc4_[axe1] + _loc4_[dim1]);
                     }
                  }
                  _loc5_.clip.face.prevChild = _loc4_;
                  if(_loc6_ <= _loc8_ - 1)
                  {
                     _loc5_.clip.face.prevChild.nextChild = _loc5_.clip.face;
                  }
                  if(_loc6_ == _loc8_ - 1)
                  {
                     _loc5_.clip.face.pos = _loc5_.clip.face[axe1] + _loc5_.clip.face[dim1];
                  }
               }
               else if(_loc5_.clip.face[axe1] <= mij && _loc5_.clip.face[axe1] + _loc5_.clip.face[dim1] >= mij)
               {
                  owner["clip" + _loc13_ + "_" + j].isMoving = false;
                  owner["clip" + _loc13_ + "_" + j].position = "right";
                  owner["clip" + _loc13_ + "_" + j].difX = owner["clip" + _loc13_ + "_" + j][axe1] - (_loc4_[axe1] + _loc4_[dim1]);
               }
               _loc4_ = _loc5_.clip.face;
               j++;
            }
            _loc13_++;
         }
         owner.maxItems = presetObject.maxItems;
         _loc13_ = 0;
         while(_loc13_ < timeMatrix.length)
         {
            owner.elements[_loc13_] = [];
            _loc16_ = 0;
            while(_loc16_ < timeMatrix[_loc13_].length)
            {
               _loc17_ = objMatrix[_loc13_][_loc16_];
               _loc18_ = new Point();
               _loc18_ = _loc17_.localToGlobal(_loc18_);
               _loc17_.xInit = _loc18_.x;
               _loc17_.yInit = _loc18_.y;
               _loc5_ = owner.elements[_loc13_][_loc16_] = {};
               _loc5_.clip = objMatrix[_loc13_][_loc16_];
               _loc19_ = transitionType == "show"?initScale:1;
               _loc5_.clip.face.scaleX = _loc5_.clip.face.scaleY = _loc19_;
               _loc5_.clip.face.setPosition();
               _loc20_ = timeMatrix[_loc13_][_loc16_] * owner.delay * 1000;
               _loc20_ = !!isNaN(_loc20_)?0:_loc20_;
               startTween(timeMatrix[_loc13_][_loc16_] * _loc14_,_loc5_.clip.face,_loc13_,_loc16_,timeMatrix[_loc13_][_loc16_]);
               _loc16_++;
            }
            _loc13_++;
         }
      }
      
      function blurEffect(param1:*, param2:Number, param3:Number, param4:* = 3) : *
      {
         param4 = this._blurQuality;
         var _loc5_:BlurFilter = new BlurFilter(param2,param3,param4);
         var _loc6_:Array = new Array();
         _loc6_.push(_loc5_);
         param1.filters = _loc6_;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      protected function clearProperties() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         var _loc3_:Object = null;
         if(owner.elements)
         {
            objMatrix = this.component.absMatrix;
            _loc1_ = owner.elements.length;
            i = 0;
            while(i < _loc1_)
            {
               _loc2_ = owner.elements[i].length;
               j = 0;
               while(j < _loc2_)
               {
                  _loc3_ = owner.elements[i][j];
                  _loc3_.clip = objMatrix[i][j];
                  TweenLite.killTweensOf(_loc3_.clip.face,false);
                  if(owner["clip" + i + "_" + j])
                  {
                     if(this.component.targetOwner.contains(owner["clip" + i + "_" + j]))
                     {
                        if(owner["clip" + i + "_" + j].contains(_loc3_.clip))
                        {
                           owner["clip" + i + "_" + j].removeChild(_loc3_.clip);
                           this.component.targetOwner.removeChild(owner["clip" + i + "_" + j]);
                           _loc3_.clip.__parent.addChild(_loc3_.clip);
                           owner["clip" + i + "_" + j] = null;
                           _loc3_.clip[axe1] = _loc3_.clip.__x;
                           _loc3_.clip[axe2] = _loc3_.clip.__y;
                           _loc3_.clip.visible = transitionType == "show";
                        }
                     }
                  }
                  j++;
               }
               i++;
            }
         }
         if(endEvent == true)
         {
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = param1;
      }
      
      function motionFinish(param1:*) : *
      {
         tweensFinished++;
         param1.filters = [];
         if(transitionType == "hide")
         {
            param1.visible = false;
         }
         if(tweensFinished == maxItems)
         {
            endEvent = true;
            remove();
         }
      }
      
      public function get alignment() : String
      {
         return this._alignment;
      }
      
      function parseGroups() : *
      {
         var _loc1_:Object = null;
         i = 0;
         while(i < timeMatrix.length)
         {
            col = timeMatrix[i].length;
            owner.elements[i] = [];
            j = 0;
            while(j < col)
            {
               _loc1_ = owner.elements[i][j] = {};
               _loc1_.clip = objMatrix[i][j];
               _loc1_.clip.__x = _loc1_.clip[axe1];
               _loc1_.clip.__y = _loc1_.clip[axe2];
               _loc1_.clip.__parent = _loc1_.clip.parent;
               owner["clip" + i + "_" + j] = new JScaleElement();
               owner["clip" + i + "_" + j].isLines = isLines;
               owner["clip" + i + "_" + j].alias = _loc1_.clip;
               owner["clip" + i + "_" + j].addChild(_loc1_.clip);
               owner["clip" + i + "_" + j].init();
               _loc1_.clip[axe1] = 0;
               _loc1_.clip[axe2] = -_loc1_.clip[dim2] / 2;
               owner["clip" + i + "_" + j][axe1] = _loc1_.clip.__x;
               owner["clip" + i + "_" + j][axe2] = _loc1_.clip.__y + _loc1_.clip[dim2] / 2;
               owner["clip" + i + "_" + j].alpha = transitionType == "show"?0:1;
               owner["clip" + i + "_" + j].align = alignment;
               _loc1_.clip.face = owner["clip" + i + "_" + j];
               this.component.targetOwner.addChild(_loc1_.clip.face);
               j++;
            }
            i++;
         }
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition("show");
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
   }
}
