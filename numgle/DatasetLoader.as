package 
{
	public class DatasetLoader
	{
		import flash.net.*;
		import flash.events.*;
		private var _loadedSet;
		private var urlRequest:URLRequest = new URLRequest("https://raw.githubusercontent.com/numgle/dataset/main/src/data.json");
		private var loader:URLLoader = new URLLoader();

		function DatasetLoader()
		{
			urlRequest.contentType = "text/json";
			urlRequest.method = URLRequestMethod.GET;
			loader.addEventListener(Event.COMPLETE, completeHandler);
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			Update();
		}

		public function Update()
		{
			loader.load(urlRequest);
		}

		public function GetData()
		{
			return _loadedSet;
		}

		private function completeHandler(event):void
		{
			_loadedSet = JSON.parse(event.target.data);
		}

	}

}