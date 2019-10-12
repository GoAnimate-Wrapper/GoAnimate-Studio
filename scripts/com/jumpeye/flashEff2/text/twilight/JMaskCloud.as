package com.jumpeye.flashEff2.text.twilight
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public dynamic class JMaskCloud extends Sprite
   {
       
      
      protected var _amount:Number = 0;
      
      private var bitmapData:BitmapData;
      
      private var perlinBitmapData:BitmapData;
      
      public function JMaskCloud(param1:Number, param2:Number)
      {
         super();
         this.bitmapData = new BitmapData(param1,param2,true,13421772);
         this.perlinBitmapData = new BitmapData(param1,param2,false,13421772);
         var _loc3_:Bitmap = new Bitmap(this.bitmapData);
         this.perlinBitmapData.perlinNoise(param1 / 7,param2 / 7,10,Math.floor(Math.random() * 10),false,true,1,true,null);
         this.addChild(_loc3_);
      }
      
      public function set amount(param1:Number) : void
      {
         this._amount = param1;
         this.distort();
      }
      
      public function destroy() : void
      {
         if(this.bitmapData != null)
         {
            this.bitmapData.dispose();
            this.bitmapData = null;
         }
         if(this.perlinBitmapData != null)
         {
            this.perlinBitmapData.dispose();
            this.perlinBitmapData = null;
         }
         if(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
      }
      
      public function get amount() : Number
      {
         return this._amount;
      }
      
      public function distort() : void
      {
         this.bitmapData.threshold(this.perlinBitmapData,new Rectangle(0,0,this.bitmapData.width,this.bitmapData.height),new Point(0,0),">=",this._amount / 100 * 16777215,16777215,16777215,true);
      }
   }
}
