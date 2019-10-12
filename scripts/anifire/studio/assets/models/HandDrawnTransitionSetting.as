package anifire.studio.assets.models
{
   import anifire.constants.WhiteboardConstants;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Console;
   
   public class HandDrawnTransitionSetting extends TransitionSetting
   {
      
      public static const WHITEBOARD_HAND_ATTR:String = "wbHand";
      
      public static const WHITEBOARD_HAND_XML_ATTR:String = "@wbHand";
       
      
      protected var _whiteboardHandStyle:int = 1;
      
      public function HandDrawnTransitionSetting()
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:AnimeScene = null;
         var _loc6_:AssetTransition = null;
         var _loc7_:HandDrawnTransitionSetting = null;
         super();
         var _loc1_:Console = Console.getConsole();
         if(_loc1_.defaultHandStyle != WhiteboardConstants.INVALID_HAND)
         {
            this._whiteboardHandStyle = _loc1_.defaultHandStyle;
         }
         else
         {
            _loc2_ = [];
            _loc3_ = 0;
            while(_loc3_ < _loc1_.scenes.length)
            {
               _loc5_ = _loc1_.scenes[_loc3_];
               _loc2_ = _loc2_.concat(_loc5_.getWhiteboardHandTransitions());
               _loc3_++;
            }
            _loc4_ = WhiteboardConstants.INVALID_HAND;
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc6_ = _loc2_[_loc3_];
               _loc7_ = _loc6_.setting as HandDrawnTransitionSetting;
               if(_loc7_)
               {
                  _loc4_ = _loc7_._whiteboardHandStyle;
               }
               _loc3_++;
            }
            if(_loc4_ != WhiteboardConstants.INVALID_HAND)
            {
               _loc1_.defaultHandStyle = _loc4_;
               this._whiteboardHandStyle = _loc4_;
            }
            else
            {
               this._whiteboardHandStyle = WhiteboardConstants.DEFAULT_HAND;
            }
         }
      }
      
      public function get whiteboardHandStyle() : int
      {
         return this._whiteboardHandStyle;
      }
      
      public function set whiteboardHandStyle(param1:int) : void
      {
         if(param1 != this._whiteboardHandStyle)
         {
            this._whiteboardHandStyle = param1;
            notifyChange();
         }
      }
      
      override public function convertToJsonObj() : Object
      {
         var _loc1_:Object = {"wbHand":this._whiteboardHandStyle};
         return _loc1_;
      }
      
      override public function convertToXml() : XML
      {
         var _loc1_:XML = createDefaultNode();
         _loc1_[WHITEBOARD_HAND_ATTR] = this._whiteboardHandStyle;
         return _loc1_;
      }
      
      override public function convertFromJsonObj(param1:Object) : Boolean
      {
         if(param1.wbHand != null)
         {
            this._whiteboardHandStyle = param1.wbHand;
         }
         else
         {
            this._whiteboardHandStyle = WhiteboardConstants.DEFAULT_HAND;
         }
         return true;
      }
      
      override public function convertFromXml(param1:XML) : Boolean
      {
         if(param1.hasOwnProperty(WHITEBOARD_HAND_XML_ATTR))
         {
            this._whiteboardHandStyle = param1[WHITEBOARD_HAND_ATTR];
            return true;
         }
         this._whiteboardHandStyle = WhiteboardConstants.DEFAULT_HAND;
         return true;
      }
      
      override public function clone() : TransitionSetting
      {
         var _loc1_:HandDrawnTransitionSetting = new HandDrawnTransitionSetting();
         _loc1_.whiteboardHandStyle = this._whiteboardHandStyle;
         return _loc1_;
      }
   }
}
