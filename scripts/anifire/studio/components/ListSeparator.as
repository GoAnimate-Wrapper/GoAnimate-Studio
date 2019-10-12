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
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.primitives.BitmapImage;
   import spark.primitives.Line;
   
   use namespace mx_internal;
   
   public class ListSeparator extends HGroup implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _ListSeparator_Label1:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _3556653text:String;
      
      private var _embed_mxml__styles_images_panel_narration_icon_png_756367561:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ListSeparator()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._embed_mxml__styles_images_panel_narration_icon_png_756367561 = ListSeparator__embed_mxml__styles_images_panel_narration_icon_png_756367561;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ListSeparator_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_ListSeparatorWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ListSeparator[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.verticalAlign = "middle";
         this.gap = 4;
         this.minHeight = 20;
         this.mxmlContent = [this._ListSeparator_Group1_c(),this._ListSeparator_BitmapImage1_c(),this._ListSeparator_Label1_i(),this._ListSeparator_Group2_c()];
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ListSeparator._watcherSetupUtil = param1;
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
      
      private function _ListSeparator_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 10;
         _loc1_.height = 2;
         _loc1_.mxmlContent = [this._ListSeparator_Line1_c(),this._ListSeparator_Line2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ListSeparator_Line1_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.top = 0;
         _loc1_.stroke = this._ListSeparator_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ListSeparator_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 4439205;
         return _loc1_;
      }
      
      private function _ListSeparator_Line2_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._ListSeparator_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ListSeparator_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 3233154;
         return _loc1_;
      }
      
      private function _ListSeparator_BitmapImage1_c() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.source = this._embed_mxml__styles_images_panel_narration_icon_png_756367561;
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ListSeparator_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("typographicCase","uppercase");
         _loc1_.id = "_ListSeparator_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._ListSeparator_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_ListSeparator_Label1",this._ListSeparator_Label1);
         return _loc1_;
      }
      
      private function _ListSeparator_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.height = 2;
         _loc1_.mxmlContent = [this._ListSeparator_Line3_c(),this._ListSeparator_Line4_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _ListSeparator_Line3_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.top = 0;
         _loc1_.stroke = this._ListSeparator_SolidColorStroke3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ListSeparator_SolidColorStroke3_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 4439205;
         return _loc1_;
      }
      
      private function _ListSeparator_Line4_c() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.percentWidth = 100;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._ListSeparator_SolidColorStroke4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ListSeparator_SolidColorStroke4_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 3233154;
         return _loc1_;
      }
      
      private function _ListSeparator_bindingsSetup() : Array
      {
         var _loc1_:Array = [];
         _loc1_[0] = new Binding(this,null,null,"_ListSeparator_Label1.text","text");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get text() : String
      {
         return this._3556653text;
      }
      
      public function set text(param1:String) : void
      {
         var _loc2_:Object = this._3556653text;
         if(_loc2_ !== param1)
         {
            this._3556653text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text",_loc2_,param1));
            }
         }
      }
   }
}
