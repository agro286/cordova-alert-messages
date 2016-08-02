import android.app.AlertDialog;
import android.content.DialogInterface;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.chromium.ui.widget.Toast;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * This class echoes a string called from JavaScript.
 */
public class AlertMessages extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, final CallbackContext callbackContext) throws JSONException {
        Runnable runnable = new Runnable() {
            @Override
            public void run() {
                AlertDialog.Builder alertDialog = new AlertDialog.Builder(cordova.getActivity().getApplicationContext());
                alertDialog.setTitle("SO");
                alertDialog.setMessage("SO und SO");
                alertDialog.setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        callbackContext.success("aadas");
                    }
                });
                alertDialog.show();
            }
        };

        if (action.equals("echo")) {
            String message = args.getString(0);
            cordova.getActivity().runOnUiThread(runnable);
            return true;
        }
        return false;
    }

    private void echo(String message, CallbackContext callbackContext) {
        if (message != null && message.length() > 0) {
            callbackContext.success(message);
        } else {
            callbackContext.error("Expected one non-empty string argument.");
        }
    }
}