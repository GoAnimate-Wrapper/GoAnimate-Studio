package anifire.bubble
{
   public class BubbleMgr
   {
      
      public static const RECTANGULAR:String = "RECTANGULAR";
      
      public static const ROUNDRECTANGULAR:String = "ROUNDRECTANGULAR";
      
      public static const ELLIPSE:String = "ELLIPSE";
      
      public static const IMAGE:String = "IMAGE";
      
      public static const CLOUD:String = "CLOUD";
      
      public static const HEART:String = "HEART";
      
      public static const BOOM:String = "BOOM";
      
      public static const BLANK:String = "BLANK";
      
      public static const BLANKTAIL:String = "BLANKTAIL";
      
      private static var _bubble:Bubble = new Bubble();
      
      private static var _shapeName:String = null;
      
      private static var _name:String = "BubbleElement";
       
      
      public function BubbleMgr()
      {
         super();
      }
      
      public static function getBubble(param1:String = "RECTANGULAR") : Bubble
      {
         return createBubble(param1);
      }
      
      public static function getBubbleByXML(param1:XML, param2:Number = -1) : Bubble
      {
         var _loc3_:String = param1.@type;
         var _loc4_:Boolean = param1.@hasTail == "0"?false:true;
         var _loc5_:Bubble = createBubble(_loc3_,_loc4_);
         _loc5_.deSerialize(param1,param2);
         return _loc5_;
      }
      
      public static function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public static function get name() : String
      {
         return _name;
      }
      
      private static function createBubble(param1:String = "RECTANGULAR", param2:Boolean = true) : Bubble
      {
         switch(param1)
         {
            case RECTANGULAR:
               _bubble = new PlainRectangularBubble(param2) as Bubble;
               _name = _name + ("_" + RECTANGULAR);
               break;
            case ROUNDRECTANGULAR:
               _bubble = new RoundedRectangularBubble(param2) as Bubble;
               _name = _name + ("_" + ROUNDRECTANGULAR);
               break;
            case ELLIPSE:
               _bubble = new EllipseBubble(param2) as Bubble;
               _name = _name + ("_" + ELLIPSE);
               break;
            case CLOUD:
               _bubble = new CloudBubble(param2) as Bubble;
               _name = _name + ("_" + CLOUD);
               break;
            case HEART:
               _bubble = new HeartBubble(param2) as Bubble;
               _name = _name + ("_" + HEART);
               break;
            case BOOM:
               _bubble = new BoomBubble() as Bubble;
               _name = _name + ("_" + BOOM);
               break;
            case BLANK:
               _bubble = new BlankBubble() as Bubble;
               _name = _name + ("_" + BLANK);
               break;
            case BLANKTAIL:
               _bubble = new BlankTailBubble() as Bubble;
               _name = _name + ("_" + BLANK);
               break;
            default:
               _bubble = new PlainRectangularBubble(param2) as Bubble;
               _name = _name + ("_" + RECTANGULAR);
         }
         _bubble.redraw();
         return _bubble;
      }
      
      public static function isSameBubble(param1:Bubble, param2:Bubble) : Boolean
      {
         if(param1.width == param2.width && param1.height == param2.height && param1.x == param2.x && param1.y == param2.y && param1.rotation == param2.rotation && param1.fillRgb == param2.fillRgb && param1.lineRgb == param2.lineRgb && param1.tailx == param2.tailx && param1.taily == param2.taily && param1.textRgb == param2.textRgb && param1.textFont == param2.textFont && param1.textSize == param2.textSize && param1.textAlign == param2.textAlign && param1.textBold == param2.textBold && param1.textItalic == param2.textItalic && param1.text == param2.text)
         {
            return true;
         }
         return false;
      }
   }
}
