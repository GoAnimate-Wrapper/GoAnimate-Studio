package anifire.studio.components
{
   import anifire.studio.skins.ImportButtonSkin;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   
   public class ImporterButton extends Button
   {
       
      
      protected var normalIcon:Class;
      
      protected var processingIcon:Class;
      
      protected var doneIcon:Class;
      
      protected var _status:String;
      
      public function ImporterButton()
      {
         this.normalIcon = ImporterButton_normalIcon;
         this.processingIcon = ImporterButton_processingIcon;
         this.doneIcon = ImporterButton_doneIcon;
         super();
         buttonMode = true;
         setStyle("skinClass",ImportButtonSkin);
         setStyle("icon",this.normalIcon);
      }
      
      [Bindable(event="propertyChange")]
      public function get status() : String
      {
         return this._status;
      }
      
      private function set _892481550status(param1:String) : void
      {
         if(this._status != param1)
         {
            this._status = param1;
            this.updateIcon();
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == iconDisplay)
         {
            this.updateIcon();
         }
      }
      
      protected function updateIcon() : void
      {
         if(iconDisplay)
         {
            switch(this.status)
            {
               case "clear":
               default:
                  iconDisplay.source = this.normalIcon;
                  break;
               case "processing":
                  iconDisplay.source = this.processingIcon;
                  break;
               case "done":
                  iconDisplay.source = this.doneIcon;
            }
         }
      }
      
      public function set status(param1:String) : void
      {
         var _loc2_:Object = this.status;
         if(_loc2_ !== param1)
         {
            this._892481550status = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"status",_loc2_,param1));
            }
         }
      }
   }
}
