package com.jumpeye.transitions.plugins
{
   import com.jumpeye.transitions.TweenLite;
   import com.jumpeye.transitions.utils.tween.TweenInfo;
   import fl.motion.Color;
   import flash.display.DisplayObject;
   import flash.geom.ColorTransform;
   
   public class CustomTintPlugin extends TweenPlugin
   {
      
      public static const VERSION:Number = 1;
      
      public static const API:Number = 1;
      
      protected static var _props:Array = ["redMultiplier","greenMultiplier","blueMultiplier","alphaMultiplier","redOffset","greenOffset","blueOffset","alphaOffset"];
       
      
      protected var _color:Color;
      
      protected var _tintMultiplier:Number = 0;
      
      protected var _target:DisplayObject;
      
      protected var _matrix:Array;
      
      protected var _matrixTween:EndArrayPlugin;
      
      public function CustomTintPlugin()
      {
         super();
         this.propName = "customTint";
         this.overwriteProps = ["customTint"];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         if(!(param1 is DisplayObject))
         {
            return false;
         }
         var _loc4_:Object = param2;
         var _loc5_:Color = new Color();
         var _loc6_:ColorTransform = (param1 as DisplayObject).transform.colorTransform;
         this._color = new Color(_loc6_.redMultiplier,_loc6_.greenMultiplier,_loc6_.blueMultiplier,_loc6_.alphaMultiplier,_loc6_.redOffset,_loc6_.greenOffset,_loc6_.blueOffset,_loc6_.alphaOffset);
         var _loc7_:Number = _loc4_.amount;
         if(isNaN(_loc7_))
         {
            _loc7_ = 1;
         }
         _loc5_.setTint(uint(_loc4_.tintColor) || uint(this._color.tintColor),_loc7_);
         this.init(param1 as DisplayObject,_loc5_);
         return true;
      }
      
      public function init(param1:DisplayObject, param2:Color) : void
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         this._target = param1;
         _loc3_ = _props.length - 1;
         while(_loc3_ > -1)
         {
            _loc4_ = _props[_loc3_];
            if(this._color[_loc4_] != param2[_loc4_])
            {
               _tweens[_tweens.length] = new TweenInfo(this._color,_loc4_,this._color[_loc4_],param2[_loc4_] - this._color[_loc4_],"customTint",true);
            }
            _loc3_--;
         }
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         updateTweens(param1);
         this._target.transform.colorTransform = this._color;
      }
   }
}
