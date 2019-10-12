package anifire.studio.assets.control
{
   import anifire.studio.assets.controllers.AssetControllerFactory;
   import anifire.studio.assets.models.AssetCollectionShadow;
   import anifire.studio.assets.views.AssetViewCollection;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Background;
   import anifire.studio.interfaces.IAssetControl;
   import anifire.studio.interfaces.IAssetController;
   import anifire.studio.interfaces.IAssetView;
   import anifire.util.UtilErrorLogger;
   import flash.display.DisplayObject;
   import flash.events.IEventDispatcher;
   import mx.core.UIComponent;
   
   public class AssetControlBox extends UIComponent
   {
       
      
      private var _target:Object;
      
      private var _control:IAssetControl;
      
      private var _controller:IEventDispatcher;
      
      private var _showReferencePoint:Boolean;
      
      private var _undoableAction:Boolean = true;
      
      private var _drawingScale:Number = 1;
      
      public function AssetControlBox()
      {
         super();
      }
      
      public function get controller() : IEventDispatcher
      {
         return this._controller;
      }
      
      public function set drawingScale(param1:Number) : void
      {
         this._drawingScale = param1;
         if(this._control)
         {
            this._control.drawingScale = param1;
         }
      }
      
      public function set undoableAction(param1:Boolean) : void
      {
         if(this._undoableAction != param1)
         {
            this._undoableAction = param1;
            if(this._control)
            {
               this._control.undoableAction = param1;
            }
         }
      }
      
      public function get target() : Object
      {
         return this._target;
      }
      
      public function set target(param1:Object) : void
      {
         var asset:Asset = null;
         var value:Object = param1;
         if(value is IAssetView)
         {
            asset = IAssetView(value).asset;
            if(asset is Background)
            {
               return;
            }
         }
         if(this._control)
         {
            this._control.destroy();
            try
            {
               this.removeChild(this._control as DisplayObject);
            }
            catch(e:Error)
            {
               UtilErrorLogger.getInstance().appendCustomError("AssetControlBox:target",e);
            }
            this._control = null;
         }
         if(this._controller)
         {
            this._controller = null;
         }
         this._target = value;
         if(value)
         {
            if(value is IAssetView)
            {
               this._controller = AssetControllerFactory.createController(value as IAssetView);
               if(this._controller is IAssetController)
               {
                  IAssetController(this._controller).view = value as IAssetView;
               }
            }
            else if(value is AssetViewCollection)
            {
               this._controller = AssetControllerFactory.getCollectionController(value as AssetViewCollection);
            }
            else if(value is AssetCollectionShadow)
            {
               this._controller = value as AssetCollectionShadow;
            }
            if(this._controller)
            {
               this._control = AssetControlFactory.createControl(value);
               if(this._control)
               {
                  this._control.undoableAction = this._undoableAction;
                  this._control.drawingScale = this._drawingScale;
                  this._control.asset = this._controller;
                  this.addChild(this._control as DisplayObject);
                  if(this._showReferencePoint)
                  {
                     this._control.showReferencePoint = this._showReferencePoint;
                  }
               }
            }
         }
      }
      
      public function set showReferencePoint(param1:Boolean) : void
      {
         if(this._showReferencePoint != param1)
         {
            this._showReferencePoint = param1;
            if(this._control)
            {
               this._control.showReferencePoint = param1;
            }
         }
      }
   }
}
