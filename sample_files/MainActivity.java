// TODO package

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import com.microblink.flutter.MicroblinkFlutterPlugin;

public class MainActivity extends FlutterActivity {
  @Override
  public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    MicroblinkFlutterPlugin.registerWith(registrarFor("com.microblink.flutter.MicroblinkFlutterPlugin"));
  }
}