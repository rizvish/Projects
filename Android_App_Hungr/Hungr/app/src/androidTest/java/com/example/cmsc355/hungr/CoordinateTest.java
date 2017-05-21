package com.example.cmsc355.hungr;

import android.content.Context;
import android.support.test.InstrumentationRegistry;
import android.support.test.espresso.ViewAssertion;
import android.support.test.espresso.assertion.ViewAssertions;
import android.support.test.espresso.matcher.ViewMatchers;
import android.support.test.rule.ActivityTestRule;
import android.support.test.runner.AndroidJUnit4;
import android.view.View;
import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.Espresso.pressBack;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.isCompletelyDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withEffectiveVisibility;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static android.support.test.espresso.matcher.RootMatchers.withDecorView;
import static android.support.test.espresso.matcher.ViewMatchers.withText;
import static org.hamcrest.Matchers.not;
import static org.hamcrest.core.AllOf.allOf;


import org.hamcrest.Matchers;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

/**
 * Created by rizvish on 11/8/16.
 */

@RunWith(AndroidJUnit4.class)
public class CoordinateTest {

    @Rule
    public ActivityTestRule<MainActivity> mActivityRule =
            new ActivityTestRule<>(MainActivity.class);

        /*
        Instrumentation Test for the user story:
        As a basic user, I want to use coordinates to find restaurants,
        so that I can get a recommendation for a restaurant to eat at.

        SCENARIO: Given that no coordinates are available,
        when I click the 'Get Food' button,
        then I should see an error message telling me what went wrong.
        */

        @Test
         public void isEmptyCoordinates(){
        mActivityRule.getActivity().setCoordinates(22.0,22.0);
        onView(withId(R.id.getFoodButton)).perform(click());
        onView(withText("No restaurants nearby"))
                .inRoot(withDecorView(Matchers.not(mActivityRule.getActivity().getWindow().getDecorView())))
                .check(matches((isDisplayed())));
    }
        /*
        Instrumentation Test for the user story:
        As a basic user, I want to use coordinates to find restaurants,
        so that I can get a recommendation for a restaurant to eat at.
        SCENARIO:
        Given that coordinates are available, when I click the 'Get Food' button,
        then I should see a restaurant recommendation.
        */

        @Test
        public void isRecommendationSuccess () {
            mActivityRule.getActivity().setCoordinates(34.0, -110.0);
            onView(withId(R.id.getFoodButton)).perform(click());
            onView(withId(R.id.view_pager)).check(matches(isDisplayed()));
        }
         /*
        Instrumentation Test for the user story:
        As a basic user, I want to use coordinates to find restaurants,
        so that I can get a recommendation for a restaurant to eat at.

        SCENARIO:
        Given that I have used coordinates to successfully find a restaurant recommendation,
        when I click the back button,
        then I should be redirected to the screen with the 'Get Food' button on it.
        */

            @Test
            public void isAfterRecommendBackButtonGetFood () {
                mActivityRule.getActivity().setCoordinates(34.0, -110.0);
                onView(withId(R.id.getFoodButton)).perform(click());
                onView(withId(R.id.view_pager)).check(matches(isDisplayed()));
                pressBack();
                onView(withId(R.id.getFoodButton)).check(matches(isDisplayed()));
            }
        }

