package anifire.cc.view
{
   import anifire.cc.interfaces.ICcPairComponent;
   import anifire.constant.CcLibConstant;
   import flash.display.DisplayObjectContainer;
   
   public class CcEyeComponent extends CcPairComponent
   {
       
      
      private var _leftSide:DisplayObjectContainer;
      
      private var _rightSide:DisplayObjectContainer;
      
      private var _lookAtCamera:Boolean = false;
      
      private var _supportLookAtCamera:Boolean = false;
      
      public function CcEyeComponent()
      {
         super();
      }
      
      override public function get leftSide() : DisplayObjectContainer
      {
         if(this._lookAtCamera && this._leftSide)
         {
            return this._leftSide;
         }
         return super.leftSide;
      }
      
      override public function get rightSide() : DisplayObjectContainer
      {
         if(this._lookAtCamera && this._rightSide)
         {
            return this._rightSide;
         }
         return super.rightSide;
      }
      
      public function get supportLookAtCamera() : Boolean
      {
         return this._supportLookAtCamera;
      }
      
      public function get lookAtCamera() : Boolean
      {
         return this._lookAtCamera;
      }
      
      public function set lookAtCamera(param1:Boolean) : void
      {
         if(this._lookAtCamera != param1)
         {
            this._lookAtCamera = param1;
         }
      }
      
      override protected function addLoader() : void
      {
         super.addLoader();
         if(this.model is ICcPairComponent)
         {
            if(ICcPairComponent(model).split)
            {
               this._leftSide = addDefinition(loader.contentLoaderInfo,this.name + CcLibConstant.LIB_LEFT + "_Cam");
               this._rightSide = addDefinition(loader.contentLoaderInfo,this.name + CcLibConstant.LIB_RIGHT + "_Cam");
            }
            else
            {
               this._leftSide = this._rightSide = addDefinition(loader.contentLoaderInfo,this.name + "_Cam");
            }
            this._supportLookAtCamera = this._leftSide != null;
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
         super.setProperties();
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
   }
}
