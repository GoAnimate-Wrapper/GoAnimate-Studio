package com.jumpeye.flashEff2.text.stationPanels
{
   import com.jumpeye.Events.FLASHEFFEvents;
   import com.jumpeye.Events.JEvent;
   import com.jumpeye.core.JUIComponent;
   import com.jumpeye.flashEff2.core.interfaces.IFlashEffText;
   import com.jumpeye.flashEff2.text.patternsPresets.JFETPreset;
   import com.jumpeye.transitions.TweenLite;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class FETStationPanels extends IFlashEffText
   {
       
      
      private var container:Sprite;
      
      private var bmp:BitmapData;
      
      private var bit:BitmapData;
      
      private var ptRIn;
      
      private var objMatrix:Array;
      
      private var ptROut;
      
      private var superChars:Array;
      
      private var finalY:Number;
      
      private var _initialCharacter:String = "";
      
      private var transitionType:String;
      
      private var lineCollection:Array;
      
      private var _groupDuration:Number = 1;
      
      protected var owner:Object;
      
      private var _blurAmount:Number = 30;
      
      private var ptR;
      
      private var angle:Number;
      
      private var ptX;
      
      public var childs:Array;
      
      private var _blurQuality:Number = 2;
      
      public var chars;
      
      private var prop:Number = 0;
      
      private var _preset:Number = 1;
      
      public function FETStationPanels(param1:JUIComponent = null)
      {
         chars = ["0","1","2","3","4","5","6","7","8","9","A","a","B","b","C","c","D","d","E","e","F","f","G","g","H","h","I","i","J","j","K","k","L","l","M","m","N","n","O","o","P","p","Q","q","R","r","S","s","T","t","U","u","V","v","W","w","X","x","Y","y","Z","z"];
         super();
         this.component = param1;
         this.init();
      }
      
      override public function remove() : void
      {
         this.clearProperties();
      }
      
      protected function init() : void
      {
         _tweenDuration = 2;
         _easeType = "easeOut";
         _tweenType = "Quadratic";
         this.owner = {};
      }
      
      public function set initialCharacter(param1:String) : void
      {
         _initialCharacter = param1;
      }
      
      private function checkChar(param1:String, param2:TextFormat = null) : int
      {
         var _loc4_:* = undefined;
         var _loc3_:* = -1;
         for(_loc4_ in superChars)
         {
            if(superChars[_loc4_].ch == param1)
            {
               _loc3_ = _loc4_;
               break;
            }
         }
         return _loc3_;
      }
      
      public function get blurAmount() : Number
      {
         return _blurAmount;
      }
      
      private function onTweenComplete(param1:JEvent) : void
      {
         owner.tweensFinished++;
         var _loc2_:* = param1.target;
         if(transitionType == "show")
         {
            _loc2_.alias.visible = true;
         }
         _loc2_.destroy();
         _loc2_.removeEventListener("onTweenComplete",onTweenComplete);
         component.targetOwner.removeChild(_loc2_);
         _loc2_ = null;
         if(owner.tweensNumber == owner.tweensFinished)
         {
            clearProperties();
            this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_END));
         }
      }
      
      function randRange(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = Math.floor(Math.random() * (param2 - param1 + 1)) + param1;
         return _loc3_;
      }
      
      private function getBitmap() : BitmapData
      {
         var _loc1_:* = undefined;
         var _loc2_:BitmapData = null;
         finalY = 0;
         childs = [];
         container = new Sprite();
         component.targetOwner.addChild(container);
         for(_loc1_ in superChars)
         {
            this.addTextField(superChars[_loc1_]);
         }
         _loc2_ = new BitmapData(Math.min(container.width,2880),Math.min(container.height,2880),true,0);
         _loc2_.draw(container);
         container.visible = false;
         return _loc2_;
      }
      
      public function get groupDuration() : Number
      {
         return this._groupDuration;
      }
      
      private function addTextField(param1:*) : void
      {
         var _loc2_:* = new TextField();
         _loc2_.autoSize = TextFieldAutoSize.LEFT;
         _loc2_.embedFonts = true;
         _loc2_.selectable = false;
         _loc2_.htmlText = param1.ch;
         _loc2_.setTextFormat(param1.tf);
         container.addChild(_loc2_);
         childs.push({
            "tx":_loc2_,
            "y":finalY,
            "char":param1.ch
         });
         _loc2_.y = finalY;
         finalY = finalY + _loc2_.height;
      }
      
      public function set preset(param1:Number) : void
      {
         this._preset = param1;
      }
      
      override public function hide() : void
      {
         if(this.component != null)
         {
            this.startTransition(false);
         }
      }
      
      public function get initialCharacter() : String
      {
         return _initialCharacter;
      }
      
      public function set blurAmount(param1:Number) : void
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
         param1 = param1;
         this._blurAmount = param1;
      }
      
      public function get preset() : Number
      {
         return this._preset;
      }
      
      private function checkDictionary() : void
      {
         var _loc3_:uint = 0;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         var _loc6_:* = undefined;
         var _loc7_:* = undefined;
         var _loc8_:* = undefined;
         var _loc1_:uint = objMatrix.length;
         var _loc2_:* = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = objMatrix[_loc2_].length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = objMatrix[_loc2_][_loc4_];
               _loc6_ = _loc5_.textField.text;
               _loc7_ = _loc5_.textField.getTextFormat();
               _loc8_ = checkChar(_loc6_,_loc7_);
               if(_loc8_ == -1)
               {
                  superChars.push({
                     "ch":_loc6_,
                     "tf":_loc7_
                  });
               }
               _loc4_++;
            }
            _loc2_++;
         }
         if(initialCharacter)
         {
            if(!checkChar(initialCharacter))
            {
               superChars.push(initialCharacter);
            }
         }
      }
      
      public function set groupDuration(param1:Number) : void
      {
         if(param1 < 0.001)
         {
            param1 = 0.001;
         }
         this._groupDuration = Number(Number(param1)) || Number(1);
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
      }
      
      protected function startTransition(param1:Boolean = true) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         var _loc5_:* = undefined;
         var _loc6_:uint = 0;
         var _loc8_:String = null;
         var _loc11_:uint = 0;
         var _loc12_:Object = null;
         var _loc13_:* = undefined;
         var _loc14_:* = undefined;
         transitionType = !!param1?"show":"hide";
         superChars = [];
         var _loc7_:Number = Number(Number(this.preset)) || Number(9);
         if(Number(_loc7_) > 9)
         {
            _loc7_ = 9;
         }
         _loc7_ = Math.max(1,_loc7_);
         _loc8_ = "chars";
         this.component.drawTextTable(_loc8_,this.partialGroup,this.partialPercent,this.selectedStrings,this.partialStart,this.partialBlurAmount);
         objMatrix = this.component.absMatrix;
         _loc4_ = JFETPreset.getPresetsArray(_loc7_,objMatrix);
         _loc3_ = _loc4_.timeMatrix;
         owner.maxItems = _loc4_.maxItems;
         owner.tweensFinished = 0;
         _loc2_ = objMatrix.length;
         owner.tweensNumber = this.component.textTable.childs.length;
         if(owner.maxItems <= 1)
         {
            owner.delay = 0;
         }
         else
         {
            owner.delay = Math.max((this.tweenDuration - this.groupDuration) / (owner.maxItems - 1),0);
         }
         owner.elements = [];
         lineCollection = [];
         var _loc9_:* = objMatrix[0][0];
         var _loc10_:* = _loc9_.textField.getTextFormat();
         for(_loc5_ in chars)
         {
            superChars.push({
               "ch":chars[_loc5_],
               "tf":_loc10_
            });
         }
         this.checkDictionary();
         bit = getBitmap();
         _loc5_ = 0;
         while(_loc5_ < _loc2_)
         {
            _loc11_ = objMatrix[_loc5_].length;
            owner.elements[_loc5_] = [];
            lineCollection[_loc5_] = [];
            _loc6_ = 0;
            while(_loc6_ < _loc11_)
            {
               _loc12_ = owner.elements[_loc5_][_loc6_] = {};
               _loc12_.clip = objMatrix[_loc5_][_loc6_];
               _loc12_.clip.visible = false;
               _loc13_ = new JCharLine();
               _loc13_.blurFactor = blurAmount;
               _loc13_.alias = _loc12_.clip;
               _loc13_.addEventListener("onTweenComplete",onTweenComplete,false,0,true);
               component.targetOwner.addChild(_loc13_);
               _loc13_.textFormat = _loc12_.clip.textField.getTextFormat();
               if(transitionType == "show")
               {
                  _loc13_.primalKey = _loc12_.clip.textField.text;
               }
               else
               {
                  _loc13_.primalKey = !!initialCharacter?initialCharacter:chars[randRange(0,chars.length - 1)];
               }
               _loc13_.maskWidth = _loc12_.clip.width + 2;
               _loc13_.maskHeight = _loc12_.clip.height;
               if(transitionType == "show")
               {
                  _loc13_.firstKey = !!initialCharacter?initialCharacter:chars[randRange(0,chars.length - 1)];
               }
               else
               {
                  _loc13_.firstKey = _loc12_.clip.textField.text;
               }
               _loc13_.create(bit,childs);
               lineCollection[_loc5_][_loc6_] = _loc13_;
               _loc13_.scaleX = target.scaleX;
               _loc13_.scaleY = target.scaleY;
               _loc13_.x = _loc12_.clip.x * target.scaleX;
               _loc13_.y = _loc12_.clip.y * target.scaleY;
               _loc13_.alpha = transitionType == "show"?0:1;
               _loc14_ = transitionType == "show"?1:0;
               TweenLite.to(_loc13_,this.groupDuration,{
                  "alpha":_loc14_,
                  "delay":_loc3_[_loc5_][_loc6_] * owner.delay,
                  "overwrite":true
               });
               _loc13_.scrollPrimal(this.groupDuration,{
                  "delay":_loc3_[_loc5_][_loc6_] * owner.delay,
                  "ease":easeFunc
               });
               _loc6_++;
            }
            _loc5_++;
         }
         this.component.dispatchEvent(new FLASHEFFEvents(FLASHEFFEvents.TRANSITION_START));
      }
      
      override public function show() : void
      {
         if(this.component != null)
         {
            this.startTransition(true);
         }
      }
   }
}
