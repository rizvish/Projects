package com.example.cmsc355.hungr;

import android.test.suitebuilder.annotation.SmallTest;

import org.junit.Test;

import static junit.framework.Assert.assertEquals;

/**
 * Created by Kyle on 11/26/2016.
 */

public class test_YelpApi_searchByBusinessId {
    @Test
    public void searchByBusinessId_Test() throws Exception {
        String goodId = "the-naked-onion-richmond";
        String nullId = "the-naked-onion-ri";
        String errorResult = "{\"error\": {\"text\": \"Business information is unavailable\", \"id\": \"BUSINESS_UNAVAILABLE\"}}";
        MainActivity mainActivity = new MainActivity();
        YelpApi yelpApi = new YelpApi(
                mainActivity.getYelpApiParams("CONSUMER_KEY"),
                mainActivity.getYelpApiParams("CONSUMER_SECRET"),
                mainActivity.getYelpApiParams("TOKEN"),
                mainActivity.getYelpApiParams("TOKEN_SECRET"));
        String apiResult = yelpApi.searchByBusinessId(goodId);
        assertEquals(false, mainActivity.apiHasError(apiResult));
        apiResult = yelpApi.searchByBusinessId(nullId);
        assertEquals(true, mainActivity.apiHasError(apiResult));
    }
}
