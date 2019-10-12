package anifire.studio.assets.views
{
   import anifire.util.UtilDict;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.graphics.SolidColor;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class FlowFrameAddImageToolTip extends Group implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _FlowFrameAddImageToolTip_Label1:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function FlowFrameAddImageToolTip()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._FlowFrameAddImageToolTip_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_assets_views_FlowFrameAddImageToolTipWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return FlowFrameAddImageToolTip[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mouseEnabled = false;
         this.mouseChildren = false;
         this.mxmlContent = [this._FlowFrameAddImageToolTip_VGroup1_c()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         FlowFrameAddImageToolTip._watcherSetupUtil = param1;
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
      
      private function _FlowFrameAddImageToolTip_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.gap = 0;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._FlowFrameAddImageToolTip_Group2_c(),this._FlowFrameAddImageToolTip_Path1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FlowFrameAddImageToolTip_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.mxmlContent = [this._FlowFrameAddImageToolTip_Rect1_c(),this._FlowFrameAddImageToolTip_Label1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _FlowFrameAddImageToolTip_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.fill = this._FlowFrameAddImageToolTip_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FlowFrameAddImageToolTip_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _FlowFrameAddImageToolTip_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("paddingLeft",5);
         _loc1_.setStyle("paddingRight",5);
         _loc1_.setStyle("paddingTop",5);
         _loc1_.setStyle("paddingBottom",5);
         _loc1_.id = "_FlowFrameAddImageToolTip_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._FlowFrameAddImageToolTip_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_FlowFrameAddImageToolTip_Label1",this._FlowFrameAddImageToolTip_Label1);
         return _loc1_;
      }
      
      private function _FlowFrameAddImageToolTip_Path1_c() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.data = "M 5 0 L 0 10 L -5 0 Z";
         _loc1_.fill = this._FlowFrameAddImageToolTip_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FlowFrameAddImageToolTip_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.5;
         return _loc1_;
      }
      
      private function _FlowFrameAddImageToolTip_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.translate("Add Image / Logo");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_FlowFrameAddImageToolTip_Label1.text");
         return result;
      }
   }
}
