package anifire.studio.utils
{
   import anifire.geom.AlignmentTool;
   import anifire.interfaces.IIterator;
   import anifire.studio.assets.views.AssetViewCollection;
   import anifire.studio.components.SceneEditor;
   import anifire.studio.core.AnimeScene;
   import anifire.studio.core.Asset;
   import anifire.studio.core.ProgramEffectAsset;
   import anifire.studio.interfaces.IAssetView;
   import anifire.util.UtilMath;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AssetSnapTool
   {
       
      
      private var _alignTool:AlignmentTool;
      
      private var _snapObjectsEnabled:Boolean = true;
      
      private var _snapCameraEnabled:Boolean = true;
      
      private var _snapOldPositionEnabled:Boolean = true;
      
      private var _snapEnabled:Boolean = true;
      
      private var _selectedRect:Rectangle;
      
      private var _sceneEditor:SceneEditor;
      
      public function AssetSnapTool()
      {
         this._alignTool = new AlignmentTool();
         super();
      }
      
      public function get snapCameraEnabled() : Boolean
      {
         return this._snapCameraEnabled;
      }
      
      public function get snapObjectsEnabled() : Boolean
      {
         return this._snapObjectsEnabled;
      }
      
      public function toggleSnapMode(param1:String = "all") : void
      {
         if(param1 == "snapObjects")
         {
            this._snapObjectsEnabled = !this._snapObjectsEnabled;
            this._snapOldPositionEnabled = !this._snapOldPositionEnabled;
         }
         else if(param1 == "snapCamera")
         {
            this._snapCameraEnabled = !this._snapCameraEnabled;
         }
         else
         {
            this._snapObjectsEnabled = !this._snapObjectsEnabled;
            this._snapCameraEnabled = !this._snapCameraEnabled;
            this._snapOldPositionEnabled = !this._snapOldPositionEnabled;
         }
      }
      
      public function updateReference(param1:SceneEditor) : void
      {
         var _loc2_:Rectangle = null;
         var _loc4_:Asset = null;
         var _loc5_:IIterator = null;
         var _loc6_:DisplayObject = null;
         this._alignTool.reset();
         this._sceneEditor = param1;
         var _loc3_:AssetViewCollection = this._sceneEditor.selection;
         if(this._snapCameraEnabled)
         {
            if(this._sceneEditor.sceneModel is AnimeScene)
            {
               _loc4_ = AnimeScene(this._sceneEditor.sceneModel).camera;
               if(_loc4_)
               {
                  _loc2_ = new Rectangle(_loc4_.x,_loc4_.y,_loc4_.width,_loc4_.height);
                  this._alignTool.addRectangle(new Rectangle(_loc4_.x,_loc4_.y,_loc4_.width,_loc4_.height),"camera");
                  this._alignTool.addCenter(new Point(_loc2_.x + _loc2_.width / 3,_loc2_.y + _loc2_.height / 3),_loc2_,"ruleOfThirds");
                  this._alignTool.addCenter(new Point(_loc2_.x + 2 * _loc2_.width / 3,_loc2_.y + _loc2_.height / 3),_loc2_,"ruleOfThirds");
                  this._alignTool.addCenter(new Point(_loc2_.x + _loc2_.width / 3,_loc2_.y + 2 * _loc2_.height / 3),_loc2_,"ruleOfThirds");
                  this._alignTool.addCenter(new Point(_loc2_.x + 2 * _loc2_.width / 3,_loc2_.y + 2 * _loc2_.height / 3),_loc2_,"ruleOfThirds");
               }
            }
         }
         if(this._snapObjectsEnabled)
         {
            _loc5_ = this._sceneEditor.view.view.iterator("asset");
            if(_loc5_)
            {
               while(_loc5_.hasNext)
               {
                  _loc6_ = _loc5_.next as DisplayObject;
                  if(_loc6_ && !_loc3_.isInCollection(_loc6_ as IAssetView))
                  {
                     _loc2_ = _loc6_.getBounds(_loc6_);
                     this._alignTool.addRectangle(_loc2_);
                  }
               }
            }
         }
         this._selectedRect = _loc3_.getBounds(this._sceneEditor.view.view);
         if(this._snapOldPositionEnabled)
         {
            _loc2_ = this._selectedRect.clone();
            this._alignTool.addCenter(UtilMath.getCenter(_loc2_),_loc2_,"oldPosition");
         }
         this._snapEnabled = true;
         if(_loc3_.selectedAsset && _loc3_.selectedAsset.asset is ProgramEffectAsset && ProgramEffectAsset(_loc3_.selectedAsset.asset).isCamera)
         {
            this._snapEnabled = false;
         }
      }
      
      public function snapPoint(param1:Point) : void
      {
         if(!this._snapEnabled)
         {
            return;
         }
         var _loc2_:Rectangle = this._selectedRect;
         _loc2_.x = param1.x;
         _loc2_.y = param1.y;
         _loc2_.offset(-_loc2_.width / 2,-_loc2_.height / 2);
         var _loc3_:Point = this.snapRect(_loc2_);
         param1.offset(_loc3_.x,_loc3_.y);
      }
      
      public function snapRect(param1:Rectangle) : Point
      {
         if(!this._snapEnabled)
         {
            return new Point();
         }
         var _loc2_:Point = this._alignTool.getSnappedDisplacement(param1);
         param1.offset(_loc2_.x,_loc2_.y);
         this._sceneEditor.guideLayer.redrawAlignGuide(this._alignTool,this._alignTool.rects,param1);
         this._sceneEditor.guideLayer.redrawSpacingGuide(this._alignTool);
         this._sceneEditor.guideVisble = true;
         return _loc2_;
      }
      
      public function set scaleFactor(param1:Number) : void
      {
         this._alignTool.scaleFactor = param1;
      }
   }
}
