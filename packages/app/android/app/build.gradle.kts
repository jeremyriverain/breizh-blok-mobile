import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

val localProperties = Properties()
val localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.reader().use { reader ->
        localProperties.load(reader)
    }
}

val flutterVersionCode = localProperties.getProperty("flutter.versionCode") ?: "1"
val flutterVersionName = localProperties.getProperty("flutter.versionName") ?: "1.0"

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "fr.geekco.boulders"
    compileSdk = flutter.compileSdkVersion

    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "fr.geekco.boulders"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true

        manifestPlaceholders["auth0Domain"] = "breizh-blok.eu.auth0.com"
        manifestPlaceholders["auth0Scheme"] = "https"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
    }

    dependencies {
        testImplementation("junit:junit:4.12")
        androidTestImplementation("androidx.test:runner:1.2.0")
        androidTestImplementation("androidx.test.espresso:espresso-core:3.2.0")
    }

    signingConfigs {
        create("release") {
            val storePath = System.getenv("SIGNING_STORE_PATH")
            if (!storePath.isNullOrEmpty()) {
                storeFile = file(storePath)
            }
            storePassword = System.getenv("SIGNING_STORE_PASSWORD")
            keyAlias = System.getenv("SIGNING_KEY_ALIAS")
            keyPassword = System.getenv("SIGNING_KEY_PASSWORD")
        }
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
        }
        getByName("debug") {
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    flavorDimensions += "default"
    productFlavors {
        create("staging") {
            dimension = "default"
            applicationIdSuffix = ".staging"
            resValue(
                type = "string",
                name = "app_name",
                value = "Staging Breizh Blok")
        }
        create("prod") {
            dimension = "default"
            applicationIdSuffix = ""
            resValue(
                type = "string",
                name = "app_name",
                value = "Breizh Blok")
        }
    }
}

flutter {
    source = "../.."
}