
package utils;

import models.News;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class WriteNews {

    private static final String FOLDER_NAME = "news";
    private final String mEmpresa;
    private PrintWriter newsFile;

    public WriteNews(final String empresa) {
        mEmpresa = empresa;

        createFolder();
    }

    public void writeNews(final News news) {

        final String fileName = FOLDER_NAME + "/" + news.getUrl() + ".txt";

        try {
            newsFile = new PrintWriter(new BufferedWriter(new FileWriter(fileName, false)));

            newsFile.print(news.getText());

            newsFile.flush();

            newsFile.close();

        } catch (final IOException e) {
            e.printStackTrace();
        }

    }

    private boolean createFolder() {
        return new File(FOLDER_NAME).mkdirs();
    }

}
