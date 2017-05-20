package com.example.cmsc355.hungr;

import android.support.test.espresso.ViewAssertion;
import android.support.test.espresso.ViewInteraction;
import android.support.test.rule.ActivityTestRule;
import android.support.test.runner.AndroidJUnit4;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.action.ViewActions.swipeLeft;
import static android.support.test.espresso.action.ViewActions.swipeRight;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.hasDescendant;
import static android.support.test.espresso.matcher.ViewMatchers.hasFocus;
import static android.support.test.espresso.matcher.ViewMatchers.isDescendantOfA;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static android.support.test.espresso.matcher.ViewMatchers.withText;
import static org.hamcrest.core.AllOf.allOf;

@RunWith(AndroidJUnit4.class)

public class GetAnotherRecommendationTest {

    String twoResponses = "[{\"is_claimed\":true,\"rating\":4.5,\"mobile_url\":\"https:\\/\\/m.yelp.com\\/biz\\/the-naked-onion-richmond?adjust_creative=4gMlTiNc9lXpqP9YIwmbJg&utm_campaign=" +
            "yelp_api&utm_medium=api_v2_search&utm_source=4gMlTiNc9lXpqP9YIwmbJg\",\"rating_img_url\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/assets\\/2\\/www\\/img\\/99493c12711e\\/ico\\/stars" +
            "\\/v1\\/stars_4_half.png\",\"review_count\":172,\"name\":\"Hobo Dobo\",\"rating_img_url_small\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/assets\\/2\\/www\\/img\\/a5221e66bc70\\/ico" +
            "\\/stars\\/v1\\/stars_small_4_half.png\",\"url\":\"https:\\/\\/www.yelp.com\\/biz\\/the-naked-onion-richmond?adjust_creative=4gMlTiNc9lXpqP9YIwmbJg&utm_campaign=yelp_api&utm_medium=" +
            "api_v2_search&utm_source=4gMlTiNc9lXpqP9YIwmbJg\",\"categories\":[[\"Sandwiches\",\"sandwiches\"],[\"Soup\",\"soup\"],[\"American (New)\",\"newamerican\"]],\"menu_date_updated\":" +
            "1472779506,\"phone\":\"8049723339\",\"snippet_text\":\"Very nice!\",\"image_url\":\"https:\\/\\/s3-media3.fl.yelpcdn.com\\/bphoto\\/50em_CAx0AwSGAP0tttcmQ\\/ms.jpg\",\"snippet_image_url" +
            "\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/photo\\/eaXgtO4A-7KtIWLlEN8rSQ\\/ms.jpg\",\"display_phone\":\"+1-804-555-5555\",\"rating_img_url_large\":\"https:\\/\\/s3-media4.fl.yelpcdn.com" +
            "\\/assets\\/2\\/www\\/img\\/9f83790ff7f6\\/ico\\/stars\\/v1\\/stars_large_4_half.png\",\"menu_provider\":\"single_platform\",\"id\":\"the-naked-onion-richmond\",\"is_closed" +
            "\":false,\"location\":{\"city\":\"Richmond\",\"display_address\":[\"401 Hong Sheng Way\",\"The Zhou\",\"Richmond, VA 23220\"],\"geo_accuracy\":9.5,\"neighborhoods\":[\"The Fan\"]," +
            "\"postal_code\":\"23220\",\"country_code\":\"US\",\"address\":[\"2118 W Cary St\"],\"coordinate\":{\"latitude\":37.5489080495392,\"longitude\":-77.4684175830781},\"state_code\":\"VA\"}}," +

