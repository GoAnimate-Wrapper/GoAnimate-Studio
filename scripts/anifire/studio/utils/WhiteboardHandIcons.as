package anifire.studio.utils
{
   public class WhiteboardHandIcons
   {
      
      public static const DEFAULT_HAND:Class = WhiteboardHandIcons_DEFAULT_HAND;
      
      public static const HAND_02:Class = WhiteboardHandIcons_HAND_02;
      
      public static const HAND_03:Class = WhiteboardHandIcons_HAND_03;
      
      public static const HAND_04:Class = WhiteboardHandIcons_HAND_04;
      
      public static const HAND_06:Class = WhiteboardHandIcons_HAND_06;
      
      public static const HAND_07:Class = WhiteboardHandIcons_HAND_07;
      
      public static const HAND_08:Class = WhiteboardHandIcons_HAND_08;
      
      public static const HAND_09:Class = WhiteboardHandIcons_HAND_09;
      
      public static const HAND_10:Class = WhiteboardHandIcons_HAND_10;
      
      public static const HAND_05:Class = WhiteboardHandIcons_HAND_05;
      
      public static const NOTHING:Class = WhiteboardHandIcons_NOTHING;
       
      
      public function WhiteboardHandIcons()
      {
         super();
      }
      
      public static function getIcon(param1:int) : Class
      {
         switch(param1)
         {
            case 1:
               return DEFAULT_HAND;
            case 2:
               return HAND_02;
            case 3:
               return HAND_03;
            case 4:
               return HAND_04;
            case 5:
               return HAND_05;
            case 6:
               return HAND_06;
            case 7:
               return HAND_07;
            case 8:
               return HAND_08;
            case 9:
               return HAND_09;
            case 10:
               return HAND_10;
            case 0:
               return NOTHING;
            default:
               return null;
         }
      }
   }
}
