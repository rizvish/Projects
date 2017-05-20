package com.example.cmsc355.hungr;

import com.google.android.gms.maps.model.LatLng;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;


import java.io.InputStream;

public class ShowRecommendationsFragment extends Fragment implements View.OnClickListener {

    private String restaurantName;
    private String url;
    private LatLng ll;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater,
                             @Nullable ViewGroup container,
                             @Nullable Bundle savedInstanceState) {

        ViewGroup rootView;
        rootView = (ViewGroup) inflater.inflate(R.layout.fragment_slide_page, container, false);

        //Get references to objects, then set them with the values set in
        //'ShowRecommendationsActivity'
        TextView restaurantName = (TextView) rootView.findViewById(R.id.restaurantNameText);
        ImageView restaurantImage = (ImageView) rootView.findViewById(R.id.restaurantImageView);
        restaurantName.setText(this.restaurantName);
        rootView.findViewById(R.id.getDirectionsButton).setOnClickListener(this);

        DownloadImageTask setImage = new DownloadImageTask(restaurantImage);
        setImage.execute(url);
        return rootView;
    }

    //Setters
    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setLoc(LatLng ll) {
        this.ll = ll;
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
            if (urldisplay != null) {
                urldisplay = urldisplay.replace("ms.jpg", "o.jpg");
            }
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

    public void onClick(View view) {
        switch (view.getId()) {
          case R.id.getDirectionsButton:
              //Check to make sure lat and lng are valid
              if (this.ll == null) {
                  Toast.makeText(getContext(),
                          "Restaurant has no location data.", Toast.LENGTH_SHORT)
                          .show();
              } else {
                  Intent mapIntent = new Intent(getContext()
                          .getApplicationContext(),
                          DirectionsActivity.class);
                  mapIntent.putExtra("location", this.ll);
                  startActivity(mapIntent);
              }
              break;
          default:
              break;
        }
    }
}
