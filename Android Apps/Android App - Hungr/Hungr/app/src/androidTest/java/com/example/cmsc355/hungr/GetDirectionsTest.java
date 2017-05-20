package com.example.cmsc355.hungr;

/**
 * Created by connerza on 11/2/16.
 */

import android.app.Activity;
import android.app.Instrumentation;
import android.support.test.espresso.ViewAssertion;
import android.support.test.espresso.ViewInteraction;
import android.support.test.espresso.intent.matcher.IntentMatchers;
import android.support.test.espresso.matcher.ViewMatchers;
import android.support.test.rule.ActivityTestRule;
import android.support.test.runner.AndroidJUnit4;

import org.hamcrest.Matchers;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

import java.util.ArrayList;
import java.util.regex.Matcher;

import static android.support.test.espresso.Espresso.onData;
import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.Espresso.pressBack;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.action.ViewActions.swipeLeft;
import static android.support.test.espresso.action.ViewActions.swipeRight;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.intent.Intents.intending;
import static android.support.test.espresso.intent.matcher.IntentMatchers.isInternal;
import static android.support.test.espresso.intent.matcher.IntentMatchers.toPackage;
import static android.support.test.espresso.matcher.RootMatchers.withDecorView;
import static android.support.test.espresso.matcher.ViewMatchers.hasDescendant;
import static android.support.test.espresso.matcher.ViewMatchers.hasFocus;
import static android.support.test.espresso.matcher.ViewMatchers.isCompletelyDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.isDescendantOfA;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withEffectiveVisibility;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static android.support.test.espresso.matcher.ViewMatchers.withText;
import static org.hamcrest.core.AllOf.allOf;
import static org.hamcrest.core.IsNot.not;

@RunWith(AndroidJUnit4.class)

/*  As a basic user,
    I want to be able to click the map showing the location of the restaurant,
    so that I can be redirected to Google Maps getting directions to that restaurant.
*/
public class GetDirectionsTest {
    String noLocationResponse = "[{\"is_claimed\":true,\"rating\":4.5,\"mobile_url\":\"https:\\/\\/m.yelp.com\\/biz\\/the-naked-onion-richmond?adjust_creative=4gMlTiNc9lXpqP9YIwmbJg&utm_campaign=" +
            "yelp_api&utm_medium=api_v2_search&utm_source=4gMlTiNc9lXpqP9YIwmbJg\",\"rating_img_url\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/assets\\/2\\/www\\/img\\/99493c12711e\\/ico\\/stars" +
            "\\/v1\\/stars_4_half.png\",\"review_count\":172,\"name\":\"Hobo Dobo\",\"rating_img_url_small\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/assets\\/2\\/www\\/img\\/a5221e66bc70\\/ico" +
            "\\/stars\\/v1\\/stars_small_4_half.png\",\"url\":\"https:\\/\\/www.yelp.com\\/biz\\/the-naked-onion-richmond?adjust_creative=4gMlTiNc9lXpqP9YIwmbJg&utm_campaign=yelp_api&utm_medium=" +
            "api_v2_search&utm_source=4gMlTiNc9lXpqP9YIwmbJg\",\"categories\":[[\"Sandwiches\",\"sandwiches\"],[\"Soup\",\"soup\"],[\"American (New)\",\"newamerican\"]],\"menu_date_updated\":" +
            "1472779506,\"phone\":\"8049723339\",\"snippet_text\":\"Very nice!\",\"image_url\":\"https:\\/\\/s3-media3.fl.yelpcdn.com\\/bphoto\\/50em_CAx0AwSGAP0tttcmQ\\/ms.jpg\",\"snippet_image_url" +
            "\":\"https:\\/\\/s3-media2.fl.yelpcdn.com\\/photo\\/eaXgtO4A-7KtIWLlEN8rSQ\\/ms.jpg\",\"display_phone\":\"+1-804-555-5555\",\"rating_img_url_large\":\"https:\\/\\/s3-media4.fl.yelpcdn.com" +
            "\\/assets\\/2\\/www\\/img\\/9f83790ff7f6\\/ico\\/stars\\/v1\\/stars_large_4_half.png\",\"menu_provider\":\"single_platform\",\"id\":\"the-naked-onion-richmond\",\"is_closed" +
            "\":false}]";

    @Rule
    public ActivityTestRule<MainActivity> mActivityRule =
            new ActivityTestRule<>(MainActivity.class);


    /*  Given that I am viewing a restaurant in the main activity,
        when I click the get directions button,
        then Google Maps should open up with a marker on the restaurant location.

        Given that I have gotten the directions already and am in the map,
        when I click the back button,
        I should be taken back to the recommendation view.
    */
    @Test
    public void getDirectionsTest() {
        onView(withId(R.id.getFoodButton)).perform(click());

        onView(allOf(withId(R.id.getDirectionsButton),
                withEffectiveVisibility(ViewMatchers.Visibility.VISIBLE),
                isCompletelyDisplayed())).perform(click());

        //Make sure the layout has a map
        onView(withId(R.id.map))
                .check(matches(withEffectiveVisibility(ViewMatchers.Visibility.VISIBLE)));

        //Press back button
        pressBack();

        //Check to make sure we are back to recommendation page
        onView(allOf(withId(R.id.getDirectionsButton),
                withEffectiveVisibility(ViewMatchers.Visibility.VISIBLE),
                isCompletelyDisplayed())).check(matches(isDisplayed()));

    }

    /*  Given that the restaurant I am viewing does not have location data,
        when I click the get directions button,
        then I should see a Toast telling me what happened.
    */
    @Test
    public void invalidLocationTest () {
        mActivityRule.getActivity().setTestVar(1);
        mActivityRule.getActivity().setMockMasterArray(noLocationResponse);
        onView(withId(R.id.getFoodButton)).perform(click());

        onView(allOf(withId(R.id.getDirectionsButton),
                withEffectiveVisibility(ViewMatchers.Visibility.VISIBLE),
                isCompletelyDisplayed())).perform(click());

        //Make sure we get a Toast
        onView(withText("Restaurant has no location data."))
                .inRoot(withDecorView(Matchers.not(mActivityRule.getActivity().getWindow().getDecorView())))
                .check(matches((isDisplayed())));
    }
}
