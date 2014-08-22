
package utils;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.LinkedList;

public class UtilsProblem {

    public final static boolean DEBUG = true;

    public final static String EMPRESAS_FILE = "empresas.txt";

    public static LinkedList<String> readEmpresas() {
        final LinkedList<String> empresas = new LinkedList<String>();

        BufferedReader reader;

        try {
            reader = new BufferedReader(new FileReader(EMPRESAS_FILE));

            String line = null;

            while ((line = reader.readLine()) != null) {
                empresas.add(line);
            }

            reader.close();

        } catch (final FileNotFoundException e) {
            e.printStackTrace();
        } catch (final IOException e) {
            e.printStackTrace();
        }

        return empresas;
    }

}
