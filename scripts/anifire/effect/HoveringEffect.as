package anifire.effect
{
   import caurina.transitions.Tweener;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class HoveringEffect extends ProgramEffect
   {
       
      
      private const RGB:Number = 13421772;
      
      private const ALPHA:Number = 0.6;
      
      private const LINESIZE:Number = 5;
      
      private var _myThumbnailSymbol:Class;
      
      public function HoveringEffect()
      {
         this._myThumbnailSymbol = HoveringEffect__myThumbnailSymbol;
         super();
         type = EffectMgr.TYPE_HOVERING;
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
         var _loc2_:Number = 8;
         var _loc3_:Number = 3;
         var _loc4_:Number = 5;
         var _loc5_:Number = 1;
         while(_loc5_ <= _loc4_)
         {
            Tweener.addTween(param1,{
               "x":0,
               "y":Math.random() * _loc2_ * (_loc5_ % 2 == 0?1:-1),
               "time":_loc3_ / _loc4_,
               "delay":_loc3_ * _loc5_ / _loc4_,
               "transition":"easeInOutQuint"
            });
            _loc5_++;
         }
         Tweener.addTween(param1,{
            "x":0,
            "y":0,
            "time":0,
            "delay":_loc3_ * _loc5_ / _loc4_,
            "transition":"easeInExpo"
         });
      }
   }
}
