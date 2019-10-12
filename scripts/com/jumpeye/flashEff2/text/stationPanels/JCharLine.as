package com.jumpeye.flashEff2.text.stationPanels
{
   import com.jumpeye.Events.JEvent;
   import com.jumpeye.transitions.TweenLite;
   import com.jumpeye.utils.JArray;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   import flash.geom.Matrix;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.clearInterval;
   
   public class JCharLine extends Sprite
   {
       
      
      private var container:Sprite;
      
      public var textFormat:TextFormat;
      
      private var di:Number;
      
      private var tweenObj:Object;
      
      private var bit:BitmapData;
      
      public var firstKey:String;
      
      public var blurFactor:Number = 3;
      
      private var bitLine;
      
      private var finalY:Number;
      
      public var maskWidth;
      
      public var primalKey;
      
      public var alias;
      
      public var maskHeight:Number;
      
      private var inte:Number;
      
      public var childs:Array;
      
      public var chars;
      
      private var d;
      
      private var maske:Shape;
      
      public function JCharLine()
      {
         chars = ["A","a","B","b","C","c","D","d","E","e","F","f","G","g","H","h","I","i","J","j","K","k","L","l","M","m","N","n","O","o","P","p","Q","q","R","r","S","s","T","t","U","u","V","v","W","w","X","x","Y","y","Z","z"];
         super();
      }
      
      private function getIndexOf(param1:*) : int
      {
         var _loc3_:* = undefined;
         var _loc2_:int = -1;
         for(_loc3_ in chars)
         {
            if(chars[_loc3_].ch == param1)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         return _loc2_;
      }
      
      public function createChildren(param1:*) : void
      {
         var _loc4_:* = undefined;
         if(blurFactor == 0)
         {
            blurFactor = 0.01;
         }
         this.chars = param1;
         finalY = 0;
         childs = [];
         container = new Sprite();
         this.addChild(container);
         maske = new Shape();
         maske.graphics.beginFill(3368601,0.5);
         maske.graphics.drawRect(0,0,maskWidth,maskHeight);
         maske.graphics.endFill();
         var _loc2_:* = getIndexOf(primalKey);
         if(_loc2_ == -1)
         {
            param1.push(primalKey);
            _loc2_ = getIndexOf(primalKey);
         }
         var _loc3_:* = getIndexOf(firstKey);
         if(_loc3_ == -1)
         {
            param1.push(firstKey);
            _loc3_ = getIndexOf(firstKey);
         }
         if(_loc2_ > _loc3_)
         {
            d = _loc2_ - _loc3_;
            di = param1.length - _loc2_ + _loc3_;
            if(di < d)
            {
               param1 = JArray.shift(param1,"right",di);
            }
         }
         else
         {
            d = _loc3_ - _loc2_;
            di = param1.length - _loc3_ + _loc2_;
            if(di < d)
            {
               param1 = JArray.shift(param1,"left",di);
            }
         }
         for(_loc4_ in param1)
         {
            this.addTextField(param1[_loc4_]);
         }
         bitLine = container as Sprite;
         setKey(firstKey);
         container.mask = maske;
         this.addChild(maske);
      }
      
      public function setKey(param1:*) : void
      {
         bitLine.y = -getChar(param1).y;
      }
      
      private function makeTween(param1:*, param2:*, param3:*) : void
      {
      }
      
      private function addTextField(param1:*) : void
      {
         var _loc2_:* = new TextField();
         _loc2_.autoSize = TextFieldAutoSize.LEFT;
         _loc2_.embedFonts = true;
         _loc2_.selectable = false;
         _loc2_.text = param1.ch;
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
      
      function colorGradient(param1:Shape, param2:*, param3:*, param4:*, param5:*, param6:*, param7:*, param8:*, param9:*, param10:*) : *
      {
         param1.graphics.clear();
         var _loc11_:String = param4;
         var _loc12_:Array = param5;
         var _loc13_:Array = param6;
         var _loc14_:Array = param7;
         var _loc15_:Matrix = new Matrix();
         _loc15_.createGradientBox(param2,param3,param8,param9,param10);
         var _loc16_:String = "pad";
         param1.graphics.beginGradientFill(_loc11_,_loc12_,_loc13_,_loc14_,_loc15_,_loc16_);
      }
      
      private function onUpdateTween() : void
      {
         var _loc3_:* = undefined;
         bitLine.y = Math.floor(tweenObj.position);
         var _loc1_:* = Math.abs(Math.floor(tweenObj.finish - tweenObj.begin));
         var _loc2_:* = Math.abs(Math.floor(tweenObj.position - tweenObj.begin));
         if(blurFactor > 0)
         {
            _loc3_ = Math.abs(Math.abs(_loc2_ - _loc1_ / 2) - _loc1_ / 2) * blurFactor / 1000;
            bitLine.filters = [getBlur(_loc3_)];
         }
      }
      
      public function getChar(param1:*) : Object
      {
         var _loc2_:Object = null;
         var _loc3_:* = undefined;
         for(_loc3_ in childs)
         {
            if(childs[_loc3_].char == param1)
            {
               _loc2_ = childs[_loc3_];
               break;
            }
         }
         return _loc2_;
      }
      
      public function scroll(param1:*, param2:*, param3:*) : *
      {
         tweenObj = {};
         tweenObj.begin = bitLine.y;
         tweenObj.finish = -getChar(param1).y;
         tweenObj.position = tweenObj.begin;
         TweenLite.to(tweenObj,param2,{
            "position":tweenObj.finish,
            "delay":param3.delay,
            "onUpdate":onUpdateTween,
            "onComplete":onTweenFinished,
            "ease":param3.ease,
            "overwrite":false
         });
      }
      
      private function onTweenFinished() : void
      {
         dispatchEvent(new JEvent("onTweenComplete"));
      }
      
      private function getBlur(param1:*) : BitmapFilter
      {
         var _loc2_:* = new BlurFilter(0,param1,3);
         return _loc2_;
      }
      
      public function destroy() : void
      {
         this.removeChild(bitLine);
         childs = null;
         this.removeChild(maske);
         container.mask = null;
         clearInterval(inte);
         maske = null;
      }
      
      public function create(param1:BitmapData, param2:*) : void
      {
         this.bit = param1;
         this.childs = param2;
         container = new Sprite();
         this.addChild(container);
         maske = new Shape();
         maske.graphics.beginFill(3368601,0.5);
         maske.graphics.drawRect(0,0,maskWidth,maskHeight);
         maske.graphics.endFill();
         this.addChild(maske);
         bitLine = new Bitmap(param1);
         this.addChild(bitLine);
         setKey(firstKey);
         bitLine.mask = maske;
         this.addChild(maske);
      }
      
      public function scrollPrimal(param1:*, param2:*) : void
      {
         scroll(primalKey,param1,param2);
      }
   }
}
