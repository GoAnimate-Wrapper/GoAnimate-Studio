package anifire.studio.assets.models
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.studio.assets.interfaces.IDestination;
   
   public class DestinationTransitionSetting extends TransitionSetting implements IDestination
   {
      
      public static const DESTINATION_ATTR:String = "dest";
      
      public static const DESTINATION_XML_ATTR:String = "@dest";
       
      
      private var _destination:uint = 2;
      
      public function DestinationTransitionSetting()
      {
         super();
      }
      
      public function get destination() : uint
      {
         return this._destination;
      }
      
      public function set destination(param1:uint) : void
      {
         if(param1 >= 1 && param1 <= 9)
         {
            if(param1 != this._destination)
            {
               this._destination = param1;
               notifyChange();
            }
         }
      }
      
      override public function convertToJsonObj() : Object
      {
         var _loc1_:Object = {"dest":this._destination};
         return _loc1_;
      }
      
      override public function convertToXml() : XML
      {
         var _loc1_:XML = createDefaultNode();
         _loc1_[DESTINATION_ATTR] = this._destination;
         return _loc1_;
      }
      
      override public function convertFromJsonObj(param1:Object) : Boolean
      {
         if(param1.dest != null)
         {
            this._destination = param1.dest;
         }
         else
         {
            this._destination = AssetTransitionConstants.DEST_TOP;
         }
         return true;
      }
      
      override public function convertFromXml(param1:XML) : Boolean
      {
         if(param1.hasOwnProperty(DESTINATION_XML_ATTR))
         {
            this._destination = param1[DESTINATION_ATTR];
         }
         else
         {
            this._destination = AssetTransitionConstants.DEST_TOP;
         }
         return true;
      }
      
      override public function clone() : TransitionSetting
      {
         var _loc1_:DestinationTransitionSetting = new DestinationTransitionSetting();
         _loc1_.destination = this.destination;
         return _loc1_;
      }
   }
}
