import java.io.IOException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawler {
	public static void main(String args[]) {
		String url = "https://www.gamemeca.com/ranking.php";
		Document doc = null;
		
		try{
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Elements element = doc.select("tbody");
		System.out.println(element);
		
		Iterator<Element> rank = element.select("span.rank").iterator();
		Iterator<Element> rankChange = element.select("span.rankChange").iterator();
		Iterator<Element> name = element.select("div.game-name").iterator();
		Iterator<Element> company = element.select("span.company").iterator();
		
		while (name.hasNext()) {
			System.out.println(rank.next().text());
			System.out.println(rankChange.next());
			System.out.println(name.next().text());
			System.out.println(company.next().text()+"\n");
		}
	}
}
