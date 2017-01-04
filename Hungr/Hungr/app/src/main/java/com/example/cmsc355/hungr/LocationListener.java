package com.example.cmsc355.hungr;

import android.location.Location;
import android.os.Bundle;

/**
 * Created by Kyle on 10/6/2016.
 */

public class LocationListener implements android.location.LocationListener{
    private double longitude;
    private double latitude;

    @Override
    public void onLocationChanged(Location location) {
        longitude = location.getLongitude();
        latitude = location.getLatitude();
    }

    public double retLongitude(){
        return this.longitude;
    }
    public double retLatitude(){
        return this.latitude;
    }

    @Override
    public void onStatusChanged(String provider, int status, Bundle extras) {

    }

    @Override
    public void onProviderEnabled(String provider) {

    }

    @Override
    public void onProviderDisabled(String provider) {

    }
}
