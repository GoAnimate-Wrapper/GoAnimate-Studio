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
   
   public class TextComponentInfoRenderer extends ItemRenderer implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _TextComponentInfoRenderer_Label1:Label;
      
      public var _TextComponentInfoRenderer_Label2:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      protected var _73562804_textComponentId:String;
      
      protected var _1974228356_textComponentName:String;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function TextComponentInfoRenderer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._TextComponentInfoRenderer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_TextComponentInfoRendererWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return TextComponentInfoRenderer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.autoDrawBackground = true;
         this.mxmlContent = [this._TextComponentInfoRenderer_VGroup1_c()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         TextComponentInfoRenderer._watcherSetupUtil = param1;
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
            this._textComponentId = param1["id"];
            this._textComponentName = param1["name"];
         }
      }
      
      private function _TextComponentInfoRenderer_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.paddingTop = 7;
         _loc1_.paddingBottom = 7;
         _loc1_.paddingLeft = 5;
         _loc1_.paddingRight = 5;
         _loc1_.mxmlContent = [this._TextComponentInfoRenderer_Label1_i(),this._TextComponentInfoRenderer_Label2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _TextComponentInfoRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.id = "_TextComponentInfoRenderer_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TextComponentInfoRenderer_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_TextComponentInfoRenderer_Label1",this._TextComponentInfoRenderer_Label1);
         return _loc1_;
      }
      
      private function _TextComponentInfoRenderer_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 100;
         _loc1_.setStyle("fontSize",12);
         _loc1_.id = "_TextComponentInfoRenderer_Label2";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._TextComponentInfoRenderer_Label2 = _loc1_;
         BindingManager.executeBindings(this,"_TextComponentInfoRenderer_Label2",this._TextComponentInfoRenderer_Label2);
         return _loc1_;
      }
      
      private function _TextComponentInfoRenderer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = _textComponentName;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_TextComponentInfoRenderer_Label1.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = _textComponentId;
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_TextComponentInfoRenderer_Label2.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      protected function get _textComponentId() : String
      {
         return this._73562804_textComponentId;
      }
      
      protected function set _textComponentId(param1:String) : void
      {
         var _loc2_:Object = this._73562804_textComponentId;
         if(_loc2_ !== param1)
         {
            this._73562804_textComponentId = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_textComponentId",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      protected function get _textComponentName() : String
      {
         return this._1974228356_textComponentName;
      }
      
      protected function set _textComponentName(param1:String) : void
      {
         var _loc2_:Object = this._1974228356_textComponentName;
         if(_loc2_ !== param1)
         {
            this._1974228356_textComponentName = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_textComponentName",_loc2_,param1));
            }
         }
      }
   }
}
