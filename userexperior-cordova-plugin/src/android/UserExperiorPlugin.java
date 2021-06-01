package com.userexperiorplugin.cordova;

import android.content.Context;
import android.util.Log;
import com.userexperior.UserExperior;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * This class echoes a string called from JavaScript.
 */
public class UserExperiorPlugin extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        try{
            String result = "OK";

            if(action.equals("startRecording")){
				Context context = this.cordova.getActivity().getApplicationContext();
				String ueSdkAppVersionKey = args.getString(0);
                UserExperior.startRecording(context, ueSdkAppVersionKey);
            }

            if(action.equals("stopRecording")){
                UserExperior.stopRecording();
            }

            if(action.equals("pauseRecording")){
                UserExperior.pauseRecording();
            }

            if(action.equals("resumeRecording")){
                UserExperior.resumeRecording();
            }

            if(action.equals("setUserIdentifier")){
                String userIdentifier = args.getString(0);
                UserExperior.setUserIdentifier(userIdentifier);
            }

            if(action.equals("setUserProperties")){
                JSONObject params = args.getJSONObject(0);

                if (params != null && params.length() != 0) {
                    UserExperior.setUserProperties(params);
                }
            }

            if(action.equals("setCustomTag")){
                String customTag = args.getString(0);
				String type = args.getString(1);
                UserExperior.setCustomTag(customTag, type);
            }

            if(action.equals("logEvent")){
                String eventName = args.getString(0);
                if (eventName == null || eventName.length() == 0) {
                    throw new IllegalArgumentException("missing event Name");
                }
                UserExperior.logEvent(eventName);
            }

            if(action.equals("logEventWithProperties")){ 
                String eventName = args.getString(0);
                JSONObject params = args.getJSONObject(1);

                if (eventName == null || eventName.length() == 0) {
                    throw new IllegalArgumentException("missing event Name");
                }
                if (params == null || params.length() == 0) {
                    UserExperior.logEvent(eventName);
                } else {
                    UserExperior.logEvent(eventName, params);
                }
            }

            if(action.equals("logMessage")){
                String messageName = args.getString(0);
                if (messageName == null || messageName.length() == 0) {
                    throw new IllegalArgumentException("missing message Name");
                }
                UserExperior.logMessage(messageName);
            }

            if(action.equals("logMessageWithProperties")){
                String messageName = args.getString(0);
                JSONObject params = args.getJSONObject(1);

                if (messageName == null || messageName.length() == 0) {
                    throw new IllegalArgumentException("missing message Name");
                }
                if (params == null || params.length() == 0) {
                    UserExperior.logMessage(messageName);
                } else {
                    UserExperior.logMessage(messageName, params);
                }
            }

            if(action.equals("startScreen")){
                String screenName = args.getString(0);
                UserExperior.startScreen(screenName);
            }

            if(action.equals("startTimer")){
                String timerName = args.getString(0);
                UserExperior.startTimer(timerName);
            }

            if(action.equals("endTimer")){
                String timerName = args.getString(0);
                UserExperior.endTimer(timerName);
            }

            if(action.equals("endTimerWithProperties")){
                String timerName = args.getString(0);
                JSONObject params = args.getJSONObject(1);

                if (params == null || params.length() == 0) {
                    UserExperior.endTimer(timerName);
                } else {
                    UserExperior.endTimer(timerName, params);
                }
            }

            if (action.equals("setDeviceLocation"))
            {
                double latitude = args.getDouble(0);
                double longitude = args.getDouble(1);
                UserExperior.setDeviceLocation(latitude, longitude);
            }
            
            if (action.equals("optIn"))
            {
                UserExperior.optIn();
            }
            
            if (action.equals("optOut"))
            {
                UserExperior.optOut();
            }
            
            if (action.equals("getOptOutStatus"))
            {
                UserExperior.getOptOutStatus();
            }
            
            if (action.equals("consent"))
            {
                UserExperior.consent();
            }

            if (action.equals("isRecording"))
            {
                callbackContext.success(UserExperior.isRecording() ? "true" : "false");
            }

            callbackContext.success(result);

            return true;
        } catch (Exception e){
            Log.e("UserExperiorPlugin", "Error in UserExperiorPlugin for Cordova: " + e);
            callbackContext.error("Error in UserExperiorPlugin for Cordova. Exception:" + e);
            return false;
        }
    }
}
