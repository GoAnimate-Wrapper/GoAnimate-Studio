package anifire.studio.interfaces
{
   import anifire.interfaces.IPlayable;
   import anifire.interfaces.IRegulatedProcess;
   import anifire.studio.assets.image.AssetImageBase;
   import anifire.studio.core.Asset;
   import flash.events.IEventDispatcher;
   
   public interface IAssetView extends IDestroyable, IEventDispatcher, IPlayable, IRegulatedProcess
   {
       
      
      function get asset() : Asset;
      
      function get assetImage() : AssetImageBase;
      
      function loadImage() : void;
   }
}
