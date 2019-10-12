package anifire.studio.commands
{
   import anifire.constant.ThemeConstants;
   import anifire.iterators.ArrayIterator;
   import anifire.managers.AmplitudeAnalyticsManager;
   import anifire.studio.assets.commands.AddTransitionCollectionCommand;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.managers.TutorialManager;
   import anifire.studio.models.TextComponentThumb;
   
   public class ApplyTextComponentCommand extends CollectiveCommand
   {
       
      
      private var _textComponent:TextComponentThumb;
      
      public function ApplyTextComponentCommand(param1:TextComponentThumb)
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:Vector.<AssetTransition> = null;
         var _loc6_:ArrayIterator = null;
         super();
         this._textComponent = param1;
         _type = "ApplyTextComponentCommand";
         var _loc2_:AnimeScene = this.scene;
         if(_loc2_ && param1)
         {
            _loc3_ = _loc2_.getAssetsFromTextComponent();
            if(_loc3_)
            {
               _loc6_ = new ArrayIterator(_loc3_);
               this.addCommand(new RemoveAssetCollectionCommand(_loc6_,false));
            }
            _loc4_ = _loc2_.createAssetsFromTextComponent(param1);
            if(_loc4_)
            {
               this.addCommand(new AddAssetCollectionCommand(_loc4_,false));
            }
            _loc5_ = _loc2_.createAssetTransitionsFromTextComponent(param1,_loc4_);
            if(_loc5_)
            {
               this.addCommand(new AddTransitionCollectionCommand(_loc5_,false));
            }
         }
      }
      
      override public function execute() : void
      {
         var _loc2_:TutorialManager = null;
         var _loc3_:Object = null;
         disableSoundOverlapCheck();
         var _loc1_:AnimeScene = this.scene;
         if(_loc1_)
         {
            _loc1_.saveTextCopiesFromTextComponent();
            super.execute();
            _loc1_.loadTextCopiesFromTextComponent();
            _loc2_ = TutorialManager.instance;
            _loc3_ = {
               "theme":this._textComponent.themeId,
               "type":"text_component",
               "name":this._textComponent.name,
               "ugc":(this._textComponent.themeId == ThemeConstants.UGC_THEME_ID?"true":"false"),
               "asset_id":this._textComponent.id,
               "asset_category":this._textComponent.categoryName,
               "tutorial":(!!_loc2_.currentTutorial?"yes":"no")
            };
            AmplitudeAnalyticsManager.instance.log(AmplitudeAnalyticsManager.EVENT_NAME_ADD_ASSET_TO_STAGE,_loc3_);
         }
         enableSoundOverlapCheck();
      }
      
      override public function undo() : void
      {
         disableSoundOverlapCheck();
         super.undo();
         enableSoundOverlapCheck();
      }
   }
}
