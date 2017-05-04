package com.example.cmsc355.hungr;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiManager;
import android.support.test.espresso.IdlingResource;
import android.util.Log;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * Created by Eric Darling on 9/30/2016.
 * Use with Espresso.registerIdlingResources in a a test file.
 * Runs an asynchronous task in the background, and waits until
 * that task has completed before resuming the test.
 */

public class NetworkConnectionIdlingResource implements IdlingResource {

    private ResourceCallback resourceCallback;
    private boolean disconnected;
    private ConnectivityManager connManager;

    public NetworkConnectionIdlingResource (ConnectivityManager wifi) {
        connManager = wifi;
        disconnected = false;
    }

    @Override
    public String getName() {
        return NetworkConnectionIdlingResource.class.getName();
    }

    @Override
    public boolean isIdleNow() {

        if (disconnected) return true;
        if (connManager == null) return false;

        disconnected = !connManager.getActiveNetworkInfo().isConnected();
        // (wifiManager.getWifiState() == WifiManager.WIFI_STATE_DISABLED);

        Log.d("Testing-Log: ", "isIdleNow() called, disconnected status = " + disconnected);

        if (disconnected) {
            resourceCallback.onTransitionToIdle();
        }

        return disconnected;
    }

    @Override
    public void registerIdleTransitionCallback (ResourceCallback resourceCallback) {
        this.resourceCallback = resourceCallback;
    }

    /*
        Code for this method modified from
        http://stackoverflow.com/a/11555457/6896580
        An answer to the question: "Enable/disable data connection in android programmatically"

    private void setMobileDataEnabled (ConnectivityManager con, boolean enabled) {

        try {
            final ConnectivityManager conman = con;
            final Class conmanClass = Class.forName(conman.getClass().getName());
            final Field iConnectivityManagerField = conmanClass.getDeclaredField("mService");
            iConnectivityManagerField.setAccessible(true);
            final Object iConnectivityManager = iConnectivityManagerField.get(conman);
            final Class iConnectivityManagerClass = Class.forName(iConnectivityManager.getClass().getName());
            final Method setMobileDataEnabledMethod = iConnectivityManagerClass.getDeclaredMethod("setMobileDataEnabled", Boolean.TYPE);
            setMobileDataEnabledMethod.setAccessible(true);

            setMobileDataEnabledMethod.invoke(iConnectivityManager, enabled);
        }
        catch (Exception e) {e.printStackTrace();}

        Method dataMtd = null;
        try {
            dataMtd = ConnectivityManager.class.getDeclaredMethod("setMobileDataEnabled", boolean.class);
        } catch (NoSuchMethodException e) {e.printStackTrace();}
        dataMtd.setAccessible(true);
        try {
            dataMtd.invoke(con, true);
        } catch (IllegalArgumentException e) {e.printStackTrace();
        } catch (IllegalAccessException e) {e.printStackTrace();
        } catch (InvocationTargetException e) {e.printStackTrace();}
    }
    */

    /*
        Code for this method modified from
        http://stackoverflow.com/q/11555366/6896580
        An answer to the question: "Enable/disable data connection in android programmatically"
     */
    void enableInternet(boolean enable){}

    /*
        Code for this method modified from
        http://stackoverflow.com/questions/4008627/how-to-put-an-avd-emulator-into-offline-mode
     */
    void disableDataByADBShell() {
        try {
            Process process = Runtime.getRuntime().exec("adb shell svc data disable");
            BufferedReader bufferedReader = new BufferedReader(
                    new InputStreamReader(process.getInputStream()));
        } catch (IOException e) {}
    }
}