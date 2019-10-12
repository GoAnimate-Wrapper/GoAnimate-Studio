package com.jumpeye.flashEff2.buttonEffect
{
   import com.jumpeye.transitions.plugins.ColorMatrixFilterPlugin;
   import com.jumpeye.transitions.plugins.TweenPlugin;
   import flash.display.Sprite;
   
   public class FEBColorMatrixFilterPlugin extends Sprite
   {
       
      
      public function FEBColorMatrixFilterPlugin()
      {
         super();
         TweenPlugin.activate([ColorMatrixFilterPlugin]);
      }
   }
}
