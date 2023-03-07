package com.microblink.blinkid.flutter.recognizers;

import com.microblink.blinkid.entities.recognizers.Recognizer;
import com.microblink.blinkid.entities.recognizers.RecognizerBundle;
import com.microblink.blinkid.flutter.recognizers.serialization.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;

public enum RecognizerSerializers {
    INSTANCE;

    private HashMap<String, RecognizerSerialization> mByJSONName = new HashMap<>();
    private HashMap<Class<?>, RecognizerSerialization> mByClass = new HashMap<>();

    private void registerMapping( RecognizerSerialization recognizerSerialization ) {
        mByJSONName.put(recognizerSerialization.getJsonName(), recognizerSerialization);
        mByClass.put(recognizerSerialization.getRecognizerClass(), recognizerSerialization);
    }

    RecognizerSerializers() {
        registerMapping(new SuccessFrameGrabberRecognizerSerialization());
        registerMapping(new BlinkIdMultiSideRecognizerSerialization());
        registerMapping(new BlinkIdSingleSideRecognizerSerialization());
        registerMapping(new DocumentFaceRecognizerSerialization());
        registerMapping(new IdBarcodeRecognizerSerialization());
        registerMapping(new MrtdCombinedRecognizerSerialization());
        registerMapping(new MrtdRecognizerSerialization());
        registerMapping(new PassportRecognizerSerialization());
        registerMapping(new VisaRecognizerSerialization());
        registerMapping(new UsdlRecognizerSerialization());
        registerMapping(new UsdlCombinedRecognizerSerialization());
        
    }

    public RecognizerSerialization getRecognizerSerialization(JSONObject jsonRecognizer) throws JSONException {
        return mByJSONName.get(jsonRecognizer.getString("recognizerType"));
    }

    public RecognizerSerialization getRecognizerSerialization(Recognizer<?> recognizer) {
        return mByClass.get(recognizer.getClass());
    }

    public RecognizerBundle deserializeRecognizerCollection(JSONObject jsonRecognizerCollection) {
        try {
            JSONArray recognizerArray = jsonRecognizerCollection.getJSONArray("recognizerArray");
            int numRecognizers = recognizerArray.length();
            Recognizer<?>[] recognizers = new Recognizer[numRecognizers];
            for (int i = 0; i < numRecognizers; ++i) {
                recognizers[ i ] = getRecognizerSerialization(recognizerArray.getJSONObject(i)).createRecognizer(recognizerArray.getJSONObject(i));
            }
            RecognizerBundle recognizerBundle = new RecognizerBundle(recognizers);
            recognizerBundle.setAllowMultipleScanResultsOnSingleImage(jsonRecognizerCollection.optBoolean("allowMultipleResults", false));
            recognizerBundle.setNumMsBeforeTimeout(jsonRecognizerCollection.optInt("milisecondsBeforeTimeout", 10000));

            return recognizerBundle;
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
    }

    public JSONArray serializeRecognizerResults(Recognizer<?>[] recognizers) {
        JSONArray jsonArray = new JSONArray();

        for (Recognizer<?> recognizer : recognizers) {
            jsonArray.put(getRecognizerSerialization(recognizer).serializeResult(recognizer));
        }

        return jsonArray;
    }

}