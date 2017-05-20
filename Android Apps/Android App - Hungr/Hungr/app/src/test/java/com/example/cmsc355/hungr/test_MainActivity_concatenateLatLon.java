package com.example.cmsc355.hungr;

import org.junit.Test;

import static junit.framework.Assert.assertEquals;

/**
 * Created by Kyle on 11/26/2016.
 */

public class test_MainActivity_concatenateLatLon {
    @Test
    public void concatenateLatLon_Test() throws Exception {
        MainActivity mainActivity = new MainActivity();
        double lat = 102.5;
        double lon = 1009.7;
        assertEquals("102.5,1009.7", mainActivity.concatenateLatLon(lat, lon));
        lat = 0;
        lon = 0;
        assertEquals("0.0,0.0", mainActivity.concatenateLatLon(lat, lon));
    }
}
