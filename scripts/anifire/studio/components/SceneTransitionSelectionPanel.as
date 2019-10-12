package anifire.studio.components
{
   import anifire.studio.events.SceneOptionEvent;
   import anifire.studio.models.MenuItemModel;
   import anifire.studio.skins.LinkArrowBlackButtonSkin;
   import anifire.studio.skins.PlainListSkin;
   import anifire.util.UtilDict;
   import anifire.util.UtilEffect;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.IList;
   import mx.collections.Sort;
   import mx.collections.SortField;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.List;
   import spark.components.VGroup;
   import spark.components.supportClasses.ItemRenderer;
   import spark.events.IndexChangeEvent;
   import spark.events.ListEvent;
   
   use namespace mx_internal;
   
   public class SceneTransitionSelectionPanel extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SceneTransitionSelectionPanel_LinkArrowButton1:LinkArrowButton;
      
      private var _1818605159previewContainer:spark.components.PopUpAnchor;
      
      private var _2003902573transitionList:List;
      
      private var _1283806387transitionPreview:TransitionPreview;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _1802782443_effectSource:ArrayCollection;
      
      private var _effectLookup:Object;
      
      private var noTransitionItem:MenuItemModel;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SceneTransitionSelectionPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._SceneTransitionSelectionPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SceneTransitionSelectionPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SceneTransitionSelectionPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 310;
         this.percentHeight = 100;
         this.mxmlContent = [this._SceneTransitionSelectionPanel_VGroup1_c(),this._SceneTransitionSelectionPanel_PopUpAnchor1_i()];
         this.addEventListener("creationComplete",this.___SceneTransitionSelectionPanel_Group1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         SceneTransitionSelectionPanel._watcherSetupUtil = param1;
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
      
      private function init() : void
      {
         var _loc2_:String = null;
         var _loc3_:MenuItemModel = null;
         var _loc4_:Sort = null;
         this._effectLookup = {};
         this._effectSource = new ArrayCollection();
         this.noTransitionItem = new MenuItemModel(UtilDict.toDisplay("go","No Transition"),null);
         this.noTransitionItem.sortOrder = -1;
         this._effectSource.addItem(this.noTransitionItem);
         var _loc1_:Array = UtilEffect.getTransitions();
         for each(_loc2_ in _loc1_)
         {
            _loc3_ = new MenuItemModel(UtilDict.toDisplay("go",UtilEffect.getLabelById(_loc2_)),_loc2_);
            this._effectSource.addItem(_loc3_);
            this._effectLookup[_loc2_] = _loc3_;
         }
         _loc4_ = new Sort();
         _loc4_.fields = [new SortField("sortOrder"),new SortField("label")];
         this._effectSource.sort = _loc4_;
         this._effectSource.refresh();
      }
      
      private function onTransitionChange() : void
      {
         var _loc1_:MenuItemModel = this.transitionList.selectedItem as MenuItemModel;
         var _loc2_:SceneOptionEvent = new SceneOptionEvent(SceneOptionEvent.TYPE_CHANGED);
         _loc2_.ttype = _loc1_.value as String;
         dispatchEvent(_loc2_);
      }
      
      private function onBackRelease() : void
      {
         var _loc1_:SceneOptionEvent = new SceneOptionEvent(SceneOptionEvent.BACK);
         dispatchEvent(_loc1_);
      }
      
      private function onMouseOverEffect(param1:ListEvent) : void
      {
         this.showTransPreview(param1.itemRenderer as ItemRenderer);
      }
      
      private function hideTransPreview() : void
      {
         this.previewContainer.displayPopUp = false;
         this.transitionPreview.visible = false;
      }
      
      private function showTransPreview(param1:ItemRenderer) : void
      {
         var _loc2_:MenuItemModel = param1.data as MenuItemModel;
         var _loc3_:String = _loc2_.value as String;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:Point = param1.localToGlobal(new Point(0,0));
         var _loc5_:Point = globalToLocal(_loc4_);
         this.previewContainer.x = _loc5_.x;
         this.previewContainer.y = _loc5_.y - 3;
         this.previewContainer.width = param1.getLayoutBoundsWidth() + 5;
         this.previewContainer.displayPopUp = true;
         this.transitionPreview.transitionId = _loc3_;
         this.transitionPreview.visible = true;
      }
      
      public function onRemoveSelection(param1:Event = null) : void
      {
         this.reset();
      }
      
      public function reset() : void
      {
         this.transitionList.selectedIndex = -1;
      }
      
      private function _SceneTransitionSelectionPanel_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.gap = 0;
         _loc1_.mxmlContent = [this._SceneTransitionSelectionPanel_Group2_c(),this._SceneTransitionSelectionPanel_List1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneTransitionSelectionPanel_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.height = 30;
         _loc1_.mxmlContent = [this._SceneTransitionSelectionPanel_LinkArrowButton1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _SceneTransitionSelectionPanel_LinkArrowButton1_i() : LinkArrowButton
      {
         var _loc1_:LinkArrowButton = new LinkArrowButton();
         _loc1_.top = 0;
         _loc1_.left = 14;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("skinClass",LinkArrowBlackButtonSkin);
         _loc1_.setStyle("arrowPosition","left");
         _loc1_.setStyle("arrowDirection","left");
         _loc1_.addEventListener("click",this.___SceneTransitionSelectionPanel_LinkArrowButton1_click);
         _loc1_.id = "_SceneTransitionSelectionPanel_LinkArrowButton1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SceneTransitionSelectionPanel_LinkArrowButton1 = _loc1_;
         BindingManager.executeBindings(this,"_SceneTransitionSelectionPanel_LinkArrowButton1",this._SceneTransitionSelectionPanel_LinkArrowButton1);
         return _loc1_;
      }
      
      public function ___SceneTransitionSelectionPanel_LinkArrowButton1_click(param1:MouseEvent) : void
      {
         this.onBackRelease();
      }
      
      private function _SceneTransitionSelectionPanel_List1_i() : List
      {
         var _loc1_:List = new List();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.setStyle("skinClass",PlainListSkin);
         _loc1_.addEventListener("change",this.__transitionList_change);
         _loc1_.addEventListener("itemRollOver",this.__transitionList_itemRollOver);
         _loc1_.addEventListener("itemRollOut",this.__transitionList_itemRollOut);
         _loc1_.id = "transitionList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.transitionList = _loc1_;
         BindingManager.executeBindings(this,"transitionList",this.transitionList);
         return _loc1_;
      }
      
      public function __transitionList_change(param1:IndexChangeEvent) : void
      {
         this.onTransitionChange();
      }
      
      public function __transitionList_itemRollOver(param1:ListEvent) : void
      {
         this.onMouseOverEffect(param1);
      }
      
      public function __transitionList_itemRollOut(param1:ListEvent) : void
      {
         this.hideTransPreview();
      }
      
      private function _SceneTransitionSelectionPanel_PopUpAnchor1_i() : spark.components.PopUpAnchor
      {
         var _loc1_:spark.components.PopUpAnchor = new spark.components.PopUpAnchor();
         _loc1_.includeInLayout = false;
         _loc1_.popUpPosition = "right";
         _loc1_.popUp = this._SceneTransitionSelectionPanel_TransitionPreview1_i();
         _loc1_.id = "previewContainer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.previewContainer = _loc1_;
         BindingManager.executeBindings(this,"previewContainer",this.previewContainer);
         return _loc1_;
      }
      
      private function _SceneTransitionSelectionPanel_TransitionPreview1_i() : TransitionPreview
      {
         var _loc1_:TransitionPreview = new TransitionPreview();
         _loc1_.visible = false;
         _loc1_.id = "transitionPreview";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.transitionPreview = _loc1_;
         BindingManager.executeBindings(this,"transitionPreview",this.transitionPreview);
         return _loc1_;
      }
      
      public function ___SceneTransitionSelectionPanel_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _SceneTransitionSelectionPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Back");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SceneTransitionSelectionPanel_LinkArrowButton1.label");
         result[1] = new Binding(this,function():IList
         {
            return _effectSource;
         },null,"transitionList.dataProvider");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get previewContainer() : spark.components.PopUpAnchor
      {
         return this._1818605159previewContainer;
      }
      
      public function set previewContainer(param1:spark.components.PopUpAnchor) : void
      {
         var _loc2_:Object = this._1818605159previewContainer;
         if(_loc2_ !== param1)
         {
            this._1818605159previewContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previewContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get transitionList() : List
      {
         return this._2003902573transitionList;
      }
      
      public function set transitionList(param1:List) : void
      {
         var _loc2_:Object = this._2003902573transitionList;
         if(_loc2_ !== param1)
         {
            this._2003902573transitionList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"transitionList",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get transitionPreview() : TransitionPreview
      {
         return this._1283806387transitionPreview;
      }
      
      public function set transitionPreview(param1:TransitionPreview) : void
      {
         var _loc2_:Object = this._1283806387transitionPreview;
         if(_loc2_ !== param1)
         {
            this._1283806387transitionPreview = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"transitionPreview",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _effectSource() : ArrayCollection
      {
         return this._1802782443_effectSource;
      }
      
      private function set _effectSource(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this._1802782443_effectSource;
         if(_loc2_ !== param1)
         {
            this._1802782443_effectSource = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_effectSource",_loc2_,param1));
            }
         }
      }
   }
}
