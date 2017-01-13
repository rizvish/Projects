package com.example.cmsc355.hungr;

import org.junit.Test;

import static junit.framework.Assert.assertEquals;

/**
 * Created by Kyle on 11/26/2016.
 */

public class test_MainActivity_apiHasError {
    @Test
    public void apiHasError_Test() throws Exception {
        String fullResponse = "{\"is_claimed\":true,\"rating\":4.5,\"mobile_url\":\"https:\\/\\/m.yelp.com\\/biz\\/the-naked-onion-richmond?adjust_creative=4gMlTiNc9lXpqP9YIwmbJg&utm_campaign=" +
                "yelp_api&utm_medium=api_v2_search&utm_source=4gMlTiNc9lXpqP9YIwmbJg\",\"rating_img_url\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/assets\\/2\\/www\\/img\\/99493c12711e\\/ico\\/stars" +
                "\\/v1\\/stars_4_half.png\",\"review_count\":172,\"name\":\"Hobo Dobo\",\"rating_img_url_small\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/assets\\/2\\/www\\/img\\/a5221e66bc70\\/ico" +
                "\\/stars\\/v1\\/stars_small_4_half.png\",\"url\":\"https:\\/\\/www.yelp.com\\/biz\\/the-naked-onion-richmond?adjust_creative=4gMlTiNc9lXpqP9YIwmbJg&utm_campaign=yelp_api&utm_medium=" +
                "api_v2_search&utm_source=4gMlTiNc9lXpqP9YIwmbJg\",\"categories\":[[\"Sandwiches\",\"sandwiches\"],[\"Soup\",\"soup\"],[\"American (New)\",\"newamerican\"]],\"menu_date_updated\":" +
                "1472779506,\"phone\":\"8049723339\",\"snippet_text\":\"Very nice!\",\"image_url\":\"https:\\/\\/s3-media3.fl.yelpcdn.com\\/bphoto\\/50em_CAx0AwSGAP0tttcmQ\\/ms.jpg\",\"snippet_image_url" +
                "\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/photo\\/eaXgtO4A-7KtIWLlEN8rSQ\\/ms.jpg\",\"display_phone\":\"+1-804-555-5555\",\"rating_img_url_large\":\"https:\\/\\/s3-media4.fl.yelpcdn.com" +
                "\\/assets\\/2\\/www\\/img\\/9f83790ff7f6\\/ico\\/stars\\/v1\\/stars_large_4_half.png\",\"menu_provider\":\"single_platform\",\"id\":\"the-naked-onion-richmond\",\"is_closed" +
                "\":false,\"location\":{\"city\":\"Richmond\",\"display_address\":[\"401 Hong Sheng Way\",\"The Zhou\",\"Richmond, VA 23220\"],\"geo_accuracy\":9.5,\"neighborhoods\":[\"The Fan\"]," +
                "\"postal_code\":\"23220\",\"country_code\":\"US\",\"address\":[\"2118 W Cary St\"],\"coordinate\":{\"latitude\":37.5489080495392,\"longitude\":-77.4684175830781},\"state_code\":\"VA\"}}";

        String str = "{\"error\": {\"text\": \"API unavailable in this location\", "
                + "\"id\": \"UNAVAILABLE_FOR_LOCATION\"}}";
        MainActivity mainActivity = new MainActivity();
        assertEquals(true, mainActivity.apiHasError(str));
        str = "";
        assertEquals(true, mainActivity.apiHasError(str));
        assertEquals(false, mainActivity.apiHasError(fullResponse));
    }
}
