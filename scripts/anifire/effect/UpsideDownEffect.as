package anifire.effect
{
   import anifire.constant.AnimeConstants;
   import caurina.transitions.Tweener;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class UpsideDownEffect extends ProgramEffect
   {
       
      
      private const RGB:Number = 13421772;
      
      private const ALPHA:Number = 0.6;
      
      private const LINESIZE:Number = 5;
      
      private var _myThumbnailSymbol:Class;
      
      public function UpsideDownEffect()
      {
         this._myThumbnailSymbol = UpsideDownEffect__myThumbnailSymbol;
         super();
         type = EffectMgr.TYPE_UPSIDEDOWN;
         thumbnailSymbol = this._myThumbnailSymbol;
         this.redraw();
      }
      
      override public function serialize() : XML
      {
         var _loc1_:XML = <effect x="{x}" y="{y}" w="{width}" h="{height}" rotate='0' id="{id}" type="{type}">
                                             </effect>;
         return _loc1_;
      }
      
      override protected function drawBody() : void
      {
         if(super.body != null)
         {
            content.removeChild(super.body);
         }
         var _loc1_:Sprite = new Sprite();
         _loc1_.name = "body";
         super.body = content.addChild(_loc1_) as Sprite;
      }
      
      override protected function drawLabel() : void
      {
      }
      
      override public function redraw() : void
      {
         this.drawBody();
         this.drawLabel();
      }
      
      override public function showEffect(param1:DisplayObject) : void
      {
         var _loc2_:Number = 2;
         var _loc3_:Number = 2;
         param1.y = AnimeConstants.SCREEN_X + AnimeConstants.SCREEN_HEIGHT;
         param1.scaleY = -1;
         Tweener.addTween(param1,{
            "y":0,
            "scaleY":1,
            "time":0.1,
            "delay":_loc3_,
            "transition":"linear"
         });
      }
   }
}
