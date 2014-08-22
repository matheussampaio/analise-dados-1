
package utils;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.io.IOException;

public class Surf {

    public static void getDoc(final String url) {
        try {
            final Document doc = Jsoup.connect("http://en.wikipedia.org/").get();
        } catch (final IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
