package com.example.cmsc355.hungr;

import org.junit.Test;

import static junit.framework.Assert.assertEquals;

/**
 * Created by Kyle on 11/26/2016.
 */

public class test_YelpApi_searchForBusinessByCoordinates {
    @Test
    public void searchForBusinessByCoordinates_Test() throws Exception {
        double goodLat = 32;
        double goodLon = -110;
        int goodRadius = 40000;
        double nullLat = Integer.MAX_VALUE;
        double nullLon = Integer.MAX_VALUE;
        int nullRadius = -1;
        MainActivity mainActivity = new MainActivity();
        YelpApi yelpApi = new YelpApi(
                mainActivity.getYelpApiParams("CONSUMER_KEY"),
                mainActivity.getYelpApiParams("CONSUMER_SECRET"),
                mainActivity.getYelpApiParams("TOKEN"),
                mainActivity.getYelpApiParams("TOKEN_SECRET"));
//        String apiResult = yelpApi.searchForBusinessesByCoordinates("food", goodLat, goodLon, goodRadius);
//        assertEquals(false, mainActivity.apiHasError(apiResult));
//        apiResult = yelpApi.searchForBusinessesByCoordinates("food", nullLat, nullLon, nullRadius);
//        assertEquals(true, mainActivity.apiHasError(apiResult));
    }
}
