package com.example.cmsc355.hungr;

import android.support.test.rule.ActivityTestRule;
import android.support.test.runner.AndroidJUnit4;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.RootMatchers.withDecorView;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static android.support.test.espresso.matcher.ViewMatchers.withText;

import static org.hamcrest.Matchers.not;


@RunWith(AndroidJUnit4.class)

public class SplashScreenTest {

    @Rule
    public ActivityTestRule<SplashScreen> mActivityRule =
            new ActivityTestRule<>(SplashScreen.class);

    public void LogoutFromGoogleTest() {
        /*
            Instrumentation Test for the user story:
            As a basic user,
            I want a button to log in with my Google account,
            so that I can be logged in to save my settings later.


            SCENARIO:
            Given that I am on the splash screen for the app,
            when I click the Logout button,
            then I will be logged out of my Google account.
         */

        onView(withId(R.id.sign_out_button)).perform(click());

        onView(withText("Signed out of Google"))
                .inRoot(withDecorView(not(mActivityRule.getActivity().getWindow().getDecorView())))
                .check(matches((isDisplayed())));
    }

    @Test
    public void LoginAsGuestTest() {
        /*
            Instrumentation Test for the user story:
            As a basic user,
            I want a button to log in with my Google account,
            so that I can be logged in to save my settings later.

            SCENARIO:
            Given that I am on the splash screen and I do not wish to log in with Google,
            when I select the Guest button,
            then I get access to the main screen of the app.
          */

        onView(withId(R.id.guest_button)).perform(click());

        onView(withId(R.id.getFoodButton)).check(matches(isDisplayed()));
    }
}

