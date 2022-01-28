package 
{
	public class NumgleConverter
	{

		private var _datasetLoader:DatasetLoader;
		function NumgleConverter(datasetLoader:DatasetLoader)
		{
			_datasetLoader = datasetLoader;
		}
		
		public function convertChar(letter)
        {
			var dataset = _datasetLoader.GetData();
            if (letter >= 44032 && letter <= 55203){
				var hangulIndex = (letter - 44032);
				var onset = Math.floor(hangulIndex / 28 / 21);
				var nucleus = Math.floor(hangulIndex / 28 % 21);
				var coda = Math.floor(hangulIndex % 28);
				trace(hangulIndex,onset,nucleus,coda);
				if(nucleus >= 8 && nucleus !=20){
					return dataset.jong[coda] + dataset.jung[nucleus - 8] + dataset.cho[onset];
				}
				return dataset.jong[coda] + dataset.cj[Math.min(8, nucleus)][onset];
			}
            else if (letter >= 0x3131 && letter <= 0x3163){
				var index = letter - 0x3131;
				return dataset.han[index];
			}
            else if (letter >= 65 && letter <= 90){
				index = letter - 65;
				return dataset.englishUpper[index];
			}
            else if (letter >= 97 && letter <= 122){
				index = letter - 97;
				return dataset.englishLower[index];			
			}
            else if (letter >= 48 && letter <= 57) {
				index = letter - 48;
				return dataset.number[index];			
			}
            else {
				index = dataset.range.special.indexOf(letter);
				if (index!=-1){
					return dataset.special[index];			
				}
			}
			return "";
		}
		
		public function convertStr(str){
			var result = "";
			for(var i = 0;i<str.length;i++){
				trace(str);
				result += convertChar(str.charCodeAt(i))+"\n";
			}
			return result;
		}

	}

}
