package anifire.studio.assets.models
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.interfaces.IXmlConvertable;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class TransitionSetting extends EventDispatcher implements IXmlConvertable
   {
       
      
      public function TransitionSetting()
      {
         super();
      }
      
      public function clone() : TransitionSetting
      {
         return new TransitionSetting();
      }
      
      protected function createDefaultNode() : XML
      {
         return new XML("<" + AssetTransitionConstants.TAG_NAME_TRANSITION_SETTING + "/>");
      }
      
      protected function notifyChange() : void
      {
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function convertToJsonObj() : Object
      {
         return null;
      }
      
      public function convertToXml() : XML
      {
         return null;
      }
      
      public function convertFromJsonObj(param1:Object) : Boolean
      {
         return false;
      }
      
      public function convertFromXml(param1:XML) : Boolean
      {
         return false;
      }
   }
}
