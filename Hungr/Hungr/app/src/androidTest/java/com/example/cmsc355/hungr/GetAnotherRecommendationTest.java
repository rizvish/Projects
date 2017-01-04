package com.example.cmsc355.hungr;

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
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withId;

@RunWith(AndroidJUnit4.class)

public class GetAnotherRecommendationTest {

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
            when I click the button,
            then I need to be recommended a restaurant differing from the current recommended one.
         */
        int firstRestaurant, anotherRestaurant;
        onView(withId(R.id.getFoodButton)).perform(click());
        firstRestaurant = R.id.restaurantNameText;
        onView(withId(R.id.view_pager)).perform(swipeRight());
        anotherRestaurant = R.id.restaurantNameText;
        onView(withId(R.id.view_pager)).check(matches(isDisplayed()));
        assert(firstRestaurant != anotherRestaurant);
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

        int firstRestaurant, checkFirstRestaurant;
        onView(withId(R.id.getFoodButton)).perform(click());
        firstRestaurant = R.id.restaurantNameText;
        onView(withId(R.id.view_pager)).perform(swipeRight());
        onView(withId(R.id.view_pager)).perform(swipeLeft());
        checkFirstRestaurant = R.id.restaurantNameText;
        onView(withId(R.id.view_pager)).check(matches(isDisplayed()));
        assert(firstRestaurant == checkFirstRestaurant);
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
        int firstRestaurant, nextRestaurant;
        onView(withId(R.id.getFoodButton)).perform(click());
        firstRestaurant = R.id.restaurantNameText;
        do {
            onView(withId(R.id.view_pager)).perform(swipeRight());
            nextRestaurant = R.id.restaurantNameText;
        } while (firstRestaurant != nextRestaurant);
        onView(withId(R.id.view_pager)).check(matches(isDisplayed()));
        assert (firstRestaurant == nextRestaurant);

    }
}

