package anifire.studio.components
{
   import anifire.managers.CCThemeManager;
   import anifire.models.creator.CCFaceModel;
   import anifire.models.creator.CCThemeModel;
   import anifire.studio.commands.CcLookAtCameraCommand;
   import anifire.studio.commands.ChangeFacialExpressionCommand;
   import anifire.studio.commands.ICommand;
   import anifire.studio.core.CharThumb;
   import anifire.studio.core.Character;
   import anifire.studio.events.AssetEvent;
   import anifire.studio.events.CharacterAssetEvent;
   import anifire.studio.interfaces.IEye;
   import anifire.studio.models.FacePreviewModel;
   import anifire.studio.models.MenuItemModel;
   import anifire.studio.skins.ClearCharacterActionButtonSkin;
   import anifire.studio.skins.ExpressionDropDownListSkin;
   import anifire.studio.skins.LookAtCameraToggleButtonSkin;
   import anifire.util.UtilDict;
   import anifire.util.UtilString;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.collections.Sort;
   import spark.collections.SortField;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.ToggleButton;
   import spark.events.IndexChangeEvent;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class CharacterExpressionPanel extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _CharacterExpressionPanel_Label1:Label;
      
      private var _2071192609clearButton:Button;
      
      private var _1318802602expressionList:DropDownList;
      
      private var _1711989513lookAtCameraButton:ToggleButton;
      
      private var _2146085971selectionGroup:Group;
      
      private var _1795581177titleGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _character:Character;
      
      protected var _eye:IEye;
      
      protected var _hasExpressions:Boolean;
      
      protected var _withoutHeadProp:Boolean;
      
      protected var _446488804_expressions:ArrayCollection;
      
      protected var _expressionLookup:Object;
      
      protected var autoFaceModel:FacePreviewModel;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CharacterExpressionPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._CharacterExpressionPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_CharacterExpressionPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CharacterExpressionPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._CharacterExpressionPanel_HGroup1_c()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CharacterExpressionPanel._watcherSetupUtil = param1;
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
      
      protected function set hasExpressions(param1:Boolean) : void
      {
         this._hasExpressions = param1;
         visible = this._hasExpressions && this._withoutHeadProp;
         includeInLayout = this._hasExpressions && this._withoutHeadProp;
      }
      
      public function set withoutHeadProp(param1:Boolean) : void
      {
         this._withoutHeadProp = param1;
         visible = this._hasExpressions && this._withoutHeadProp;
         includeInLayout = this._hasExpressions && this._withoutHeadProp;
      }
      
      public function get character() : Character
      {
         return this._character;
      }
      
      public function set character(param1:Character) : void
      {
         if(this._character != param1)
         {
            if(this._character)
            {
               this._character.removeEventListener(CharacterAssetEvent.FACIAL_CHANGE,this.onFacialChange);
               this._character.removeEventListener(AssetEvent.EYE_CHANGE,this.onEyeChange);
               this._character.removeEventListener(AssetEvent.CHARACTER_SWAP_COMPLETE,this.onCharacterSwap);
            }
            this._character = param1;
            if(this._character)
            {
               this.createMenuModel(this._character.thumb as CharThumb);
               this.lookAtCameraButton.selected = this._character.lookAtCamera;
               this._character.addEventListener(CharacterAssetEvent.FACIAL_CHANGE,this.onFacialChange);
               this._character.addEventListener(AssetEvent.EYE_CHANGE,this.onEyeChange);
               this._character.addEventListener(AssetEvent.CHARACTER_SWAP_COMPLETE,this.onCharacterSwap);
            }
            else
            {
               this._expressions = null;
               this._expressionLookup = null;
            }
         }
      }
      
      public function get eye() : IEye
      {
         return this._eye;
      }
      
      public function set eye(param1:IEye) : void
      {
         if(this._eye != param1)
         {
            this._eye = param1;
            if(this._eye && this._eye.lookAtCameraSupported)
            {
               this.lookAtCameraButton.visible = true;
               this.lookAtCameraButton.includeInLayout = true;
               if(this._character)
               {
                  this._eye.lookAtCamera = this._character.lookAtCamera;
               }
            }
            else
            {
               this.lookAtCameraButton.visible = false;
               this.lookAtCameraButton.includeInLayout = false;
            }
         }
      }
      
      private function createMenuModel(param1:CharThumb) : void
      {
         var _loc2_:String = null;
         var _loc5_:MenuItemModel = null;
         if(this._character.head && this._character.head.state)
         {
            _loc2_ = this._character.head.state.id;
         }
         this.expressionList.selectedIndex = -1;
         this._expressions = new ArrayCollection();
         this._expressionLookup = {};
         this.autoFaceModel = new FacePreviewModel(this._character,Character.AUTO_FACIAL_EXPRESSION);
         var _loc3_:MenuItemModel = new MenuItemModel(UtilDict.toDisplay("go","Auto"),this.autoFaceModel);
         _loc3_.sortOrder = -2;
         this._expressions.addItem(_loc3_);
         this._expressionLookup[Character.AUTO_FACIAL_EXPRESSION] = _loc3_;
         var _loc4_:MenuItemModel = new MenuItemModel("",null,MenuItemModel.MENU_TYPE_SEPARATOR);
         _loc4_.sortOrder = -1;
         this._expressions.addItem(_loc4_);
         if(param1.isCC)
         {
            _loc5_ = this.createMenuByCCThemeModel(CCThemeManager.instance.getThemeModel(param1.ccThemeId),_loc2_);
         }
         else if(param1.xml)
         {
            _loc5_ = this.createMenuByXml(param1.xml,_loc2_);
         }
         var _loc6_:Sort = new Sort();
         _loc6_.fields = [new SortField("sortOrder",false,true),new SortField("label")];
         this._expressions.sort = _loc6_;
         this._expressions.refresh();
         this.hasExpressions = this._expressions.length > 2;
         if(_loc5_)
         {
            this.expressionList.selectedItem = _loc5_;
         }
         else
         {
            this.expressionList.selectedItem = _loc3_;
         }
      }
      
      protected function createMenuByCCThemeModel(param1:CCThemeModel, param2:String) : MenuItemModel
      {
         var _loc3_:MenuItemModel = null;
         var _loc4_:* = null;
         var _loc5_:CCFaceModel = null;
         var _loc6_:FacePreviewModel = null;
         var _loc7_:MenuItemModel = null;
         for(_loc4_ in param1.faces)
         {
            _loc5_ = param1.faces[_loc4_];
            _loc6_ = new FacePreviewModel(this._character,_loc4_ + ".xml");
            _loc7_ = new MenuItemModel(UtilString.firstLetterToUpperCase(UtilDict.toDisplay("store",_loc5_.name)),_loc6_);
            if(_loc5_.enable)
            {
               this._expressions.addItem(_loc7_);
               this._expressionLookup[_loc6_.stateId] = _loc7_;
            }
            if(_loc6_.stateId == param2)
            {
               _loc3_ = _loc7_;
            }
         }
         return _loc3_;
      }
      
      protected function createMenuByXml(param1:XML, param2:String) : MenuItemModel
      {
         var _loc3_:MenuItemModel = null;
         var _loc4_:XML = null;
         var _loc5_:FacePreviewModel = null;
         var _loc6_:MenuItemModel = null;
         for each(_loc4_ in param1.descendants("facial"))
         {
            if(_loc4_.@enable != "N")
            {
               _loc5_ = new FacePreviewModel(this._character,_loc4_.@id);
               _loc6_ = new MenuItemModel(UtilString.firstLetterToUpperCase(UtilDict.toDisplay("store",_loc4_.@name)),_loc5_);
               this._expressions.addItem(_loc6_);
               this._expressionLookup[_loc5_.stateId] = _loc6_;
               if(_loc5_.stateId == param2)
               {
                  _loc3_ = _loc6_;
               }
            }
         }
         return _loc3_;
      }
      
      protected function onExpressionChange(param1:IndexChangeEvent) : void
      {
         var _loc2_:MenuItemModel = this.expressionList.selectedItem as MenuItemModel;
         if(_loc2_ && this._character)
         {
            this.changeFacial((_loc2_.value as FacePreviewModel).stateId);
            if(this._eye)
            {
               this.lookAtCameraButton.selected = this._eye.lookAtCamera;
            }
         }
      }
      
      protected function onLookAtCameraClick(param1:MouseEvent) : void
      {
         var _loc2_:ICommand = new CcLookAtCameraCommand(this._character,!this._character.lookAtCamera);
         _loc2_.execute();
         this._eye.lookAtCamera = this._character.lookAtCamera;
      }
      
      protected function onClearButtonClick(param1:MouseEvent) : void
      {
         if(this._character)
         {
            this.changeFacial(Character.AUTO_FACIAL_EXPRESSION);
            this.expressionList.selectedIndex = 0;
         }
      }
      
      protected function changeFacial(param1:String) : void
      {
         var _loc2_:ICommand = new ChangeFacialExpressionCommand(this._character,param1);
         _loc2_.execute();
      }
      
      public function updateAutoFacial(param1:String) : void
      {
         if(param1)
         {
            this.autoFaceModel.updateAutoState(param1);
         }
      }
      
      protected function onCharacterSwap(param1:AssetEvent) : void
      {
         this.createMenuModel(this._character.thumb as CharThumb);
      }
      
      protected function onEyeChange(param1:AssetEvent) : void
      {
         this.lookAtCameraButton.selected = this._character.lookAtCamera;
      }
      
      protected function onFacialChange(param1:CharacterAssetEvent) : void
      {
         this.expressionList.selectedItem = this._expressionLookup[this._character.facialId];
      }
      
      private function _CharacterExpressionPanel_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._CharacterExpressionPanel_Group2_i(),this._CharacterExpressionPanel_Group3_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CharacterExpressionPanel_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 98;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CharacterExpressionPanel_Rect1_c(),this._CharacterExpressionPanel_Line1_c(),this._CharacterExpressionPanel_Line2_c(),this._CharacterExpressionPanel_HGroup2_c()];
         _loc1_.id = "titleGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.titleGroup = _loc1_;
         BindingManager.executeBindings(this,"titleGroup",this.titleGroup);
         return _loc1_;
      }
      
      private function _CharacterExpressionPanel_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._CharacterExpressionPanel_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CharacterExpressionPanel_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3233154;
         return _loc1_;
      }
      
      private function _CharacterExpressionPanel_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._CharacterExpressionPanel_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CharacterExpressionPanel_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 4023184;
         return _loc1_;
      }
      
      private function _CharacterExpressionPanel_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.top = 1;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.stroke = this._CharacterExpressionPanel_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CharacterExpressionPanel_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 5276350;
         return _loc1_;
      }
      
      private function _CharacterExpressionPanel_HGroup2_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 0;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.paddingLeft = 10;
         _loc1_.paddingRight = 5;
         _loc1_.mxmlContent = [this._CharacterExpressionPanel_Label1_i(),this._CharacterExpressionPanel_Button1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CharacterExpressionPanel_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("paddingTop",4);
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "_CharacterExpressionPanel_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CharacterExpressionPanel_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_CharacterExpressionPanel_Label1",this._CharacterExpressionPanel_Label1);
         return _loc1_;
      }
      
      private function _CharacterExpressionPanel_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",ClearCharacterActionButtonSkin);
         _loc1_.addEventListener("click",this.__clearButton_click);
         _loc1_.id = "clearButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.clearButton = _loc1_;
         BindingManager.executeBindings(this,"clearButton",this.clearButton);
         return _loc1_;
      }
      
      public function __clearButton_click(param1:MouseEvent) : void
      {
         this.onClearButtonClick(param1);
      }
      
      private function _CharacterExpressionPanel_Group3_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CharacterExpressionPanel_Line3_c(),this._CharacterExpressionPanel_HGroup3_c()];
         _loc1_.id = "selectionGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.selectionGroup = _loc1_;
         BindingManager.executeBindings(this,"selectionGroup",this.selectionGroup);
         return _loc1_;
      }
      
      private function _CharacterExpressionPanel_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.stroke = this._CharacterExpressionPanel_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CharacterExpressionPanel_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14606820;
         return _loc1_;
      }
      
      private function _CharacterExpressionPanel_HGroup3_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.gap = 0;
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._CharacterExpressionPanel_Group4_c(),this._CharacterExpressionPanel_ToggleButton1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CharacterExpressionPanel_Group4_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._CharacterExpressionPanel_DropDownList1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _CharacterExpressionPanel_DropDownList1_i() : DropDownList
      {
         var _loc1_:DropDownList = new DropDownList();
         _loc1_.buttonMode = true;
         _loc1_.top = 6;
         _loc1_.bottom = 5;
         _loc1_.left = 4;
         _loc1_.right = 4;
         _loc1_.popUpPosition = "above";
         _loc1_.itemRenderer = this._CharacterExpressionPanel_ClassFactory1_c();
         _loc1_.useVirtualLayout = false;
         _loc1_.setStyle("skinClass",ExpressionDropDownListSkin);
         _loc1_.addEventListener("change",this.__expressionList_change);
         _loc1_.id = "expressionList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.expressionList = _loc1_;
         BindingManager.executeBindings(this,"expressionList",this.expressionList);
         return _loc1_;
      }
      
      private function _CharacterExpressionPanel_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = FaceItemRenderer;
         return _loc1_;
      }
      
      public function __expressionList_change(param1:IndexChangeEvent) : void
      {
         this.onExpressionChange(param1);
      }
      
      private function _CharacterExpressionPanel_ToggleButton1_i() : ToggleButton
      {
         var _loc1_:ToggleButton = new ToggleButton();
         _loc1_.percentHeight = 100;
         _loc1_.buttonMode = true;
         _loc1_.visible = false;
         _loc1_.includeInLayout = false;
         _loc1_.setStyle("skinClass",LookAtCameraToggleButtonSkin);
         _loc1_.addEventListener("click",this.__lookAtCameraButton_click);
         _loc1_.id = "lookAtCameraButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.lookAtCameraButton = _loc1_;
         BindingManager.executeBindings(this,"lookAtCameraButton",this.lookAtCameraButton);
         return _loc1_;
      }
      
      public function __lookAtCameraButton_click(param1:MouseEvent) : void
      {
         this.onLookAtCameraClick(param1);
      }
      
      private function _CharacterExpressionPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Expression");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_CharacterExpressionPanel_Label1.text");
         result[1] = new Binding(this,function():Boolean
         {
            return expressionList.selectedIndex != 0;
         },null,"clearButton.visible");
         result[2] = new Binding(this,function():IList
         {
            return _expressions;
         },null,"expressionList.dataProvider");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Look at camera");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"lookAtCameraButton.toolTip");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get clearButton() : Button
      {
         return this._2071192609clearButton;
      }
      
      public function set clearButton(param1:Button) : void
      {
         var _loc2_:Object = this._2071192609clearButton;
         if(_loc2_ !== param1)
         {
            this._2071192609clearButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"clearButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get expressionList() : DropDownList
      {
         return this._1318802602expressionList;
      }
      
      public function set expressionList(param1:DropDownList) : void
      {
         var _loc2_:Object = this._1318802602expressionList;
         if(_loc2_ !== param1)
         {
            this._1318802602expressionList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"expressionList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lookAtCameraButton() : ToggleButton
      {
         return this._1711989513lookAtCameraButton;
      }
      
      public function set lookAtCameraButton(param1:ToggleButton) : void
      {
         var _loc2_:Object = this._1711989513lookAtCameraButton;
         if(_loc2_ !== param1)
         {
            this._1711989513lookAtCameraButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lookAtCameraButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectionGroup() : Group
      {
         return this._2146085971selectionGroup;
      }
      
      public function set selectionGroup(param1:Group) : void
      {
         var _loc2_:Object = this._2146085971selectionGroup;
         if(_loc2_ !== param1)
         {
            this._2146085971selectionGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectionGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get titleGroup() : Group
      {
         return this._1795581177titleGroup;
      }
      
      public function set titleGroup(param1:Group) : void
      {
         var _loc2_:Object = this._1795581177titleGroup;
         if(_loc2_ !== param1)
         {
            this._1795581177titleGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _expressions() : ArrayCollection
      {
         return this._446488804_expressions;
      }
      
      protected function set _expressions(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._446488804_expressions;
         if(_loc2_ !== param1)
         {
            this._446488804_expressions = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_expressions",_loc2_,param1));
            }
         }
      }
   }
}
