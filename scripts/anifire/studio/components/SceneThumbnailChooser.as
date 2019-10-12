package anifire.studio.components
{
   import anifire.studio.skins.FlatNextButtonSkin;
   import anifire.util.UtilDict;
   import flash.display.BitmapData;
   import flash.events.Event;
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
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.State;
   import mx.utils.StringUtil;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.primitives.BitmapImage;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class SceneThumbnailChooser extends VGroup implements IBindingClient, IStateClient2
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _SceneThumbnailChooser_Group1:Group;
      
      public var _SceneThumbnailChooser_Label1:Label;
      
      private var _1781625235buttonGroup:HGroup;
      
      private var _2024940825imageDisplay:BitmapImage;
      
      private var _1184053038labelDisplay:Label;
      
      private var _1749722107nextButton:Button;
      
      private var _498435831previousButton:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _bitmapDataArray:Vector.<BitmapData>;
      
      private var _selectedIndex:int = 0;
      
      private var _numThumbnails:int = 0;
      
      private var _editable:Boolean = true;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function SceneThumbnailChooser()
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
         bindings = this._SceneThumbnailChooser_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_studio_components_SceneThumbnailChooserWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return SceneThumbnailChooser[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._SceneThumbnailChooser_Group1_i()];
         this.currentState = "normal";
         var _SceneThumbnailChooser_HGroup1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SceneThumbnailChooser_HGroup1_i);
         var _SceneThumbnailChooser_Label1_factory:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._SceneThumbnailChooser_Label1_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_SceneThumbnailChooser_HGroup1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_SceneThumbnailChooser_Group1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_SceneThumbnailChooser_Label1_factory,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            })]
         }),new State({
            "name":"displayOnly",
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
         SceneThumbnailChooser._watcherSetupUtil = param1;
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
      
      public function init(param1:Vector.<BitmapData>, param2:int = 0) : void
      {
         this._bitmapDataArray = param1;
         if(param1)
         {
            if(param2 >= 0 && param2 < param1.length)
            {
               this._selectedIndex = param2;
            }
         }
         if(this._bitmapDataArray)
         {
            this._numThumbnails = this._bitmapDataArray.length;
         }
         this.updateUI();
      }
      
      private function updateUI() : void
      {
         var _loc1_:BitmapData = null;
         if(this._selectedIndex >= 0 && this._selectedIndex < this._bitmapDataArray.length)
         {
            _loc1_ = this._bitmapDataArray[this._selectedIndex];
            if(_loc1_)
            {
               this.imageDisplay.source = _loc1_;
            }
         }
         if(this._editable)
         {
            this.labelDisplay.text = StringUtil.substitute(UtilDict.toDisplay("go","{0} of {1}"),this._selectedIndex + 1,this._numThumbnails);
            this.previousButton.enabled = this._selectedIndex > 0;
            this.nextButton.enabled = this._selectedIndex < this._numThumbnails - 1;
         }
      }
      
      private function onClickPrev(param1:MouseEvent) : void
      {
         if(this._selectedIndex > 0)
         {
            this._selectedIndex--;
            this.updateUI();
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      private function onClickNext(param1:MouseEvent) : void
      {
         if(this._selectedIndex < this._numThumbnails - 1)
         {
            this._selectedIndex++;
            this.updateUI();
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function get selectedIndex() : int
      {
         return this._selectedIndex;
      }
      
      public function set editable(param1:Boolean) : void
      {
         this._editable = param1;
         currentState = !!this._editable?"normal":"displayOnly";
      }
      
      private function _SceneThumbnailChooser_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.id = "_SceneThumbnailChooser_Label1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SceneThumbnailChooser_Label1 = _loc1_;
         BindingManager.executeBindings(this,"_SceneThumbnailChooser_Label1",this._SceneThumbnailChooser_Label1);
         return _loc1_;
      }
      
      private function _SceneThumbnailChooser_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 190;
         _loc1_.height = 110;
         _loc1_.mxmlContent = [this._SceneThumbnailChooser_Rect1_c(),this._SceneThumbnailChooser_BitmapImage1_i()];
         _loc1_.id = "_SceneThumbnailChooser_Group1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._SceneThumbnailChooser_Group1 = _loc1_;
         BindingManager.executeBindings(this,"_SceneThumbnailChooser_Group1",this._SceneThumbnailChooser_Group1);
         return _loc1_;
      }
      
      private function _SceneThumbnailChooser_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 5;
         _loc1_.stroke = this._SceneThumbnailChooser_SolidColorStroke1_c();
         _loc1_.fill = this._SceneThumbnailChooser_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _SceneThumbnailChooser_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13355989;
         return _loc1_;
      }
      
      private function _SceneThumbnailChooser_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _SceneThumbnailChooser_BitmapImage1_i() : BitmapImage
      {
         var _loc1_:BitmapImage = new BitmapImage();
         _loc1_.smooth = true;
         _loc1_.scaleMode = "zoom";
         _loc1_.fillMode = "scale";
         _loc1_.width = 180;
         _loc1_.height = 100;
         _loc1_.verticalCenter = 0;
         _loc1_.horizontalCenter = 0;
         _loc1_.initialized(this,"imageDisplay");
         this.imageDisplay = _loc1_;
         BindingManager.executeBindings(this,"imageDisplay",this.imageDisplay);
         return _loc1_;
      }
      
      private function _SceneThumbnailChooser_HGroup1_i() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.percentWidth = 100;
         _loc1_.gap = 0;
         _loc1_.verticalAlign = "middle";
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._SceneThumbnailChooser_Button1_i(),this._SceneThumbnailChooser_Label2_i(),this._SceneThumbnailChooser_Button2_i()];
         _loc1_.id = "buttonGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonGroup = _loc1_;
         BindingManager.executeBindings(this,"buttonGroup",this.buttonGroup);
         return _loc1_;
      }
      
      private function _SceneThumbnailChooser_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.scaleX = -1;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",FlatNextButtonSkin);
         _loc1_.addEventListener("click",this.__previousButton_click);
         _loc1_.id = "previousButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.previousButton = _loc1_;
         BindingManager.executeBindings(this,"previousButton",this.previousButton);
         return _loc1_;
      }
      
      public function __previousButton_click(param1:MouseEvent) : void
      {
         this.onClickPrev(param1);
      }
      
      private function _SceneThumbnailChooser_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.minWidth = 60;
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",this.labelDisplay);
         return _loc1_;
      }
      
      private function _SceneThumbnailChooser_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.buttonMode = true;
         _loc1_.setStyle("skinClass",FlatNextButtonSkin);
         _loc1_.addEventListener("click",this.__nextButton_click);
         _loc1_.id = "nextButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.nextButton = _loc1_;
         BindingManager.executeBindings(this,"nextButton",this.nextButton);
         return _loc1_;
      }
      
      public function __nextButton_click(param1:MouseEvent) : void
      {
         this.onClickNext(param1);
      }
      
      private function _SceneThumbnailChooser_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("go","Select thumbnail");
            return _loc1_ == undefined?null:String(_loc1_);
         },null,"_SceneThumbnailChooser_Label1.text");
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
      public function get imageDisplay() : BitmapImage
      {
         return this._2024940825imageDisplay;
      }
      
      public function set imageDisplay(param1:BitmapImage) : void
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
      public function get labelDisplay() : Label
      {
         return this._1184053038labelDisplay;
      }
      
      public function set labelDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1184053038labelDisplay;
         if(_loc2_ !== param1)
         {
            this._1184053038labelDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get nextButton() : Button
      {
         return this._1749722107nextButton;
      }
      
      public function set nextButton(param1:Button) : void
      {
         var _loc2_:Object = this._1749722107nextButton;
         if(_loc2_ !== param1)
         {
            this._1749722107nextButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"nextButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get previousButton() : Button
      {
         return this._498435831previousButton;
      }
      
      public function set previousButton(param1:Button) : void
      {
         var _loc2_:Object = this._498435831previousButton;
         if(_loc2_ !== param1)
         {
            this._498435831previousButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"previousButton",_loc2_,param1));
            }
         }
      }
   }
}
