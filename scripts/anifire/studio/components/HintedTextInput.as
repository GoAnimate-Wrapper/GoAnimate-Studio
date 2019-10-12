package anifire.studio.components
{
   import anifire.studio.skins.HintedTextInputSkin;
   import mx.events.PropertyChangeEvent;
   import spark.components.Label;
   import spark.components.TextInput;
   
   public class HintedTextInput extends TextInput
   {
       
      
      [SkinPart(required="false")]
      public var hintDisplay:Label;
      
      protected var _hint:String;
      
      public function HintedTextInput()
      {
         super();
         setStyle("skinClass",HintedTextInputSkin);
      }
      
      [Bindable(event="propertyChange")]
      public function get hint() : String
      {
         return this._hint;
      }
      
      private function set _3202695hint(param1:String) : void
      {
         if(this._hint != param1)
         {
            this._hint = param1;
            if(this.hintDisplay)
            {
               this.hintDisplay.text = param1;
            }
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.hintDisplay)
         {
            this.hintDisplay.text = this.hint;
         }
      }
      
      public function set hint(param1:String) : void
      {
         var _loc2_:Object = this.hint;
         if(_loc2_ !== param1)
         {
            this._3202695hint = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hint",_loc2_,param1));
            }
         }
      }
   }
}
