import java.io.IOException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawler {
	public static void craw() {
		String url = "https://en.dict.naver.com/#/main?sLn=kr";
		Document doc = null;
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Elements element = doc.select("ul.theme_words");
		
		Iterator<Element> iter = element.iterator();
		
		while (iter.hasNext()) {
			System.out.println(iter.next());
		}
	}
}
