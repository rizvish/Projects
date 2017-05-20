/*
    Class donated from https://github.com/Yelp/yelp-api/blob/master/v2/java/TwoStepOAuth.java
    and is NOT the original work of the author(s)
 */

package com.example.cmsc355.hungr;

/**
 * Created by Kyle on 9/23/2016.
 */

import org.scribe.builder.api.DefaultApi10a;
import org.scribe.model.Token;

/**
 * Generic service provider for two-step OAuth10a.
 */
public class TwoStepOAuth extends DefaultApi10a {

    @Override
    public String getAccessTokenEndpoint() {
        return null;
    }

    @Override
    public String getAuthorizationUrl(Token arg0) {
        return null;
    }

    @Override
    public String getRequestTokenEndpoint() {
        return null;
    }
}
