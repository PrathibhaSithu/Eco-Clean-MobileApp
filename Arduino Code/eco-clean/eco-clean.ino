#include <ESP8266Firebase.h>
#include <ESP8266WiFi.h>

#define _SSID "Chiku"                                                            // Your WiFi SSID
#define _PASSWORD "chatnoir"                                                              // Your WiFi Password
#define REFERENCE_URL "https://eco-clean-b0119-default-rtdb.firebaseio.com/"  // Your Firebase project reference url

Firebase firebase(REFERENCE_URL);

// Ultrasonic sensor parameters
const int trigPin = D4;
const int echoPin = D5;
const String binnumber = "332";
String status = "empty";


String checkBinStatus(float distance) {
  String status1 = "empty";
  if (distance < 60) {
    status1 = "full";
  }
  return status1;
}
void setup() {
  Serial.begin(115200);
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, LOW);
  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  delay(1000);

  // Connect to WiFi
  Serial.println();
  Serial.println();
  Serial.print("Connecting to: ");
  Serial.println(_SSID);
  WiFi.begin(_SSID, _PASSWORD);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print("-");
  }

  Serial.println("");
  Serial.println("WiFi Connected");

  // Print the IP address
  Serial.print("IP Address: ");
  Serial.print("http://");
  Serial.print(WiFi.localIP());
  Serial.println("/");
  digitalWrite(LED_BUILTIN, HIGH);

  // Initialize ultrasonic sensor
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
}

void loop() {
  // Read data from ultrasonic sensor
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  long duration = pulseIn(echoPin, HIGH);
  float distance = duration * 0.034 / 2;
  if (!status.equals(checkBinStatus(distance))) {
    status = checkBinStatus(distance);
    // Send data to Firebase
    if (firebase.setString("Bin/" + binnumber + "/status", status)) {
      Serial.print("Data sent to Firebase : ");
      Serial.println(distance);
    } else {
      Serial.println("Failed to send data to Firebase");
      // Serial.println("Reason: " + firebase.errorReason());
    }
  }

  delay(5000);
}
