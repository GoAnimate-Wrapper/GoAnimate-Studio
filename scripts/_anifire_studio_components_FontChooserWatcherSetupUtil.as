package
{
   import anifire.studio.components.FontChooser;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_studio_components_FontChooserWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_studio_components_FontChooserWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         FontChooser.watcherSetupUtil = new _anifire_studio_components_FontChooserWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[3] = new PropertyWatcher("_displayRotationWarning",{"propertyChange":true},[param4[2],param4[3]],param2);
         param5[19] = new PropertyWatcher("_horizontalPadding",{"propertyChange":true},[param4[22]],param2);
         param5[5] = new PropertyWatcher("_displayInternationalWarning",{"propertyChange":true},[param4[5],param4[6]],param2);
         param5[8] = new PropertyWatcher("_displayUserFontWarning",{"propertyChange":true},[param4[10],param4[11]],param2);
         param5[10] = new PropertyWatcher("_fontSizeSource",{"propertyChange":true},[param4[13]],param2);
         param5[13] = new PropertyWatcher("_bold",{"propertyChange":true},[param4[16]],param2);
         param5[14] = new PropertyWatcher("_enableBold",{"propertyChange":true},[param4[17]],param2);
         param5[6] = new PropertyWatcher("_displayLanguageWarning",{"propertyChange":true},[param4[7],param4[8]],param2);
         param5[21] = new PropertyWatcher("_verticalPadding",{"propertyChange":true},[param4[24]],param2);
         param5[3].updateParent(param1);
         param5[19].updateParent(param1);
         param5[5].updateParent(param1);
         param5[8].updateParent(param1);
         param5[10].updateParent(param1);
         param5[13].updateParent(param1);
         param5[14].updateParent(param1);
         param5[6].updateParent(param1);
         param5[21].updateParent(param1);
      }
   }
}
