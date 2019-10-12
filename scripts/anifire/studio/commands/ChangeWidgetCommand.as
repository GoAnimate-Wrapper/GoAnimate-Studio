package anifire.studio.commands
{
   import anifire.studio.core.Widget;
   
   public class ChangeWidgetCommand extends AssetCommand
   {
       
      
      public function ChangeWidgetCommand(param1:Widget, param2:Boolean = true)
      {
         super(param1,param2);
         _type = "ChangeWidgetCommand";
      }
   }
}
