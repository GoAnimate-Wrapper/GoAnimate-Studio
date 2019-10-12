package anifire.studio.components
{
   import anifire.studio.skins.HelpButtonSkin;
   import spark.components.Button;
   import spark.components.Label;
   
   public class HelpButton extends Button
   {
       
      
      [SkinPart(required="false")]
      public var helpLabel:Label;
      
      private var _helpText:String;
      
      public function HelpButton()
      {
         super();
         setStyle("skinClass",HelpButtonSkin);
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this.helpLabel)
         {
            this.helpLabel.text = this._helpText;
         }
      }
      
      public function set helpText(param1:String) : void
      {
         this._helpText = param1;
         if(this.helpLabel)
         {
            this.helpLabel.text = this._helpText;
         }
      }
   }
}
