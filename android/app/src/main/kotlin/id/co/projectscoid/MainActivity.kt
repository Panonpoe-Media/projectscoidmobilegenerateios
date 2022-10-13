package id.co.projectscoid
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.net.Uri
import android.os.AsyncTask
import android.os.Bundle
import android.preference.PreferenceManager
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import android.content.*
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

open class MainActivity: FlutterActivity() {
    private fun getSharedPreference(context: Context): SharedPreferences? {
        return PreferenceManager.getDefaultSharedPreferences(context)
    }
    private fun commitAsync(
        editor: SharedPreferences.Editor, result: Boolean
    ) {
        object : AsyncTask<Void, Void, Boolean>()  {

            override fun doInBackground(vararg params: Void?): Boolean?{

                return editor.commit()
            }

            override protected fun onPostExecute(result: Boolean?) {
                Log.d("DeepLinkingresult123", "new intent value==>${result.toString()}==== value===>")

            }
        }.execute()

    }

    private fun commitAsync1(
        editor: SharedPreferences.Editor, result: Boolean
    ) {
        object : AsyncTask<Void, Void, Boolean>()  {

            override fun doInBackground(vararg params: Void?): Boolean?{

                return editor.commit()
            }

            override protected fun onPostExecute(result: Boolean?) {
                Log.d("DeepLinkingresult123456", "new intent value==>${result.toString()}==== value===>")

            }
        }.execute()

    }

    private val CHANNEL = "mypackage.com/shared_pref_migration"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            when (call.method) {
                "getStringValue" -> {
                    val key: String? = call.argument<String>("key");
                    val file: String? = call.argument<String>("file");

                    when {
                        key == null -> {
                            result.error("KEY_MISSING", "Argument 'key' is not provided.", null)
                        }
                        file == null -> {
                            result.error("FILE_MISSING", "Argument 'file' is not provided.", null)
                        }
                        else -> {
                            val value: String? = getStringValue(file, key)
                            result.success(value)
                        }
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun getStringValue(file: String, key: String): String? {

        val rsl = context.getSharedPreferences(
            file,
            Context.MODE_PRIVATE
        ).getString(key, null)
        commitAsync(getBaseContext().getSharedPreferences(
            "projects_co",
            Context.MODE_PRIVATE
        ).edit().putString("deep_link1",""), true)
        return rsl
    }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // val preferences: SharedPreferences =
        //    getBaseContext().getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
        val sharedPrefs: SharedPreferences = getBaseContext().getSharedPreferences(
            "projects_co",
            Context.MODE_PRIVATE
        )
        // getting the data from our
        // intent in our uri.
        val uri: Uri? = intent.data
        var stringUri: String = ""

        // checking if the uri is null or not.
        if (uri != null) {
            // if the uri is not null then we are getting the
            // path segments and storing it in list.
            val parameters: List<String> = uri.getPathSegments()

            // after that we are extracting string from that parameters.
           // val param = parameters[parameters.size - 1]
            val result = false
            stringUri = uri.toString()
            Log.i("param1", stringUri)
            //sharedPrefs.edit().putString("deep_link1", stringUri)
            //sharedPrefs.edit().apply()
            val res = commitAsync(sharedPrefs.edit().putString("deep_link1",stringUri), result)
           // val editor: SharedPreferences.Editor = preferences.edit()
           // editor.putString("flutter.deep_link",stringUri)

           // editor.commit()
            //commitAsync(preferences.edit().putString("flutter.deep_link",stringUri), result);
        }else{
            val result = false
          //  commitAsync(preferences.edit().putString("flutter.deep_link",""), result);
        }
    }


        override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
          //  val preferences: SharedPreferences =
            //    getBaseContext().getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
            val sharedPrefs: SharedPreferences = getBaseContext().getSharedPreferences(
                "projects_co",
                Context.MODE_PRIVATE
            )


            val uri: Uri? = intent.data
        var stringUri: String = ""
      //  val preferences: SharedPreferences =
      //      getBaseContext().getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
        // checking if the uri is null or not.
        if (uri != null) {
            // if the uri is not null then we are getting the
            // path segments and storing it in list.
            val parameters: List<String> = uri.getPathSegments()

            // after that we are extracting string from that parameters.
            //val param = parameters[parameters.size - 1]
            val result = false
            stringUri = uri.toString()
            Log.i("param", stringUri)
           // val editor: SharedPreferences.Editor = preferences.edit()
           // editor.putString("flutter.deep_link",stringUri)

           // editor.apply()
          // val res = commitAsync(preferences.edit().putString("flutter.deep_link",stringUri), result);
            //sharedPrefs.edit().putString("deep_link1", stringUri)
            //sharedPrefs.edit().apply()
            val res = commitAsync(sharedPrefs.edit().putString("deep_link1",stringUri), result)
            Log.d("DeepLinkingresult", "new intent value==>${result.toString()}==== value===>")
        }else{
            val result = false
           // commitAsync(preferences.edit().putString("flutter.deep_link",""), result);
        }
        Log.d("DeepLinking", "new intent value==>$stringUri==== value===>")
    }
}
