package anifire.studio.assets.views
{
   import anifire.studio.assets.image.AssetImageLibrary;
   import anifire.studio.core.Asset;
   import anifire.studio.core.Background;
   import anifire.studio.core.BubbleAsset;
   import anifire.studio.core.Character;
   import anifire.studio.core.EffectAsset;
   import anifire.studio.core.EffectThumb;
   import anifire.studio.core.FlowFrame;
   import anifire.studio.core.Prop;
   import anifire.studio.core.Widget;
   import anifire.studio.interfaces.IAssetView;
   
   public class AssetViewFactory
   {
      
      private static var _instance:AssetViewFactory;
       
      
      public function AssetViewFactory()
      {
         super();
      }
      
      public static function get instance() : AssetViewFactory
      {
         if(!_instance)
         {
            _instance = new AssetViewFactory();
         }
         return _instance;
      }
      
      public function createAssetView(param1:Asset, param2:AssetImageLibrary = null) : IAssetView
      {
         var _loc3_:IAssetView = null;
         if(!param1)
         {
            return null;
         }
         if(param1 is Character)
         {
            _loc3_ = new CharacterAssetView(param1,param2);
         }
         else if(param1 is Widget)
         {
            _loc3_ = new WidgetAssetView(param1,param2);
         }
         else if(param1 is FlowFrame)
         {
            _loc3_ = new FlowFrameView(param1,param2);
         }
         else if(param1 is Prop)
         {
            _loc3_ = new PropAssetView(param1,param2);
         }
         else if(param1 is Background)
         {
            _loc3_ = new BgAssetView(param1,param2);
         }
         else if(param1 is BubbleAsset)
         {
            _loc3_ = new BubbleAssetView(param1,param2);
         }
         else if(param1 is EffectAsset)
         {
            if(EffectAsset(param1).getExactType() == EffectThumb.TYPE_ZOOM)
            {
               _loc3_ = new ZoomEffectAssetView(param1,param2);
            }
         }
         if(_loc3_ is AssetView)
         {
            if(param1 is FlowFrame)
            {
               _loc3_ = new FlowFrameEditor(_loc3_ as AssetView);
            }
            else
            {
               _loc3_ = new AssetEditor(_loc3_ as AssetView);
            }
         }
         return _loc3_;
      }
   }
}
