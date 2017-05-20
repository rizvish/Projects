package com.example.cmsc355.hungr;

import android.support.test.rule.ActivityTestRule;
import android.support.test.runner.AndroidJUnit4;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static android.support.test.espresso.matcher.RootMatchers.withDecorView;
import static android.support.test.espresso.matcher.ViewMatchers.withText;
import static org.hamcrest.Matchers.not;

@RunWith(AndroidJUnit4.class)

public class MainRecommendationButtonTest {

    @Rule
    public ActivityTestRule<MainActivity> mActivityRule =
            new ActivityTestRule<>(MainActivity.class);

    @Test
    public void buttonPressForRecommendation() {
        /*
            Instrumentation Tests for the user story:
            As a basic user, I want a button to click,
            so that I can get a recommendation for a restaurant to eat at.

            SCENARIO:
            Given that I am near multiple restaurants and have a valid internet connection,
            when I click the button,
            then I need to be recommended a restaurant.
         */

        onView(withId(R.id.getFoodButton)).perform(click());
        onView(withId(R.id.view_pager)).check(matches(isDisplayed()));
    }

    @Test
    public void buttonPressNoRestaurantsNearby() {
        /*

            Instrumentation Tests for the user story:
            As a basic user, I want a button to click,
            so that I can get a recommendation for a restaurant to eat at.

            SCENARIO:
            Given that I am not near any restaurants,
            when I click the button,
            then I need to receive an error message explaining what went wrong.
         */

        mActivityRule.getActivity().setRemoteLocationTestingFlag(true);
        onView(withId(R.id.getFoodButton)).perform(click());
        onView(withText("No restaurants nearby")).check(matches((isDisplayed())));
        mActivityRule.getActivity().setRemoteLocationTestingFlag(false);
    }
}

