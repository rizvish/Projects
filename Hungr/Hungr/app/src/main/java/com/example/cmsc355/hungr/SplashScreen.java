package com.example.cmsc355.hungr;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.google.android.gms.auth.api.Auth;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.auth.api.signin.GoogleSignInResult;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient;

/**
 * Created by rizvish on 9/19/16.
 */
public class SplashScreen extends FragmentActivity implements GoogleApiClient.OnConnectionFailedListener, View.OnClickListener {
    private GoogleApiClient mGoogleApiClient;
    private static final int RC_SIGN_IN = 9001;
    private static final String TAG = "SplashScreen";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.splash);

        GoogleSignInOptions gso = new GoogleSignInOptions.Builder(GoogleSignInOptions.DEFAULT_SIGN_IN)
                .build();

        mGoogleApiClient = new GoogleApiClient.Builder(this)
                .enableAutoManage(this /* FragmentActivity */, this /* conConnectionFailedListener */)
                .addApi(Auth.GOOGLE_SIGN_IN_API, gso)
                .build();

        findViewById(R.id.sign_in_button).setOnClickListener(this);

    }

    @Override
    public void onConnectionFailed(ConnectionResult connectionResult) {
        /* do some shit */
    }

    @Override
    public void onClick(View v) {
        Log.d(TAG, "Got click on " +  v.getId());
        /* do the sign in */
        switch (v.getId()) {
            case R.id.sign_in_button:
                signIn();
                break;
            case R.id.guest_button:
                continueToHome();
                break;
        }
    }

    private void signIn() {
        Intent signInIntent = Auth.GoogleSignInApi.getSignInIntent(mGoogleApiClient);
        startActivityForResult(signInIntent, RC_SIGN_IN);
    }

    private void continueToHome() {
        Intent openStart = new Intent("com.example.cmsc355.hungr.MAINACTIVITY");
        startActivity(openStart);
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        // Result returned from launching the Intent from GoogleSignInApi.getSignInIntent(...);
        if (requestCode == RC_SIGN_IN) {
            GoogleSignInResult result = Auth.GoogleSignInApi.getSignInResultFromIntent(data);
            handleSignInResult(result);
        }
    }

    private void handleSignInResult(GoogleSignInResult result) {
        Log.d(TAG, "handleSignInResult:" + result.isSuccess());
        Toast toast;
        if (result.isSuccess()) {
            // Signed in successfully, show authenticated UI.
            GoogleSignInAccount acct = result.getSignInAccount();
            toast = Toast.makeText(getApplicationContext(), acct.getDisplayName(), Toast.LENGTH_SHORT);
            toast.show();
            continueToHome();
        } else {
            Toast.makeText(getApplicationContext(), "Oops we couldn't log you in.", Toast.LENGTH_SHORT).show();
        }
    }
}
