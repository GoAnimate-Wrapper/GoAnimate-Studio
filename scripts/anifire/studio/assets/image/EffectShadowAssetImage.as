package anifire.studio.assets.image
{
   import anifire.constant.AnimeConstants;
   import anifire.effect.AnimeEffect;
   import anifire.effect.ProgramEffect;
   import anifire.effect.SuperEffect;
   import anifire.effect.ZoomEffect;
   import anifire.studio.core.Asset;
   import anifire.studio.core.EffectThumb;
   import anifire.studio.core.Thumb;
   import anifire.studio.interfaces.IResizable;
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   
   public class EffectShadowAssetImage extends AssetImageBase implements IResizable
   {
       
      
      private var _effect:SuperEffect;
      
      public function EffectShadowAssetImage()
      {
         super();
      }
      
      override public function set asset(param1:Asset) : void
      {
         var _loc2_:Thumb = null;
         super.asset = param1;
         if(param1)
         {
            _loc2_ = param1.thumb;
            if(_loc2_)
            {
               this._effect = (_loc2_ as EffectThumb).getNewEffect();
               ZoomEffect(this._effect).isShadow = true;
               this._effect.loadEffectImage(_loc2_.imageData as ByteArray);
               super.rect.x = this._effect.x;
               super.rect.y = this._effect.y;
               super.rect.width = this._effect.width;
               super.rect.height = this._effect.height;
               if(this._effect is AnimeEffect)
               {
                  this._effect.scrollRect = new Rectangle(0,AnimeConstants.screenY,AnimeConstants.SCREEN_WIDTH,AnimeConstants.screenHeight);
                  this._effect.x = AnimeConstants.SCREEN_X;
                  this._effect.y = AnimeConstants.screenY;
               }
               else if(this._effect is ProgramEffect)
               {
                  if(!(this._effect is ZoomEffect))
                  {
                     this._effect.scrollRect = new Rectangle(0,AnimeConstants.screenY,AnimeConstants.SCREEN_WIDTH,AnimeConstants.screenHeight);
                     this._effect.x = AnimeConstants.SCREEN_X;
                     this._effect.y = AnimeConstants.screenY;
                  }
               }
               this.addChild(this._effect);
               this.dispatchImageReady();
            }
         }
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         if(this._effect)
         {
            this._effect.width = param1;
         }
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
         if(this._effect)
         {
            this._effect.height = param1;
         }
      }
      
      public function resize(param1:Number, param2:Number, param3:Boolean = false) : void
      {
         if(param1 != this.width || param2 != this.height)
         {
            this.width = param1;
            this.height = param2;
         }
      }
      
      public function showEffect(param1:DisplayObject) : void
      {
         if(param1 && this._effect is ProgramEffect)
         {
            this._effect.showEffect(param1);
         }
      }
      
      override public function destroy(param1:String = "rip") : void
      {
         super.destroy(param1);
         this._effect = null;
      }
   }
}
