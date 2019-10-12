package anifire.studio.components
{
   import anifire.constant.AnimeConstants;
   import anifire.studio.assets.control.AssetControlBox;
   import anifire.studio.assets.views.AssetEditor;
   import anifire.studio.assets.views.AssetView;
   import anifire.studio.assets.views.PropAssetView;
   import anifire.studio.commands.TransformFlowFrameImageCommand;
   import anifire.studio.core.FlowFrame;
   import anifire.studio.core.Prop;
   import anifire.studio.core.PropThumb;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.managers.ThemeManager;
   import anifire.studio.managers.UserAssetManager;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.IVisualElement;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class FlowFrameImageEditor extends Group implements IBindingClient
   {
      
      private static const MOVE_DISTANCE:Number = 1;
      
      private static const MOVE_DISTANCE_LARGE:Number = 10;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _987258306assetControlBox:AssetControlBox;
      
      private var _1295031491backgroundLayer:Group;
      
      private var _1353615175boundaryLayer:Group;
      
      private var _1152073270boundaryMask:Rect;
      
      private var _288614428frameLayer:Group;
      
      private var _1460872010imageLayer:Group;
      
      private var _69905979maskLayer:Group;
      
      private var _1101680883stageLayer:Group;
      
      private var _1634741566zoomLayer:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _flowFrame:FlowFrame;
      
      private var _prop:Prop;
      
      private var _userAssetManager:UserAssetManager;
      
      private var _propView:IAssetView;
      
      private var _propViewHighlight:IAssetView;
      
      private var _oldMousePosition:Point;
      
      private var _oldPropPosition:Point;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FlowFrameImageEditor()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._FlowFrameImageEditor_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_FlowFrameImageEditorWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FlowFrameImageEditor[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.mxmlContent = [this._FlowFrameImageEditor_Group2_i(),this._FlowFrameImageEditor_Group3_i()];
         this.addEventListener("creationComplete",this.___FlowFrameImageEditor_Group1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         FlowFrameImageEditor._watcherSetupUtil = param1;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      protected function backgroundLayer_clickHandler(param1:MouseEvent) : void
      {
         this.closeEditor();
      }
      
      public function closeEditor() : void
      {
         this.commitPropValues();
         this._flowFrame.completeEditMode();
         this._flowFrame = null;
         this._prop = null;
         if(this._propView)
         {
            this._propView.removeEventListener(MouseEvent.MOUSE_DOWN,this.propView_mouseDownHandler);
            this._propView.destroy();
            this._propView = null;
         }
         if(this._propViewHighlight)
         {
            this._propViewHighlight.destroy();
            this._propViewHighlight = null;
         }
         this.assetControlBox.target = null;
         this.imageLayer.removeAllElements();
         this.boundaryLayer.removeAllElements();
         this.visible = false;
      }
      
      public function set flowFrame(param1:FlowFrame) : void
      {
         if(this._flowFrame == param1)
         {
            return;
         }
         this._flowFrame = param1;
         if(!this._flowFrame || !this._flowFrame.innerImageId)
         {
            return;
         }
         if(!this._userAssetManager)
         {
            this._userAssetManager = UserAssetManager.instance;
         }
         var _loc2_:Array = this._flowFrame.innerImageId.split(".");
         var _loc3_:String = _loc2_[0];
         var _loc4_:String = _loc2_.length == 4?_loc2_[1]:_loc2_[1] + "." + _loc2_[2];
         var _loc5_:PropThumb = ThemeManager.instance.getPropById(_loc3_,_loc4_);
         if(!_loc5_)
         {
            return;
         }
         this.transformFrameLayer();
         var _loc6_:Rectangle = this._flowFrame.innerBoundary;
         this.boundaryMask.x = _loc6_.x;
         this.boundaryMask.y = _loc6_.y;
         this.boundaryMask.width = _loc6_.width;
         this.boundaryMask.height = _loc6_.height;
         this._prop = new Prop();
         this._prop.thumb = _loc5_;
         this._prop.scaleX = this._flowFrame.innerImageScaleX;
         this._prop.scaleY = this._flowFrame.innerImageScaleY;
         this._prop.rotation = this._flowFrame.innerImageRotation;
         this._prop.move(this._flowFrame.innerImageX,this._flowFrame.innerImageY);
         this.createAssetView(this._prop);
      }
      
      private function transformFrameLayer() : void
      {
         this.frameLayer.scaleX = !!this._flowFrame.isFlipped?Number(-this._flowFrame.scaleX):Number(this._flowFrame.scaleX);
         this.frameLayer.scaleY = this._flowFrame.scaleY;
         this.frameLayer.rotation = this._flowFrame.rotation;
         this.frameLayer.move(this._flowFrame.x,this._flowFrame.y);
      }
      
      private function createAssetView(param1:Prop) : void
      {
         if(!param1)
         {
            return;
         }
         this._propView = new PropAssetView(this._prop);
         this._propView = new AssetEditor(this._propView as AssetView);
         this._propView.loadImage();
         this._propView.addEventListener(MouseEvent.MOUSE_DOWN,this.propView_mouseDownHandler);
         this.imageLayer.removeAllElements();
         this.imageLayer.addElement(this._propView as IVisualElement);
         this.assetControlBox.target = this._propView;
         this.assetControlBox.drawingScale = Math.abs(1 / (this.zoomLayer.scaleX * this.frameLayer.scaleX));
         this._propViewHighlight = new PropAssetView(param1);
         this._propViewHighlight = new AssetEditor(this._propViewHighlight as AssetView);
         this._propViewHighlight.loadImage();
         this.boundaryLayer.removeAllElements();
         this.boundaryLayer.addElement(this._propViewHighlight as IVisualElement);
      }
      
      private function propView_mouseDownHandler(param1:MouseEvent) : void
      {
         if(!this._prop)
         {
            return;
         }
         if(!this._oldMousePosition)
         {
            this._oldMousePosition = new Point();
         }
         this._oldMousePosition.x = this.frameLayer.mouseX;
         this._oldMousePosition.y = this.frameLayer.mouseY;
         if(!this._oldPropPosition)
         {
            this._oldPropPosition = new Point();
         }
         this._oldPropPosition.x = this._prop.x;
         this._oldPropPosition.y = this._prop.y;
         this.setFocus();
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.stage_mouseMoveHandler);
         this.stage.addEventListener(MouseEvent.MOUSE_UP,this.stage_mouseUpHandler);
      }
      
      private function stage_mouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this._prop)
         {
            _loc2_ = this._oldPropPosition.x + this.frameLayer.mouseX - this._oldMousePosition.x;
            _loc3_ = this._oldPropPosition.y + this.frameLayer.mouseY - this._oldMousePosition.y;
            this._prop.move(_loc2_,_loc3_);
            this._prop.setReferencePoint(_loc2_,_loc3_);
         }
      }
      
      private function stage_mouseUpHandler(param1:MouseEvent) : void
      {
         this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.stage_mouseMoveHandler);
         this.stage.removeEventListener(MouseEvent.MOUSE_UP,this.stage_mouseUpHandler);
      }
      
      private function commitPropValues() : void
      {
         var _loc1_:TransformFlowFrameImageCommand = null;
         if(this._flowFrame && this._prop)
         {
            _loc1_ = new TransformFlowFrameImageCommand(this._flowFrame,this._prop.x,this._prop.y,this._prop.scaleX,this._prop.scaleY,this._prop.rotation);
            _loc1_.execute();
         }
      }
      
      public function zoomAndPan(param1:Number, param2:Number, param3:Number) : void
      {
         this.zoomLayer.scaleX = param1;
         this.zoomLayer.scaleY = param1;
         this.zoomLayer.move(param2,param3);
      }
      
      protected function creationCompleteHandler(param1:FlexEvent) : void
      {
         this.addEventListener(KeyboardEvent.KEY_UP,this.this_keyUpHandler);
      }
      
      private function this_keyUpHandler(param1:KeyboardEvent) : void
      {
         var _loc2_:Number = !!param1.shiftKey?Number(MOVE_DISTANCE_LARGE):Number(MOVE_DISTANCE);
         switch(param1.keyCode)
         {
            case Keyboard.LEFT:
               this.moveImage(-_loc2_,0);
               break;
            case Keyboard.UP:
               this.moveImage(0,-_loc2_);
               break;
            case Keyboard.RIGHT:
               this.moveImage(_loc2_,0);
               break;
            case Keyboard.DOWN:
               this.moveImage(0,_loc2_);
         }
      }
      
      private function moveImage(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(this._prop)
         {
            _loc3_ = this._prop.x + param1;
            _loc4_ = this._prop.y + param2;
            this._prop.move(_loc3_,_loc4_);
            this._prop.setReferencePoint(_loc3_,_loc4_);
         }
      }
      
      private function _FlowFrameImageEditor_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._FlowFrameImageEditor_Rect1_c()];
         _loc1_.addEventListener("click",this.__backgroundLayer_click);
         _loc1_.id = "backgroundLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.backgroundLayer = _loc1_;
         BindingManager.executeBindings(this,"backgroundLayer",this.backgroundLayer);
         return _loc1_;
      }
      
      private function _FlowFrameImageEditor_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._FlowFrameImageEditor_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FlowFrameImageEditor_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      public function __backgroundLayer_click(param1:MouseEvent) : void
      {
         this.backgroundLayer_clickHandler(param1);
      }
      
      private function _FlowFrameImageEditor_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._FlowFrameImageEditor_Group4_i()];
         _loc1_.id = "zoomLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.zoomLayer = _loc1_;
         BindingManager.executeBindings(this,"zoomLayer",this.zoomLayer);
         return _loc1_;
      }
      
      private function _FlowFrameImageEditor_Group4_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._FlowFrameImageEditor_Group5_i()];
         _loc1_.id = "stageLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.stageLayer = _loc1_;
         BindingManager.executeBindings(this,"stageLayer",this.stageLayer);
         return _loc1_;
      }
      
      private function _FlowFrameImageEditor_Group5_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._FlowFrameImageEditor_Group6_i(),this._FlowFrameImageEditor_Group7_i(),this._FlowFrameImageEditor_Group8_i(),this._FlowFrameImageEditor_AssetControlBox1_i()];
         _loc1_.id = "frameLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.frameLayer = _loc1_;
         BindingManager.executeBindings(this,"frameLayer",this.frameLayer);
         return _loc1_;
      }
      
      private function _FlowFrameImageEditor_Group6_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.alpha = 0.5;
         _loc1_.id = "imageLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imageLayer = _loc1_;
         BindingManager.executeBindings(this,"imageLayer",this.imageLayer);
         return _loc1_;
      }
      
      private function _FlowFrameImageEditor_Group7_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseChildren = false;
         _loc1_.mouseEnabled = false;
         _loc1_.id = "boundaryLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.boundaryLayer = _loc1_;
         BindingManager.executeBindings(this,"boundaryLayer",this.boundaryLayer);
         return _loc1_;
      }
      
      private function _FlowFrameImageEditor_Group8_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._FlowFrameImageEditor_Rect2_i()];
         _loc1_.id = "maskLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.maskLayer = _loc1_;
         BindingManager.executeBindings(this,"maskLayer",this.maskLayer);
         return _loc1_;
      }
      
      private function _FlowFrameImageEditor_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.fill = this._FlowFrameImageEditor_SolidColor2_c();
         _loc1_.initialized(this,"boundaryMask");
         this.boundaryMask = _loc1_;
         BindingManager.executeBindings(this,"boundaryMask",this.boundaryMask);
         return _loc1_;
      }
      
      private function _FlowFrameImageEditor_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 255;
         return _loc1_;
      }
      
      private function _FlowFrameImageEditor_AssetControlBox1_i() : AssetControlBox
      {
         var _loc1_:AssetControlBox = new AssetControlBox();
         _loc1_.undoableAction = false;
         _loc1_.id = "assetControlBox";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.assetControlBox = _loc1_;
         BindingManager.executeBindings(this,"assetControlBox",this.assetControlBox);
         return _loc1_;
      }
      
      public function ___FlowFrameImageEditor_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.creationCompleteHandler(param1);
      }
      
      private function _FlowFrameImageEditor_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return AnimeConstants.STAGE_PADDING;
         },null,"stageLayer.x");
         result[1] = new Binding(this,function():Number
         {
            return AnimeConstants.STAGE_PADDING;
         },null,"stageLayer.y");
         result[2] = new Binding(this,null,null,"boundaryLayer.mask","maskLayer");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get assetControlBox() : AssetControlBox
      {
         return this._987258306assetControlBox;
      }
      
      public function set assetControlBox(param1:AssetControlBox) : void
      {
         var _loc2_:Object = this._987258306assetControlBox;
         if(_loc2_ !== param1)
         {
            this._987258306assetControlBox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"assetControlBox",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get backgroundLayer() : Group
      {
         return this._1295031491backgroundLayer;
      }
      
      public function set backgroundLayer(param1:Group) : void
      {
         var _loc2_:Object = this._1295031491backgroundLayer;
         if(_loc2_ !== param1)
         {
            this._1295031491backgroundLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"backgroundLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get boundaryLayer() : Group
      {
         return this._1353615175boundaryLayer;
      }
      
      public function set boundaryLayer(param1:Group) : void
      {
         var _loc2_:Object = this._1353615175boundaryLayer;
         if(_loc2_ !== param1)
         {
            this._1353615175boundaryLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"boundaryLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get boundaryMask() : Rect
      {
         return this._1152073270boundaryMask;
      }
      
      public function set boundaryMask(param1:Rect) : void
      {
         var _loc2_:Object = this._1152073270boundaryMask;
         if(_loc2_ !== param1)
         {
            this._1152073270boundaryMask = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"boundaryMask",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get frameLayer() : Group
      {
         return this._288614428frameLayer;
      }
      
      public function set frameLayer(param1:Group) : void
      {
         var _loc2_:Object = this._288614428frameLayer;
         if(_loc2_ !== param1)
         {
            this._288614428frameLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"frameLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageLayer() : Group
      {
         return this._1460872010imageLayer;
      }
      
      public function set imageLayer(param1:Group) : void
      {
         var _loc2_:Object = this._1460872010imageLayer;
         if(_loc2_ !== param1)
         {
            this._1460872010imageLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get maskLayer() : Group
      {
         return this._69905979maskLayer;
      }
      
      public function set maskLayer(param1:Group) : void
      {
         var _loc2_:Object = this._69905979maskLayer;
         if(_loc2_ !== param1)
         {
            this._69905979maskLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maskLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get stageLayer() : Group
      {
         return this._1101680883stageLayer;
      }
      
      public function set stageLayer(param1:Group) : void
      {
         var _loc2_:Object = this._1101680883stageLayer;
         if(_loc2_ !== param1)
         {
            this._1101680883stageLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"stageLayer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get zoomLayer() : Group
      {
         return this._1634741566zoomLayer;
      }
      
      public function set zoomLayer(param1:Group) : void
      {
         var _loc2_:Object = this._1634741566zoomLayer;
         if(_loc2_ !== param1)
         {
            this._1634741566zoomLayer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"zoomLayer",_loc2_,param1));
            }
         }
      }
   }
}
