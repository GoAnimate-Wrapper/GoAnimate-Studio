package anifire.studio.components
{
   import anifire.studio.skins.PublishPanelSkin;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Panel;
   import spark.components.supportClasses.ButtonBase;
   
   public class PublishPanel extends Panel
   {
       
      
      [SkinPart(required="false")]
      public var backButton:ButtonBase;
      
      protected var _showBackButton:Boolean;
      
      public function PublishPanel()
      {
         super();
         setStyle("skinClass",PublishPanelSkin);
      }
      
      [Bindable(event="propertyChange")]
      public function get showBackButton() : Boolean
      {
         return this._showBackButton;
      }
      
      private function set _794464810showBackButton(param1:Boolean) : void
      {
         if(this._showBackButton != param1)
         {
            this._showBackButton = param1;
            if(this.backButton)
            {
               this.backButton.visible = param1;
               this.backButton.includeInLayout = param1;
            }
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.backButton)
         {
            this.backButton.visible = this._showBackButton;
            this.backButton.includeInLayout = this._showBackButton;
            this.backButton.addEventListener(MouseEvent.CLICK,this.onBackButtonClick);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this.backButton)
         {
            this.backButton.removeEventListener(MouseEvent.CLICK,this.onBackButtonClick);
         }
      }
      
      private function onBackButtonClick(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(Event.CANCEL));
      }
      
      public function set showBackButton(param1:Boolean) : void
      {
         var _loc2_:Object = this.showBackButton;
         if(_loc2_ !== param1)
         {
            this._794464810showBackButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"showBackButton",_loc2_,param1));
            }
         }
      }
   }
}
