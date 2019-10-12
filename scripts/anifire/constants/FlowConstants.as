package anifire.constants
{
   public class FlowConstants
   {
      
      public static const STORE_PREFIX:String = "flow/";
      
      public static const FLOW_TOP_LEFT:String = "topLeft";
      
      public static const FLOW_TOP:String = "top";
      
      public static const FLOW_TOP_RIGHT:String = "topRight";
      
      public static const FLOW_LEFT:String = "left";
      
      public static const FLOW_CENTER:String = "center";
      
      public static const FLOW_RIGHT:String = "right";
      
      public static const FLOW_BOTTOM_LEFT:String = "bottomLeft";
      
      public static const FLOW_BOTTOM:String = "bottom";
      
      public static const FLOW_BOTTOM_RIGHT:String = "bottomRight";
      
      public static const FLOW_SHORT_TOP_LEFT:String = "tl";
      
      public static const FLOW_SHORT_TOP:String = "t";
      
      public static const FLOW_SHORT_TOP_RIGHT:String = "tr";
      
      public static const FLOW_SHORT_LEFT:String = "l";
      
      public static const FLOW_SHORT_CENTER:String = "c";
      
      public static const FLOW_SHORT_RIGHT:String = "r";
      
      public static const FLOW_SHORT_BOTTOM_LEFT:String = "bl";
      
      public static const FLOW_SHORT_BOTTOM:String = "b";
      
      public static const FLOW_SHORT_BOTTOM_RIGHT:String = "br";
      
      public static const FLOW_SCALE_WIDTH:String = "scaleWidth";
      
      public static const FLOW_SCALE_HEIGHT:String = "scaleHeight";
      
      public static const FLOW_SCALE_ALL:String = "scaleAll";
      
      public static const FLOW_SCALE_NONE:String = "scaleNone";
       
      
      public function FlowConstants()
      {
         super();
      }
      
      public static function getFlowValue(param1:String) : String
      {
         var _loc2_:String = null;
         switch(param1)
         {
            default:
            case FLOW_SHORT_TOP_LEFT:
               _loc2_ = FLOW_TOP_LEFT;
               break;
            case FLOW_SHORT_TOP:
               _loc2_ = FLOW_TOP;
               break;
            case FLOW_SHORT_TOP_RIGHT:
               _loc2_ = FLOW_TOP_RIGHT;
               break;
            case FLOW_SHORT_LEFT:
               _loc2_ = FLOW_LEFT;
               break;
            case FLOW_SHORT_CENTER:
               _loc2_ = FLOW_CENTER;
               break;
            case FLOW_SHORT_RIGHT:
               _loc2_ = FLOW_RIGHT;
               break;
            case FLOW_SHORT_BOTTOM_LEFT:
               _loc2_ = FLOW_BOTTOM_LEFT;
               break;
            case FLOW_SHORT_BOTTOM:
               _loc2_ = FLOW_BOTTOM;
               break;
            case FLOW_SHORT_BOTTOM_RIGHT:
               _loc2_ = FLOW_BOTTOM_RIGHT;
         }
         return _loc2_;
      }
   }
}
