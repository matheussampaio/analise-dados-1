
package core;

import com.google.common.base.Strings;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import utils.CalculateTime;

import java.io.IOException;
import java.net.SocketTimeoutException;
import java.util.LinkedList;

public abstract class G1 implements Runnable {

    public final static int NUM_PAGES = 5;

    public final static String URL_PREFIX = "http://www.globo.com/busca/?q=";
    public final static String URL_SUFIX = "&page=";

    private final String mEmpresa;
    private long mPassed;

    public G1(final String empresa) {
        mEmpresa = empresa;
    }

    public LinkedList<String> getArtigoContent(final String url) {
        final LinkedList<String> artigoContent = new LinkedList<String>();

        if (!Strings.isNullOrEmpty(url)) {

            Document doc;

            try {

                doc = Jsoup.connect(url).get();

                final Elements content = doc.getElementsByTag("p");

                for (final Element e : content) {
                    artigoContent.add(e.text().toString());
                }

            } catch (final IllegalArgumentException e) {
                System.err.println("Not a valid url: " + url);
            } catch (final SocketTimeoutException ste) {
                System.err.println("Timedout: " + url);
            } catch (final IOException e) {
                e.printStackTrace();
            } catch (final Exception e) {
                e.printStackTrace();
            }
        }

        return artigoContent;
    }

    public LinkedList<String> getNews(final String searchTerm) {
        Document doc;

        final LinkedList<String> newsContent = new LinkedList<String>();

        try {

            for (int i = 1; i <= NUM_PAGES; i++) {
                doc = Jsoup.connect(URL_PREFIX + searchTerm + URL_SUFIX + i).get();

                final Elements news = doc.getElementsByClass("resultado_da_busca").get(0)
                        .getElementsByTag("li");

                for (final Element n : news) {
                    final String url = n.getElementsByTag("a").get(0).attr("href").toString();

                    newsContent.addAll(getArtigoContent(url));
                }
            }

        } catch (final IOException e) {
            e.printStackTrace();
        } catch (final Exception e) {
            e.printStackTrace();
        }

        return newsContent;
    }

    @Override
    public void run() {
        final CalculateTime time = new CalculateTime();

        time.startTime();

        final LinkedList<String> news = getNews(mEmpresa);

        final long stopTime = time.stopTime();

        System.out.println("Finished " + mEmpresa + " in " + stopTime + " seconds.");

        finishListener(stopTime, news);

    }

    public abstract void finishListener(final long time, final LinkedList<String> news);

}
