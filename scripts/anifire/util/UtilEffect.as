package anifire.util
{
   import anifire.effect.FadeOutInTransition;
   import caurina.transitions.Equations;
   import com.jumpeye.flashEff2.symbol.badTransmission.FESBadTransmission;
   import com.jumpeye.flashEff2.symbol.brightSquares.FESBrightSquares;
   import com.jumpeye.flashEff2.symbol.disc.FESDisc;
   import com.jumpeye.flashEff2.symbol.intersectingStripes.FESIntersectingStripes;
   import com.jumpeye.flashEff2.symbol.scale.FESScale;
   import com.jumpeye.flashEff2.symbol.sparkle.FESSparkle;
   import com.jumpeye.flashEff2.symbol.unpack.FESUnpack;
   import fl.transitions.Blinds;
   import fl.transitions.Fade;
   import fl.transitions.Fly;
   import fl.transitions.Iris;
   import fl.transitions.Photo;
   import fl.transitions.PixelDissolve;
   import fl.transitions.Rotate;
   import fl.transitions.Squeeze;
   import fl.transitions.Wipe;
   import fl.transitions.Zoom;
   
   public class UtilEffect
   {
      
      private static var fxArray:UtilHashArray;
      
      private static var tsArray:UtilHashArray;
      
      private static var labels:UtilHashArray;
       
      
      public function UtilEffect()
      {
         super();
         fxArray = new UtilHashArray();
         tsArray = new UtilHashArray();
         labels = new UtilHashArray();
      }
      
      public static function getEffects() : Array
      {
         var _loc1_:UtilHashArray = new UtilHashArray();
         insertEffects(_loc1_);
         return _loc1_.getKeys();
      }
      
      public static function getEffectByName(param1:String) : Function
      {
         var _loc2_:UtilHashArray = new UtilHashArray();
         insertEffects(_loc2_);
         if(_loc2_.getValueByKey(param1))
         {
            return _loc2_.getValueByKey(param1);
         }
         return Equations.easeOutCirc;
      }
      
      public static function getTransitions() : Array
      {
         var _loc1_:UtilHashArray = new UtilHashArray();
         insertTransitions(_loc1_);
         return _loc1_.getKeys();
      }
      
      public static function getTransitionByName(param1:String) : Class
      {
         var _loc2_:UtilHashArray = new UtilHashArray();
         insertTransitions(_loc2_);
         if(_loc2_.getValueByKey(param1))
         {
            return _loc2_.getValueByKey(param1);
         }
         return Fade;
      }
      
      public static function getLabelById(param1:String) : String
      {
         labels = new UtilHashArray();
         insertLabels(labels);
         if(labels.getValueByKey(param1))
         {
            return labels.getValueByKey(param1);
         }
         return param1;
      }
      
      private static function insertEffects(param1:UtilHashArray) : void
      {
         param1.push("easeInBack",Equations.easeInBack);
         param1.push("easeInBounce",Equations.easeInBounce);
         param1.push("easeInCirc",Equations.easeInCirc);
         param1.push("easeInCubic",Equations.easeInCubic);
         param1.push("easeInElastic",Equations.easeInElastic);
         param1.push("easeInExpo",Equations.easeInExpo);
         param1.push("easeInOutBack",Equations.easeInOutBack);
         param1.push("easeInOutBounce",Equations.easeInOutBounce);
         param1.push("easeInOutCirc",Equations.easeInOutCirc);
         param1.push("easeInOutCubic",Equations.easeInOutCubic);
         param1.push("easeInOutElastic",Equations.easeInOutElastic);
         param1.push("easeInOutExpo",Equations.easeInOutExpo);
         param1.push("easeInOutQuad",Equations.easeInOutQuad);
         param1.push("easeInOutQuart",Equations.easeInOutQuart);
         param1.push("easeInOutQuint",Equations.easeInOutQuint);
         param1.push("easeInOutSine",Equations.easeInOutSine);
         param1.push("easeInQuad",Equations.easeInQuad);
         param1.push("easeInQuart",Equations.easeInQuart);
         param1.push("easeInQuint",Equations.easeInQuint);
         param1.push("easeInSine",Equations.easeInSine);
         param1.push("easeNone",Equations.easeNone);
         param1.push("easeOutBack",Equations.easeOutBack);
         param1.push("easeOutBounce",Equations.easeOutBounce);
         param1.push("easeOutCirc",Equations.easeOutCirc);
         param1.push("easeOutCubic",Equations.easeOutCubic);
         param1.push("easeOutElastic",Equations.easeOutElastic);
         param1.push("easeOutExpo",Equations.easeOutExpo);
         param1.push("easeOutInBack",Equations.easeOutInBack);
         param1.push("easeOutInBounce",Equations.easeOutInBounce);
         param1.push("easeOutInCirc",Equations.easeOutInCirc);
         param1.push("easeOutInCubic",Equations.easeOutInCubic);
         param1.push("easeOutInElastic",Equations.easeOutInElastic);
         param1.push("easeOutInExpo",Equations.easeOutInExpo);
         param1.push("easeOutInQuad",Equations.easeOutInQuad);
         param1.push("easeOutInQuart",Equations.easeOutInQuart);
         param1.push("easeOutInQuint",Equations.easeOutInQuint);
         param1.push("easeOutInSine",Equations.easeOutInSine);
      }
      
      private static function insertTransitions(param1:UtilHashArray) : void
      {
         param1.push("Blinds",Blinds);
         param1.push("CleanHand",FadeOutInTransition);
         param1.push("CleanBrush",FadeOutInTransition);
         param1.push("Fade",Fade);
         param1.push("FadeDark",FadeOutInTransition);
         param1.push("Fly",Fly);
         param1.push("Iris",Iris);
         param1.push("Photo",Photo);
         param1.push("PixelDissolve",PixelDissolve);
         param1.push("Rotate",Rotate);
         param1.push("Squeeze",Squeeze);
         param1.push("Wipe",Wipe);
         param1.push("WipeHand",FadeOutInTransition);
         param1.push("Zoom",Zoom);
         param1.push("FESBadTransmission",FESBadTransmission);
         param1.push("FESBrightSquares_11",FESBrightSquares);
         param1.push("FESIntersectingStripes_1",FESIntersectingStripes);
         param1.push("FESIntersectingStripes_4",FESIntersectingStripes);
         param1.push("FESScale",FESScale);
         param1.push("FESSparkle_1",FESSparkle);
         param1.push("FESSparkle_4",FESSparkle);
         param1.push("FESUnpack_2",FESUnpack);
         param1.push("FESUnpack_1",FESUnpack);
         param1.push("FESUnpack_8",FESUnpack);
         param1.push("FESDisc",FESDisc);
         param1.push("InfoBlinds",FadeOutInTransition);
         param1.push("InfoIris",FadeOutInTransition);
         param1.push("InfoSplit",FadeOutInTransition);
         param1.push("Pan",FadeOutInTransition);
      }
      
      public static function getTransitionParamByType(param1:String) : UtilHashArray
      {
         var _loc2_:UtilHashArray = new UtilHashArray();
         switch(param1)
         {
            case "Blinds":
               _loc2_.push("numStrips",Number);
               _loc2_.push("dimension",Number);
               break;
            case "Fly":
            case "Pan":
               _loc2_.push("startPoint",Number);
               break;
            case "Iris":
               _loc2_.push("startPoint",Number);
               _loc2_.push("shape",String);
               break;
            case "Rotate":
               _loc2_.push("ccw",Boolean);
               _loc2_.push("degrees",Number);
               _loc2_.push("shiftPoint",Number);
               break;
            case "Squeeze":
               _loc2_.push("dimensionSqueeze",Number);
               _loc2_.push("shiftPoint",Number);
               break;
            case "Wipe":
               _loc2_.push("startPoint",Number);
               break;
            case "PixelDissolve":
               _loc2_.push("xSections",Number);
               _loc2_.push("ySections",Number);
               break;
            case "Zoom":
               _loc2_.push("shiftPoint",Number);
               break;
            case "FadeDark":
               _loc2_.push("targetColor",uint);
         }
         return _loc2_;
      }
      
      public static function insertLabels(param1:UtilHashArray) : void
      {
         param1.push("Blinds","Blinds");
         param1.push("CleanHand","Clean with hand");
         param1.push("CleanBrush","Clean with brush");
         param1.push("Fade","Dissolve");
         param1.push("FadeDark","Fade");
         param1.push("Fly","Fly-out");
         param1.push("Iris","Iris");
         param1.push("Photo","Photo");
         param1.push("PixelDissolve","Pixel Dissolve");
         param1.push("Rotate","Rotate");
         param1.push("Squeeze","Squeeze");
         param1.push("Wipe","Wipe");
         param1.push("WipeHand","Wipe with hand");
         param1.push("Zoom","Zoom");
         param1.push("numStrips","Strip Size");
         param1.push("dimension","Direction");
         param1.push("startPoint","Direction");
         param1.push("shape","Shape");
         param1.push("ccw","Direction");
         param1.push("degrees","degrees");
         param1.push("shiftPoint","shiftPoint");
         param1.push("xSections","xSections");
         param1.push("ySections","ySections");
         param1.push("targetColor","Color");
         param1.push("SQUARE","Square");
         param1.push("CIRCLE","Circle");
         param1.push("horizontal","Horizontal");
         param1.push("vertical","Vertical");
         param1.push("FESBadTransmission","Bad Transmission");
         param1.push("FESBrightSquares_11","Bright Squares wave");
         param1.push("FESBrightSquares_13","Bright Squares");
         param1.push("FESDesertIllusion","Desert Illusion");
         param1.push("FESIntersectingStripes_1","Stripes - vertical");
         param1.push("FESIntersectingStripes_4","Stripes - horizontal");
         param1.push("FESLightStripes","Stripes - blurry");
         param1.push("FESScale","Zoom - bounce");
         param1.push("FESSparkle_1","Sparkles - horizontal");
         param1.push("FESSparkle_4","Sparkles - vertical");
         param1.push("FESUnpack_2","Split - Horizontal");
         param1.push("FESUnpack_1","Split - Vertical");
         param1.push("FESUnpack_8","Unpack");
         param1.push("FESDisc","Circular reveal");
         param1.push("Pan","Slide");
         param1.push("InfoBlinds","Motion graphics - Stripes and Rings");
         param1.push("InfoIris","Motion graphics - Rings");
         param1.push("InfoSplit","Motion graphics - Stripes");
      }
   }
}
