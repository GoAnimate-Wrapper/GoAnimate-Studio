package anifire.studio.skins
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.PopUpAnchor;
   import spark.primitives.BitmapImage;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.skins.SparkButtonSkin;
   
   use namespace mx_internal;
   
   public class CharacterMovementTipButtonSkin extends SparkButtonSkin implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _CharacterMovementTipButtonSkin_BitmapImage1:BitmapImage;
      
      public var _CharacterMovementTipButtonSkin_Group2:Group;
      
      public var _CharacterMovementTipButtonSkin_PopUpAnchor1:PopUpAnchor;
      
      private var _268453613popUpGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _embed_mxml__styles_images_toolbar_ico_info_png_914860905:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CharacterMovementTipButtonSkin()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_toolbar_ico_info_png_914860905 = CharacterMovementTipButtonSkin__embed_mxml__styles_images_toolbar_ico_info_png_914860905;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._CharacterMovementTipButtonSkin_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_skins_CharacterMovementTipButtonSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CharacterMovementTipButtonSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 5;
         this.minHeight = 5;
         this.mxmlContent = [this._CharacterMovementTipButtonSkin_BitmapImage1_i()];
         this.currentState = "up";
         var _CharacterMovementTipButtonSkin_PopUpAnchor1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._CharacterMovementTipButtonSkin_PopUpAnchor1_i);
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_CharacterMovementTipButtonSkin_PopUpAnchor1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_CharacterMovementTipButtonSkin_BitmapImage1"]
            })]
         }),new State({
            "name":"down",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         })];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CharacterMovementTipButtonSkin._watcherSetupUtil = param1;
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
      
      private function _CharacterMovementTipButtonSkin_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_toolbar_ico_info_png_914860905;
         _loc1_.smooth = true;
         _loc1_.initialized(this,"_CharacterMovementTipButtonSkin_BitmapImage1");
         this._CharacterMovementTipButtonSkin_BitmapImage1 = _loc1_;
         BindingManager.executeBindings(this,"_CharacterMovementTipButtonSkin_BitmapImage1",this._CharacterMovementTipButtonSkin_BitmapImage1);
         return _loc1_;
      }
      
      private function _CharacterMovementTipButtonSkin_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.popUpPosition = "above";
         _loc1_.displayPopUp = true;
         _loc1_.popUpWidthMatchesAnchorWidth = true;
         _loc1_.popUp = this._CharacterMovementTipButtonSkin_Group1_i();
         _loc1_.id = "_CharacterMovementTipButtonSkin_PopUpAnchor1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CharacterMovementTipButtonSkin_PopUpAnchor1 = _loc1_;
         BindingManager.executeBindings(this,"_CharacterMovementTipButtonSkin_PopUpAnchor1",this._CharacterMovementTipButtonSkin_PopUpAnchor1);
         return _loc1_;
      }
      
      private function _CharacterMovementTipButtonSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.blendMode = "layer";
         _loc1_.alpha = 1;
         _loc1_.mxmlContent = [this._CharacterMovementTipButtonSkin_Group2_i(),this._CharacterMovementTipButtonSkin_Path1_c()];
         _loc1_.id = "popUpGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popUpGroup = _loc1_;
         BindingManager.executeBindings(this,"popUpGroup",this.popUpGroup);
         return _loc1_;
      }
      
      private function _CharacterMovementTipButtonSkin_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.top = 0;
         _loc1_.bottom = 10;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._CharacterMovementTipButtonSkin_Rect1_c(),this._CharacterMovementTipButtonSkin_Label1_i()];
         _loc1_.id = "_CharacterMovementTipButtonSkin_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._CharacterMovementTipButtonSkin_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_CharacterMovementTipButtonSkin_Group2",this._CharacterMovementTipButtonSkin_Group2);
         return _loc1_;
      }
      
      private function _CharacterMovementTipButtonSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.fill = this._CharacterMovementTipButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CharacterMovementTipButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2829099;
         return _loc1_;
      }
      
      private function _CharacterMovementTipButtonSkin_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 160;
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("paddingLeft",10);
         _loc1_.setStyle("paddingRight",10);
         _loc1_.setStyle("paddingTop",5);
         _loc1_.setStyle("paddingBottom",5);
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      private function _CharacterMovementTipButtonSkin_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.horizontalCenter = 0;
         _loc1_.bottom = 5;
         _loc1_.data = "M 0 0 l 5 5 l 5 -5 Z";
         _loc1_.fill = this._CharacterMovementTipButtonSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _CharacterMovementTipButtonSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 2829099;
         return _loc1_;
      }
      
      private function _CharacterMovementTipButtonSkin_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return popUpGroup.width;
         },null,"_CharacterMovementTipButtonSkin_Group2.minWidth");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get popUpGroup() : Group
      {
         return this._268453613popUpGroup;
      }
      
      public function set popUpGroup(param1:Group) : void
      {
         var _loc2_:Object = this._268453613popUpGroup;
         if(_loc2_ !== param1)
         {
            this._268453613popUpGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popUpGroup",_loc2_,param1));
            }
         }
      }
   }
}
