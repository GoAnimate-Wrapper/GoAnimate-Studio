package anifire.studio.components
{
   import anifire.studio.skins.ArrowToolTipGroupSkin;
   import flashx.textLayout.elements.TextFlow;
   import mx.events.PropertyChangeEvent;
   import spark.components.RichEditableText;
   import spark.components.supportClasses.SkinnableComponent;
   
   public class ArrowToolTipGroup extends SkinnableComponent
   {
       
      
      [SkinPart(required="true")]
      public var richEditableText:RichEditableText;
      
      private var _label:String;
      
      private var _arrowDirection:String = "left";
      
      private var _1045287783textWidth:Number;
      
      private var _textFlow:TextFlow;
      
      public function ArrowToolTipGroup()
      {
         super();
         setStyle("skinClass",ArrowToolTipGroupSkin);
      }
      
      public function get arrowDirection() : String
      {
         return this._arrowDirection;
      }
      
      public function set arrowDirection(param1:String) : void
      {
         if(this._arrowDirection != param1)
         {
            this._arrowDirection = param1;
            this.invalidateSkinState();
         }
      }
      
      override protected function getCurrentSkinState() : String
      {
         return this._arrowDirection;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.richEditableText)
         {
            if(this._textFlow)
            {
               this.richEditableText.textFlow = this._textFlow;
            }
            else
            {
               this.richEditableText.text = this._label;
            }
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.richEditableText)
         {
            this.richEditableText.textFlow = null;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get label() : String
      {
         return this._label;
      }
      
      private function set _102727412label(param1:String) : void
      {
         if(this._label != param1)
         {
            this._label = param1;
            this.textFlow = this.createTextFlow(this._label);
            if(!this._textFlow && this.richEditableText)
            {
               this.richEditableText.text = this._label;
            }
         }
      }
      
      protected function createTextFlow(param1:String) : TextFlow
      {
         return null;
      }
      
      private function set textFlow(param1:TextFlow) : void
      {
         if(this._textFlow != param1)
         {
            this._textFlow = param1;
            if(this.richEditableText)
            {
               this.richEditableText.textFlow = this._textFlow;
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get textWidth() : Number
      {
         return this._1045287783textWidth;
      }
      
      public function set textWidth(param1:Number) : void
      {
         var _loc2_:Object = this._1045287783textWidth;
         if(_loc2_ !== param1)
         {
            this._1045287783textWidth = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"textWidth",_loc2_,param1));
            }
         }
      }
      
      public function set label(param1:String) : void
      {
         var _loc2_:Object = this.label;
         if(_loc2_ !== param1)
         {
            this._102727412label = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"label",_loc2_,param1));
            }
         }
      }
   }
}
