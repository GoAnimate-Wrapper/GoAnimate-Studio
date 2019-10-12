package anifire.cc.view
{
   import anifire.cc.interfaces.ICcPairComponent;
   import anifire.constant.CcLibConstant;
   import anifire.util.UtilErrorLogger;
   import flash.display.DisplayObjectContainer;
   import flash.display.LoaderInfo;
   
   public class CcPairComponent extends CcComponent
   {
       
      
      private var _leftSide:DisplayObjectContainer;
      
      private var _rightSide:DisplayObjectContainer;
      
      public function CcPairComponent()
      {
         super();
      }
      
      public function get leftSide() : DisplayObjectContainer
      {
         return this._leftSide;
      }
      
      public function get rightSide() : DisplayObjectContainer
      {
         return this._rightSide;
      }
      
      override protected function addLoader() : void
      {
         if(this.model is ICcPairComponent)
         {
            if(ICcPairComponent(model).split)
            {
               this._leftSide = this.addDefinition(loader.contentLoaderInfo,this.name + CcLibConstant.LIB_LEFT);
               this._rightSide = this.addDefinition(loader.contentLoaderInfo,this.name + CcLibConstant.LIB_RIGHT);
            }
            else
            {
               this._leftSide = this._rightSide = this.addDefinition(loader.contentLoaderInfo,this.name);
            }
         }
         if(this._leftSide && this._rightSide)
         {
            this.addChild(this._leftSide);
            this.addChild(this._rightSide);
         }
      }
      
      override protected function setProperties() : void
      {
         var _loc1_:int = 0;
         if(this.model)
         {
            if(this.model is ICcPairComponent)
            {
               if(!ICcPairComponent(model).split)
               {
                  if(!CcLibConstant.ALLOW_SHOW_DETAIL_FOR_PAIR(this.model.themeId))
                  {
                     if(this.model.themeId)
                     {
                        return;
                     }
                  }
               }
            }
            if(this._leftSide)
            {
               this._leftSide.x = this.model.x;
               this._leftSide.y = this.model.y;
               _loc1_ = 0;
               while(_loc1_ < this._leftSide.numChildren)
               {
                  this._leftSide.getChildAt(_loc1_).scaleX = this.model.xscale;
                  this._leftSide.getChildAt(_loc1_).scaleY = this.model.yscale;
                  this._leftSide.getChildAt(_loc1_).rotation = -this.model.rotation;
                  _loc1_++;
               }
            }
            if(this._rightSide)
            {
               this._rightSide.x = this.model.x;
               this._rightSide.y = this.model.y;
               _loc1_ = 0;
               while(_loc1_ < this._rightSide.numChildren)
               {
                  this._rightSide.getChildAt(_loc1_).scaleX = this.model.xscale;
                  this._rightSide.getChildAt(_loc1_).scaleY = this.model.yscale;
                  this._rightSide.getChildAt(_loc1_).rotation = this.model.rotation;
                  _loc1_++;
               }
            }
            if(this.model is ICcPairComponent)
            {
               if(this._leftSide)
               {
                  this._leftSide.x = this._leftSide.x + ICcPairComponent(model).offset / 2;
               }
               if(this._rightSide)
               {
                  this._rightSide.x = this._rightSide.x - ICcPairComponent(model).offset / 2;
               }
            }
         }
      }
      
      protected function addDefinition(param1:LoaderInfo, param2:String) : DisplayObjectContainer
      {
         var definition:Class = null;
         var mc:DisplayObjectContainer = null;
         var loaderinfo:LoaderInfo = param1;
         var className:String = param2;
         try
         {
            definition = loaderinfo.applicationDomain.getDefinition(className) as Class;
            if(definition)
            {
               mc = new definition();
               mc.name = className;
               return mc;
            }
         }
         catch(e:ReferenceError)
         {
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("CcPairComponent:addDefinition",e);
         }
         return null;
      }
   }
}
