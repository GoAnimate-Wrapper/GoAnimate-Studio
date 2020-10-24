package anifire.studio.validators
{
	import anifire.util.UtilDict;
	import anifire.util.UtilUser;
	import mx.validators.ValidationResult;
	import mx.validators.Validator;
	
	public class HyperLinkValidator extends Validator
	{
		 
		
		private var _results:Array;
		
		public function HyperLinkValidator()
		{
			super();
			this.required = false;
		}
		
		private function isUrl(param1:String) : Boolean
		{
			var _loc2_:RegExp = /(?:https?:\/\/)?(?:\w+\.)*\w+\.\w+\/?/;
			return param1.search(_loc2_) == 0;
		}
		
		private function isGoAnimatePage(param1:String) : Boolean
		{
			var _loc2_:RegExp = /(http:\/\/)?(\w*\.)?goanimate\.\w*\//;
			return param1.search(_loc2_) == 0;
		}
		
		private function get supportExternalLink() : Boolean
		{
			if(UtilUser.userType == UtilUser.PRO_USER || UtilUser.userType == UtilUser.COMM_USER || UtilUser.userType == UtilUser.ADMIN_USER)
			{
				return true;
			}
			return false;
		}
		
		override protected function doValidation(param1:Object) : Array
		{
			var _loc2_:String = null;
			this._results = [];
			this._results = super.doValidation(param1);
			if(this._results.length > 0)
			{
				return this._results;
			}
			if(param1 is String)
			{
				_loc2_ = param1 as String;
				if(_loc2_.length > 0)
				{
					if(!this.isUrl(_loc2_))
					{
						this._results.push(new ValidationResult(true,null,"NaN",UtilDict.toDisplay("go","Please enter a valid URL")));
						return this._results;
					}
					if(!this.supportExternalLink && !this.isGoAnimatePage(_loc2_))
					{
						this._results.push(new ValidationResult(true,null,"NaN",UtilDict.toDisplay("go","Links to outside websites will not work")));
						return this._results;
					}
				}
				return this._results;
			}
			this._results.push(new ValidationResult(true,null,"NaN",UtilDict.toDisplay("go","Please enter a valid URL")));
			return this._results;
		}
	}
}
