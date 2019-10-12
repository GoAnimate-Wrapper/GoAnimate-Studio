package anifire.studio.components
{
   import anifire.constant.ResponseConstants;
   import anifire.constant.ServerConstants;
   import anifire.managers.AppConfigManager;
   import anifire.studio.core.Console;
   import anifire.studio.core.PropThumb;
   import anifire.studio.managers.SharedAssetManager;
   import anifire.studio.managers.UserAssetManager;
   import anifire.studio.models.ThumbModel;
   import anifire.util.ApiRequest;
   import anifire.util.UtilDict;
   import anifire.util.UtilSite;
   import anifire.util.UtilUser;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLStream;
   import flash.net.URLVariables;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.DragSource;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.State;
   import mx.utils.StringUtil;
   import spark.components.HGroup;
   import spark.events.PopUpEvent;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class PropThumbRenderer extends ThumbRendererBase implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _PropThumbRenderer_Rect1:Rect;
      
      private var _1781625235buttonGroup:HGroup;
      
      private var _1245745987deleteButton:IconButton;
      
      private var _2024940825imageDisplay:ProductThumbSparkImage;
      
      private var _1302741632infoButton:IconButton;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _model:ThumbModel;
      
      protected var _dataSource:PropThumb;
      
      protected var _colorSetId:String = "";
      
      protected var _1144562451_hasMultiState:Boolean = false;
      
      protected var _1692934083_editable:Boolean;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function PropThumbRenderer()
      {
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._PropThumbRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_PropThumbRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return PropThumbRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 60;
         this.height = 80;
         this.buttonMode = true;
         this.mxmlContent = [this._PropThumbRenderer_ProductThumbSparkImage1_i()];
         this.currentState = "normal";
         var _PropThumbRenderer_HGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PropThumbRenderer_HGroup1_i);
         var _PropThumbRenderer_Rect1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._PropThumbRenderer_Rect1_i);
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"hovered",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_PropThumbRenderer_HGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["imageDisplay"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_PropThumbRenderer_Rect1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["imageDisplay"]
            })]
         }),new State({
            "name":"dragging",
            "overrides":[]
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
         PropThumbRenderer._watcherSetupUtil = param1;
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
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         this._model = data as ThumbModel;
         if(this._model)
         {
            this._dataSource = this._model.thumb as PropThumb;
            this._colorSetId = this._model.colorSetId;
            this._editable = this._model.editable;
         }
         else
         {
            this._dataSource = null;
            this._colorSetId = "";
            this._editable = false;
         }
         if(this._dataSource)
         {
            this.updateThumbData();
         }
         this.imageDisplay.model = this._model;
      }
      
      protected function updateThumbData() : void
      {
         if(UtilUser.hasAdminFeatures)
         {
            _toolTipContent = this._dataSource.toString();
         }
         else
         {
            _toolTipContent = this._dataSource.name;
         }
         this._hasMultiState = this._dataSource.getStateNum() > 0;
      }
      
      override protected function createDragProxy() : IFlexDisplayObject
      {
         var _loc1_:PropThumbRenderer = new PropThumbRenderer();
         _loc1_.dragging = true;
         _loc1_.imageDisplay.showTransition = false;
         _loc1_.data = data;
         return _loc1_;
      }
      
      override protected function createDragSource(param1:IFlexDisplayObject, param2:MouseEvent) : DragSource
      {
         var _loc3_:DragSource = new DragSource();
         _loc3_.addData(this._dataSource,"thumb");
         if(this._colorSetId != "")
         {
            _loc3_.addData(this._colorSetId,"colorSetId");
         }
         return _loc3_;
      }
      
      override protected function shouldStartDrag(param1:MouseEvent) : Boolean
      {
         return param1.target == this;
      }
      
      protected function infoButtonHandler(param1:MouseEvent) : void
      {
         this.showInfoDialog();
      }
      
      protected function deleteButtonHandler(param1:MouseEvent) : void
      {
         this.showDeleteDialog();
      }
      
      protected function showInfoDialog() : void
      {
         var _loc1_:EditAssetPopUp = new EditAssetPopUp();
         _loc1_.showPublishOptions = allowPublish();
         _loc1_.thumb = this._dataSource;
         _loc1_.nameLabel = UtilDict.toDisplay("go","assetinfo_name");
         _loc1_.tagsLabel = UtilDict.toDisplay("go","assetinfo_tags");
         _loc1_.optionPrivateLabel = UtilDict.toDisplay("go","assetinfo_private");
         _loc1_.optionPublicLabel = UtilDict.toDisplay("go","assetinfo_public");
         _loc1_.confirmText = UtilDict.toDisplay("go","assetinfo_update");
         _loc1_.cancelText = UtilDict.toDisplay("go","assetinfo_cancel");
         _loc1_.addEventListener(PopUpEvent.CLOSE,this.confirmEdit);
         _loc1_.open(parentApplication as UIComponent,true);
      }
      
      protected function confirmEdit(param1:PopUpEvent) : void
      {
         var _loc2_:Object = null;
         if(param1.commit)
         {
            _loc2_ = param1.data;
            if(_loc2_)
            {
               this._dataSource.name = _loc2_["name"];
               this._dataSource.tags = _loc2_["tags"];
               this._dataSource.isPublished = _loc2_["published"];
               this._dataSource.sharingOptions = _loc2_["share"];
               UserAssetManager.instance.updateAsset(this._dataSource.id,this._dataSource.encAssetId,this._dataSource.name,this._dataSource.tags,this._dataSource.isPublished,this._dataSource.sharingOptions);
               _toolTipContent = this._dataSource.name;
            }
         }
      }
      
      protected function showDeleteDialog() : void
      {
         var _loc1_:ConfirmPopUp = new ConfirmPopUp();
         if(Console.getConsole().thumbTray.isInTeamTheme())
         {
            _loc1_.title = UtilDict.translate(StringUtil.substitute(LABEL_DELETE_ASSET,LABEL_TYPE_PROP));
            _loc1_.message = UtilDict.translate(StringUtil.substitute(LABEL_DELETE_ASSET_MESSAGE,LABEL_TYPE_PROP));
         }
         else
         {
            _loc1_.title = UtilDict.toDisplay("go","goalert_delprop");
            _loc1_.message = UtilDict.toDisplay("go","goalert_delproptext");
         }
         _loc1_.confirmText = UtilDict.toDisplay("go","goalert_delete");
         _loc1_.cancelText = UtilDict.toDisplay("go","goalert_cancel");
         _loc1_.addEventListener(PopUpEvent.CLOSE,this.confirmDelete);
         _loc1_.open(parentApplication as UIComponent,true);
      }
      
      protected function confirmDelete(param1:PopUpEvent) : void
      {
         if(param1.commit)
         {
            this.deleteThumbnail();
         }
      }
      
      protected function deleteThumbnail() : void
      {
         var _loc1_:Object = null;
         var _loc2_:ApiRequest = null;
         var _loc3_:URLVariables = null;
         var _loc4_:URLRequest = null;
         var _loc5_:URLStream = null;
         var _loc6_:String = null;
         if(UtilSite.isGoAnimate)
         {
            _loc1_ = {};
            _loc1_[ResponseConstants.ID] = this._dataSource.encAssetId;
            _loc2_ = new ApiRequest();
            _loc2_.post(ServerConstants.ACTION_DELETE_ASSET_V2,_loc1_);
         }
         else
         {
            _loc3_ = AppConfigManager.instance.createURLVariables();
            _loc3_["assetId"] = this._dataSource.id;
            _loc3_["id"] = this._dataSource.encAssetId;
            _loc4_ = new URLRequest(ServerConstants.ACTION_DELETE_ASSET);
            _loc4_.method = URLRequestMethod.POST;
            _loc4_.data = _loc3_;
            _loc5_ = new URLStream();
            _loc5_.load(_loc4_);
         }
         if(this._dataSource.folder)
         {
            this._dataSource.folder.removeThumb(this._dataSource);
         }
         else
         {
            _loc6_ = this._dataSource.id;
            UserAssetManager.instance.removePropByAssetId(_loc6_);
            SharedAssetManager.adminTeamInstance.removePropByAssetId(_loc6_);
         }
      }
      
      private function _PropThumbRenderer_ProductThumbSparkImage1_i() : ProductThumbSparkImage
      {
         var _loc1_:ProductThumbSparkImage = new ProductThumbSparkImage();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.id = "imageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      private function _PropThumbRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._PropThumbRenderer_SolidColorStroke1_c();
         _loc1_.initialized(this,"_PropThumbRenderer_Rect1");
         this._PropThumbRenderer_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_PropThumbRenderer_Rect1",this._PropThumbRenderer_Rect1);
         return _loc1_;
      }
      
      private function _PropThumbRenderer_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 5093288;
         return _loc1_;
      }
      
      private function _PropThumbRenderer_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.paddingLeft = 2;
         _loc1_.paddingTop = 2;
         _loc1_.gap = 2;
         _loc1_.mxmlContent = [this._PropThumbRenderer_IconButton1_i(),this._PropThumbRenderer_IconButton2_i()];
         _loc1_.id = "buttonGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonGroup = _loc1_;
         BindingManager.executeBindings(this,"buttonGroup",this.buttonGroup);
         return _loc1_;
      }
      
      private function _PropThumbRenderer_IconButton1_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.styleName = "infoSmall";
         _loc1_.addEventListener("mouseDown",this.__infoButton_mouseDown);
         _loc1_.id = "infoButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoButton = _loc1_;
         BindingManager.executeBindings(this,"infoButton",this.infoButton);
         return _loc1_;
      }
      
      public function __infoButton_mouseDown(param1:MouseEvent) : void
      {
         this.infoButtonHandler(param1);
      }
      
      private function _PropThumbRenderer_IconButton2_i() : IconButton
      {
         var _loc1_:IconButton = new IconButton();
         _loc1_.styleName = "deleteSmall";
         _loc1_.addEventListener("mouseDown",this.__deleteButton_mouseDown);
         _loc1_.id = "deleteButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.deleteButton = _loc1_;
         BindingManager.executeBindings(this,"deleteButton",this.deleteButton);
         return _loc1_;
      }
      
      public function __deleteButton_mouseDown(param1:MouseEvent) : void
      {
         this.deleteButtonHandler(param1);
      }
      
      private function _PropThumbRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return _editable;
         },null,"buttonGroup.visible");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonGroup() : HGroup
      {
         return this._1781625235buttonGroup;
      }
      
      public function set buttonGroup(param1:HGroup) : void
      {
         var _loc2_:Object = this._1781625235buttonGroup;
         if(_loc2_ !== param1)
         {
            this._1781625235buttonGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get deleteButton() : IconButton
      {
         return this._1245745987deleteButton;
      }
      
      public function set deleteButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._1245745987deleteButton;
         if(_loc2_ !== param1)
         {
            this._1245745987deleteButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"deleteButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get imageDisplay() : ProductThumbSparkImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:ProductThumbSparkImage) : void
      {
         var _loc2_:Object = this._2024940825imageDisplay;
         if(_loc2_ !== param1)
         {
            this._2024940825imageDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"imageDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoButton() : IconButton
      {
         return this._1302741632infoButton;
      }
      
      public function set infoButton(param1:IconButton) : void
      {
         var _loc2_:Object = this._1302741632infoButton;
         if(_loc2_ !== param1)
         {
            this._1302741632infoButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _hasMultiState() : Boolean
      {
         return this._1144562451_hasMultiState;
      }
      
      protected function set _hasMultiState(param1:Boolean) : void
      {
         var _loc2_:Object = this._1144562451_hasMultiState;
         if(_loc2_ !== param1)
         {
            this._1144562451_hasMultiState = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_hasMultiState",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _editable() : Boolean
      {
         return this._1692934083_editable;
      }
      
      protected function set _editable(param1:Boolean) : void
      {
         var _loc2_:Object = this._1692934083_editable;
         if(_loc2_ !== param1)
         {
            this._1692934083_editable = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_editable",_loc2_,param1));
            }
         }
      }
   }
}
