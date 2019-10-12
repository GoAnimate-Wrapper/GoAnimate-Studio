package anifire.studio.managers
{
   import anifire.studio.core.BackgroundThumb;
   import anifire.studio.core.FlowFrameThumb;
   import anifire.studio.core.Theme;
   import anifire.studio.core.Thumb;
   import anifire.studio.core.WidgetThumb;
   import anifire.studio.models.SwapBackdropExplorerCollection;
   import anifire.studio.models.SwapFlowFrameExplorerCollection;
   import anifire.studio.models.SwapPropExplorerCollection;
   import anifire.studio.models.SwapWidgetExplorerCollection;
   import anifire.studio.models.ThumbModel;
   
   public class AssetManager
   {
      
      private static var __instance:AssetManager;
       
      
      private var _backdropSourceLookup:Object;
      
      private var _propSourceLookup:Object;
      
      private var _widgetSourceLookup:Object;
      
      private var _flowFrameSourceLookup:Object;
      
      public function AssetManager()
      {
         super();
         this.init();
      }
      
      public static function get instance() : AssetManager
      {
         if(!__instance)
         {
            __instance = new AssetManager();
         }
         return __instance;
      }
      
      private function init() : void
      {
         this._propSourceLookup = {};
         this._widgetSourceLookup = {};
         this._flowFrameSourceLookup = {};
         this._backdropSourceLookup = {};
      }
      
      public function getBackdropCollection(param1:Theme) : SwapBackdropExplorerCollection
      {
         var _loc3_:ThumbModel = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:BackgroundThumb = null;
         var _loc7_:ThumbModel = null;
         var _loc2_:SwapBackdropExplorerCollection = this._backdropSourceLookup[param1.id];
         if(!_loc2_)
         {
            _loc2_ = new SwapBackdropExplorerCollection();
            _loc3_ = new ThumbModel(null);
            _loc3_.isPlaceHolder = true;
            _loc2_.addProduct(_loc3_);
            _loc4_ = param1.backgroundThumbs.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc6_ = param1.backgroundThumbs.getValueByIndex(_loc5_) as BackgroundThumb;
               if(_loc6_.enable && !_loc6_.isComposite && !_loc6_.isStarter)
               {
                  _loc7_ = new ThumbModel(_loc6_,_loc6_.firstColorSetId);
                  _loc2_.addProduct(_loc7_);
               }
               _loc5_++;
            }
            _loc2_.sortByCategoryName();
            this._backdropSourceLookup[param1.id] = _loc2_;
         }
         return _loc2_;
      }
      
      public function getPropCollection(param1:Theme) : SwapPropExplorerCollection
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Thumb = null;
         var _loc6_:ThumbModel = null;
         var _loc2_:SwapPropExplorerCollection = this._propSourceLookup[param1.id];
         if(!_loc2_)
         {
            _loc2_ = new SwapPropExplorerCollection();
            _loc3_ = param1.propThumbs.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = param1.propThumbs.getValueByIndex(_loc4_) as Thumb;
               if(_loc5_.enable && !(_loc5_ is WidgetThumb) && !(_loc5_ is FlowFrameThumb))
               {
                  _loc6_ = new ThumbModel(_loc5_,_loc5_.firstColorSetId);
                  _loc2_.addProduct(_loc6_);
               }
               _loc4_++;
            }
            _loc2_.sortByCategoryName();
            this._propSourceLookup[param1.id] = _loc2_;
         }
         return _loc2_;
      }
      
      public function getWidgetCollection(param1:Theme) : SwapWidgetExplorerCollection
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Thumb = null;
         var _loc6_:ThumbModel = null;
         var _loc2_:SwapWidgetExplorerCollection = this._widgetSourceLookup[param1.id];
         if(!_loc2_)
         {
            _loc2_ = new SwapWidgetExplorerCollection();
            _loc3_ = param1.propThumbs.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = param1.propThumbs.getValueByIndex(_loc4_) as Thumb;
               if(_loc5_.enable && _loc5_ is WidgetThumb)
               {
                  _loc6_ = new ThumbModel(_loc5_,_loc5_.firstColorSetId);
                  _loc2_.addProduct(_loc6_);
               }
               _loc4_++;
            }
            this._widgetSourceLookup[param1.id] = _loc2_;
         }
         return _loc2_;
      }
      
      public function getFlowFrameCollection(param1:Theme) : SwapFlowFrameExplorerCollection
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Thumb = null;
         var _loc6_:ThumbModel = null;
         var _loc2_:SwapFlowFrameExplorerCollection = this._flowFrameSourceLookup[param1.id];
         if(!_loc2_)
         {
            _loc2_ = new SwapFlowFrameExplorerCollection();
            _loc3_ = param1.propThumbs.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = param1.propThumbs.getValueByIndex(_loc4_) as Thumb;
               if(_loc5_.enable && _loc5_ is FlowFrameThumb)
               {
                  _loc6_ = new ThumbModel(_loc5_);
                  _loc2_.addProduct(_loc6_);
               }
               _loc4_++;
            }
            this._flowFrameSourceLookup[param1.id] = _loc2_;
         }
         return _loc2_;
      }
   }
}
