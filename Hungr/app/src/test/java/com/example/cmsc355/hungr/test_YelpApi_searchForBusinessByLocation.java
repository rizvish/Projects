//compackage com.example.cmsc355.hungr;
//
//import org.junit.Test;
//
//import static junit.framework.Assert.assertEquals;
//
///**
// * Created by Kyle on 11/26/2016.
// */
//
//public class test_YelpApi_searchForBusinessByLocation {
//    @Test
//    public void searchForBusinessByLocation_Test() throws Exception {
//        String goodLocation = "Richmond, VA";
//        String nullLocation = "notARealPlace";
//        MainActivity mainActivity = new MainActivity();
//        YelpApi yelpApi = new YelpApi(
//                mainActivity.getYelpApiParams("CONSUMER_KEY"),
//                mainActivity.getYelpApiParams("CONSUMER_SECRET"),
//                mainActivity.getYelpApiParams("TOKEN"),
//                mainActivity.getYelpApiParams("TOKEN_SECRET"));
//        String apiResult = yelpApi.searchForBusinessesByLocation("food", goodLocation);
//        assertEquals(false, mainActivity.apiHasError(apiResult));
//        apiResult = yelpApi.searchForBusinessesByLocation("food", nullLocation);
//        assertEquals(true, mainActivity.apiHasError(apiResult));
//    }
//}
