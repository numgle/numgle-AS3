package 
{
	import flash.display.MovieClip;
	import com.airhttp.*;
	
	public class Main extends MovieClip
	{
		private var webserv:HttpServer;
		public function Main()
		{
			var datasetLoader = new DatasetLoader();
			webserv = (new HttpServer());
			webserv.registerController(new NumgleController(datasetLoader));
			var isListening:Boolean = webserv.listen(4567);
		}

	}
}