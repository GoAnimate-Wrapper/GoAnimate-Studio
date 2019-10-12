package anifire.effect
{
   import anifire.constant.AnimeConstants;
   import caurina.transitions.Tweener;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.utils.setTimeout;
   
   public class FadingEffect extends ProgramEffect
   {
       
      
      private var _isIn:Boolean = false;
      
      private var _isOut:Boolean = false;
      
      private var _myThumbnailSymbol_in:Class;
      
      private var _myThumbnailSymbol_out:Class;
      
      private var _black:Sprite;
      
      public function FadingEffect(param1:String = "")
      {
         this._myThumbnailSymbol_in = FadingEffect__myThumbnailSymbol_in;
         this._myThumbnailSymbol_out = FadingEffect__myThumbnailSymbol_out;
         super();
         type = EffectMgr.TYPE_FADING;
         if(param1 == EffectMgr.TYPE_FADING_IN)
         {
            this._isIn = true;
         }
         else if(param1 == EffectMgr.TYPE_FADING_OUT)
         {
            this._isOut = true;
         }
         if(this._isIn)
         {
            thumbnailSymbol = this._myThumbnailSymbol_in;
         }
         else if(this._isOut)
         {
            thumbnailSymbol = this._myThumbnailSymbol_out;
         }
         this.redraw();
      }
      
      override public function serialize() : XML
      {
         var _loc1_:XML = <effect x="{x}" y="{y}" w="{width}" h="{height}" rotate='0' id="{id}" type="{type}" isIn="{this._isIn.toString()}" isOut="{this._isOut.toString()}">
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
      
      override public function redraw() : void
      {
         this.drawBody();
      }
      
      override public function showEffect(param1:DisplayObject) : void
      {
         this._black = new Sprite();
         this._black.visible = true;
         var _loc2_:Number = 0;
         if(this._isIn)
         {
            _loc2_ = 1;
         }
         this._black.graphics.beginFill(0,1);
         this._black.graphics.drawRect(0,0,AnimeConstants.SCREEN_WIDTH,AnimeConstants.SCREEN_HEIGHT);
         this._black.graphics.endFill();
         this._black.alpha = _loc2_;
         content.addChild(this._black) as Sprite;
         if(this._isIn)
         {
            Tweener.addTween(this._black,{
               "alpha":0,
               "time":2
            });
         }
         else
         {
            Tweener.addTween(this._black,{
               "alpha":1,
               "time":2
            });
         }
         setTimeout(this.hideEffect,2200,null);
      }
      
      override public function hideEffect(param1:DisplayObject) : void
      {
         this._black.visible = false;
      }
   }
}
