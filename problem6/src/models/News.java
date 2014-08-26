
package models;

import com.google.common.base.Joiner;

import java.util.LinkedList;

public class News {

    private final String mUrl;
    private final LinkedList<String> mContent;

    public News(final String url) {
        mUrl = url;
        mContent = new LinkedList<>();
    }

    public void add(final String txt) {
        mContent.add(txt.toLowerCase());
    }

    public String getUrl() {
        return mUrl;
    }

    public String getText() {
        return Joiner.on(" ").join(mContent);
    };
}
