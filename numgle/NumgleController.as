package 
{
	import com.airhttp.ActionController;

	public class NumgleController extends com.airhttp.ActionController
	{
		private var _datasetLoader:DatasetLoader;
		private var _numgleConverter:NumgleConverter;
		function NumgleController(datasetLoader:DatasetLoader)
		{
			super('/numgle');
			_datasetLoader = datasetLoader;
			_numgleConverter = new NumgleConverter(_datasetLoader);
		}
		public function api(params):String
		{
			if (params.hasOwnProperty('input')) {
				trace(params["input"]);
				return response(200,"OK",_numgleConverter.convertStr(params["input"]),"text/plain; charset=utf-8");
			}else{
				return responseSuccess("");
			}
			
		}
		public function update():String
		{
			
			return responseSuccess("Update");
		}
	}

}