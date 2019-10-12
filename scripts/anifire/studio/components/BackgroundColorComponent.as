package anifire.studio.components
{
   import anifire.color.SelectedColor;
   import anifire.event.ColorPaletteEvent;
   import anifire.studio.assets.image.CharacterAssetImage;
   import anifire.studio.commands.ColorAssetCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.commands.RestoreAssetColorCommand;
   import anifire.studio.commands.SceneColorCommand;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Background;
   import anifire.studio.core.Character;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.SceneEvent;
   import anifire.studio.interfaces.IAssetView;
   import anifire.studio.interfaces.IColorable;
   import anifire.studio.managers.ColorManager;
   import anifire.studio.models.ColorPartModel;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Form;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.filters.DropShadowFilter;
   import spark.primitives.Ellipse;
   
   public class BackgroundColorComponent extends VGroup implements IStateClient2
   {
       
      
      private var _1644829642_BackgroundColorComponent_Group1:Group;
      
      private var _1608109094colorPartForm:Form;
      
      private var _889711556swatch:Ellipse;
      
      private var _110371416title:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _asset:Asset;
      
      private var _scene:AnimeScene;
      
      private var _view:IAssetView;
      
      private var sceneMode:Boolean;
      
      private var _colorAssetCommand:ColorAssetCommand;
      
      private var _sceneColorCommand:SceneColorCommand;
      
      private var _colorChangable:Boolean;
      
      private var _colorManager:ColorManager;
      
      private var _target:Object;
      
      public function BackgroundColorComponent()
      {
         this._colorManager = ColorManager.instance;
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.alpha = 1;
         this.mxmlContent = [this._BackgroundColorComponent_Label1_i(),this._BackgroundColorComponent_Group1_i(),this._BackgroundColorComponent_Form1_i()];
         this.currentState = "normal";
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disable",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.6
            }),new SetProperty().initializeFromObject({
               "target":"_BackgroundColorComponent_Group1",
               "name":"visible",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"_BackgroundColorComponent_Group1",
               "name":"includeInLayout",
               "value":true
            }),new SetProperty().initializeFromObject({
               "target":"colorPartForm",
               "name":"visible",
               "value":false
            }),new SetProperty().initializeFromObject({
               "target":"colorPartForm",
               "name":"includeInLayout",
               "value":false
            })]
         })];
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
      
      public function set target(param1:Object) : void
      {
         var _loc2_:* = this._target != param1;
         this._target = param1;
         this._view = param1 as IAssetView;
         if(this._view)
         {
            param1 = this._view.asset;
         }
         if(param1 is Background)
         {
            this.scene = Background(param1).scene;
         }
         else if(param1 is AnimeScene)
         {
            this.scene = param1 as AnimeScene;
         }
         this.asset = param1 as Asset;
         if(this._asset)
         {
            this._colorChangable = this.createColorModel(_loc2_);
         }
         if(param1 is AnimeScene)
         {
            this.createSceneColorModel(_loc2_);
            this._colorChangable = true;
         }
         currentState = !!this._colorChangable?"normal":"disable";
         this.updateTitle();
      }
      
      protected function get asset() : Asset
      {
         return this._asset;
      }
      
      protected function set asset(param1:Asset) : void
      {
         if(this._asset != param1)
         {
            if(this._asset)
            {
               this._asset.removeEventListener(AssetEvent.COLOR_CHANGE,this.onAssetColorChange);
            }
            this._asset = param1;
            if(this._asset)
            {
               this._asset.addEventListener(AssetEvent.COLOR_CHANGE,this.onAssetColorChange);
            }
         }
      }
      
      protected function get scene() : AnimeScene
      {
         return this._scene;
      }
      
      protected function set scene(param1:AnimeScene) : void
      {
         if(this._scene != param1)
         {
            if(this._scene)
            {
               this._scene.removeEventListener(SceneEvent.BASE_COLOR_CHANGE,this.onSceneBaseColorChange);
            }
            this._scene = param1;
            if(this._scene)
            {
               this._scene.addEventListener(SceneEvent.BASE_COLOR_CHANGE,this.onSceneBaseColorChange);
            }
         }
      }
      
      private function clearColorParts() : void
      {
         var _loc2_:BackgroundColorFormItem = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.colorPartForm.numElements)
         {
            _loc2_ = this.colorPartForm.getElementAt(_loc1_) as BackgroundColorFormItem;
            _loc2_.removeEventListener(Event.CHANGE,this.onColorPartChange);
            _loc1_++;
         }
         this.colorPartForm.removeAllElements();
      }
      
      private function createSceneColorModel(param1:Boolean = true) : void
      {
         var _loc3_:BackgroundColorFormItem = null;
         this.sceneMode = true;
         var _loc2_:ColorPartModel = new ColorPartModel();
         _loc2_.color = this._scene.baseColor;
         _loc2_.partId = ColorManager.SCENE_COLOR_PART_ID;
         if(param1)
         {
            this.clearColorParts();
            _loc3_ = new BackgroundColorFormItem();
            _loc3_.addEventListener(ColorPaletteEvent.COLOR_CHANGE,this.onSceneColorPartChange);
            _loc3_.addEventListener(ColorPaletteEvent.COLOR_PREVIEW,this.onSceneColorPartPreview);
            _loc3_.model = _loc2_;
            this.colorPartForm.addElement(_loc3_);
         }
         else
         {
            _loc3_ = this.colorPartForm.getElementAt(0) as BackgroundColorFormItem;
            _loc3_.model = _loc2_;
         }
         this._colorManager.updateColorValue(_loc2_.partId,_loc2_.color);
      }
      
      private function createColorModel(param1:Boolean = true) : Boolean
      {
         var _loc2_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:ColorPartModel = null;
         var _loc8_:SelectedColor = null;
         var _loc9_:BackgroundColorFormItem = null;
         var _loc10_:Object = null;
         this.sceneMode = false;
         if(param1)
         {
            this.clearColorParts();
         }
         var _loc3_:IColorable = this._view.assetImage as IColorable;
         if(_loc3_)
         {
            _loc4_ = _loc3_.colorableArea;
            if(!(_loc4_ && _loc4_.length > 0))
            {
               return false;
            }
            _loc5_ = _loc4_.length;
            _loc2_ = 0;
            while(_loc2_ < _loc5_)
            {
               _loc6_ = _loc4_[_loc2_];
               _loc7_ = new ColorPartModel(_loc6_);
               _loc8_ = this._asset.customColor.getValueByKey(_loc6_) as SelectedColor;
               if(!_loc8_)
               {
                  _loc10_ = this._asset.thumb.defaultColor;
                  if(_loc10_)
                  {
                     if(_loc10_[_loc6_] != null)
                     {
                        _loc7_.color = _loc10_[_loc6_];
                     }
                  }
               }
               else
               {
                  _loc7_.color = _loc8_.dstColor;
                  this._colorManager.updateColorValue(_loc7_.partId,_loc7_.color);
               }
               if(param1 || _loc2_ >= this.colorPartForm.numElements)
               {
                  _loc9_ = new BackgroundColorFormItem();
                  _loc9_.addEventListener(ColorPaletteEvent.COLOR_CHANGE,this.onColorPartChange);
                  _loc9_.addEventListener(ColorPaletteEvent.COLOR_PREVIEW,this.onColorPartPreview);
                  _loc9_.model = _loc7_;
                  this.colorPartForm.addElement(_loc9_);
               }
               else
               {
                  _loc9_ = this.colorPartForm.getElementAt(_loc2_) as BackgroundColorFormItem;
                  _loc9_.model = _loc7_;
               }
               _loc2_++;
            }
            _loc2_ = this.colorPartForm.numElements - 1;
            while(_loc2_ >= _loc5_)
            {
               this.colorPartForm.removeElementAt(_loc2_);
               _loc2_--;
            }
            return true;
         }
         return false;
      }
      
      private function updateColorModel() : void
      {
         var _loc2_:BackgroundColorFormItem = null;
         var _loc3_:ColorPartModel = null;
         var _loc4_:SelectedColor = null;
         var _loc5_:IColorable = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.colorPartForm.numElements)
         {
            _loc2_ = this.colorPartForm.getElementAt(_loc1_) as BackgroundColorFormItem;
            _loc3_ = _loc2_.model;
            _loc4_ = this._asset.customColor.getValueByKey(_loc3_.partId) as SelectedColor;
            if(this._asset is Character)
            {
               _loc5_ = this._view.assetImage as IColorable;
               if(_loc5_ is CharacterAssetImage)
               {
                  _loc4_ = CharacterAssetImage(_loc5_).getCCSelectedColor().getValueByKey(_loc3_.partId) as SelectedColor;
               }
            }
            if(_loc4_)
            {
               _loc3_.color = _loc4_.dstColor;
            }
            else
            {
               _loc3_.color = 0;
            }
            _loc1_++;
         }
      }
      
      private function updateSceneColorModel() : void
      {
         var _loc1_:BackgroundColorFormItem = null;
         var _loc2_:ColorPartModel = null;
         if(this.colorPartForm.numElements > 0)
         {
            _loc1_ = this.colorPartForm.getElementAt(0) as BackgroundColorFormItem;
            _loc2_ = _loc1_.model;
            _loc2_.color = this._scene.baseColor;
         }
      }
      
      private function onRestoreBtnClick(param1:MouseEvent) : void
      {
         var _loc2_:ICommand = null;
         if(this.sceneMode)
         {
            _loc2_ = new SceneColorCommand(this._scene.background,AnimeScene.DEFAULT_BASE_COLOR,true);
            _loc2_.execute();
            this.updateSceneColorModel();
         }
         else if(this._asset is IColorable)
         {
            _loc2_ = new RestoreAssetColorCommand(this._asset as IColorable);
            _loc2_.execute();
            this.updateColorModel();
         }
      }
      
      protected function startChangingColorPart(param1:ColorPartModel) : void
      {
         if(!this._colorAssetCommand)
         {
            this._colorAssetCommand = new ColorAssetCommand(this._asset as IColorable,param1.partId,param1.color);
            this._colorAssetCommand.execute();
         }
         else
         {
            this._colorAssetCommand.newColor = param1.color;
         }
         this._colorManager.updateColorValue(param1.partId,param1.color);
      }
      
      protected function onColorPartPreview(param1:Event) : void
      {
         var _loc3_:ColorPartModel = null;
         var _loc2_:BackgroundColorFormItem = param1.currentTarget as BackgroundColorFormItem;
         if(_loc2_)
         {
            _loc3_ = _loc2_.model;
            if(_loc3_)
            {
               this.startChangingColorPart(_loc3_);
               this._asset.changeColor(_loc3_.partId,_loc3_.color);
            }
         }
      }
      
      protected function onColorPartChange(param1:Event) : void
      {
         var _loc3_:ColorPartModel = null;
         var _loc2_:BackgroundColorFormItem = param1.currentTarget as BackgroundColorFormItem;
         if(_loc2_)
         {
            _loc3_ = _loc2_.model;
            if(_loc3_)
            {
               this.startChangingColorPart(_loc3_);
               this._asset.changeColor(_loc3_.partId,_loc3_.color);
               this._colorAssetCommand = null;
            }
         }
      }
      
      protected function onAssetColorChange(param1:AssetEvent) : void
      {
         this.updateColorModel();
      }
      
      protected function onSceneColorPartPreview(param1:Event) : void
      {
         var _loc3_:ColorPartModel = null;
         var _loc2_:BackgroundColorFormItem = param1.currentTarget as BackgroundColorFormItem;
         if(_loc2_)
         {
            _loc3_ = _loc2_.model;
            if(_loc3_)
            {
               this._scene.applyColor(_loc3_.color);
               if(!this._sceneColorCommand)
               {
                  this._sceneColorCommand = new SceneColorCommand(this._scene.background,_loc3_.color);
               }
               else
               {
                  this._sceneColorCommand.newColor = _loc3_.color;
               }
            }
         }
      }
      
      protected function onSceneColorPartChange(param1:Event) : void
      {
         var _loc3_:ColorPartModel = null;
         var _loc2_:BackgroundColorFormItem = param1.currentTarget as BackgroundColorFormItem;
         if(_loc2_)
         {
            _loc3_ = _loc2_.model;
            if(_loc3_)
            {
               if(!this._sceneColorCommand)
               {
                  this._sceneColorCommand = new SceneColorCommand(this._scene.background,_loc3_.color);
               }
               this._sceneColorCommand.execute();
               this._sceneColorCommand = null;
            }
         }
      }
      
      protected function onSceneBaseColorChange(param1:SceneEvent) : void
      {
         this.updateSceneColorModel();
      }
      
      private function updateTitle() : void
      {
         if(!this._colorChangable)
         {
            this.title.text = UtilDict.translate("No color");
         }
         else if(this.colorPartForm.numElements == 1)
         {
            this.title.text = UtilDict.translate("Color");
         }
         else
         {
            this.title.text = UtilDict.translate("Colors");
         }
      }
      
      public function updateAssignedColors() : void
      {
         var _loc2_:BackgroundColorFormItem = null;
         var _loc3_:ColorPartModel = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.colorPartForm.numElements)
         {
            _loc2_ = this.colorPartForm.getElementAt(_loc1_) as BackgroundColorFormItem;
            _loc3_ = _loc2_.model;
            ColorManager.instance.updateColorValue(_loc3_.partId,_loc3_.color);
            _loc1_++;
         }
      }
      
      private function _BackgroundColorComponent_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("color",5724523);
         _loc1_.id = "title";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.title = _loc1_;
         BindingManager.executeBindings(this,"title",this.title);
         return _loc1_;
      }
      
      private function _BackgroundColorComponent_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.mxmlContent = [this._BackgroundColorComponent_Ellipse1_i()];
         _loc1_.id = "_BackgroundColorComponent_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._BackgroundColorComponent_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_BackgroundColorComponent_Group1",this._BackgroundColorComponent_Group1);
         return _loc1_;
      }
      
      private function _BackgroundColorComponent_Ellipse1_i() : Ellipse
      {
         var _loc1_:Ellipse = new Ellipse();
         _loc1_.width = 28;
         _loc1_.height = 28;
         _loc1_.fill = this._BackgroundColorComponent_SolidColor1_c();
         _loc1_.stroke = this._BackgroundColorComponent_SolidColorStroke1_c();
         _loc1_.filters = [this._BackgroundColorComponent_DropShadowFilter1_c()];
         _loc1_.initialized(this,"swatch");
         this.swatch = _loc1_;
         BindingManager.executeBindings(this,"swatch",this.swatch);
         return _loc1_;
      }
      
      private function _BackgroundColorComponent_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 10066329;
         return _loc1_;
      }
      
      private function _BackgroundColorComponent_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14803430;
         return _loc1_;
      }
      
      private function _BackgroundColorComponent_DropShadowFilter1_c() : DropShadowFilter
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _loc1_.color = 0;
         _loc1_.alpha = 0.15;
         _loc1_.distance = 3;
         _loc1_.inner = true;
         _loc1_.angle = 90;
         return _loc1_;
      }
      
      private function _BackgroundColorComponent_Form1_i() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.visible = true;
         _loc1_.includeInLayout = true;
         _loc1_.styleName = "backgroundform";
         _loc1_.id = "colorPartForm";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorPartForm = _loc1_;
         BindingManager.executeBindings(this,"colorPartForm",this.colorPartForm);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _BackgroundColorComponent_Group1() : Group
      {
         return this._1644829642_BackgroundColorComponent_Group1;
      }
      
      public function set _BackgroundColorComponent_Group1(param1:Group) : void
      {
         var _loc2_:Object = this._1644829642_BackgroundColorComponent_Group1;
         if(_loc2_ !== param1)
         {
            this._1644829642_BackgroundColorComponent_Group1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_BackgroundColorComponent_Group1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get colorPartForm() : Form
      {
         return this._1608109094colorPartForm;
      }
      
      public function set colorPartForm(param1:Form) : void
      {
         var _loc2_:Object = this._1608109094colorPartForm;
         if(_loc2_ !== param1)
         {
            this._1608109094colorPartForm = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"colorPartForm",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get swatch() : Ellipse
      {
         return this._889711556swatch;
      }
      
      public function set swatch(param1:Ellipse) : void
      {
         var _loc2_:Object = this._889711556swatch;
         if(_loc2_ !== param1)
         {
            this._889711556swatch = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"swatch",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get title() : Label
      {
         return this._110371416title;
      }
      
      public function set title(param1:Label) : void
      {
         var _loc2_:Object = this._110371416title;
         if(_loc2_ !== param1)
         {
            this._110371416title = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"title",_loc2_,param1));
            }
         }
      }
   }
}
