package anifire.studio.commands
{
   import anifire.studio.core.Asset;
   import anifire.studio.core.Background;
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.core.Console;
   import anifire.studio.managers.ColorManager;
   
   public class SwapBackdropCommand extends AssetCommand
   {
       
      
      protected var _oldBackdrop:Background;
      
      protected var _oldThumb:BackgroundThumb;
      
      protected var _newThumb:BackgroundThumb;
      
      protected var _oldBaseVisible:Boolean;
      
      protected var _newBaseVisible:Boolean;
      
      protected var _oldBaseColor:uint;
      
      protected var _newBaseColor:uint;
      
      public function SwapBackdropCommand(param1:Asset, param2:BackgroundThumb, param3:Boolean = true)
      {
         super(param1,param3);
         _type = "SwapBackdropCommand";
         this._oldBackdrop = param1 as Background;
         this._newThumb = param2;
         this._newBaseVisible = this._newThumb != null;
         this._newBaseColor = ColorManager.instance.getSceneColor();
      }
      
      override public function execute() : void
      {
         super.execute();
         var _loc1_:Background = this._oldBackdrop as Background;
         var _loc2_:Console = Console.getConsole();
         if(_loc1_)
         {
            this._oldThumb = BackgroundThumb(_loc1_.thumb);
            this._oldBaseVisible = _loc1_.baseVisible;
            this._oldBaseColor = _loc2_.currentScene.baseColor;
            if(this._newThumb)
            {
               _loc1_.swapWithThumb(this._newThumb);
               if(_loc2_.currentScene.background != _loc1_)
               {
                  _loc2_.currentScene.addAsset(_loc1_);
               }
            }
            else
            {
               _loc2_.currentScene.baseColor = this._newBaseColor;
               _loc2_.currentScene.deleteBackground();
            }
         }
         else
         {
            _loc2_.createAsset(this._newThumb);
         }
      }
      
      override public function undo() : void
      {
         super.undo();
         var _loc1_:Console = Console.getConsole();
         _loc1_.propertiesWindow.close();
         var _loc2_:Background = this._oldBackdrop as Background;
         if(_loc2_)
         {
            _loc2_.swapWithThumb(this._oldThumb);
            _loc2_.baseVisible = this._oldBaseVisible;
            if(_loc1_.currentScene.background != _loc2_)
            {
               _loc1_.currentScene.addAsset(_loc2_);
            }
         }
         else
         {
            _loc1_.currentScene.baseColor = this._oldBaseColor;
            _loc1_.currentScene.deleteBackground();
         }
      }
      
      override public function redo() : void
      {
         super.redo();
         var _loc1_:Console = Console.getConsole();
         _loc1_.propertiesWindow.close();
         var _loc2_:Background = this._oldBackdrop as Background;
         if(_loc2_)
         {
            if(this._newThumb)
            {
               _loc2_.swapWithThumb(this._newThumb);
               _loc2_.baseVisible = this._newBaseVisible;
               if(_loc1_.currentScene.background != _loc2_)
               {
                  _loc1_.currentScene.addAsset(_loc2_);
               }
            }
            else
            {
               _loc1_.currentScene.baseColor = this._newBaseColor;
               _loc1_.currentScene.deleteBackground();
            }
         }
         else
         {
            _loc1_.createAsset(this._newThumb);
         }
      }
   }
}
