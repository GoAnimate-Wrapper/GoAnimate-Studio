package com.jumpeye.flashEff2.buttonEffect
{
   import com.jumpeye.transitions.plugins.BevelFilterPlugin;
   import com.jumpeye.transitions.plugins.BlurFilterPlugin;
   import com.jumpeye.transitions.plugins.DropShadowFilterPlugin;
   import com.jumpeye.transitions.plugins.GlowFilterPlugin;
   import com.jumpeye.transitions.plugins.TweenPlugin;
   import flash.display.Sprite;
   
   public class FEBFilterPlugins extends Sprite
   {
       
      
      public function FEBFilterPlugins()
      {
         super();
         TweenPlugin.activate([BlurFilterPlugin,BevelFilterPlugin,GlowFilterPlugin,DropShadowFilterPlugin]);
      }
   }
}
