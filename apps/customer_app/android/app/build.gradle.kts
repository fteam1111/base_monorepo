plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
    // END: FlutterFire Configuration
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.bikeTracker"
    compileSdk = 36
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.bikeTracker"
        minSdk = flutter.minSdkVersion
        targetSdk = 36  // Match with compileSdk
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    flavorDimensions += listOf("env")

    // manifestPlaceholders dùng để định nghĩa các biến có thể được sử dụng trong AndroidManifest.xml
    // example:
    //            manifestPlaceholders += mapOf(
    //                "mapsApiKey" to "AIzaSyStaging_Key_67890",
    //                "baseUrl" to "https://staging-api.example.com",
    //                "deepLinkScheme" to "myapp-staging",
    //                "fileProviderAuthority" to "com.example.myapp.staging.fileprovider",
    //                "facebookAppId" to "123456789_staging"
    //            )
    // use in AndroidManifest.xml like this:
    //            <meta-data
    //                android:name="com.google.android.geo.API_KEY"
    //                android:value="${mapsApiKey}"/>
    productFlavors {
        create("dev") {
            dimension = "env"
            applicationIdSuffix = ".dev"
            resValue("string", "app_name", "BikeTracker Dev")
            manifestPlaceholders["mapKey"] = "key_dev"
        }

        create("uat") {
            dimension = "env"
            applicationIdSuffix = ".uat"
            resValue("string", "app_name", "BikeTracker Uat")
            manifestPlaceholders["mapKey"] = "key_uat"
        }

        create("prd") {
            dimension = "env"
            resValue("string", "app_name", "BikeTracker")
            manifestPlaceholders["mapKey"] = "key_prd"
        }
    }
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
    implementation("com.google.firebase:firebase-crashlytics")
    implementation("com.google.firebase:firebase-analytics")
}

flutter {
    source = "../.."
}