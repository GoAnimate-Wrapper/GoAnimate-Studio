package anifire.effect
{
   import anifire.constant.AnimeConstants;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class FireSpringEffect extends ProgramEffect
   {
       
      
      private var _myThumbnailSymbol:Class;
      
      public function FireSpringEffect()
      {
         this._myThumbnailSymbol = FireSpringEffect__myThumbnailSymbol;
         super();
         type = EffectMgr.TYPE_FIRESPRING;
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
         var _loc4_:Number = NaN;
         var _loc5_:Point = null;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:FireSpring = null;
         if(content.numChildren > 1)
         {
            _loc4_ = content.numChildren - 1;
            while(_loc4_ >= 1)
            {
               if(content.getChildAt(_loc4_) != null)
               {
                  content.removeChildAt(_loc4_);
               }
               _loc4_--;
            }
         }
         var _loc2_:Number = int(Math.random() * 2) + 4;
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_)
         {
            _loc5_ = new Point((_loc3_ + 1) * (AnimeConstants.SCREEN_WIDTH / (_loc2_ + 1)),AnimeConstants.SCREEN_HEIGHT);
            _loc6_ = int(Math.random() * 2) + 5;
            _loc7_ = int(Math.random() * 3);
            _loc8_ = 0;
            while(_loc8_ < _loc6_)
            {
               _loc9_ = new FireSpring();
               _loc9_.init(_loc5_,_loc7_);
               _loc9_.show(Math.random() * 500 + _loc8_ * 100);
               content.addChild(_loc9_) as Sprite;
               _loc8_++;
            }
            _loc3_++;
         }
      }
   }
}
