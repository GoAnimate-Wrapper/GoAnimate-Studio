package anifire.studio.components
{
   import flash.events.MouseEvent;
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
   import mx.states.AddItems;
   import mx.states.State;
   import spark.components.Group;
   import spark.primitives.BitmapImage;
   
   use namespace mx_internal;
   
   public class UpgradeIcon extends Group implements IBindingClient, IStateClient2
   {
      
      private static const HORIZONTAL_PADDING:Number = 4.5;
      
      private static const VERTICAL_PADDING:Number = 5;
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _UpgradeIcon_Group2:Group;
      
      public var _UpgradeIcon_PopUpAnchor1:spark.components.PopUpAnchor;
      
      private var _1284010086arrowToolTip:ArrowToolTipGroup;
      
      private var _838639658iconGoPremium:BitmapImage;
      
      private var _846055106iconGoTeam:BitmapImage;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _271297745toolTipLabel:String;
      
      private var _embed_mxml__styles_images_tray_icon_rocket_png_1316563401:Class;
      
      private var _embed_mxml__styles_images_tray_icon_rocket_premium_png_1501854121:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function UpgradeIcon()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_tray_icon_rocket_png_1316563401 = UpgradeIcon__embed_mxml__styles_images_tray_icon_rocket_png_1316563401;
         this._embed_mxml__styles_images_tray_icon_rocket_premium_png_1501854121 = UpgradeIcon__embed_mxml__styles_images_tray_icon_rocket_premium_png_1501854121;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._UpgradeIcon_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_UpgradeIconWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return UpgradeIcon[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._UpgradeIcon_Group2_i()];
         this.currentState = "normal";
         this.addEventListener("rollOver",this.___UpgradeIcon_Group1_rollOver);
         this.addEventListener("rollOut",this.___UpgradeIcon_Group1_rollOut);
         var _UpgradeIcon_PopUpAnchor1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._UpgradeIcon_PopUpAnchor1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hover",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_UpgradeIcon_PopUpAnchor1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_UpgradeIcon_Group2"]
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
         UpgradeIcon._watcherSetupUtil = param1;
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
      
      public function set isGoTeamOnly(param1:Boolean) : void
      {
         this.iconGoTeam.visible = param1;
         this.iconGoPremium.visible = !param1;
      }
      
      protected function icon_mouseOverHandler(param1:MouseEvent) : void
      {
         this.currentState = "hover";
      }
      
      protected function icon_mouseOutHandler(param1:MouseEvent) : void
      {
         this.currentState = "normal";
      }
      
      private function _UpgradeIcon_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.mxmlContent = [this._UpgradeIcon_BitmapImage1_i(),this._UpgradeIcon_BitmapImage2_i()];
         _loc1_.id = "_UpgradeIcon_Group2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._UpgradeIcon_Group2 = _loc1_;
         BindingManager.executeBindings(this,"_UpgradeIcon_Group2",this._UpgradeIcon_Group2);
         return _loc1_;
      }
      
      private function _UpgradeIcon_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 9;
         _loc1_.height = 14;
         _loc1_.source = this._embed_mxml__styles_images_tray_icon_rocket_premium_png_1501854121;
         _loc1_.initialized(this,"iconGoPremium");
         this.iconGoPremium = _loc1_;
         BindingManager.executeBindings(this,"iconGoPremium",this.iconGoPremium);
         return _loc1_;
      }
      
      private function _UpgradeIcon_BitmapImage2_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.width = 9;
         _loc1_.height = 14;
         _loc1_.source = this._embed_mxml__styles_images_tray_icon_rocket_png_1316563401;
         _loc1_.initialized(this,"iconGoTeam");
         this.iconGoTeam = _loc1_;
         BindingManager.executeBindings(this,"iconGoTeam",this.iconGoTeam);
         return _loc1_;
      }
      
      private function _UpgradeIcon_PopUpAnchor1_i() : spark.components.PopUpAnchor
      {
         var _loc1_:spark.components.PopUpAnchor = new spark.components.PopUpAnchor();
         _loc1_.bottom = 0;
         _loc1_.displayPopUp = true;
         _loc1_.popUpWidthMatchesAnchorWidth = true;
         _loc1_.popUpHeightMatchesAnchorHeight = true;
         _loc1_.popUp = this._UpgradeIcon_Group3_c();
         _loc1_.id = "_UpgradeIcon_PopUpAnchor1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._UpgradeIcon_PopUpAnchor1 = _loc1_;
         BindingManager.executeBindings(this,"_UpgradeIcon_PopUpAnchor1",this._UpgradeIcon_PopUpAnchor1);
         return _loc1_;
      }
      
      private function _UpgradeIcon_Group3_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._UpgradeIcon_ArrowToolTipGroup1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _UpgradeIcon_ArrowToolTipGroup1_i() : ArrowToolTipGroup
      {
         var _loc1_:ArrowToolTipGroup = new ArrowToolTipGroup();
         _loc1_.arrowDirection = "down";
         _loc1_.verticalCenter = 0;
         _loc1_.id = "arrowToolTip";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.arrowToolTip = _loc1_;
         BindingManager.executeBindings(this,"arrowToolTip",this.arrowToolTip);
         return _loc1_;
      }
      
      public function ___UpgradeIcon_Group1_rollOver(param1:MouseEvent) : void
      {
         this.icon_mouseOverHandler(param1);
      }
      
      public function ___UpgradeIcon_Group1_rollOut(param1:MouseEvent) : void
      {
         this.icon_mouseOutHandler(param1);
      }
      
      private function _UpgradeIcon_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Object
         {
            return -(arrowToolTip.width / 2) + HORIZONTAL_PADDING;
         },null,"_UpgradeIcon_PopUpAnchor1.left");
         result[1] = new Binding(this,function():Object
         {
            return -arrowToolTip.height - VERTICAL_PADDING;
         },null,"_UpgradeIcon_PopUpAnchor1.top");
         result[2] = new Binding(this,null,null,"arrowToolTip.label","toolTipLabel");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get arrowToolTip() : ArrowToolTipGroup
      {
         return this._1284010086arrowToolTip;
      }
      
      public function set arrowToolTip(param1:ArrowToolTipGroup) : void
      {
         var _loc2_:Object = this._1284010086arrowToolTip;
         if(_loc2_ !== param1)
         {
            this._1284010086arrowToolTip = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowToolTip",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconGoPremium() : BitmapImage
      {
         return this._838639658iconGoPremium;
      }
      
      public function set iconGoPremium(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._838639658iconGoPremium;
         if(_loc2_ !== param1)
         {
            this._838639658iconGoPremium = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconGoPremium",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get iconGoTeam() : BitmapImage
      {
         return this._846055106iconGoTeam;
      }
      
      public function set iconGoTeam(param1:BitmapImage) : void
      {
         var _loc2_:Object = this._846055106iconGoTeam;
         if(_loc2_ !== param1)
         {
            this._846055106iconGoTeam = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"iconGoTeam",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get toolTipLabel() : String
      {
         return this._271297745toolTipLabel;
      }
      
      public function set toolTipLabel(param1:String) : void
      {
         var _loc2_:Object = this._271297745toolTipLabel;
         if(_loc2_ !== param1)
         {
            this._271297745toolTipLabel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"toolTipLabel",_loc2_,param1));
            }
         }
      }
   }
}
