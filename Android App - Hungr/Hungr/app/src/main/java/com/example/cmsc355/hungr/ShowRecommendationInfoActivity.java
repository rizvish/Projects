package com.example.cmsc355.hungr;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.telephony.TelephonyManager;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.InputStream;

public class ShowRecommendationInfoActivity
        extends AppCompatActivity
        implements GestureDetector.OnGestureListener, View.OnClickListener {

    private JSONObject restaurantJson;
    private GestureDetector gestureDetector;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_show_recommendation_info);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar.setVisibility(View.GONE);

        TextView name = (TextView) findViewById(R.id.sriRestaurantName);
        ImageView restaurantPicture = (ImageView) findViewById(R.id.sriImageView);
        TextView address = (TextView) findViewById(R.id.sriAddressP1);
        TextView address1 = (TextView) findViewById(R.id.sriAddressP2);
        TextView phoneNumber = (TextView) findViewById(R.id.sriPhoneNumber);
        ImageView averageReview = (ImageView) findViewById(R.id.sriAverageReviewIcon);
        TextView review = (TextView) findViewById(R.id.sriExampleReview);

        findViewById(R.id.yelpButton).setOnClickListener(this);

        try {
            Bundle extras = getIntent().getExtras();
            restaurantJson = new JSONObject(extras.getString("getBusinessArray"));
            restaurantJson = getJsonForMockito();

            String restaurantName = restaurantJson.getString("name");

            //Unit Test 1 Call
            restaurantName = capitalizeRestaurantName(restaurantName);

            name.setText(restaurantName);
            if (!restaurantJson.getString("display_phone").equals("")) {
                phoneNumber.setText(restaurantJson.getString("display_phone"));
            } else {
                phoneNumber.setText("No Phone Number Given");
            }
            JSONObject locationJson = restaurantJson.getJSONObject("location");
            JSONArray locationJsonArray = locationJson.getJSONArray("display_address");
            String addressText;
            String addressText1;
            if (locationJsonArray.length() == 0) {
                address.setText("No Address Given");
            }
            if (locationJsonArray.length() > 0) {
                addressText = locationJsonArray.get(0).toString();
                address.setText(addressText);
            }
            if (locationJsonArray.length() > 1) {
                addressText1 = locationJsonArray.get(1).toString();
                address1.setText(addressText1);
            }
            if (hasReviewSnippet(restaurantJson)) {
                review.setText(restaurantJson.getString("snippet_text"));
            } else {
                review.setText("No Reviews Given");
            }

            DownloadImageTask downloadImageTask = new DownloadImageTask(restaurantPicture);
            downloadImageTask.execute(restaurantJson.getString("image_url"));
            DownloadImageTask downloadImageTask1 = new DownloadImageTask(averageReview);
            downloadImageTask1.execute(restaurantJson.getString("rating_img_url_small"));
        } catch (Exception exception) {
            System.out.println("Fail 3");
            exception.printStackTrace();
        }

        //Create the GestureDector and set it to this layout
        gestureDetector = new GestureDetector(this);
        findViewById(R.id.content_show_recommendation_info)
                .setOnTouchListener(new View.OnTouchListener() {
                    @Override
            public boolean onTouch(View view, MotionEvent event) {
                        return gestureDetector.onTouchEvent(event);
                        }
                    });
    }

    // Unit Test 1
    public String capitalizeRestaurantName(String restaurantName) {
        String fixedRestaurantName = "";
        String[] nameParts = restaurantName.split(" ");
        for (String str : nameParts) {
            if (str.length() == 1) {
                str = str.substring(0,1).toUpperCase();
            } else if (str.length() > 1) {
                str = str.substring(0,1).toUpperCase()
                        + str.substring(1, str.length());
            }
            fixedRestaurantName += str + " ";
        }
        fixedRestaurantName = fixedRestaurantName.trim();
        return fixedRestaurantName;
    }

    // Unit Test 5
    public boolean hasReviewSnippet(JSONObject restaurantJson) {
        try {
            String snippetText = restaurantJson.getString("snippet_text");
            if (snippetText.equals("") || snippetText == null) {
                return false;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return true;
    }

    public void onPhoneNumberClick(View view) {
        if (view.getId() == R.id.sriPhoneNumber) {
            TextView sriPhoneNumberText = (TextView) view.findViewById(R.id.sriPhoneNumber);
            String phoneNumber = sriPhoneNumberText.getText().toString();
            String intentPhoneNumber = "";

            // Unit Test 2 Call
            intentPhoneNumber = makeIntentPhoneNumber(phoneNumber);

            // Unit Test 8 call
            if (hasProperPhoneNumber(phoneNumber) && isTelephonyEnabled()) {
                Intent intent = new Intent(Intent.ACTION_DIAL);
                intent.setData(Uri.parse(intentPhoneNumber));
                startActivity(intent);
            } else if (intentPhoneNumber.length() > 0 && intentPhoneNumber.length() < 15) {
                Toast.makeText(this, "Full Phone Number Not Given", Toast.LENGTH_SHORT);
            } else {
                Toast.makeText(this, "No Phone Number Given", Toast.LENGTH_SHORT);
            }
        }
    }

    // Unit Test 2
    public String makeIntentPhoneNumber(String phoneNumber) {
        String intentPhoneNumber = "";
        for (int i = 0; i < phoneNumber.length(); i++) {
            if (phoneNumber.charAt(i) != '+' && phoneNumber.charAt(i) != '-') {
                intentPhoneNumber += phoneNumber.charAt(i);
            }
        }
        intentPhoneNumber = "tel:" + intentPhoneNumber;
        return intentPhoneNumber;
    }

    // Unit Test 8
    public boolean hasProperPhoneNumber(String phoneNumber) {
        if (phoneNumber.equals("No Phone Number Given")) {
            return false;
        }
        if (phoneNumber.length() != 15) {
            return false;
        }
        return true;
    }

    //Method donated from
    //http://stackoverflow.com/questions/16236504/no-activity-found-to-handle-intent-with-action-dial
    private boolean isTelephonyEnabled() {
        TelephonyManager telephonyManager = (TelephonyManager)getSystemService(TELEPHONY_SERVICE);
        return telephonyManager != null
                && telephonyManager.getSimState() == TelephonyManager.SIM_STATE_READY;
    }

    public JSONObject getJsonForMockito() {
        return restaurantJson;
    }

    public void clickSampleReview(View view) {
        if (view.getId() == R.id.sriExampleReview) {
            Toast.makeText(this, "You clicked the review!", Toast.LENGTH_SHORT).show();
        }

    }
    // Overrides for Gesture Detector

    @Override
    public boolean onDown(MotionEvent motionEvent) {
        return true;
    }

    @Override
    public void onShowPress(MotionEvent motionEvent) {

    }

    @Override
    public boolean onSingleTapUp(MotionEvent motionEvent) {
        return false;
    }

    @Override
    public boolean onScroll(MotionEvent motionEvent, MotionEvent motionEvent1, float v1, float v2) {
        return false;
    }

    @Override
    public void onLongPress(MotionEvent motionEvent) {

    }

    @Override
    public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent1, float v1, float v2) {
        if (motionEvent1.getY() - motionEvent.getY() > 80 && Math.abs(1) > 50) {
            finish();
            return true;
        }
        return false;
    }

    public void onClick(View view) {
        switch (view.getId()) {
          case R.id.yelpButton:
              //Redirect to Yelp
              try {
                  String restUrl = restaurantJson.getString("mobile_url");
                  Intent yelpIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(restUrl));
                  startActivity(yelpIntent);
              } catch (JSONException exception) {
                  Toast.makeText(getApplicationContext(),
                          "No valid restaurant URL!",
                          Toast.LENGTH_SHORT).show();
              }
              break;
          default:
              break;
        }
    }

    //Class DownloadImageTask donated from http://stackoverflow.com/questions/5776851/load-image-from-url
    //and is NOT the original work of the author(s)
    private class DownloadImageTask extends AsyncTask<String, Void, Bitmap> {
        ImageView bmImage;

        public DownloadImageTask(ImageView bmImage) {
            this.bmImage = bmImage;
        }

        protected Bitmap doInBackground(String... urls) {
            String urldisplay = urls[0];
            urldisplay = urldisplay.replace("ms.jpg", "o.jpg");
            Bitmap mapIcon = null;
            try {
                InputStream in = new java.net.URL(urldisplay).openStream();
                mapIcon = BitmapFactory.decodeStream(in);
            } catch (Exception ex) {
                //Log.e("Error", e.getMessage());
                ex.printStackTrace();
            }
            return mapIcon;
        }

        protected void onPostExecute(Bitmap result) {
            bmImage.setImageBitmap(result);
        }
    }
}
