
package problem6;

import core.G1;
import utils.UtilsProblem;

public class Main {

    public static void main(final String[] args) {

        for (final String empresa : UtilsProblem.readEmpresas()) {

            new G1(empresa).start();
        }

    }
}
