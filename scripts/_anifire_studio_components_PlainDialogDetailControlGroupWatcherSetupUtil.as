package
{
   import anifire.studio.components.PlainDialogDetailControlGroup;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_PlainDialogDetailControlGroupWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_PlainDialogDetailControlGroupWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         PlainDialogDetailControlGroup.watcherSetupUtil = new _anifire_studio_components_PlainDialogDetailControlGroupWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("voiceContentUpdated",{"propertyChange":true},[param4[0],param4[1],param4[2],param4[3],param4[4],param4[5],param4[6],param4[7],param4[8],param4[9],param4[10],param4[11],param4[12],param4[13],param4[14],param4[15],param4[16],param4[17],param4[18],param4[19],param4[20],param4[21],param4[22],param4[23]],param2);
         param5[0].updateParent(param1);
      }
   }
}
