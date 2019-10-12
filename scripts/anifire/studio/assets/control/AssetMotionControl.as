package anifire.studio.assets.control
{
   import anifire.studio.assets.commands.ChangeMotionPathCommand;
   import anifire.studio.assets.commands.RemoveAssetMovementCommand;
   import anifire.studio.assets.controllers.AssetCollectionController;
   import anifire.studio.assets.interfaces.IReferencePoint;
   import anifire.studio.assets.models.AssetCollectionShadow;
   import anifire.studio.assets.views.AssetCollectionShadowView;
   import anifire.studio.assets.views.AssetViewFactory;
   import anifire.studio.commands.ICommand;
   import anifire.studio.commands.MoveObjectCommand;
   import anifire.studio.components.SceneEditor;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Console;
   import anifire.studio.core.MotionData;
   import anifire.studio.core.ProgramEffectAsset;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.AssetViewEvent;
   import anifire.studio.interfaces.IAssetController;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IMotion;
   import anifire.studio.interfaces.IMovable;
   import anifire.studio.managers.TutorialManager;
   import anifire.util.UtilErrorLogger;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.core.UIComponent;
   
   public class AssetMotionControl extends UIComponent
   {
       
      
      private var _motionPath:AssetMotionPath;
      
      private var _assetViewFactory:AssetViewFactory;
      
      private var _controller:IAssetController;
      
      private var _target:IEventDispatcher;
      
      private var _shadow:Object;
      
      private var _shadowView:UIComponent;
      
      private var _shadowLayer:UIComponent;
      
      private var _shadowCameraLayer:UIComponent;
      
      private var _pathLayer:UIComponent;
      
      private var _controlBox:AssetControlBox;
      
      private var _mouseDown:Point;
      
      private var _shadowPos:Point;
      
      private var _shadowRef:Point;
      
      private var _sceneEditor:SceneEditor;
      
      private var _command:ICommand;
      
      private var _tutorialManager:TutorialManager;
      
      private var _disableMotionPathMenu:Boolean;
      
      public function AssetMotionControl()
      {
         this._motionPath = new AssetMotionPath();
         this._assetViewFactory = new AssetViewFactory();
         this._shadowLayer = new UIComponent();
         this._shadowCameraLayer = new UIComponent();
         this._pathLayer = new UIComponent();
         this._controlBox = new AssetControlBox();
         super();
         this.addChild(this._shadowCameraLayer);
         this.addChild(this._shadowLayer);
         this.addChild(this._controlBox);
         this._pathLayer.addChild(this._motionPath);
         this.addChild(this._pathLayer);
         this._motionPath.addEventListener(AssetMotionPathEvent.CONTROL_POINT_ADDED,this.onMotionPathChange);
         this._motionPath.addEventListener(AssetMotionPathEvent.CONTROL_POINT_REMOVED,this.onMotionPathChange);
         this._motionPath.addEventListener(AssetMotionPathEvent.CONTROL_POINT_MOVED,this.onMotionPathChange);
         this._motionPath.addEventListener(AssetMotionPathEvent.CONTROL_POINT_MOVING,this.onMotionPathChange);
         this._motionPath.addEventListener(AssetMotionPathEvent.PATH_ORIENTED_CHANGED,this.onMotionPathChange);
         this._motionPath.addEventListener(AssetMotionPathEvent.MOTION_PATH_REMOVED,this.onMotionPathChange);
         this._tutorialManager = TutorialManager.instance;
      }
      
      public function get shadow() : UIComponent
      {
         return this._shadowView;
      }
      
      public function set sceneEditor(param1:SceneEditor) : void
      {
         this._sceneEditor = param1;
      }
      
      public function set motionPathGrowthColor(param1:uint) : void
      {
         this._motionPath.growthColor = param1;
      }
      
      public function get disableMotionPathMenu() : Boolean
      {
         return this._disableMotionPathMenu;
      }
      
      public function set disableMotionPathMenu(param1:Boolean) : void
      {
         if(this._disableMotionPathMenu != param1)
         {
            this._disableMotionPathMenu = param1;
            this._motionPath.disableMenu = this._disableMotionPathMenu;
         }
      }
      
      private function onMotionPathChange(param1:Event) : void
      {
         var _loc2_:ICommand = null;
         var _loc3_:MotionData = null;
         switch(param1.type)
         {
            case AssetMotionPathEvent.CONTROL_POINT_ADDED:
            case AssetMotionPathEvent.CONTROL_POINT_REMOVED:
            case AssetMotionPathEvent.CONTROL_POINT_MOVED:
            case AssetMotionPathEvent.PATH_ORIENTED_CHANGED:
               if(this._target as Asset)
               {
                  _loc2_ = new ChangeMotionPathCommand(this._target as Asset,this._motionPath.path,this._motionPath.pathOriented);
               }
               else if(this._target is AssetCollectionController)
               {
                  _loc3_ = (this._target as AssetCollectionController).motionData;
                  if(_loc3_)
                  {
                     _loc3_.path = this._motionPath.path;
                     _loc3_.pathOriented = this._motionPath.pathOriented;
                  }
               }
               break;
            case AssetMotionPathEvent.CONTROL_POINT_MOVING:
               if(this._target is IMotion)
               {
                  IMotion(this._target as IMotion).motionData.path = this._motionPath.path;
               }
               break;
            case AssetMotionPathEvent.MOTION_PATH_REMOVED:
               if(this._target as Asset)
               {
                  _loc2_ = new RemoveAssetMovementCommand(this._target as Asset);
               }
               else if(this._target is AssetCollectionController)
               {
                  (this._target as AssetCollectionController).removeSlideMotion();
               }
         }
         if(_loc2_)
         {
            _loc2_.execute();
         }
      }
      
      private function removeShadow() : void
      {
         if(this._shadowView)
         {
            this._shadowView.removeEventListener(Event.COMPLETE,this.onShadowImageReady);
            if(this._shadowView is IAssetView)
            {
               IAssetView(this._shadowView).destroy("destroyed by AssetMotionControl");
            }
            try
            {
               this._shadowLayer.removeChild(this._shadowView);
            }
            catch(e:Error)
            {
               UtilErrorLogger.getInstance().appendCustomError("AssetMotionControl:removeShadow",e);
            }
            this._shadowView = null;
            this._shadow = null;
            this._controlBox.target = null;
         }
      }
      
      private function updateShadow() : void
      {
         if(this._target is IMotion)
         {
            if(this._shadow != IMotion(this._target).shadow)
            {
               this.removeShadow();
               this._shadow = IMotion(this._target).shadow;
               if(this._shadow)
               {
                  this.createShadowView(this._shadow);
               }
            }
         }
         else
         {
            this.removeShadow();
         }
      }
      
      private function updatePath() : void
      {
         if(this._target is IMotion && IMotion(this._target).motionData)
         {
            if(this._target is ProgramEffectAsset && Console.getConsole().metaData.mver > 3)
            {
               this._motionPath.growthColor = 6110118;
               this._motionPath.distLabel = false;
            }
            else
            {
               this._motionPath.growthColor = 5405190;
               this._motionPath.distLabel = true;
            }
            this._motionPath.path = IMotion(this._target).motionData.path;
            this._motionPath.pathOriented = IMotion(this._target).motionData.pathOriented;
            this._motionPath.mouseChildren = IMotion(this._target).motionData.maxInterPointNum > 0;
            this._motionPath.visible = true;
         }
         else
         {
            this._motionPath.visible = false;
         }
      }
      
      public function set target(param1:Object) : void
      {
         this.removeAssetEventListeners(this._target);
         if(this._target is AssetCollectionController)
         {
            AssetCollectionController(this._target).motionData = null;
         }
         this._target = param1 as IEventDispatcher;
         this.addAssetEventListeners(this._target);
         this.updatePath();
         this.updateShadow();
      }
      
      private function addAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.addEventListener(AssetEvent.MOTION_CHANGE,this.onAssetMotionChange);
         }
      }
      
      private function removeAssetEventListeners(param1:IEventDispatcher) : void
      {
         if(param1)
         {
            param1.removeEventListener(AssetEvent.MOTION_CHANGE,this.onAssetMotionChange);
         }
      }
      
      private function onAssetMotionChange(param1:AssetEvent) : void
      {
         this.updatePath();
         this.updateShadow();
      }
      
      private function createShadowView(param1:Object) : void
      {
         if(param1 is Asset)
         {
            this._shadowView = this._assetViewFactory.createAssetView(param1 as Asset) as UIComponent;
            if(this._shadowView)
            {
               this._shadowView.addEventListener(AssetViewEvent.VIEW_LOAD_COMPLETE,this.onShadowImageReady);
               if(this._shadowView is IAssetView)
               {
                  IAssetView(this._shadowView).loadImage();
               }
            }
         }
         else if(param1 is AssetCollectionShadow)
         {
            this._shadowView = new AssetCollectionShadowView();
            if(this._target is AssetCollectionController)
            {
               AssetCollectionShadowView(this._shadowView).controller = this._target as AssetCollectionController;
            }
            this._controlBox.target = param1;
         }
         if(this._shadowView)
         {
            this._shadowView.buttonMode = true;
            this._shadowView.addEventListener(MouseEvent.MOUSE_DOWN,this.onShadowMouseDown);
            this._shadowLayer.addChild(this._shadowView);
            this._shadowLayer.alpha = 0.5;
         }
      }
      
      private function onShadowMouseDown(param1:MouseEvent) : void
      {
         this._command = new MoveObjectCommand(this._shadow as IMovable);
         this._command.execute();
         this._mouseDown = new Point(this.mouseX,this.mouseY);
         if(this._shadow is IMovable)
         {
            this._shadowPos = new Point(IMovable(this._shadow).x,IMovable(this._shadow).y);
         }
         if(this._shadow is IReferencePoint)
         {
            this._shadowRef = new Point(IReferencePoint(this._shadow).referenceX,IReferencePoint(this._shadow).referenceY);
         }
         this._controlBox.visible = false;
         if(this._sceneEditor && this._sceneEditor.snapTool)
         {
            this._sceneEditor.snapTool.updateReference(this._sceneEditor);
            if(this._shadow is IMovable)
            {
               this._sceneEditor.snapTool.snapPoint(new Point(IMovable(this._shadow).x,IMovable(this._shadow).y));
            }
         }
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         dispatchEvent(new AssetEvent(AssetEvent.SHADOW_MOVE_START,this._target as Asset));
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:Point = new Point(this.mouseX - this._mouseDown.x,this.mouseY - this._mouseDown.y);
         var _loc3_:Point = new Point(this._shadowPos.x + _loc2_.x,this._shadowPos.y + _loc2_.y);
         if(this._sceneEditor.snapTool)
         {
            this._sceneEditor.guideVisble = false;
            if(!param1.ctrlKey)
            {
               this.snapPoint(_loc3_);
               _loc2_.x = _loc3_.x - this._shadowPos.x;
               _loc2_.y = _loc3_.y - this._shadowPos.y;
            }
         }
         if(this._shadow is IMovable)
         {
            IMovable(this._shadow).move(_loc3_.x,_loc3_.y);
         }
         if(this._shadow is IReferencePoint)
         {
            IReferencePoint(this._shadow).setReferencePoint(this._shadowRef.x + _loc2_.x,this._shadowRef.y + _loc2_.y);
         }
      }
      
      private function snapPoint(param1:Point) : void
      {
         var _loc2_:Rectangle = null;
         var _loc3_:Point = null;
         if(this._sceneEditor)
         {
            _loc2_ = new Rectangle();
            _loc2_ = this._shadowView.getBounds(this._sceneEditor.view.view);
            _loc2_.x = param1.x;
            _loc2_.y = param1.y;
            _loc2_.offset(-_loc2_.width / 2,-_loc2_.height / 2);
            _loc3_ = this._sceneEditor.snapTool.snapRect(_loc2_);
            param1.offset(_loc3_.x,_loc3_.y);
         }
      }
      
      private function onMouseUp(param1:Event) : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this._controlBox.visible = true;
         this._sceneEditor.guideVisble = false;
         dispatchEvent(new AssetEvent(AssetEvent.SHADOW_MOVED,this._target as Asset));
      }
      
      private function onShadowImageReady(param1:Event) : void
      {
         IEventDispatcher(param1.currentTarget).removeEventListener(param1.type,this.onShadowImageReady);
         if(this._shadowView is IAssetView)
         {
            IAssetView(this._shadowView).pause();
         }
         this._controlBox.target = this._shadowView;
      }
      
      public function refreshShadowControl() : void
      {
         this._controlBox.target = null;
         this._controlBox.target = this._shadowView;
      }
      
      public function set showReferencePoint(param1:Boolean) : void
      {
         if(this._controlBox)
         {
            this._controlBox.showReferencePoint = param1;
         }
      }
      
      public function set drawingScale(param1:Number) : void
      {
         if(this._controlBox)
         {
            this._controlBox.drawingScale = param1;
         }
      }
   }
}
