package anifire.studio.assets.controllers
{
   import anifire.studio.assets.views.AssetViewCollection;
   import anifire.studio.core.Asset;
   import anifire.studio.core.BubbleAsset;
   import anifire.studio.core.Character;
   import anifire.studio.core.EffectAsset;
   import anifire.studio.core.FlowFrame;
   import anifire.studio.core.Prop;
   import anifire.studio.core.Widget;
   import anifire.studio.interfaces.IAssetController;
   import anifire.studio.interfaces.IAssetView;
   
   public class AssetControllerFactory
   {
      
      private static var _characterController:IAssetController;
      
      private static var _widgetController:IAssetController;
      
      private static var _flowFrameController:IAssetController;
      
      private static var _bubbleController:IAssetController;
      
      private static var _cameraController:IAssetController;
      
      private static var _collectionController:AssetCollectionController;
      
      private static var _textCollectionController:TextCollectionController;
       
      
      public function AssetControllerFactory()
      {
         super();
      }
      
      public static function createController(param1:IAssetView) : IAssetController
      {
         var _loc2_:IAssetController = null;
         var _loc3_:Asset = null;
         if(param1)
         {
            _loc3_ = param1.asset;
            if(_loc3_ is Widget)
            {
               _loc2_ = new WidgetController(param1);
            }
            else if(_loc3_ is FlowFrame)
            {
               _loc2_ = new FlowFrameController(param1);
            }
            else if(_loc3_ is Prop || _loc3_ is Character)
            {
               _loc2_ = new CharacterController(param1);
            }
            else if(_loc3_ is BubbleAsset)
            {
               _loc2_ = new BubbleController(param1);
            }
            else if(_loc3_ is EffectAsset)
            {
               _loc2_ = new CameraController(param1);
            }
         }
         return _loc2_;
      }
      
      public static function getController(param1:IAssetView) : IAssetController
      {
         var _loc2_:Asset = null;
         if(param1)
         {
            _loc2_ = param1.asset;
            if(_loc2_ is Widget)
            {
               if(!_widgetController)
               {
                  _widgetController = createController(param1);
               }
               return _widgetController;
            }
            if(_loc2_ is FlowFrame)
            {
               if(!_flowFrameController)
               {
                  _flowFrameController = createController(param1);
               }
               return _flowFrameController;
            }
            if(_loc2_ is Prop || _loc2_ is Character)
            {
               if(!_characterController)
               {
                  _characterController = createController(param1);
               }
               return _characterController;
            }
            if(_loc2_ is BubbleAsset)
            {
               if(!_bubbleController)
               {
                  _bubbleController = createController(param1);
               }
               return _bubbleController;
            }
            if(_loc2_ is EffectAsset)
            {
               if(!_cameraController)
               {
                  _cameraController = createController(param1);
               }
               return _cameraController;
            }
         }
         return createController(param1);
      }
      
      public static function getCollectionController(param1:AssetViewCollection) : AssetCollectionController
      {
         if(param1 && param1.containsBubbleViewOnly)
         {
            return getTextCollectionController(param1);
         }
         if(!_collectionController)
         {
            _collectionController = new AssetCollectionController(param1);
         }
         else
         {
            _collectionController.viewCollection = param1;
         }
         return _collectionController;
      }
      
      public static function getTextCollectionController(param1:AssetViewCollection) : TextCollectionController
      {
         if(!_textCollectionController)
         {
            _textCollectionController = new TextCollectionController(param1);
         }
         else
         {
            _textCollectionController.viewCollection = param1;
         }
         return _textCollectionController;
      }
   }
}
