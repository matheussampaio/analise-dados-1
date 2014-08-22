
package utils;

import org.joda.time.Instant;
import org.joda.time.Interval;

/**
 * The Class Utils.
 */
public class CalculateTime {

    /** The millis. */
    private Instant instant;

    /**
     * Start time.
     */
    public void startTime() {
        instant = new Instant();
    }

    /**
     * Stop time.
     *
     * @return the long
     */
    public long stopTime() {
        return new Interval(instant, new Instant()).toDuration().getStandardSeconds();
    }

}