            "{\"is_claimed\":true,\"rating\":4.5,\"mobile_url\":\"https:\\/\\/m.yelp.com\\/biz\\/the-naked-onion-richmond?adjust_creative=4gMlTiNc9lXpqP9YIwmbJg&utm_campaign=" +
            "yelp_api&utm_medium=api_v2_search&utm_source=4gMlTiNc9lXpqP9YIwmbJg\",\"rating_img_url\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/assets\\/2\\/www\\/img\\/99493c12711e\\/ico\\/stars" +
            "\\/v1\\/stars_4_half.png\",\"review_count\":172,\"name\":\"McBurgerKing\",\"rating_img_url_small\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/assets\\/2\\/www\\/img\\/a5221e66bc70\\/ico" +
            "\\/stars\\/v1\\/stars_small_4_half.png\",\"url\":\"https:\\/\\/www.yelp.com\\/biz\\/the-naked-onion-richmond?adjust_creative=4gMlTiNc9lXpqP9YIwmbJg&utm_campaign=yelp_api&utm_medium=" +
            "api_v2_search&utm_source=4gMlTiNc9lXpqP9YIwmbJg\",\"categories\":[[\"Sandwiches\",\"sandwiches\"],[\"Soup\",\"soup\"],[\"American (New)\",\"newamerican\"]],\"menu_date_updated\":" +
            "1472779506,\"phone\":\"8049723339\",\"snippet_text\":\"Very nice!\",\"image_url\":\"https:\\/\\/s3-media3.fl.yelpcdn.com\\/bphoto\\/50em_CAx0AwSGAP0tttcmQ\\/ms.jpg\",\"snippet_image_url" +
            "\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/photo\\/eaXgtO4A-7KtIWLlEN8rSQ\\/ms.jpg\",\"display_phone\":\"+1-804-555-5555\",\"rating_img_url_large\":\"https:\\/\\/s3-media4.fl.yelpcdn.com" +
            "\\/assets\\/2\\/www\\/img\\/9f83790ff7f6\\/ico\\/stars\\/v1\\/stars_large_4_half.png\",\"menu_provider\":\"single_platform\",\"id\":\"the-naked-onion-richmond\",\"is_closed" +
            "\":false,\"location\":{\"city\":\"Richmond\",\"display_address\":[\"401 Hong Sheng Way\",\"The Zhou\",\"Richmond, VA 23220\"],\"geo_accuracy\":9.5,\"neighborhoods\":[\"The Fan\"]," +
            "\"postal_code\":\"23220\",\"country_code\":\"US\",\"address\":[\"2118 W Cary St\"],\"coordinate\":{\"latitude\":37.5489080495392,\"longitude\":-77.4684175830781},\"state_code\":\"VA\"}}]";

    @Rule
    public ActivityTestRule<MainActivity> mActivityRule =
            new ActivityTestRule<>(MainActivity.class);

    @Test
    public void swipeForNewRecommendationTest() {
        /*
            Instrumentation Test for the user story:
            As a basic user,
            I want the ability to choose another restaurant recommendation,
            so that I can get a new restaurant suggestion to have more to choose from.

            SCENARIO:
            Given that I am near multiple restaurants,
            when I swipe to the right,
            then I need to be recommended a restaurant differing from the current recommended one.
         */

        mActivityRule.getActivity().setTestVar(1);
        mActivityRule.getActivity().setMockMasterArray(twoResponses);
        onView(withId(R.id.getFoodButton)).perform(click());
        onView(withId(R.id.view_pager)).check(matches(hasDescendant(withText("Hobo Dobo"))));
        onView(withId(R.id.view_pager)).perform(swipeLeft());
        onView(withId(R.id.view_pager)).check(matches(hasDescendant(withText("McBurgerKing"))));
    }

    @Test
    public void swipeToReviewPreviousRecommendationsTest() {
        /*
            Instrumentation Test for the user story:
            As a basic user,
            I want the ability to choose another restaurant recommendation,
            so that I can get a new restaurant suggestion to have more to choose from.

            SCENARIO:
            Given that I have seen several recommendations,
            when I swipe the screen,
            then I need to be able to review the previous recommendations shown.
         */


        mActivityRule.getActivity().setTestVar(1);
        mActivityRule.getActivity().setMockMasterArray(twoResponses);
        onView(withId(R.id.getFoodButton)).perform(click());
        onView(withId(R.id.view_pager)).check(matches(hasDescendant(withText("Hobo Dobo"))));
        onView(withId(R.id.view_pager)).perform(swipeLeft());
        onView(withId(R.id.view_pager)).check(matches(hasDescendant(withText("McBurgerKing"))));
        onView(withId(R.id.view_pager)).perform(swipeRight());
        onView(withId(R.id.view_pager)).check(matches(hasDescendant(withText("Hobo Dobo"))));
    }

    @Test
    public void swipeNoMoreRecommendationsTest() {
    /*
        Instrumentation Test for the user story:
        As a basic user,
        I want the ability to choose another restaurant recommendation,
        so that I can get a new restaurant suggestion to have more to choose from.

        Given that there are no more recommendations available,
        when I swipe the screen,
        then I will remain on the current recommendation indicating that there are none left.
     */
        mActivityRule.getActivity().setTestVar(1);
        mActivityRule.getActivity().setMockMasterArray(twoResponses);
        onView(withId(R.id.getFoodButton)).perform(click());
        onView(withId(R.id.view_pager)).check(matches(hasDescendant(withText("Hobo Dobo"))));
        onView(withId(R.id.view_pager)).perform(swipeLeft());
        onView(withId(R.id.view_pager)).check(matches(hasDescendant(withText("McBurgerKing"))));
        onView(withId(R.id.view_pager)).perform(swipeLeft());
        onView(withId(R.id.view_pager)).check(matches(hasDescendant(withText("McBurgerKing"))));
    }
}
