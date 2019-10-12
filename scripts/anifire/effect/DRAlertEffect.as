package anifire.effect
{
   import com.gskinner.geom.ColorMatrix;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.ColorTransform;
   import flash.utils.Timer;
   
   public class DRAlertEffect extends ProgramEffect
   {
       
      
      private const RGB:Number = 13421772;
      
      private const ALPHA:Number = 0.6;
      
      private const LINESIZE:Number = 5;
      
      private var _myThumbnailSymbol:Class;
      
      public function DRAlertEffect()
      {
         this._myThumbnailSymbol = DRAlertEffect__myThumbnailSymbol;
         super();
         type = EffectMgr.TYPE_DRALERT;
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
         var displayObject:DisplayObject = param1;
         var colorTransform:ColorTransform = new ColorTransform();
         colorTransform.redMultiplier = 1;
         colorTransform.greenMultiplier = -1;
         colorTransform.blueMultiplier = -1;
         displayObject.transform.colorTransform = colorTransform;
         var cm:ColorMatrix = new ColorMatrix();
         cm.adjustColor(-50,50,-100,0);
         displayObject.filters = [new ColorMatrixFilter(cm)];
         var timer:Timer = new Timer(1000,1);
         timer.addEventListener(TimerEvent.TIMER,function():void
         {
            hideEffect(displayObject);
         });
         timer.start();
      }
      
      override public function hideEffect(param1:DisplayObject) : void
      {
         var _loc2_:ColorTransform = new ColorTransform();
         _loc2_.redMultiplier = 1;
         _loc2_.greenMultiplier = 1;
         _loc2_.blueMultiplier = 1;
         param1.transform.colorTransform = _loc2_;
         var _loc3_:ColorMatrix = new ColorMatrix();
         _loc3_.adjustColor(0,0,0,0);
         param1.filters = [new ColorMatrixFilter(_loc3_)];
      }
   }
}
