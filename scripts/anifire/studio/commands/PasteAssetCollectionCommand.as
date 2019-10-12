package anifire.studio.commands
{
   import anifire.assets.transition.AssetTransitionConstants;
   import anifire.studio.assets.commands.AddTransitionCollectionCommand;
   import anifire.studio.assets.models.AssetTransition;
   import anifire.studio.core.Asset;
   import anifire.studio.core.EffectAsset;
   import anifire.studio.core.ProgramEffectAsset;
   
   public class PasteAssetCollectionCommand extends SceneCommand
   {
       
      
      private var _newAssetCollection:Vector.<Asset>;
      
      private var _sourceAssetCollection:Vector.<Asset>;
      
      private var _sourceTransitionCollection:Vector.<AssetTransition>;
      
      private var _transitionsNew:Vector.<AssetTransition>;
      
      private var _newAssetIdArray:Vector.<String>;
      
      private var _offset:int;
      
      private var _cameraCommand:PasteCameraCommand;
      
      private var _addTransitionCollectionCommand:AddTransitionCollectionCommand;
      
      public function PasteAssetCollectionCommand(param1:Vector.<Asset>, param2:int, param3:Vector.<AssetTransition>)
      {
         super();
         _type = "PasteAssetCollectionCommand";
         this._sourceAssetCollection = param1;
         this._offset = param2;
         this._sourceTransitionCollection = param3;
      }
      
      override public function execute() : void
      {
         var sameScene:Boolean = false;
         var asset:Asset = null;
         var assetNew:Asset = null;
         var transitionNew:AssetTransition = null;
         var assetSource:Asset = null;
         var trans:AssetTransition = null;
         if(this.scene && this._sourceAssetCollection && this._sourceAssetCollection.length > 0)
         {
            sameScene = true;
            asset = this._sourceAssetCollection[0] as Asset;
            if(asset && asset.scene != this.scene)
            {
               sameScene = false;
            }
            this._newAssetCollection = new Vector.<Asset>();
            this._newAssetIdArray = new Vector.<String>();
            if(this._sourceTransitionCollection && this._sourceTransitionCollection.length > 0)
            {
               this._transitionsNew = new Vector.<AssetTransition>();
               for each(trans in this._sourceTransitionCollection)
               {
                  if(!sameScene)
                  {
                     if(trans.direction == AssetTransitionConstants.DIRECTION_IN || trans.direction == AssetTransitionConstants.DIRECTION_OUT)
                     {
                        continue;
                     }
                  }
                  this._transitionsNew.push(trans.clone());
               }
               this._addTransitionCollectionCommand = new AddTransitionCollectionCommand(this._transitionsNew,false);
            }
            for each(assetSource in this._sourceAssetCollection)
            {
               if(assetSource is ProgramEffectAsset && (assetSource as ProgramEffectAsset).isCamera)
               {
                  this._cameraCommand = new PasteCameraCommand(assetSource,false);
               }
               else
               {
                  try
                  {
                     assetNew = this.scene.deserializeAsset(assetSource.convertToXml(),true,false);
                  }
                  catch(e:Error)
                  {
                     assetNew = null;
                  }
                  if(assetNew)
                  {
                     if(!(assetNew is EffectAsset))
                     {
                        assetNew.indent(this._offset,this._offset);
                     }
                     if(this._transitionsNew)
                     {
                        for each(transitionNew in this._transitionsNew)
                        {
                           if(transitionNew.assetId == assetSource.id)
                           {
                              transitionNew.assetId = assetNew.id;
                           }
                        }
                     }
                     this._newAssetCollection.push(assetNew);
                     this._newAssetIdArray.push(assetNew.id);
                  }
               }
            }
            if(this._cameraCommand)
            {
               this._cameraCommand.execute();
            }
            if(this._addTransitionCollectionCommand)
            {
               this._addTransitionCollectionCommand.execute();
            }
            super.execute();
         }
      }
      
      public function get assets() : Vector.<Asset>
      {
         return this._newAssetCollection;
      }
      
      override public function undo() : void
      {
         var _loc1_:String = null;
         var _loc2_:Asset = null;
         if(this.scene)
         {
            if(this._addTransitionCollectionCommand)
            {
               this._addTransitionCollectionCommand.undo();
            }
            if(this._cameraCommand)
            {
               this._cameraCommand.undo();
            }
            for each(_loc1_ in this._newAssetIdArray)
            {
               _loc2_ = this.scene.getAssetById(_loc1_);
               if(_loc2_)
               {
                  this.scene.removeAsset(_loc2_);
               }
            }
         }
         super.undo();
      }
      
      override public function redo() : void
      {
         var _loc1_:Asset = null;
         if(this.scene)
         {
            for each(_loc1_ in this._newAssetCollection)
            {
               if(_loc1_)
               {
                  this.scene.addAsset(_loc1_);
               }
            }
            if(this._cameraCommand)
            {
               this._cameraCommand.redo();
            }
            if(this._addTransitionCollectionCommand)
            {
               this._addTransitionCollectionCommand.redo();
            }
         }
         super.redo();
      }
   }
}
