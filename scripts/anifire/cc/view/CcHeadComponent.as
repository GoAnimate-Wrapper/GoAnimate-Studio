package anifire.cc.view
{
   import anifire.assets.AssetImageLibraryObject;
   import anifire.cc.interfaces.ICcComponent;
   import anifire.cc.interfaces.ICcPairComponent;
   import anifire.cc.model.CcComponentModel;
   import anifire.color.SelectedColor;
   import anifire.component.ProcessRegulator;
   import anifire.constant.CcLibConstant;
   import anifire.interfaces.IRegulatedProcess;
   import anifire.interfaces.ISpeak;
   import anifire.util.UtilColor;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilPlain;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.utils.ByteArray;
   
   public class CcHeadComponent extends MovieClip
   {
       
      
      private const STATE_LOADING:String = "STATE_LOADING";
      
      private const STATE_LOADED:String = "STATE_LOADED";
      
      protected var _componentList:UtilHashArray;
      
      private var _charXml:XML;
      
      private var _sceneId:String;
      
      private var _assetImageIdArray:UtilHashArray;
      
      private var _useImageLibrary:Boolean = false;
      
      private var _state:String;
      
      private var _containers:UtilHashArray;
      
      public function CcHeadComponent()
      {
         this._componentList = new UtilHashArray();
         this._assetImageIdArray = new UtilHashArray();
         this._containers = new UtilHashArray();
         super();
         this.createComponentContainers();
      }
      
      private function createComponentContainers() : void
      {
         var _loc3_:Sprite = null;
         var _loc1_:Array = CcLibConstant.GET_COMPONENT_ORDER_IN_HEAD;
         this._containers = new UtilHashArray();
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = new Sprite();
            _loc3_.name = _loc1_[_loc2_] + CcLibConstant.MC_NAME_EXT;
            this.addChild(_loc3_);
            this._containers.push(_loc3_.name,_loc3_);
            _loc2_++;
         }
      }
      
      private function createFaceDecorationContainers() : void
      {
         var sprite:Sprite = null;
         var node:XML = null;
         var deco:Sprite = null;
         if(this._charXml)
         {
            sprite = this._containers.getValueByKey("facedecorationMC");
            if(sprite)
            {
               for each(node in this._charXml..component.(@type == CcLibConstant.COMPONENT_TYPE_FACIAL_DECORATION))
               {
                  deco = new Sprite();
                  deco.name = node.@id + CcLibConstant.MC_NAME_EXT;
                  sprite.addChild(deco);
               }
            }
         }
      }
      
      public function init(param1:XML, param2:String = null, param3:Boolean = false) : void
      {
         this._charXml = param1;
         this._sceneId = param2;
         this._useImageLibrary = param3;
      }
      
      public function load() : void
      {
         try
         {
            if(this._state == this.STATE_LOADING)
            {
               if(this._useImageLibrary)
               {
                  this.requestImage(this._sceneId);
               }
               return;
            }
            if(this._state == this.STATE_LOADED)
            {
               if(this._useImageLibrary)
               {
                  this.requestImage(this._sceneId);
               }
               else
               {
                  this.dispatchEvent(new Event(Event.COMPLETE));
               }
               return;
            }
            this._state = this.STATE_LOADING;
            this.createFaceDecorationContainers();
            this.createAllComponents();
            return;
         }
         catch(e:Error)
         {
            this.dispatchEvent(new Event(Event.COMPLETE));
            UtilErrorLogger.getInstance().appendCustomError("CcHeadComponent:load",e);
            return;
         }
      }
      
      private function createAllComponents(param1:Boolean = false) : void
      {
         var _loc2_:XML = null;
         var _loc3_:CcComponent = null;
         var _loc4_:String = null;
         var _loc5_:ProcessRegulator = null;
         var _loc6_:String = null;
         if(this._charXml)
         {
            _loc5_ = new ProcessRegulator();
            if(!param1)
            {
               this._componentList.removeAll();
            }
            for each(_loc2_ in this._charXml..component)
            {
               _loc3_ = null;
               _loc6_ = _loc4_ = String(_loc2_.@type);
               if(CcLibConstant.ALL_HEAD_COMPONENT_TYPES.indexOf(_loc4_) >= 0)
               {
                  if(_loc4_ == CcLibConstant.COMPONENT_TYPE_FACIAL_DECORATION)
                  {
                     _loc6_ = _loc6_ + _loc2_.@id;
                  }
                  _loc3_ = this.createComponentFromXml(_loc2_,_loc4_);
                  if(_loc3_)
                  {
                     _loc5_.addProcess(_loc3_ as IRegulatedProcess,Event.COMPLETE);
                     if(!param1)
                     {
                        this._componentList.push(_loc6_,_loc3_);
                     }
                  }
               }
            }
            _loc5_.addEventListener(Event.COMPLETE,this.onAllCcComponentCreated);
            _loc5_.startProcess();
         }
      }
      
      private function onAllCcComponentCreated(param1:Event) : void
      {
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onAllCcComponentCreated);
         if(!this._useImageLibrary)
         {
            this.prepareImage(this._sceneId);
         }
         this._state = this.STATE_LOADED;
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
      
      protected function addComponent(param1:CcComponent) : void
      {
         if(param1)
         {
            if(param1 is CcHairComponent)
            {
               this.addHairComponent(param1 as CcHairComponent);
            }
            else if(param1 is CcPairComponent)
            {
               this.addPairComponent(param1 as CcPairComponent);
            }
            else if(param1 is CcDecorationComponent)
            {
               this.addFaceDecoration(param1 as CcDecorationComponent);
            }
            else
            {
               this.addImage(param1,param1.name + CcLibConstant.MC_NAME_EXT);
            }
         }
      }
      
      private function addFaceDecoration(param1:CcComponent) : void
      {
         var _loc2_:String = param1.model.id + CcLibConstant.MC_NAME_EXT;
         this.addImage(param1,_loc2_);
      }
      
      private function addHairComponent(param1:CcHairComponent) : void
      {
         var _loc2_:String = null;
         var _loc3_:DisplayObjectContainer = null;
         if(param1)
         {
            _loc2_ = CcLibConstant.COMPONENT_TYPE_HAIR + CcLibConstant.MC_NAME_EXT;
            this.removeImage(_loc2_);
            this.addImage(param1,_loc2_);
            _loc2_ = CcLibConstant.COMPONENT_TYPE_FRONT_HAIR + CcLibConstant.MC_NAME_EXT;
            this.removeImage(_loc2_);
            _loc3_ = param1.frontHair;
            if(_loc3_)
            {
               this.addImage(_loc3_,_loc2_);
            }
            _loc2_ = CcLibConstant.COMPONENT_TYPE_BACK_HAIR + CcLibConstant.MC_NAME_EXT;
            this.removeImage(_loc2_);
            _loc3_ = param1.backHair;
            if(_loc3_)
            {
               this.addImage(_loc3_,_loc2_);
            }
         }
      }
      
      private function addImage(param1:DisplayObject, param2:String) : void
      {
         var _loc3_:DisplayObjectContainer = UtilPlain.getInstance(this,param2);
         if(_loc3_ && param1)
         {
            this.removeImage(param2);
            _loc3_.addChild(param1);
            return;
         }
      }
      
      private function removeImage(param1:String) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:uint = 0;
         var _loc2_:DisplayObjectContainer = UtilPlain.getInstance(this,param1);
         if(_loc2_)
         {
            _loc3_ = _loc2_.numChildren;
            _loc4_ = _loc3_;
            while(_loc4_ > 0)
            {
               _loc2_.removeChildAt(_loc4_ - 1);
               _loc4_--;
            }
         }
      }
      
      private function addPairComponent(param1:CcPairComponent) : void
      {
         var _loc2_:String = null;
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:DisplayObjectContainer = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         if(param1)
         {
            if(param1.name == CcLibConstant.COMPONENT_TYPE_GLASSES)
            {
               _loc3_ = param1.rightSide;
               _loc5_ = "Right";
               _loc4_ = param1.leftSide;
               _loc6_ = "Left";
            }
            else
            {
               _loc3_ = param1.leftSide;
               _loc5_ = "Left";
               _loc4_ = param1.rightSide;
               _loc6_ = "Right";
            }
            if(param1.model is ICcPairComponent && ICcPairComponent(param1.model).split)
            {
               if(_loc3_)
               {
                  _loc2_ = param1.name + _loc5_ + CcLibConstant.MC_NAME_EXT;
                  this.addImage(_loc3_,_loc2_);
               }
            }
            if(_loc4_)
            {
               _loc2_ = param1.name + _loc6_ + CcLibConstant.MC_NAME_EXT;
               this.addImage(_loc4_,_loc2_);
            }
         }
      }
      
      public function getComponent(param1:String) : CcComponent
      {
         var _loc2_:CcComponent = null;
         if(this._componentList)
         {
            _loc2_ = this._componentList.getValueByKey(param1) as CcComponent;
         }
         return _loc2_;
      }
      
      private function borrowComponent(param1:XML, param2:String, param3:Boolean) : CcComponent
      {
         var _loc4_:CcComponent = null;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc7_:AssetImageLibraryObject = null;
         var _loc9_:CcComponentModel = null;
         _loc6_ = param1.@theme_id + "." + param2 + "." + param1.@path + "." + param1.@file;
         var _loc8_:Number = 0;
         if(!param3)
         {
            _loc8_ = this._assetImageIdArray.getValueByKey(_loc6_);
         }
         _loc7_ = CcImageLibrary.library.borrowImage(_loc6_,_loc8_,this._sceneId);
         if(_loc7_)
         {
            this._assetImageIdArray.push(_loc6_,_loc7_.imageId);
            _loc4_ = _loc7_.image as CcComponent;
            if(_loc4_)
            {
               _loc9_ = CcComponentModel.createModelByType(param1.@type);
               _loc9_.initByXml(param1);
               _loc4_.reset(_loc9_);
            }
         }
         return _loc4_;
      }
      
      private function createComponentFromXml(param1:XML, param2:String) : CcComponent
      {
         var _loc4_:String = null;
         var _loc5_:Number = NaN;
         var _loc6_:CcComponentModel = null;
         var _loc3_:CcComponent = CcComponentFactory.create(param2);
         if(this._useImageLibrary)
         {
            if(param1)
            {
               _loc4_ = param1.@theme_id + "." + param2 + "." + param1.@path + "." + param1.@file;
               _loc5_ = 0;
               _loc5_ = CcImageLibrary.library.requestImage(_loc4_,this._sceneId,_loc3_);
               if(_loc5_ > 0)
               {
                  return null;
               }
            }
         }
         if(_loc3_)
         {
            _loc6_ = CcComponentModel.createModelByType(param1.@type);
            _loc6_.initByXml(param1);
            _loc3_.init(_loc6_);
         }
         return _loc3_;
      }
      
      public function get supportLookAtCamera() : Boolean
      {
         var _loc1_:CcEyeComponent = null;
         if(this._componentList)
         {
            _loc1_ = this._componentList.getValueByKey("eye") as CcEyeComponent;
            if(_loc1_)
            {
               return _loc1_.supportLookAtCamera;
            }
         }
         return false;
      }
      
      public function set useTalkMouth(param1:Boolean) : void
      {
         var _loc2_:CcMouthComponent = null;
         if(this._componentList)
         {
            _loc2_ = this._componentList.getValueByKey("mouth") as CcMouthComponent;
            if(_loc2_)
            {
               _loc2_.useTalkMouth = param1;
            }
         }
      }
      
      public function get lookAtCamera() : Boolean
      {
         var _loc1_:CcEyeComponent = null;
         if(this._componentList)
         {
            _loc1_ = this._componentList.getValueByKey("eye") as CcEyeComponent;
            if(_loc1_)
            {
               return _loc1_.lookAtCamera;
            }
         }
         return false;
      }
      
      public function set lookAtCamera(param1:Boolean) : void
      {
         var _loc2_:CcEyeComponent = null;
         if(this._componentList)
         {
            _loc2_ = this._componentList.getValueByKey("eye") as CcEyeComponent;
            if(_loc2_)
            {
               _loc2_.lookAtCamera = param1;
               this.addPairComponent(_loc2_);
               this.setColors();
               UtilPlain.playFamily(_loc2_.leftSide);
               UtilPlain.playFamily(_loc2_.rightSide);
            }
         }
      }
      
      public function speak(param1:Number) : void
      {
         var _loc2_:ISpeak = null;
         if(this._componentList)
         {
            _loc2_ = this._componentList.getValueByKey("mouth") as ISpeak;
            if(_loc2_)
            {
               _loc2_.speak(param1);
            }
         }
      }
      
      public function requestImage(param1:String) : void
      {
         var sceneId:String = param1;
         try
         {
            if(this._useImageLibrary)
            {
               this._sceneId = sceneId;
               this.createAllComponents(true);
            }
            else
            {
               this.dispatchEvent(new Event(Event.COMPLETE));
            }
            return;
         }
         catch(e:Error)
         {
            this.dispatchEvent(new Event(Event.COMPLETE));
            UtilErrorLogger.getInstance().appendCustomError("CcHeadComponent:requestImage:" + sceneId,e);
            return;
         }
      }
      
      private function borrowAllComponents(param1:Boolean = true) : void
      {
         var _loc2_:XML = null;
         var _loc3_:CcComponent = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         if(this._useImageLibrary)
         {
            if(this._charXml)
            {
               this._componentList.removeAll();
               for each(_loc2_ in this._charXml..component)
               {
                  _loc3_ = null;
                  _loc5_ = _loc4_ = String(_loc2_.@type);
                  if(CcLibConstant.ALL_HEAD_COMPONENT_TYPES.indexOf(_loc4_) >= 0)
                  {
                     if(_loc4_ == CcLibConstant.COMPONENT_TYPE_FACIAL_DECORATION)
                     {
                        _loc5_ = _loc5_ + _loc2_.@id;
                     }
                     _loc3_ = this.borrowComponent(_loc2_,_loc4_,param1);
                     if(_loc3_)
                     {
                        this._componentList.push(_loc5_,_loc3_);
                     }
                  }
               }
            }
         }
      }
      
      public function setComponent(param1:ICcComponent, param2:ByteArray) : Boolean
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:DisplayObjectContainer = null;
         var _loc7_:Sprite = null;
         var _loc8_:Sprite = null;
         var _loc3_:CcComponent = CcComponentFactory.create(param1.type);
         if(_loc3_)
         {
            _loc3_.init(param1);
            _loc4_ = param1.type;
            if(_loc4_ == "facedecoration")
            {
               _loc4_ = param1.id;
               _loc5_ = param1.id + CcLibConstant.MC_NAME_EXT;
               _loc6_ = UtilPlain.getInstance(this,_loc5_);
               if(!_loc6_)
               {
                  _loc7_ = this._containers.getValueByKey("facedecorationMC");
                  if(_loc7_)
                  {
                     _loc8_ = new Sprite();
                     _loc8_.name = _loc5_;
                     _loc7_.addChild(_loc8_);
                  }
               }
            }
            this._componentList.push(_loc4_,_loc3_);
            _loc3_.addEventListener(Event.COMPLETE,this.onComponentLoaded);
            _loc3_.loadFromBytes(param2,true);
            return true;
         }
         return false;
      }
      
      private function onComponentLoaded(param1:Event) : void
      {
         var _loc2_:CcComponent = param1.target as CcComponent;
         if(_loc2_)
         {
            _loc2_.removeEventListener(Event.COMPLETE,this.onComponentLoaded);
            this.addComponent(_loc2_);
         }
         this.dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function prepareImage(param1:String, param2:Boolean = true) : void
      {
         var i:uint = 0;
         var sceneId:String = param1;
         var isFirstBehaviour:Boolean = param2;
         try
         {
            this._sceneId = sceneId;
            this.borrowAllComponents(isFirstBehaviour);
            i = 0;
            while(i < this._componentList.length)
            {
               this.addComponent(this._componentList.getValueByIndex(i) as CcComponent);
               i++;
            }
            this.setColors();
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("CcHeadComponent:prepareImage:" + sceneId,e);
            return;
         }
      }
      
      public function destroy(param1:Boolean = true) : void
      {
         var i:int = 0;
         var max:Number = NaN;
         var component:CcComponent = null;
         var gc:Boolean = param1;
         try
         {
            if(!this._useImageLibrary)
            {
               max = this.numChildren;
               i = max;
               while(i > 0)
               {
                  this.removeChildAt(i - 1);
                  i--;
               }
               this.createComponentContainers();
               i = 0;
               while(i < this._componentList.length)
               {
                  component = this._componentList.getValueByIndex(i) as CcComponent;
                  if(component)
                  {
                     component.destroy(gc);
                  }
                  i++;
               }
               this._state = null;
            }
            return;
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("CcHeadComponent:destroy",e);
            return;
         }
      }
      
      protected function setColors() : void
      {
         var _loc1_:XML = null;
         var _loc2_:SelectedColor = null;
         UtilColor.resetAssetPartsColor(this);
         if(this._charXml)
         {
            for each(_loc1_ in this._charXml.child(CcLibConstant.NODE_COLOR))
            {
               _loc2_ = new SelectedColor(_loc1_.@r,String(_loc1_.@oc).length == 0?uint(uint.MAX_VALUE):uint(_loc1_.@oc),uint(_loc1_));
               this.changeColor(_loc2_,_loc1_.@targetComponent == null?"":_loc1_.@targetComponent);
            }
         }
      }
      
      protected function changeColor(param1:SelectedColor, param2:String = "") : Number
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
   }
}
