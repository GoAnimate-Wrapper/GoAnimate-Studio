package anifire.studio.components
{
   import anifire.effect.ZoomEffect;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Console;
   import anifire.studio.core.EffectAsset;
   import anifire.studio.core.ProgramEffectAsset;
   import anifire.studio.events.EffectTrayEvent;
   import anifire.studio.skins.EffectListSkin;
   import anifire.util.UtilHashArray;
   import flash.events.Event;
   import mx.binding.BindingManager;
   import mx.collections.ArrayCollection;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.events.DragEvent;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import spark.components.Group;
   import spark.components.List;
   import spark.events.RendererExistenceEvent;
   
   public class EffectTray extends Group
   {
       
      
      private var _1315051438assetList:EffectList;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _console:Console;
      
      private var _effectSource:ArrayCollection;
      
      private var _scene:AnimeScene;
      
      public function EffectTray()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._EffectTray_EffectList1_i()];
         this.addEventListener("creationComplete",this.___EffectTray_Group1_creationComplete);
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
      
      public function get activeScene() : AnimeScene
      {
         return this._scene;
      }
      
      public function set activeScene(param1:AnimeScene) : void
      {
         if(this._scene != param1)
         {
            this._scene = param1;
         }
         this.updateEffectSource();
      }
      
      protected function updateEffectSource() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:EffectAsset = null;
         this._effectSource.removeAll();
         if(this._scene)
         {
            _loc1_ = this._scene.effects.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this._scene.effects.getValueByIndex(_loc2_) as EffectAsset;
               if(!(this._console.metaData.mver > 3 && _loc3_ is ProgramEffectAsset && _loc3_.effect is ZoomEffect))
               {
                  this._effectSource.addItem(_loc3_);
               }
               _loc2_++;
            }
         }
      }
      
      private function updateEffectIndex(param1:EffectAsset, param2:int) : void
      {
         this._scene.effects.removeByKey(param1.id);
         var _loc3_:UtilHashArray = new UtilHashArray();
         _loc3_.push(param1.id,param1);
         this._scene.effects.insert(param2,_loc3_,true);
         this._scene.reorderAsset(param1,param2);
      }
      
      protected function onEffectTrayAction(param1:EffectTrayEvent) : void
      {
         var _loc2_:EffectAsset = param1.effectAsset;
         switch(param1.subType)
         {
            case EffectTrayEvent.DELETE_EFFECT:
               this._scene.deleteEffect(_loc2_);
               dispatchEvent(new Event(Event.REMOVED));
               break;
            case EffectTrayEvent.TIMING_PRESS:
               break;
            case EffectTrayEvent.TIMING_RELEASE:
         }
      }
      
      protected function onRendererAdd(param1:RendererExistenceEvent) : void
      {
         param1.renderer.addEventListener(EffectTrayEvent.EFFECT_TRAY_ACTION,this.onEffectTrayAction);
      }
      
      protected function onRendererRemove(param1:RendererExistenceEvent) : void
      {
         param1.renderer.removeEventListener(EffectTrayEvent.EFFECT_TRAY_ACTION,this.onEffectTrayAction);
      }
      
      protected function init() : void
      {
         this._console = Console.getConsole();
         this._effectSource = new ArrayCollection();
         this.assetList.dataProvider = this._effectSource;
      }
      
      public function get length() : Number
      {
         if(this._effectSource)
         {
            return this._effectSource.length;
         }
         return -1;
      }
      
      private function onDragDrop(param1:DragEvent) : void
      {
         var _loc2_:int = this.assetList.dataProvider.getItemIndex(List(param1.dragInitiator).selectedItem);
         this.updateEffectIndex(List(param1.dragInitiator).selectedItem,_loc2_);
      }
      
      private function _EffectTray_EffectList1_i() : EffectList
      {
         var _loc1_:EffectList = new EffectList();
         _loc1_.percentWidth = 100;
         _loc1_.itemRenderer = this._EffectTray_ClassFactory1_c();
         _loc1_.setStyle("skinClass",EffectListSkin);
         _loc1_.setStyle("horizontalScrollPolicy","off");
         _loc1_.addEventListener("dragComplete",this.__assetList_dragComplete);
         _loc1_.addEventListener("rendererAdd",this.__assetList_rendererAdd);
         _loc1_.addEventListener("rendererRemove",this.__assetList_rendererRemove);
         _loc1_.id = "assetList";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.assetList = _loc1_;
         BindingManager.executeBindings(this,"assetList",this.assetList);
         return _loc1_;
      }
      
      private function _EffectTray_ClassFactory1_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = EffectControlsItemRenderer;
         return _loc1_;
      }
      
      public function __assetList_dragComplete(param1:DragEvent) : void
      {
         this.onDragDrop(param1);
      }
      
      public function __assetList_rendererAdd(param1:RendererExistenceEvent) : void
      {
         this.onRendererAdd(param1);
      }
      
      public function __assetList_rendererRemove(param1:RendererExistenceEvent) : void
      {
         this.onRendererRemove(param1);
      }
      
      public function ___EffectTray_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      [Bindable(event="propertyChange")]
      public function get assetList() : EffectList
      {
         return this._1315051438assetList;
      }
      
      public function set assetList(param1:EffectList) : void
      {
         var _loc2_:Object = this._1315051438assetList;
         if(_loc2_ !== param1)
         {
            this._1315051438assetList = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"assetList",_loc2_,param1));
            }
         }
      }
   }
}
