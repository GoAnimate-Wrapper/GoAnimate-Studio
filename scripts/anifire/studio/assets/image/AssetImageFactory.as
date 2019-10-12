package anifire.studio.assets.image
{
   import anifire.studio.core.Asset;
   import anifire.studio.core.Background;
   import anifire.studio.core.BubbleAsset;
   import anifire.studio.core.Character;
   import anifire.studio.core.EffectAsset;
   import anifire.studio.core.FlowFrame;
   import anifire.studio.core.ProgramEffectAsset;
   import anifire.studio.core.Prop;
   import anifire.studio.core.VideoProp;
   import anifire.studio.core.Widget;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class AssetImageFactory extends EventDispatcher implements IAssetImageProvider
   {
      
      private static var _instance:AssetImageFactory = new AssetImageFactory();
       
      
      public function AssetImageFactory(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public static function get instance() : AssetImageFactory
      {
         return _instance;
      }
      
      public function getImage(param1:Asset) : AssetImageBase
      {
         return this.createImage(param1);
      }
      
      private function createImage(param1:Asset) : AssetImageBase
      {
         var _loc2_:AssetImageBase = this.makeImage(param1);
         _loc2_ = this.assemblyImage(_loc2_);
         return _loc2_;
      }
      
      private function assemblyImage(param1:AssetImageBase) : AssetImageBase
      {
         return param1;
      }
      
      protected function makeImage(param1:Asset) : AssetImageBase
      {
         var _loc2_:AssetImageBase = null;
         if(!param1)
         {
            return null;
         }
         if(param1 is Background)
         {
            _loc2_ = new BgAssetImage();
         }
         else if(param1 is Widget)
         {
            _loc2_ = new WidgetAssetImage();
         }
         else if(param1 is FlowFrame)
         {
            _loc2_ = new FlowFrameImage();
         }
         else if(param1 is VideoProp)
         {
            _loc2_ = new VideoAssetImage();
         }
         else if(param1 is Prop)
         {
            _loc2_ = new PropAssetImage();
         }
         else if(param1 is Character)
         {
            _loc2_ = new CharacterAssetImage();
         }
         else if(param1 is BubbleAsset)
         {
            _loc2_ = new BubbleAssetImage();
         }
         else if(param1 is EffectAsset)
         {
            if(param1 is ProgramEffectAsset && ProgramEffectAsset(param1).isShadow)
            {
               _loc2_ = new EffectShadowAssetImage();
            }
            else
            {
               _loc2_ = new EffectAssetImage();
            }
         }
         return _loc2_;
      }
   }
}
