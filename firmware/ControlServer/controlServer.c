#include <WiServer.h>

#define WIRELESS_MODE_INFRA	1
#define WIRELESS_MODE_ADHOC	2

// Wireless configuration parameters ----------------------------------------
unsigned char local_ip[] = {192,168,1,2};	// IP address of WiShield
unsigned char gateway_ip[] = {192,168,1,1};	// router or gateway IP address
unsigned char subnet_mask[] = {255,255,255,0};	// subnet mask for the local network
const prog_char ssid[] PROGMEM = {"ASYNCLABS"};		// max 32 bytes

unsigned char security_type = 0;	// 0 - open; 1 - WEP; 2 - WPA; 3 - WPA2

// WPA/WPA2 passphrase
const prog_char security_passphrase[] PROGMEM = {"12345678"};	// max 64 characters

// WEP 128-bit keys
// sample HEX keys
prog_uchar wep_keys[] PROGMEM = { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d,	// Key 0
				  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	// Key 1
				  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,	// Key 2
				  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00	// Key 3
				};

// setup the wireless mode
// infrastructure - connect to AP
// adhoc - connect to another WiFi device
unsigned char wireless_mode = WIRELESS_MODE_INFRA;

unsigned char ssid_len;
unsigned char security_passphrase_len;
// End of wireless configuration parameters ----------------------------------------

boolean handleVerb(char *verb, char *saveptr) {
    char delims[] = "/";
    char *action = strtok_r(NULL, delims, &saveptr);
    if (strcmp(verb, "qtemp")) {
        return handleQtemp(action, saveptr);
    }
    else if (strcmp(verb, "mtemp")) {
        return getMtemp();
    }
    else if (strcmp(verb, "time")) {
        return handleTime(action, saveptr);
    }
    return false;
}

boolean handleQtemp(char *action, char *saveptr) {
    if (strcmp(action, "set")) {
        char delims[] = "/";
        char *value = strtok_r(NULL, delims, &saveptr);
        return setQtemp(value);
    }
    else if (strcmp(action, "get")) {
        return getQtemp();
    }
    return false;
}

boolean handleTime(char *action, char *saveptr) {
    if (strcmp(action, "set")) {
        char delims[] = "/";
        char *value = strtok_r(NULL, delims, &saveptr);
        return setTime(value);
    }
    else if (strcmp(action, "get")) {
      return getTime();
    }
    return false;
}

char[] HEADER = "<!DOCTYPE html>";

boolean getQtemp() {
  WiServer.print(HEADER);
  /* code */
}

boolean setQtemp() {
  /* code */
}

boolean getMtemp() {
  WiServer.print(HEADER);
  /* code */
}

boolean getTime() {
  WiServer.print(HEADER);
  /* code */
}

boolean setTime() {
  /* code */
}

// This is our page serving function that generates web pages
boolean handleRequests(char* URL) {
    char delims[] = "/";
    char *saveptr;
    char *verb = strtok_r(URL + 1, delims, &saveptr);
    return handleVerb(verb, saveptr);


    if (result != NULL) {
    }
    result = strtok(NULL, delims);
    // Check if the requested URL matches "/"
    if (strcmp(target, "/") == 0) {
        // Use WiServer's print and println functions to write out the page content
        WiServer.print("<html>");
        WiServer.print("Hello World!");
        WiServer.print("</html>");

        // URL was recognized
        return true;
    }
    // URL not found
}


void setup() {
  // Initialize WiServer and have it use the sendMyPage function to serve pages
  WiServer.init(handleRequests);

  // Enable Serial output and ask WiServer to generate log messages (optional)
  Serial.begin(57600);
  WiServer.enableVerboseMode(true);
}

void loop(){

  // Run WiServer
  WiServer.server_task();

  delay(10);
}

