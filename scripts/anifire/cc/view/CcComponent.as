package anifire.cc.view
{
   import anifire.cc.interfaces.ICcComponent;
   import anifire.color.SelectedColor;
   import anifire.component.CcComponentLoader;
   import anifire.interfaces.IRegulatedProcess;
   import anifire.util.UtilColor;
   import anifire.util.UtilCrypto;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilPlain;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Shader;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class CcComponent extends MovieClip implements IRegulatedProcess
   {
       
      
      private var GoColorMapShaderClass:Class;
      
      private var _loader:Loader;
      
      private var _model:ICcComponent;
      
      private var _customColor:UtilHashArray;
      
      public function CcComponent()
      {
         this.GoColorMapShaderClass = CcComponent_GoColorMapShaderClass;
         this._customColor = new UtilHashArray();
         super();
      }
      
      public function startProcess(param1:Boolean = false, param2:Number = 0) : void
      {
         this.loadComponent();
      }
      
      public function get model() : ICcComponent
      {
         return this._model;
      }
      
      protected function get loader() : Loader
      {
         return this._loader;
      }
      
      public function init(param1:ICcComponent) : void
      {
         if(this._model is IEventDispatcher)
         {
            IEventDispatcher(this._model).removeEventListener(Event.CHANGE,this.onModelChange);
         }
         this._model = param1;
         if(this._model is IEventDispatcher)
         {
            IEventDispatcher(this._model).addEventListener(Event.CHANGE,this.onModelChange);
         }
      }
      
      private function onModelChange(param1:Event) : void
      {
         this.setProperties();
      }
      
      public function loadComponent() : void
      {
         var _loc1_:CcComponentLoader = this.getComponentLoader();
         if(_loc1_)
         {
            _loc1_.addEventListener(Event.COMPLETE,this.onCcComponentLoaded);
            _loc1_.load();
         }
      }
      
      public function destroy(param1:Boolean = true) : void
      {
         if(this.loader)
         {
            this.loader.unloadAndStop(param1);
         }
      }
      
      protected function getComponentLoader() : CcComponentLoader
      {
         var _loc1_:CcComponentLoader = null;
         if(this.model)
         {
            _loc1_ = CcComponentLoader.getComponentLoader(this.model.url,this.model.url);
         }
         return _loc1_;
      }
      
      private function onCcComponentLoaded(param1:Event) : void
      {
         var componentLoader:CcComponentLoader = null;
         var e:Event = param1;
         try
         {
            componentLoader = CcComponentLoader(e.target);
            if(componentLoader)
            {
               componentLoader.removeEventListener(e.type,this.onCcComponentLoaded);
               this.loadFromBytes(componentLoader.swfBytes);
            }
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("CcComponent:onCcComponentLoaded",e);
            return;
         }
      }
      
      public function loadFromBytes(param1:ByteArray, param2:Boolean = false) : void
      {
         var _loc3_:ByteArray = null;
         var _loc4_:LoaderContext = null;
         var _loc5_:UtilCrypto = null;
         if(param1)
         {
            _loc3_ = param1;
            if(param2)
            {
               _loc3_ = new ByteArray();
               param1.readBytes(_loc3_);
               _loc3_.position = 0;
               param1.position = 0;
               _loc5_ = new UtilCrypto();
               _loc5_.decrypt(_loc3_);
            }
            _loc4_ = new LoaderContext();
            _loc4_.allowCodeImport = true;
            this._loader = new Loader();
            this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onImageLoaded);
            this._loader.loadBytes(_loc3_,_loc4_);
         }
      }
      
      private function onImageLoaded(param1:Event) : void
      {
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onImageLoaded);
         this.addLoader();
         this.setProperties();
         this.setColors();
         this.onReady();
      }
      
      public function reset(param1:ICcComponent) : void
      {
         this._model = param1;
         this.setProperties();
         this.setColors();
      }
      
      protected function addLoader() : void
      {
         addChild(this._loader);
      }
      
      protected function setProperties() : void
      {
         if(this._loader && this._model)
         {
            this._loader.x = this._model.x;
            this._loader.y = this._model.y;
            this._loader.getChildAt(0).scaleX = this._model.xscale;
            this._loader.getChildAt(0).scaleY = this._model.yscale;
            this._loader.getChildAt(0).rotation = this._model.rotation;
         }
      }
      
      protected function setColors() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Object = null;
         if(this._model && this._model.colors)
         {
            _loc1_ = 0;
            while(_loc1_ < this._model.colors.length)
            {
               _loc2_ = this._model.colors[_loc1_] as Object;
               this.updateColor(_loc2_);
               _loc1_++;
            }
         }
      }
      
      private function updateColor(param1:Object) : void
      {
         var _loc2_:UtilHashArray = new UtilHashArray();
         var _loc3_:SelectedColor = new SelectedColor(param1["colorReference"],param1["originalColor"],param1["colorValue"]);
         this.changeColor(_loc3_,param1["targetComponentId"]);
         if(param1["originalColor"] != uint.MAX_VALUE)
         {
            this._customColor.push(_loc3_.areaName,_loc3_);
            _loc2_.push("0x" + _loc3_.orgColor.toString(16),"0x" + _loc3_.dstColor.toString(16));
         }
         if(_loc2_.length > 0)
         {
            this.changeColorForShader(_loc2_);
         }
         this.addColor(_loc3_.areaName,_loc3_.orgColor,_loc3_.dstColor);
      }
      
      private function addColor(param1:String, param2:uint, param3:uint) : void
      {
         var _loc4_:SelectedColor = new SelectedColor(param1,param2,param3);
         this._customColor.push(_loc4_.areaName,_loc4_);
      }
      
      private function changeColor(param1:SelectedColor, param2:String = "") : Number
      {
         var _loc3_:DisplayObject = null;
         if(param2 == "")
         {
            _loc3_ = this;
         }
         else
         {
            _loc3_ = UtilPlain.getInstance(this,param2);
         }
         var _loc4_:uint = UtilColor.setAssetPartColor(_loc3_,param1.areaName,param1.dstColor);
         return _loc4_;
      }
      
      private function changeColorForShader(param1:UtilHashArray) : Number
      {
         var _loc2_:Number = NaN;
         var _loc3_:Shader = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         _loc3_ = new Shader();
         _loc3_.byteCode = new this.GoColorMapShaderClass();
         var _loc4_:Array = new Array();
         var _loc5_:Array = new Array();
         var _loc6_:Array = new Array();
         var _loc7_:UtilHashArray = new UtilHashArray();
         _loc8_ = 0;
         while(_loc8_ < this._customColor.length)
         {
            if(SelectedColor(this._customColor.getValueByIndex(_loc8_)).orgColor != uint.MAX_VALUE)
            {
               _loc7_.push("0x" + SelectedColor(this._customColor.getValueByIndex(_loc8_)).orgColor.toString(16),SelectedColor(this._customColor.getValueByIndex(_loc8_)).dstColor);
            }
            _loc8_++;
         }
         _loc7_.insert(0,param1,true);
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            if(uint(_loc7_.getKey(_loc9_)) == 0)
            {
               _loc7_.remove(_loc9_,1);
            }
            _loc9_++;
         }
         _loc9_ = 0;
         while(_loc9_ < _loc7_.length)
         {
            _loc6_.push(uint(_loc7_.getKey(_loc9_)));
            _loc12_ = uint(_loc7_.getValueByIndex(_loc9_)) >> 16 & 255;
            _loc13_ = uint(_loc7_.getValueByIndex(_loc9_)) >> 8 & 255;
            _loc14_ = uint(_loc7_.getValueByIndex(_loc9_)) & 255;
            if(_loc9_ / 4 < 1)
            {
               _loc4_[_loc9_ * 4 + 0] = _loc12_ / 255;
               _loc4_[_loc9_ * 4 + 1] = _loc13_ / 255;
               _loc4_[_loc9_ * 4 + 2] = _loc14_ / 255;
            }
            else
            {
               _loc5_[_loc9_ % 4 * 4 + 0] = _loc12_ / 255;
               _loc5_[_loc9_ % 4 * 4 + 1] = _loc13_ / 255;
               _loc5_[_loc9_ % 4 * 4 + 2] = _loc14_ / 255;
            }
            _loc9_++;
         }
         _loc3_.data["colorValue0"].value = _loc4_;
         _loc3_.data["colorValue1"].value = _loc5_;
         _loc3_.data["colorKey"].value = _loc6_;
         var _loc10_:Array = UtilPlain.getAllShaderObj(this);
         var _loc11_:int = 0;
         while(_loc11_ < _loc10_.length)
         {
            DisplayObject(_loc10_[_loc11_]).blendMode = BlendMode.NORMAL;
            DisplayObject(_loc10_[_loc11_]).blendMode = BlendMode.SHADER;
            DisplayObject(_loc10_[_loc11_]).visible = true;
            DisplayObject(_loc10_[_loc11_]).blendShader = _loc3_;
            _loc11_++;
         }
         return _loc2_;
      }
      
      protected function onReady() : void
      {
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
