package com.userexperiorplugin.cordova;

import android.content.Context;
import android.util.Log;
import com.userexperior.UserExperior;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;
import org.json.JSONException;

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

            if(action.equals("setCustomTag")){
                String customTag = args.getString(0);
				String type = args.getString(1);
                UserExperior.setCustomTag(customTag, type);
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

            callbackContext.success(result);

            return true;
        } catch (Exception e){
            Log.e("UserExperiorPlugin", "Error in UserExperiorPlugin for Cordova: " + e);
            callbackContext.error("Error in UserExperiorPlugin for Cordova. Exception:" + e);
            return false;
        }
    }
}
