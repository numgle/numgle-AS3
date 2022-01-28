package 
{
	public class DatasetLoader
	{
		import com.brokenfunction.json.JsonDecoderAsync;
		import flash.net.*;
		import flash.events.*;
		private var _loadedSet;
		private var urlRequest:URLRequest = new URLRequest("https://pastebin.com/raw/5Wu0vZBX");
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
			trace(event.target.data);
			_loadedSet = (new JsonDecoderAsync(event.target.data)).result; 
		}

	}

}