package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.interfaces.IColorable;
   
   public class SceneColorCommand extends AssetCommand
   {
       
      
      private var _oldColor:uint = 4.294967295E9;
      
      private var _newColor:uint = 4.294967295E9;
      
      private var _oldBaseVisible:Boolean;
      
      private var _resetBaseColor:Boolean;
      
      public function SceneColorCommand(param1:IColorable, param2:uint, param3:Boolean = false)
      {
         super(param1 as Asset);
         this._newColor = param2;
         this._oldColor = scene.baseColor;
         this._resetBaseColor = param3;
         _type = "SceneColorCommand";
      }
      
      public function set newColor(param1:uint) : void
      {
         this._newColor = param1;
      }
      
      override public function execute() : void
      {
         super.execute();
         if(scene.background)
         {
            this._oldBaseVisible = scene.background.baseVisible;
            scene.background.baseVisible = this._resetBaseColor;
         }
         scene.baseColor = this._newColor;
      }
      
      override public function undo() : void
      {
         if(scene.background)
         {
            scene.background.baseVisible = this._oldBaseVisible;
         }
         scene.baseColor = this._oldColor;
         super.undo();
      }
      
      override public function redo() : void
      {
         if(scene.background)
         {
            scene.background.baseVisible = this._resetBaseColor;
         }
         scene.baseColor = this._newColor;
         super.redo();
      }
   }
}
