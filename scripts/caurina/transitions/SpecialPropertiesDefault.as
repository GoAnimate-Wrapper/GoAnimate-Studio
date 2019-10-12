package caurina.transitions
{
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   import flash.geom.ColorTransform;
   import flash.media.SoundTransform;
   
   public class SpecialPropertiesDefault
   {
       
      
      public function SpecialPropertiesDefault()
      {
         super();
      }
      
      public static function init() : void
      {
         Tweener.registerSpecialProperty("_frame",frame_get,frame_set);
         Tweener.registerSpecialProperty("_sound_volume",_sound_volume_get,_sound_volume_set);
         Tweener.registerSpecialProperty("_sound_pan",_sound_pan_get,_sound_pan_set);
         Tweener.registerSpecialProperty("_color_ra",_color_property_get,_color_property_set,["redMultiplier"]);
         Tweener.registerSpecialProperty("_color_rb",_color_property_get,_color_property_set,["redOffset"]);
         Tweener.registerSpecialProperty("_color_ga",_color_property_get,_color_property_set,["greenMultiplier"]);
         Tweener.registerSpecialProperty("_color_gb",_color_property_get,_color_property_set,["greenOffset"]);
         Tweener.registerSpecialProperty("_color_ba",_color_property_get,_color_property_set,["blueMultiplier"]);
         Tweener.registerSpecialProperty("_color_bb",_color_property_get,_color_property_set,["blueOffset"]);
         Tweener.registerSpecialProperty("_color_aa",_color_property_get,_color_property_set,["alphaMultiplier"]);
         Tweener.registerSpecialProperty("_color_ab",_color_property_get,_color_property_set,["alphaOffset"]);
         Tweener.registerSpecialProperty("_autoAlpha",_autoAlpha_get,_autoAlpha_set);
         Tweener.registerSpecialPropertySplitter("_color",_color_splitter);
         Tweener.registerSpecialPropertySplitter("_colorTransform",_colorTransform_splitter);
         Tweener.registerSpecialPropertySplitter("_scale",_scale_splitter);
         Tweener.registerSpecialProperty("_blur_blurX",_filter_property_get,_filter_property_set,[BlurFilter,"blurX"]);
         Tweener.registerSpecialProperty("_blur_blurY",_filter_property_get,_filter_property_set,[BlurFilter,"blurY"]);
         Tweener.registerSpecialProperty("_blur_quality",_filter_property_get,_filter_property_set,[BlurFilter,"quality"]);
         Tweener.registerSpecialPropertySplitter("_filter",_filter_splitter);
         Tweener.registerSpecialPropertyModifier("_bezier",_bezier_modifier,_bezier_get);
      }
      
      public static function _color_splitter(param1:*, param2:Array) : Array
      {
         var _loc3_:Array = new Array();
         if(param1 == null)
         {
            _loc3_.push({
               "name":"_color_ra",
               "value":1
            });
            _loc3_.push({
               "name":"_color_rb",
               "value":0
            });
            _loc3_.push({
               "name":"_color_ga",
               "value":1
            });
            _loc3_.push({
               "name":"_color_gb",
               "value":0
            });
            _loc3_.push({
               "name":"_color_ba",
               "value":1
            });
            _loc3_.push({
               "name":"_color_bb",
               "value":0
            });
         }
         else
         {
            _loc3_.push({
               "name":"_color_ra",
               "value":0
            });
            _loc3_.push({
               "name":"_color_rb",
               "value":AuxFunctions.numberToR(param1)
            });
            _loc3_.push({
               "name":"_color_ga",
               "value":0
            });
            _loc3_.push({
               "name":"_color_gb",
               "value":AuxFunctions.numberToG(param1)
            });
            _loc3_.push({
               "name":"_color_ba",
               "value":0
            });
            _loc3_.push({
               "name":"_color_bb",
               "value":AuxFunctions.numberToB(param1)
            });
         }
         return _loc3_;
      }
      
      public static function _colorTransform_splitter(param1:*, param2:Array) : Array
      {
         var _loc3_:Array = new Array();
         if(param1 == null)
         {
            _loc3_.push({
               "name":"_color_ra",
               "value":1
            });
            _loc3_.push({
               "name":"_color_rb",
               "value":0
            });
            _loc3_.push({
               "name":"_color_ga",
               "value":1
            });
            _loc3_.push({
               "name":"_color_gb",
               "value":0
            });
            _loc3_.push({
               "name":"_color_ba",
               "value":1
            });
            _loc3_.push({
               "name":"_color_bb",
               "value":0
            });
         }
         else
         {
            if(param1.ra != undefined)
            {
               _loc3_.push({
                  "name":"_color_ra",
                  "value":param1.ra
               });
            }
            if(param1.rb != undefined)
            {
               _loc3_.push({
                  "name":"_color_rb",
                  "value":param1.rb
               });
            }
            if(param1.ga != undefined)
            {
               _loc3_.push({
                  "name":"_color_ba",
                  "value":param1.ba
               });
            }
            if(param1.gb != undefined)
            {
               _loc3_.push({
                  "name":"_color_bb",
                  "value":param1.bb
               });
            }
            if(param1.ba != undefined)
            {
               _loc3_.push({
                  "name":"_color_ga",
                  "value":param1.ga
               });
            }
            if(param1.bb != undefined)
            {
               _loc3_.push({
                  "name":"_color_gb",
                  "value":param1.gb
               });
            }
            if(param1.aa != undefined)
            {
               _loc3_.push({
                  "name":"_color_aa",
                  "value":param1.aa
               });
            }
            if(param1.ab != undefined)
            {
               _loc3_.push({
                  "name":"_color_ab",
                  "value":param1.ab
               });
            }
         }
         return _loc3_;
      }
      
      public static function _scale_splitter(param1:Number, param2:Array) : Array
      {
         var _loc3_:Array = new Array();
         _loc3_.push({
            "name":"scaleX",
            "value":param1
         });
         _loc3_.push({
            "name":"scaleY",
            "value":param1
         });
         return _loc3_;
      }
      
      public static function _filter_splitter(param1:BitmapFilter, param2:Array) : Array
      {
         var _loc3_:Array = new Array();
         if(param1 is BlurFilter)
         {
            _loc3_.push({
               "name":"_blur_blurX",
               "value":BlurFilter(param1).blurX
            });
            _loc3_.push({
               "name":"_blur_blurY",
               "value":BlurFilter(param1).blurY
            });
            _loc3_.push({
               "name":"_blur_quality",
               "value":BlurFilter(param1).quality
            });
         }
         return _loc3_;
      }
      
      public static function frame_get(param1:Object) : Number
      {
         return param1.currentFrame;
      }
      
      public static function frame_set(param1:Object, param2:Number) : void
      {
         param1.gotoAndStop(Math.round(param2));
      }
      
      public static function _sound_volume_get(param1:Object) : Number
      {
         return param1.soundTransform.volume;
      }
      
      public static function _sound_volume_set(param1:Object, param2:Number) : void
      {
         var _loc3_:SoundTransform = param1.soundTransform;
         _loc3_.volume = param2;
         param1.soundTransform = _loc3_;
      }
      
      public static function _sound_pan_get(param1:Object) : Number
      {
         return param1.soundTransform.pan;
      }
      
      public static function _sound_pan_set(param1:Object, param2:Number) : void
      {
         var _loc3_:SoundTransform = param1.soundTransform;
         _loc3_.pan = param2;
         param1.soundTransform = _loc3_;
      }
      
      public static function _color_property_get(param1:Object, param2:Array) : Number
      {
         return param1.transform.colorTransform[param2[0]];
      }
      
      public static function _color_property_set(param1:Object, param2:Number, param3:Array) : void
      {
         var _loc4_:ColorTransform = param1.transform.colorTransform;
         _loc4_[param3[0]] = param2;
         param1.transform.colorTransform = _loc4_;
      }
      
      public static function _autoAlpha_get(param1:Object) : Number
      {
         return param1.alpha;
      }
      
      public static function _autoAlpha_set(param1:Object, param2:Number) : void
      {
         param1.alpha = param2;
         param1.visible = param2 > 0;
      }
      
      public static function _filter_property_get(param1:Object, param2:Array) : Number
      {
         var _loc4_:uint = 0;
         var _loc7_:Object = null;
         var _loc3_:Array = param1.filters;
         var _loc5_:Object = param2[0];
         var _loc6_:String = param2[1];
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_] is BlurFilter && _loc5_ == BlurFilter)
            {
               return _loc3_[_loc4_][_loc6_];
            }
            _loc4_++;
         }
         switch(_loc5_)
         {
            case BlurFilter:
               _loc7_ = {
                  "blurX":0,
                  "blurY":0,
                  "quality":NaN
               };
         }
         return _loc7_[_loc6_];
      }
      
      public static function _filter_property_set(param1:Object, param2:Number, param3:Array) : void
      {
         var _loc5_:uint = 0;
         var _loc8_:BitmapFilter = null;
         var _loc4_:Array = param1.filters;
         var _loc6_:Object = param3[0];
         var _loc7_:String = param3[1];
         _loc5_ = 0;
         while(_loc5_ < _loc4_.length)
         {
            if(_loc4_[_loc5_] is BlurFilter && _loc6_ == BlurFilter)
            {
               _loc4_[_loc5_][_loc7_] = param2;
               param1.filters = _loc4_;
               return;
            }
            _loc5_++;
         }
         if(_loc4_ == null)
         {
            _loc4_ = new Array();
         }
         switch(_loc6_)
         {
            case BlurFilter:
               _loc8_ = new BlurFilter(0,0);
         }
         _loc8_[_loc7_] = param2;
         _loc4_.push(_loc8_);
         param1.filters = _loc4_;
      }
      
      public static function _bezier_modifier(param1:*) : Array
      {
         var _loc3_:Array = null;
         var _loc4_:uint = 0;
         var _loc5_:* = null;
         var _loc2_:Array = [];
         if(param1 is Array)
         {
            _loc3_ = param1;
         }
         else
         {
            _loc3_ = [param1];
         }
         var _loc6_:Object = {};
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            for(_loc5_ in _loc3_[_loc4_])
            {
               if(_loc6_[_loc5_] == undefined)
               {
                  _loc6_[_loc5_] = [];
               }
               _loc6_[_loc5_].push(_loc3_[_loc4_][_loc5_]);
            }
            _loc4_++;
         }
         for(_loc5_ in _loc6_)
         {
            _loc2_.push({
               "name":_loc5_,
               "parameters":_loc6_[_loc5_]
            });
         }
         return _loc2_;
      }
      
      public static function _bezier_get(param1:Number, param2:Number, param3:Number, param4:Array) : Number
      {
         var _loc5_:uint = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(param4.length == 1)
         {
            return param1 + param3 * (2 * (1 - param3) * (param4[0] - param1) + param3 * (param2 - param1));
         }
         _loc5_ = Math.floor(param3 * param4.length);
         _loc6_ = (param3 - _loc5_ * (1 / param4.length)) * param4.length;
         if(_loc5_ == 0)
         {
            _loc7_ = param1;
            _loc8_ = (param4[0] + param4[1]) / 2;
         }
         else if(_loc5_ == param4.length - 1)
         {
            _loc7_ = (param4[_loc5_ - 1] + param4[_loc5_]) / 2;
            _loc8_ = param2;
         }
         else
         {
            _loc7_ = (param4[_loc5_ - 1] + param4[_loc5_]) / 2;
            _loc8_ = (param4[_loc5_] + param4[_loc5_ + 1]) / 2;
         }
         return _loc7_ + _loc6_ * (2 * (1 - _loc6_) * (param4[_loc5_] - _loc7_) + _loc6_ * (_loc8_ - _loc7_));
      }
   }
}
