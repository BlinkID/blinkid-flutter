// TODO package

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import com.microblink.blinkid_flutter.BlinkidFlutterPlugin;

public class MainActivity extends FlutterActivity {
  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    BlinkidFlutterPlugin.registerWith(registrarFor("com.microblink.blinkid_flutter.BlinkidFlutterPlugin"));
  }
}