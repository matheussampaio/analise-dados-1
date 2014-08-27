
package core;

import com.google.common.base.Preconditions;
import com.google.common.base.Strings;

import models.News;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import utils.CalculateTime;
import utils.WriteNews;

public class G1 extends Thread {

    private static final int GET_TIMEOUT = 10000;
    public final static int NUM_PAGES = 5;

    public final static String URL_PREFIX = "http://www.globo.com/busca/?q=";
    public final static String URL_SUFIX = "&page=";

    private final String mEmpresa;

    private final WriteNews mWriteNews;

    private int totalNews;

    public G1(final String empresa) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(empresa));

        mEmpresa = empresa.toLowerCase();
        mWriteNews = new WriteNews(mEmpresa);
    }

    public News getArtigoContent(final String url) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(url));

        final News news = new News(url);

        if (!Strings.isNullOrEmpty(url)) {

            Document doc;

            try {
                doc = Jsoup.connect(url).timeout(GET_TIMEOUT).get();

                final Elements content = doc.getElementsByTag("p");

                for (final Element e : content) {
                    news.add(e.text().toString());
                }

                return news;

            } catch (final Exception e) {
            }
        }

        return null;
    }

    public void getNews() {
        Document doc;

        try {

            for (int i = 1; i <= NUM_PAGES; i++) {
                doc = Jsoup.connect(URL_PREFIX + mEmpresa + URL_SUFIX + i).get();

                final Elements elements = doc.getElementsByClass("resultado_da_busca").get(0)
                        .getElementsByTag("li");

                for (final Element n : elements) {
                    final String url = n.getElementsByTag("a").get(0).attr("href").toString();

                    final News news = getArtigoContent(url);

                    if (news != null) {
                        mWriteNews.writeNews(news);
                        totalNews++;
                    }
                }
            }
        } catch (final Exception e) {
            //            e.printStackTrace();
        }
    }

    @Override
    public void run() {

        final CalculateTime cTime = new CalculateTime();

        cTime.startTime();

        getNews();

        System.out.println("Finished (" + cTime.stopTime() + " seconds) : " + totalNews
                + " news from " + mEmpresa);
    }

}
