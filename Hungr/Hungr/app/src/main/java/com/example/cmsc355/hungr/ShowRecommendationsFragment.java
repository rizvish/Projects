package com.example.cmsc355.hungr;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import java.io.InputStream;

public class ShowRecommendationsFragment extends Fragment {

    private String restaurantName;
    private String url;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        ViewGroup rootView = (ViewGroup) inflater.inflate(R.layout.fragment_slide_page, container, false);

        //Get references to objects, then set them with the values set in
        //'ShowRecommendationsActivity'
        TextView restaurantName = (TextView) rootView.findViewById(R.id.restaurantNameText);
        ImageView restaurantImage = (ImageView) rootView.findViewById(R.id.restaurantImageView);
        restaurantName.setText(this.restaurantName);
        DownloadImageTask setImage = new DownloadImageTask(restaurantImage);
        setImage.execute(url);
        return rootView;
    }

    //Setters
    public void setRestaurantName(String restaurantName){
        this.restaurantName = restaurantName;
    }
    public void setURL(String url){
        this.url = url;
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
            Bitmap mIcon11 = null;
            try {
                InputStream in = new java.net.URL(urldisplay).openStream();
                mIcon11 = BitmapFactory.decodeStream(in);
            } catch (Exception e) {
                //Log.e("Error", e.getMessage());
                e.printStackTrace();
            }
            return mIcon11;
        }
        protected void onPostExecute(Bitmap result) {
            bmImage.setImageBitmap(result);
        }
    }
}
