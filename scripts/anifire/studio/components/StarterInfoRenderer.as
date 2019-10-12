package anifire.studio.components
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.components.supportClasses.ItemRenderer;
   
   use namespace mx_internal;
   
   public class StarterInfoRenderer extends ItemRenderer implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _StarterInfoRenderer_Label1:Label;
      
      public var _StarterInfoRenderer_Label2:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _677272715_starterId:String;
      
      protected var _1114481432_starterTitle:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function StarterInfoRenderer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._StarterInfoRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_StarterInfoRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return StarterInfoRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = true;
         this.mxmlContent = [this._StarterInfoRenderer_VGroup1_c()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         StarterInfoRenderer._watcherSetupUtil = param1;
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
         if(param1)
         {
            this._starterId = param1["id"];
            this._starterTitle = param1["title"];
         }
      }
      
      private function _StarterInfoRenderer_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingTop = 7;
         _loc1_.paddingBottom = 7;
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 5;
         _loc1_.mxmlContent = [this._StarterInfoRenderer_Label1_i(),this._StarterInfoRenderer_Label2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _StarterInfoRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_StarterInfoRenderer_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._StarterInfoRenderer_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_StarterInfoRenderer_Label1",this._StarterInfoRenderer_Label1);
         return _loc1_;
      }
      
      private function _StarterInfoRenderer_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "_StarterInfoRenderer_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._StarterInfoRenderer_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_StarterInfoRenderer_Label2",this._StarterInfoRenderer_Label2);
         return _loc1_;
      }
      
      private function _StarterInfoRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = _starterTitle;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_StarterInfoRenderer_Label1.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = _starterId;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_StarterInfoRenderer_Label2.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      protected function get _starterId() : String
      {
         return this._677272715_starterId;
      }
      
      protected function set _starterId(param1:String) : void
      {
         var _loc2_:Object = this._677272715_starterId;
         if(_loc2_ !== param1)
         {
            this._677272715_starterId = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_starterId",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _starterTitle() : String
      {
         return this._1114481432_starterTitle;
      }
      
      protected function set _starterTitle(param1:String) : void
      {
         var _loc2_:Object = this._1114481432_starterTitle;
         if(_loc2_ !== param1)
         {
            this._1114481432_starterTitle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_starterTitle",_loc2_,param1));
            }
         }
      }
   }
}
