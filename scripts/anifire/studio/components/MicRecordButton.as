package anifire.studio.components
{
   import anifire.studio.skins.MicRecordButtonSkin;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.Label;
   
   public class MicRecordButton extends Button
   {
       
      
      [SkinPart(required="false")]
      public var customToolTipLabel:Label;
      
      [SkinPart(required="false")]
      public var popUpGroup:Group;
      
      private var _customToolTip:String = "";
      
      public function MicRecordButton()
      {
         super();
         setStyle("skinClass",MicRecordButtonSkin);
      }
      
      [Bindable(event="propertyChange")]
      public function get customToolTip() : String
      {
         return this._customToolTip;
      }
      
      private function set _122694862customToolTip(param1:String) : void
      {
         this._customToolTip = param1;
         if(this.customToolTipLabel)
         {
            this.customToolTipLabel.text = param1;
         }
         if(this.popUpGroup)
         {
            if(this._customToolTip)
            {
               this.popUpGroup.visible = true;
            }
            else
            {
               this.popUpGroup.visible = false;
            }
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.customToolTipLabel)
         {
            this.customToolTipLabel.text = this._customToolTip;
         }
         else if(param2 == this.popUpGroup)
         {
            if(this._customToolTip)
            {
               this.popUpGroup.visible = true;
            }
            else
            {
               this.popUpGroup.visible = false;
            }
         }
      }
      
      public function set customToolTip(param1:String) : void
      {
         var _loc2_:Object = this.customToolTip;
         if(_loc2_ !== param1)
         {
            this._122694862customToolTip = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"customToolTip",_loc2_,param1));
            }
         }
      }
   }
}
