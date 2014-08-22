
package problem6;

import core.G1;
import utils.CalculateTime;
import utils.UtilsProblem;

import java.util.LinkedList;

public class Main {
    static int countThreads = 0;

    public static void finishG1(final long time, final LinkedList<String> news) {
        System.out.println(time);
        countThreads--;
        System.out.println(countThreads);
    }

    public static void main(final String[] args) {

        final LinkedList<String> listEmpresas = UtilsProblem.readEmpresas();

        final CalculateTime time = new CalculateTime();

        final long total = 0;

        time.startTime();

        for (final String empresa : listEmpresas) {

            countThreads++;

            new Thread(new G1(empresa) {

                @Override
                public void finishListener(final long time, final LinkedList<String> news) {
                    finishG1(time, news);
                }
            }).start();
        }

        while (countThreads > 0) {
            System.out.println(countThreads);
        }

        System.err.println("Total: " + time.stopTime());

    }
}
