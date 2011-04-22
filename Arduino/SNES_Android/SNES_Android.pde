/**
 * Super Nintendo Controller & Android
 * 
 * SNESpad version: 1.3
 * MeetAndroid version: 3
 * 
 * @author   Bruno Soares
 * @link     www.bsoares.com
 * @language Arduino / C++
 */
#include <SNESpad.h>
#include <MeetAndroid.h>

#define SERIAL_BAUD 57600

#define PIN_STROBE 2
#define PIN_CLOCK 3
#define PIN_DATA 4

SNESpad nintendo = SNESpad(PIN_STROBE, PIN_CLOCK, PIN_DATA);
MeetAndroid meetAndroid;
int state = 0;

void setup()
{
  Serial.begin(SERIAL_BAUD);
}

void loop()
{
  meetAndroid.receive();
  state = nintendo.buttons();
  meetAndroid.send(state);
  
  delay(15);
}
