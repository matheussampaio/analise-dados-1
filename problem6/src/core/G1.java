
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
    private final News mNews;

    public G1(final String empresa) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(empresa));

        mEmpresa = empresa.toLowerCase();
        mWriteNews = new WriteNews(mEmpresa);
        mNews = new News(mEmpresa);
    }

    public void getArtigoContent(final String url) {
        Preconditions.checkArgument(!Strings.isNullOrEmpty(url));

        if (!Strings.isNullOrEmpty(url)) {

            Document doc;

            try {
                doc = Jsoup.connect(url).timeout(GET_TIMEOUT).get();

                final Elements content = doc.getElementsByTag("p");

                for (final Element e : content) {
                    mNews.add(e.text().toString());
                }

                totalNews++;

            } catch (final Exception e) {
            }
        }

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

                    getArtigoContent(url);

                }
            }
        } catch (final Exception e) {
        }
    }

    @Override
    public void run() {

        final CalculateTime cTime = new CalculateTime();

        cTime.startTime();

        getNews();

        if (Strings.isNullOrEmpty(mNews.getText())) {
            System.out.println("Finished (" + cTime.stopTime() + " seconds) : EMPTY " + mEmpresa
                    + " Skiping write file...");
        } else {
            mWriteNews.writeNews(mNews);

            System.out.println("Finished (" + cTime.stopTime() + " seconds) : " + totalNews
                    + " news from " + mEmpresa + " " + mNews.getText().length() + " length");
        }
    }

}
