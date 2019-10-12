package
{
   import anifire.studio.components.SoundThumbRenderer;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_SoundThumbRendererWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_SoundThumbRendererWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         SoundThumbRenderer.watcherSetupUtil = new _anifire_studio_components_SoundThumbRendererWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[12] = new PropertyWatcher("_editable",{"propertyChange":true},[param4[11],param4[12],param4[13],param4[14]],param2);
         param5[6] = new PropertyWatcher("_labelText",{"propertyChange":true},[param4[2]],param2);
         param5[4] = new PropertyWatcher("upgradeIcon",{"propertyChange":true},[param4[1]],param2);
         param5[5] = new PropertyWatcher("width",{"widthChanged":true},[param4[1]],null);
         param5[7] = new PropertyWatcher("_upsellNotice",{"propertyChange":true},[param4[6]],param2);
         param5[10] = new PropertyWatcher("_durationText",{"propertyChange":true},[param4[8]],param2);
         param5[0] = new PropertyWatcher("_variationCollection",{"propertyChange":true},[param4[0]],param2);
         param5[11] = new PropertyWatcher("_playing",{"propertyChange":true},[param4[10],param4[15]],param2);
         param5[2] = new PropertyWatcher("labelGroup",{"propertyChange":true},[param4[1]],param2);
         param5[3] = new PropertyWatcher("width",{"widthChanged":true},[param4[1]],null);
         param5[8] = new PropertyWatcher("_dataSource",{"propertyChange":true},[param4[7]],param2);
         param5[9] = new PropertyWatcher("goTeamOnly",{"propertyChange":true},[param4[7]],null);
         param5[1] = new PropertyWatcher("_previewOnly",{"propertyChange":true},[param4[1],param4[3],param4[4],param4[5],param4[9]],param2);
         param5[12].updateParent(param1);
         param5[6].updateParent(param1);
         param5[4].updateParent(param1);
         param5[4].addChild(param5[5]);
         param5[7].updateParent(param1);
         param5[10].updateParent(param1);
         param5[0].updateParent(param1);
         param5[11].updateParent(param1);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[3]);
         param5[8].updateParent(param1);
         param5[8].addChild(param5[9]);
         param5[1].updateParent(param1);
      }
   }
}
