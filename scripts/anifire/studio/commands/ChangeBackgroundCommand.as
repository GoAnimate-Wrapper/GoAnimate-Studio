package anifire.studio.commands
{
   import anifire.iterators.ArrayIterator;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Background;
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.managers.ThemeManager;
   import anifire.util.UtilHashSelectedColor;
   
   public class ChangeBackgroundCommand extends SceneCommand
   {
       
      
      private var _newBg:Background;
      
      private var _newBgThumb:BackgroundThumb;
      
      private var _oldBg:Background;
      
      private var _oldBgThumb:BackgroundThumb;
      
      private var _oldBgColorModel:UtilHashSelectedColor;
      
      private var _oldBgColorCode:int;
      
      private var _oldBaseVisible:Boolean = true;
      
      private var _removeComBgCommand:RemoveAssetCollectionCommand;
      
      public function ChangeBackgroundCommand(param1:Background)
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:BackgroundThumb = null;
         var _loc5_:ArrayIterator = null;
         super();
         this._oldBg = scene.background;
         if(scene.background && scene.background.customColor)
         {
            this._oldBgColorModel = scene.background.customColor.clone();
         }
         if(this._oldBg)
         {
            this._oldBgThumb = scene.background.thumb as BackgroundThumb;
            this._oldBaseVisible = scene.background.baseVisible;
         }
         if(scene.combgId)
         {
            _loc2_ = scene.combgId.split(".")[0];
            _loc3_ = scene.combgId.split(".")[1];
            _loc4_ = ThemeManager.instance.getBackgroundById(_loc2_,_loc3_);
            if(_loc4_)
            {
               this._oldBgThumb = _loc4_;
            }
            _loc5_ = scene.allBgAttachedAssets as ArrayIterator;
            this._removeComBgCommand = new RemoveAssetCollectionCommand(_loc5_,false);
         }
         this._oldBgColorCode = scene.baseColor;
         this._newBg = param1;
         if(this._newBg)
         {
            this._newBgThumb = this._newBg.thumb as BackgroundThumb;
         }
         _type = "ChangeBackgroundCommand";
      }
      
      override public function execute() : void
      {
         if(scene && this._newBg)
         {
            super.execute();
            if((this._newBg.isWhiteboardAsset || this._newBg.isInfographicAsset) && this._newBgThumb && this._newBgThumb.isComposite)
            {
               scene.addTransitionForCompositeBg = true;
            }
            if(this._removeComBgCommand)
            {
               this._removeComBgCommand.execute();
            }
            scene.combgId = "";
            scene.addAsset(this._newBg);
         }
      }
      
      override public function undo() : void
      {
         var _loc1_:Asset = null;
         super.undo();
         if(scene)
         {
            if(this._oldBg && (this._oldBg.isWhiteboardAsset || this._oldBg.isInfographicAsset) && this._oldBgThumb && this._oldBgThumb.isComposite)
            {
               scene.addTransitionForCompositeBg = true;
            }
            if(this._removeComBgCommand)
            {
               this._removeComBgCommand.undo();
               scene.addAsset(this._oldBg);
            }
            scene.removeAsset(this._newBg);
            if(this._oldBgThumb)
            {
               _loc1_ = scene.createAsset(this._oldBgThumb);
               if(_loc1_)
               {
                  scene.addAsset(_loc1_,false,this._oldBgColorModel,!this._oldBaseVisible);
               }
            }
            scene.baseColor = this._oldBgColorCode;
         }
      }
      
      override public function redo() : void
      {
         super.redo();
         if(scene && this._newBg)
         {
            if(this._newBg && (this._newBg.isWhiteboardAsset || this._newBg.isInfographicAsset) && this._newBgThumb && this._newBgThumb.isComposite)
            {
               scene.addTransitionForCompositeBg = true;
            }
            if(this._removeComBgCommand)
            {
               this._removeComBgCommand.redo();
            }
            scene.combgId = "";
            scene.addAsset(this._newBg);
         }
      }
   }
}
