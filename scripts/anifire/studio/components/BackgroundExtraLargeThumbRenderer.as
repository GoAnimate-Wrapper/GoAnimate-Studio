package anifire.studio.components
{
   import mx.core.IFlexModuleFactory;
   
   public class BackgroundExtraLargeThumbRenderer extends BackgroundThumbRenderer
   {
       
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function BackgroundExtraLargeThumbRenderer()
      {
         super();
         mx_internal::_document = this;
         this.width = 278;
         this.height = 157;
         this.wideMode = true;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
   }
}
