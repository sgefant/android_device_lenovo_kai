android_device_lenovo_kai
=========================

Lenovo Ideatab A2109A (kai)

This is aosp for Lenovo Ideatab A2109A (kai)

Special thanks to Aospplus developers, who already did most of what I'm trying to accomplish:
  Lloir
  Tom Briden

Special thanks for JB-4.2 to the tf700t developers for Cyanogenmod:
  dasunsrule32
  xplodwild
  nycbjr

Thanks to the A2109A pioneers:
  superhansi
  gmarkall
  kahlo007

|Category |Feature |Working |Not working |Unknown |
|---------|--------|--------|------------|--------|
|EGL | |X | | |
|WLAN | | | | |
|  |Client mode |X | | |
|  |P2P |X | | |
|Bluetooth | |X | |
|  |Send files |X | | |
|  |Receive files | |X | |
|  |Headset | | |X |
|Camera | | |X | |
|  |Preview | | |X |
|  |Regular pictures | | |X |
|  |Panorama pictures | | |X |
|  |SD Video recording | | |X |
|  |HD Video recording | | |X |
|Media | | | | |
|  |Playing videos |X | | |
|  |Playing sound |X | | |
|  |Microphone |X | | |
|GPS | | | |X |
|HDMI out | | | |X |
|USB-OTG | | | |X |

Some basic hardware info
-Bluetooth: BCM4330
-GPS: BCM47511
-WiFi: BCMDHD
-Audio: tegra-aic326x
-Touchscreen: ft5x0x_ts
-Accelerometer: lis3dh
-Ambient light sensor: Solteam JSA1127	
-Back camera: s5k5cag
-Front camera: mt9m114


GPS errors with grouper HAL:
D/libgps  (  385): proxy_gps_set_position_mode()
D/libgps  (  385): gps_set_position_mode: Waiting for IPC connection...
D/libgps  (  385): gps_set_position_mode: Waiting for IPC connection - timeout
E/libgps  (  385): LIBGPS: Cannot communicate (write) with a GPSD
E/libgps  (  385): IPC Communication Error, /tmp/11862727/customers/Asustek/Tabletandroid/../../../proprietary/deliverables/android/gps_interface/../gps_interface/gpsi_client/GpsiClient.cpp:915 gps_set_position_mode
E/GpsLocationProvider(  385): set_position_mode failed in startNavigating()

Working GPS combo's:
tf700 gpsconfig.xml gps.tegra.so and kai glgps


Camera errors:
Vendor skia + jpeg:
E/HAL     (  282): load: module=/system/lib/hw/camera.tegra3.so
E/HAL     (  282): Cannot load library: soinfo_link_image(linker.cpp:1635): could not load library "libandroid_runtime.so" needed by "camera.tegra3.so"; caused by soinfo_relocate(linker.cpp:975): cannot locate symbol 
"_ZN10SkLanguage7getInfoEPKc" referenced by "libandroid_runtime.so"...
E/CameraService(  282): Could not load camera HAL module

Vendor jpeg, aosp skia
E/NvOmxCamera(  111): createCameraObjects: graph creation failed! [0x80001005]
E/NvOmxCamera(  111): NvOmxCamera::createObjects :::: FAIL ::::::::::::::::: [0x80001005]
E/gralloc (  108): failed to load symbol nvcap_video_create (Symbol not found: )

Vendor jpeg, aosp skia, compiled against old libjpeg-turbo
E/gralloc (  107): creating nvcap video capture service
E/NvOmxCamera(  110): createCameraObjects: graph creation failed! [0x80001005]
E/NvOmxCamera(  110): NvOmxCamera::createObjects :::: FAIL ::::::::::::::::: [0x80001005]
E/gralloc (  107): failed to load symbol nvcap_video_create (Symbol not found: )

Vendor skia + jpeg, compiled against old libjpeg-turbo
I/CameraService(  111): CameraService started (pid=111)
E/HAL     (  111): load: module=/system/lib/hw/camera.tegra3.so
E/HAL     (  111): Cannot load library: soinfo_link_image(linker.cpp:1635): could not load library "libandroid_runtime.so" needed by "camera.tegra3.so"; caused by soinfo_relocate(linker.cpp:975): cannot locate symbol 
"_ZN10SkLanguage7getInfoEPKc" referenced by "libandroid_runtime.so"...
E/CameraService(  111): Could not load camera HAL module

