package anifire.cc.view
{
   import anifire.assets.AssetImageLibraryObject;
   import anifire.cc.model.CcComponentModel;
   import anifire.color.SelectedColor;
   import anifire.component.ProcessRegulator;
   import anifire.constant.CcLibConstant;
   import anifire.interfaces.IRegulatedProcess;
   import anifire.models.creator.CCBodyComponentModel;
   import anifire.models.creator.CCCharActionComponentModel;
   import anifire.models.creator.CCCharacterActionModel;
   import anifire.models.creator.CCColor;
   import anifire.util.UtilColor;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilHashArray;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class CCHeadView extends CcHeadComponent
   {
       
      
      private const STATE_LOADING:String = "STATE_LOADING";
      
      private const STATE_LOADED:String = "STATE_LOADED";
      
      private var _myActionModel:CCCharacterActionModel;
      
      private var _sceneId:String;
      
      private var _assetImageIdArray:UtilHashArray;
      
      private var _useImageLibrary:Boolean = false;
      
      private var _state:String;
      
      private var _containers:UtilHashArray;
      
      public function CCHeadView()
      {
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
         var _loc1_:Sprite = null;
         var _loc2_:* = null;
         var _loc3_:Object = null;
         var _loc4_:* = null;
         var _loc5_:CCBodyComponentModel = null;
         var _loc6_:Sprite = null;
         if(this._myActionModel)
         {
            _loc1_ = this._containers.getValueByKey("facedecorationMC");
            if(_loc1_)
            {
               for(_loc2_ in this._myActionModel.components)
               {
                  if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(_loc2_) > -1)
                  {
                     _loc3_ = this._myActionModel.getComponentByType(_loc2_);
                     if(_loc3_)
                     {
                        for(_loc4_ in _loc3_)
                        {
                           _loc5_ = _loc3_[_loc4_] as CCBodyComponentModel;
                           if(_loc5_.id)
                           {
                              _loc6_ = new Sprite();
                              _loc6_.name = _loc5_.id + CcLibConstant.MC_NAME_EXT;
                              _loc1_.addChild(_loc6_);
                           }
                        }
                     }
                  }
               }
            }
         }
      }
      
      public function initByCam(param1:CCCharacterActionModel, param2:String = null, param3:Boolean = false) : void
      {
         this._myActionModel = param1;
         this._sceneId = param2;
         this._useImageLibrary = param3;
      }
      
      private function createAllComponents(param1:Boolean = false) : void
      {
         var _loc2_:CcComponent = null;
         var _loc3_:* = null;
         var _loc4_:ProcessRegulator = null;
         var _loc5_:String = null;
         var _loc6_:Object = null;
         var _loc7_:* = null;
         if(this._myActionModel)
         {
            _loc4_ = new ProcessRegulator();
            if(!param1)
            {
               _componentList.removeAll();
            }
            for(_loc3_ in this._myActionModel.components)
            {
               _loc2_ = null;
               _loc5_ = _loc3_;
               if(CcLibConstant.ALL_HEAD_COMPONENT_TYPES.indexOf(_loc3_) >= 0)
               {
                  if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(_loc3_) > -1)
                  {
                     _loc6_ = this._myActionModel.getComponentByType(_loc3_);
                     for(_loc7_ in _loc6_)
                     {
                        if(_loc3_ == CcLibConstant.COMPONENT_TYPE_FACIAL_DECORATION && _loc6_[_loc7_].id)
                        {
                           _loc5_ = _loc6_[_loc7_].id;
                        }
                        _loc2_ = this.createComponentFromCam(_loc3_,_loc7_);
                        if(_loc2_)
                        {
                           _loc4_.addProcess(_loc2_ as IRegulatedProcess,Event.COMPLETE);
                           if(!param1)
                           {
                              _componentList.push(_loc5_,_loc2_);
                           }
                        }
                     }
                  }
                  else
                  {
                     _loc2_ = this.createComponentFromCam(_loc3_);
                     if(_loc2_)
                     {
                        _loc4_.addProcess(_loc2_ as IRegulatedProcess,Event.COMPLETE);
                        if(!param1)
                        {
                           _componentList.push(_loc5_,_loc2_);
                        }
                     }
                  }
               }
            }
            _loc4_.addEventListener(Event.COMPLETE,this.onAllCcComponentCreated);
            _loc4_.startProcess();
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
      
      override public function prepareImage(param1:String, param2:Boolean = true) : void
      {
         var i:uint = 0;
         var sceneId:String = param1;
         var isFirstBehaviour:Boolean = param2;
         try
         {
            this._sceneId = sceneId;
            this.borrowAllComponents(isFirstBehaviour);
            i = 0;
            while(i < _componentList.length)
            {
               this.addComponent(_componentList.getValueByIndex(i) as CcComponent);
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
      
      private function createComponentFromCam(param1:String, param2:String = "") : CcComponent
      {
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc6_:Number = NaN;
         var _loc7_:CcComponentModel = null;
         var _loc3_:CcComponent = CcComponentFactory.create(param1);
         if(this._useImageLibrary)
         {
            if(this._myActionModel)
            {
               if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(param1) > -1)
               {
                  _loc4_ = this._myActionModel.getComponentByType(param1);
                  _loc5_ = _loc4_[param2].path;
               }
               else
               {
                  _loc5_ = this._myActionModel.getComponentByType(param1).path;
               }
               _loc6_ = 0;
               _loc6_ = CcImageLibrary.library.requestImage(_loc5_,this._sceneId,_loc3_);
               if(_loc6_ > 0)
               {
                  return null;
               }
            }
         }
         if(_loc3_)
         {
            _loc7_ = CcComponentModel.createModelByType(param1);
            if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(param1) > -1)
            {
               _loc4_ = this._myActionModel.getComponentByType(param1);
               _loc7_.initByCACam(_loc4_[param2] as CCCharActionComponentModel);
            }
            else
            {
               _loc7_.initByCam(this._myActionModel,param1);
            }
            _loc3_.init(_loc7_);
         }
         return _loc3_;
      }
      
      override public function requestImage(param1:String) : void
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
      
      override public function load() : void
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
      }
      
      private function borrowAllComponents(param1:Boolean = true) : void
      {
         var _loc2_:* = null;
         var _loc3_:CcComponent = null;
         var _loc4_:* = null;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         if(this._useImageLibrary)
         {
            if(this._myActionModel)
            {
               _componentList.removeAll();
               for(_loc2_ in this._myActionModel.components)
               {
                  _loc3_ = null;
                  _loc4_ = _loc2_ = String(_loc2_);
                  if(CcLibConstant.ALL_HEAD_COMPONENT_TYPES.indexOf(_loc2_) >= 0)
                  {
                     if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(_loc2_) > -1)
                     {
                        _loc5_ = this._myActionModel.components[_loc2_];
                        for(_loc4_ in _loc5_)
                        {
                           _loc3_ = this.borrowComponentByCam(_loc2_,param1,_loc4_);
                           if(_loc3_)
                           {
                              _componentList.push(_loc4_,_loc3_);
                           }
                        }
                     }
                     else
                     {
                        _loc3_ = this.borrowComponentByCam(_loc2_,param1,this._myActionModel.getComponentByType(_loc2_).path);
                        if(_loc3_)
                        {
                           _componentList.push(_loc4_,_loc3_);
                        }
                     }
                  }
               }
            }
         }
      }
      
      private function borrowComponentByCam(param1:String, param2:Boolean, param3:String) : CcComponent
      {
         var _loc4_:CcComponent = null;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc7_:Object = null;
         var _loc8_:AssetImageLibraryObject = null;
         var _loc10_:CcComponentModel = null;
         if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(param1) > -1)
         {
            _loc7_ = this._myActionModel.getComponentByType(param1);
            _loc6_ = _loc7_[param3].path;
         }
         else
         {
            _loc6_ = this._myActionModel.getComponentByType(param1).path;
         }
         var _loc9_:Number = 0;
         if(!param2)
         {
            _loc9_ = this._assetImageIdArray.getValueByKey(_loc6_);
         }
         _loc8_ = CcImageLibrary.library.borrowImage(_loc6_,_loc9_,this._sceneId);
         if(_loc8_)
         {
            this._assetImageIdArray.push(_loc6_,_loc8_.imageId);
            _loc4_ = _loc8_.image as CcComponent;
            if(_loc4_)
            {
               _loc10_ = CcComponentModel.createModelByType(param1);
               if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(param1) > -1)
               {
                  _loc10_.initByCACam(_loc7_[param3]);
               }
               else
               {
                  _loc10_.initByCam(this._myActionModel,param1);
               }
               _loc4_.reset(_loc10_);
            }
         }
         return _loc4_;
      }
      
      public function restoreColors() : void
      {
         this.setColors();
      }
      
      override protected function setColors() : void
      {
         var _loc1_:* = null;
         var _loc2_:CCColor = null;
         var _loc3_:SelectedColor = null;
         UtilColor.resetAssetPartsColor(this);
         if(this._myActionModel)
         {
            for(_loc1_ in this._myActionModel.colorCodes)
            {
               _loc2_ = this._myActionModel.getColor(_loc1_);
               _loc3_ = new SelectedColor(_loc2_.type,_loc2_.oc,_loc2_.dest);
               changeColor(_loc3_,!!_loc2_.targetComponent?_loc2_.targetComponent:"");
            }
         }
      }
   }
}
