package anifire.studio.components
{
   import anifire.studio.skins.DefaultValueTextInputSkin;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import mx.events.FlexEvent;
   import spark.components.Button;
   import spark.components.TextInput;
   import spark.events.TextOperationEvent;
   
   public class DefaultValueTextInput extends TextInput
   {
       
      
      [SkinPart(required="false")]
      public var resetButton:Button;
      
      [SkinPart(required="false")]
      public var editButton:Button;
      
      private var _defaultText:String = "";
      
      private var _isEditing:Boolean;
      
      public function DefaultValueTextInput()
      {
         super();
         setStyle("skinClass",DefaultValueTextInputSkin);
      }
      
      public function get defaultText() : String
      {
         return this._defaultText;
      }
      
      public function set defaultText(param1:String) : void
      {
         if(this._defaultText != param1)
         {
            this._defaultText = param1;
            if(this.editButton)
            {
               this.editButton.label = this._defaultText;
            }
            if(this.resetButton)
            {
               if(this._defaultText)
               {
                  this.resetButton.visible = true;
               }
               else
               {
                  this.resetButton.visible = false;
               }
            }
            invalidateSkinState();
         }
      }
      
      public function get value() : Number
      {
         var _loc1_:Number = Number(this.text);
         return !!isNaN(_loc1_)?Number(0):Number(_loc1_);
      }
      
      public function set value(param1:Number) : void
      {
         this.text = String(param1);
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.resetButton)
         {
            if(this._defaultText)
            {
               this.resetButton.visible = true;
            }
            else
            {
               this.resetButton.visible = false;
            }
            this.resetButton.addEventListener(MouseEvent.CLICK,this.resetButton_clickHandler);
         }
         else if(param2 == this.editButton)
         {
            this.editButton.label = this._defaultText;
            this.editButton.addEventListener(MouseEvent.CLICK,this.editButton_clickHandler);
         }
         else if(param2 == textDisplay)
         {
            textDisplay.addEventListener(MouseEvent.CLICK,this.textDisplay_clickHandler);
            textDisplay.addEventListener(FocusEvent.FOCUS_OUT,this.textDisplay_focusOutHandler);
            textDisplay.addEventListener(FlexEvent.ENTER,this.textDisplay_enterHandler);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.resetButton)
         {
            this.resetButton.removeEventListener(MouseEvent.CLICK,this.resetButton_clickHandler);
         }
         else if(param2 == this.editButton)
         {
            this.editButton.removeEventListener(MouseEvent.CLICK,this.editButton_clickHandler);
         }
         else if(param2 == textDisplay)
         {
            textDisplay.removeEventListener(MouseEvent.CLICK,this.textDisplay_clickHandler);
            textDisplay.removeEventListener(FocusEvent.FOCUS_OUT,this.textDisplay_focusOutHandler);
            textDisplay.removeEventListener(FlexEvent.ENTER,this.textDisplay_enterHandler);
         }
      }
      
      override protected function getCurrentSkinState() : String
      {
         if(!this._isEditing && this.text == this._defaultText)
         {
            return "normalWithDefaultValue";
         }
         return super.getCurrentSkinState();
      }
      
      private function textDisplay_clickHandler(param1:Event) : void
      {
         this._isEditing = true;
      }
      
      private function textDisplay_focusOutHandler(param1:Event) : void
      {
         this.endEdit();
      }
      
      private function textDisplay_enterHandler(param1:Event) : void
      {
         this.endEdit();
      }
      
      private function endEdit() : void
      {
         this._isEditing = false;
         invalidateSkinState();
      }
      
      private function resetButton_clickHandler(param1:Event) : void
      {
         this.endEdit();
         this.text = this._defaultText;
         this.dispatchEvent(new TextOperationEvent(TextOperationEvent.CHANGE));
      }
      
      private function editButton_clickHandler(param1:Event) : void
      {
         this._isEditing = true;
         if(textDisplay)
         {
            textDisplay.setFocus();
         }
         invalidateSkinState();
      }
   }
}
