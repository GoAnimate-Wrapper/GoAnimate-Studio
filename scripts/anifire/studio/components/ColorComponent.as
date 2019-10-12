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
   import anifire.studio.models.ColorPartModel;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import spark.components.Button;
   import spark.components.Form;
   import spark.components.VGroup;
   
   use namespace mx_internal;
   
   public class ColorComponent extends VGroup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1608109094colorPartForm:Form;
      
      private var _1249819808restoreButton:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _asset:Asset;
      
      private var _scene:AnimeScene;
      
      private var _view:IAssetView;
      
      private var sceneMode:Boolean;
      
      private var _colorAssetCommand:ColorAssetCommand;
      
      private var _sceneColorCommand:SceneColorCommand;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ColorComponent()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ColorComponent_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ColorComponentWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ColorComponent[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.horizontalAlign = "center";
         this.gap = 6;
         this.paddingLeft = 14;
         this.paddingRight = 14;
         this.mxmlContent = [this._ColorComponent_Form1_i(),this._ColorComponent_Button1_i()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ColorComponent._watcherSetupUtil = param1;
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
         var _loc2_:Boolean = false;
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
            _loc2_ = this.createColorModel();
         }
         if(param1 is AnimeScene)
         {
            this.createSceneColorModel();
         }
         this.restoreButton.visible = this.restoreButton.includeInLayout = this.scene == null;
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
         var _loc2_:ColorPaletteFormItem = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.colorPartForm.numElements)
         {
            _loc2_ = this.colorPartForm.getElementAt(_loc1_) as ColorPaletteFormItem;
            _loc2_.removeEventListener(Event.CHANGE,this.onColorPartChange);
            _loc1_++;
         }
         this.colorPartForm.removeAllElements();
      }
      
      private function createSceneColorModel() : void
      {
         this.sceneMode = true;
         this.clearColorParts();
         var _loc1_:ColorPaletteFormItem = new ColorPaletteFormItem();
         var _loc2_:ColorPartModel = new ColorPartModel();
         _loc2_.color = this._scene.baseColor;
         _loc2_.partId = "";
         _loc1_.addEventListener(ColorPaletteEvent.COLOR_CHANGE,this.onSceneColorPartChange);
         _loc1_.addEventListener(ColorPaletteEvent.COLOR_PREVIEW,this.onSceneColorPartPreview);
         _loc1_.model = _loc2_;
         this.colorPartForm.styleName = "compact";
         this.colorPartForm.addElement(_loc1_);
      }
      
      private function createColorModel() : Boolean
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:ColorPartModel = null;
         var _loc6_:SelectedColor = null;
         var _loc7_:ColorPaletteFormItem = null;
         this.sceneMode = false;
         this.clearColorParts();
         var _loc1_:IColorable = this._view.assetImage as IColorable;
         if(_loc1_)
         {
            _loc2_ = _loc1_.colorableArea;
            if(!(_loc2_ && _loc2_.length > 0))
            {
               return false;
            }
            this.colorPartForm.styleName = "compact";
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length)
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new ColorPartModel(_loc4_);
               _loc6_ = this._asset.customColor.getValueByKey(_loc4_) as SelectedColor;
               if(this._asset is Character)
               {
                  if(_loc1_ is CharacterAssetImage && CharacterAssetImage(_loc1_).getCCSelectedColor())
                  {
                     _loc6_ = CharacterAssetImage(_loc1_).getCCSelectedColor().getValueByKey(_loc4_) as SelectedColor;
                  }
               }
               if(_loc6_)
               {
                  _loc5_.color = _loc6_.dstColor;
               }
               _loc7_ = new ColorPaletteFormItem();
               _loc7_.addEventListener(ColorPaletteEvent.COLOR_CHANGE,this.onColorPartChange);
               _loc7_.addEventListener(ColorPaletteEvent.COLOR_PREVIEW,this.onColorPartPreview);
               _loc7_.model = _loc5_;
               this.colorPartForm.addElement(_loc7_);
               _loc3_++;
            }
            return true;
         }
         return false;
      }
      
      private function updateColorModel() : void
      {
         var _loc2_:ColorPaletteFormItem = null;
         var _loc3_:ColorPartModel = null;
         var _loc4_:SelectedColor = null;
         var _loc5_:IColorable = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.colorPartForm.numElements)
         {
            _loc2_ = this.colorPartForm.getElementAt(_loc1_) as ColorPaletteFormItem;
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
         var _loc1_:ColorPaletteFormItem = this.colorPartForm.getElementAt(0) as ColorPaletteFormItem;
         var _loc2_:ColorPartModel = _loc1_.model;
         _loc2_.color = this._scene.baseColor;
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
      }
      
      protected function onColorPartPreview(param1:Event) : void
      {
         var _loc3_:ColorPartModel = null;
         var _loc2_:ColorPaletteFormItem = param1.currentTarget as ColorPaletteFormItem;
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
         var _loc2_:ColorPaletteFormItem = param1.currentTarget as ColorPaletteFormItem;
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
      
      protected function startChangingSceneColorPart(param1:ColorPartModel) : void
      {
         if(!this._sceneColorCommand)
         {
            this._sceneColorCommand = new SceneColorCommand(this._scene.background,param1.color);
            this._sceneColorCommand.execute();
         }
         else
         {
            this._sceneColorCommand.newColor = param1.color;
         }
      }
      
      protected function onSceneColorPartPreview(param1:Event) : void
      {
         var _loc3_:ColorPartModel = null;
         var _loc2_:ColorPaletteFormItem = param1.currentTarget as ColorPaletteFormItem;
         if(_loc2_)
         {
            _loc3_ = _loc2_.model;
            if(_loc3_)
            {
               this.startChangingSceneColorPart(_loc3_);
               this._scene.applyColor(_loc3_.color);
            }
         }
      }
      
      protected function onSceneColorPartChange(param1:Event) : void
      {
         var _loc3_:ColorPartModel = null;
         var _loc2_:ColorPaletteFormItem = param1.currentTarget as ColorPaletteFormItem;
         if(_loc2_)
         {
            _loc3_ = _loc2_.model;
            if(_loc3_)
            {
               this.startChangingSceneColorPart(_loc3_);
               this._scene.applyColor(_loc3_.color);
               this._sceneColorCommand = null;
            }
         }
      }
      
      protected function onSceneBaseColorChange(param1:SceneEvent) : void
      {
         this.updateSceneColorModel();
      }
      
      private function _ColorComponent_Form1_i() : Form
      {
         var _loc1_:Form = new Form();
         _loc1_.styleName = "compact";
         _loc1_.percentWidth = 100;
         _loc1_.id = "colorPartForm";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.colorPartForm = _loc1_;
         BindingManager.executeBindings(this,"colorPartForm",this.colorPartForm);
         return _loc1_;
      }
      
      private function _ColorComponent_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__restoreButton_click);
         _loc1_.id = "restoreButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.restoreButton = _loc1_;
         BindingManager.executeBindings(this,"restoreButton",this.restoreButton);
         return _loc1_;
      }
      
      public function __restoreButton_click(param1:MouseEvent) : void
      {
         this.onRestoreBtnClick(param1);
      }
      
      private function _ColorComponent_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Restore default");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"restoreButton.label");
         return result;
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
      public function get restoreButton() : Button
      {
         return this._1249819808restoreButton;
      }
      
      public function set restoreButton(param1:Button) : void
      {
         var _loc2_:Object = this._1249819808restoreButton;
         if(_loc2_ !== param1)
         {
            this._1249819808restoreButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"restoreButton",_loc2_,param1));
            }
         }
      }
   }
}
