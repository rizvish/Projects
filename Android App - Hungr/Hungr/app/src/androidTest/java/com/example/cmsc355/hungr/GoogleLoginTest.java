package com.example.cmsc355.hungr;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Intent;
import android.support.test.espresso.intent.rule.IntentsTestRule;
import android.support.test.runner.AndroidJUnit4;

import com.google.android.gms.auth.api.Auth;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

import static android.content.Intent.ACTION_MAIN;
import static android.support.test.espresso.Espresso.pressBack;
import static android.support.test.espresso.intent.Intents.intended;
import static android.support.test.espresso.intent.Intents.intending;
import static android.support.test.espresso.intent.matcher.IntentMatchers.hasAction;
import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.intent.matcher.IntentMatchers.hasComponent;
import static android.support.test.espresso.intent.matcher.IntentMatchers.isInternal;
import static android.support.test.espresso.intent.matcher.IntentMatchers.toPackage;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static org.hamcrest.core.IsNot.not;

@RunWith(AndroidJUnit4.class)

public class GoogleLoginTest {

    @Rule
    public IntentsTestRule<SplashScreen> mIntentsRule =
            new IntentsTestRule<>(SplashScreen.class);

    @Before
    public void stubGoogleLoginIntent()
    {
        // "By default Espresso Intents does not stub any Intents. Stubbing needs to be setup before
        // every test run. In this case all external Intents will be blocked."
        // From: http://stackoverflow.com/questions/35211950/how-to-test-intent-based-on-espresso-in-android/35214915#35214915

        intending(not(isInternal())).respondWith(new Instrumentation.ActivityResult(Activity.RESULT_OK, null));
    }

    @Test
    public void LoginWithGoogleTest() {
        /*
            Instrumentation Test for the user story:
            As a basic user,
            I want a button to log in with my Google account,
            so that I can be logged in to save my settings later.

            SCENARIO:
            Given that I am on the splash screen for the app,
            when I click the Google button,
            then I have the option to log in with my Google account.
         */

        onView(withId(R.id.sign_in_button)).perform(click());

        // Ensure the main Google Login intent has launched.
        intending(toPackage("com.google.android.gms"));

        /*
        Intent resultData = new Intent();
        resultData.setData();
        Instrumentation.ActivityResult result = new Instrumentation.ActivityResult(Activity.RESULT_OK, resultData);
        intending(toPackage("com.google.android-gms)).respondWith(result);
        */
    }
}