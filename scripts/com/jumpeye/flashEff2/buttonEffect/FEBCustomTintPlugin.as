package com.jumpeye.flashEff2.buttonEffect
{
   import com.jumpeye.transitions.plugins.CustomTintPlugin;
   import com.jumpeye.transitions.plugins.TweenPlugin;
   import flash.display.Sprite;
   
   public class FEBCustomTintPlugin extends Sprite
   {
       
      
      public function FEBCustomTintPlugin()
      {
         super();
         TweenPlugin.activate([CustomTintPlugin]);
      }
   }
}
