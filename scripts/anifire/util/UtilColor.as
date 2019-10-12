package anifire.util
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   
   public class UtilColor
   {
       
      
      public function UtilColor()
      {
         super();
      }
      
      public static function setRGB(param1:Sprite, param2:uint = 4.294967295E9) : void
      {
         var _loc3_:ColorTransform = new ColorTransform();
         if(param2 != uint.MAX_VALUE)
         {
            _loc3_.color = param2;
         }
         param1.transform.colorTransform = _loc3_;
      }
      
      public static function getRGB(param1:Sprite) : uint
      {
         return param1.transform.colorTransform.color;
      }
      
      public static function getRGBstr(param1:Sprite) : String
      {
         var _loc2_:String = param1.transform.colorTransform.color.toString(16);
         var _loc3_:int = 6 - _loc2_.length;
         while(_loc3_--)
         {
            _loc2_ = "0" + _loc2_;
         }
         _loc2_ = "0x" + _loc2_;
         return _loc2_;
      }
      
      public static function setRGB2(param1:Sprite, param2:uint, param3:uint, param4:uint) : void
      {
         var _loc5_:uint = param2 << 16 | param3 << 8 | param4;
         setRGB(param1,_loc5_);
      }
      
      public static function getRGB2(param1:Sprite) : Object
      {
         var _loc2_:ColorTransform = param1.transform.colorTransform;
         return {
            "r":_loc2_.redOffset,
            "g":_loc2_.greenOffset,
            "b":_loc2_.blueOffset
         };
      }
      
      public static function reset(param1:Sprite) : void
      {
         param1.transform.colorTransform = new ColorTransform();
      }
      
      public static function setBrightness(param1:Sprite, param2:uint) : void
      {
         var mc:Sprite = param1;
         var bright:uint = param2;
         var trans:ColorTransform = mc.transform.colorTransform;
         with(_loc4_)
         {
            
            redMultiplier = greenMultiplier = blueMultiplier = (100 - Math.abs(bright)) / 100;
            redOffset = greenOffset = blueOffset = bright > 0?bright * (256 / 100):0;
         }
         mc.transform.colorTransform = trans;
      }
      
      public static function setBrightOffset(param1:Sprite, param2:uint) : void
      {
         var mc:Sprite = param1;
         var offset:uint = param2;
         var trans:ColorTransform = mc.transform.colorTransform;
         with(trans)
         {
            
            redOffset = greenOffset = blueOffset = offset;
         }
         mc.transform.colorTransform = trans;
      }
      
      public static function setTint(param1:Sprite, param2:uint, param3:uint, param4:uint, param5:uint) : void
      {
         var mc:Sprite = param1;
         var r:uint = param2;
         var g:uint = param3;
         var b:uint = param4;
         var percent:uint = param5;
         var per:Number = percent / 100;
         var trans:ColorTransform = mc.transform.colorTransform;
         with(trans)
         {
            
            redOffset = per * redOffset;
            greenOffset = per * greenOffset;
            blueOffset = per * blueOffset;
            redMultiplier = greenMultiplier = blueMultiplier = (100 - percent) / 100;
         }
         mc.transform.colorTransform = trans;
      }
      
      public static function getTint(param1:Sprite) : Object
      {
         var _loc2_:ColorTransform = param1.transform.colorTransform;
         var _loc3_:Object = new Object();
         _loc3_.percent = (1 - _loc2_.redMultiplier) * 100;
         var _loc4_:Number = 100 / _loc3_.percent;
         _loc3_.r = Math.round(_loc4_ * _loc2_.redOffset);
         _loc3_.g = Math.round(_loc4_ * _loc2_.greenOffset);
         _loc3_.b = Math.round(_loc4_ * _loc2_.blueOffset);
         return _loc3_;
      }
      
      public static function setTintOffset(param1:Sprite, param2:uint, param3:uint, param4:uint) : void
      {
         var mc:Sprite = param1;
         var r:uint = param2;
         var g:uint = param3;
         var b:uint = param4;
         var trans:ColorTransform = mc.transform.colorTransform;
         with(trans)
         {
            
            redOffset = r;
            greenOffset = g;
            blueOffset = b;
         }
         mc.transform.colorTransform = trans;
      }
      
      public static function getTintOffset(param1:Sprite) : Object
      {
         var _loc2_:ColorTransform = param1.transform.colorTransform;
         var _loc3_:Object = new Object();
         _loc3_.rb = _loc2_.redOffset;
         _loc3_.gb = _loc2_.greenOffset;
         _loc3_.bb = _loc2_.blueOffset;
         return _loc3_;
      }
      
      public static function invert(param1:Sprite) : void
      {
         var mc:Sprite = param1;
         var trans:ColorTransform = mc.transform.colorTransform;
         with(trans)
         {
            
            redMultiplier = -redMultiplier;
            greenMultiplier = -greenMultiplier;
            blueMultiplier = -blueMultiplier;
            redOffset = 255 - redOffset;
            greenOffset = 255 - greenOffset;
            blueOffset = 255 - blueOffset;
         }
         mc.transform.colorTransform = trans;
      }
      
      public static function setNegative(param1:Sprite, param2:Number) : void
      {
         var mc:Sprite = param1;
         var percent:Number = param2;
         var trans:ColorTransform = mc.transform.colorTransform;
         with(trans)
         {
            
            redMultiplier = greenMultiplier = blueMultiplier = (100 - 2 * percent) / 100;
            redOffset = greenOffset = blueOffset = percent * (255 / 100);
         }
         mc.transform.colorTransform = trans;
      }
      
      public static function getNegative(param1:Sprite) : Number
      {
         var _loc2_:ColorTransform = param1.transform.colorTransform;
         return _loc2_.redOffset * (100 / 255);
      }
      
      public static function setRed(param1:Sprite, param2:uint) : void
      {
         var _loc3_:ColorTransform = param1.transform.colorTransform;
         var _loc4_:uint = param2 << 16 | _loc3_.greenOffset << 8 | _loc3_.blueOffset;
         setRGB(param1,_loc4_);
      }
      
      public static function setGreen(param1:Sprite, param2:uint) : void
      {
         var _loc3_:ColorTransform = param1.transform.colorTransform;
         var _loc4_:uint = _loc3_.redOffset << 16 | param2 << 8 | _loc3_.blueOffset;
         setRGB(param1,_loc4_);
      }
      
      public static function setBlue(param1:Sprite, param2:uint) : void
      {
         var _loc3_:ColorTransform = param1.transform.colorTransform;
         var _loc4_:uint = _loc3_.redOffset << 16 | _loc3_.greenOffset << 8 | param2;
         setRGB(param1,_loc4_);
      }
      
      public static function getRed(param1:Sprite) : uint
      {
         return param1.transform.colorTransform.redOffset;
      }
      
      public static function getGreen(param1:Sprite) : uint
      {
         return param1.transform.colorTransform.greenOffset;
      }
      
      public static function getBlue(param1:Sprite) : uint
      {
         return param1.transform.colorTransform.blueOffset;
      }
      
      public static function setAssetPartColor(param1:DisplayObject, param2:String, param3:uint = 4.294967295E9) : uint
      {
         var _loc5_:int = 0;
         var _loc6_:Sprite = null;
         var _loc7_:ColorTransform = null;
         var _loc4_:Array = new Array();
         _loc4_ = UtilPlain.getColorItem(param1,param2);
         if(_loc4_.length > 0)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc6_ = Sprite(_loc4_[_loc5_]);
               if(param3 == uint.MAX_VALUE)
               {
                  _loc7_ = new ColorTransform();
                  _loc6_.transform.colorTransform = _loc7_;
               }
               else
               {
                  setRGB(_loc6_,param3);
               }
               _loc5_++;
            }
         }
         return _loc4_.length;
      }
      
      public static function resetAssetPartsColor(param1:DisplayObject) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Sprite = null;
         var _loc7_:ColorTransform = null;
         var _loc2_:Array = new Array();
         _loc2_ = UtilPlain.getColorItem(param1);
         if(_loc2_.length > 0)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc2_.length)
            {
               _loc6_ = Sprite(_loc2_[_loc5_]);
               _loc7_ = new ColorTransform();
               _loc6_.transform.colorTransform = _loc7_;
               _loc5_++;
            }
         }
         var _loc3_:Array = UtilPlain.getAllShaderObj(param1);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            DisplayObject(_loc3_[_loc4_]).visible = false;
            _loc4_++;
         }
      }
   }
}
