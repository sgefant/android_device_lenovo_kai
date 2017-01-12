android_device_lenovo_kai
=========================

Lenovo Ideatab A2109A (kai)

This is cm-12.1 for Lenovo Ideatab A2109A (kai)

BLUETOOTH
E/bt_osi_config( 1484): config_new unable to open file '/etc/bluetooth/ble_stack.conf': No such file or directory

AUDIT
E/audit_rules(  131): Could not read audit rules /data/misc/audit/audit.rules: No such file or directory

MINIKIN
E/Minikin (  139): addFont failed to create font /system/fonts/NotoSansGujarati-Regular.ttf


Special thanks to the tf700t and tf300t developers for Cyanogenmod:
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
|Bluetooth | | | |
|  |Send files | | |X |
|  |Receive files |X | | |
|  |Headset |X | | |
|  |Browse files | | |X |
|Camera | |X | | |
|  |Preview |X | | |
|  |Regular pictures |X | | |
|  |Panorama pictures |X | | |
|  |SD Video recording |X | | |
|  |HD Video recording |X | | |
|Media | | | | |
|  |Playing videos |X | | |
|  |Playing sound |X | | |
|  |Microphone |X | | |
|Sensors | | | |
|  |GPS |X | | |
|  |Accellerometer |X | | |
|  |Lightsensor |X | | |
|HDMI out | | | |X |
|USB-OTG | | | |X |
|SELinux |X | | | |


Other tegra3 devices and their repos:
grouper (Nexus 7 2012)
https://github.com/CyanogenMod/android_device_asus_grouper
devs: Lloir, jrizzoli, thoemy, dhacker29
https://android.googlesource.com/device/asus/grouper/

tf300t (Asus Transformer Pad TF300T)
https://github.com/CyanogenMod/android_device_asus_tf300t
devs: chrmhoffmann, jruesga, dasunsrule32

tf700t (Asus Transformer Pad Infinity TF700T)
https://github.com/CyanogenMod/android_device_asus_tf700t
devs: jruesga, dasunsrule32, tombriden, rmcc

a500 (Acer Iconia A500 Picasso)
https://github.com/CyanogenMod/android_device_acer_a500

p880 (LG Optimus 4X HD)
https://github.com/CyanogenMod/android_device_lge_p880
devs: Ntemis, rmcc
https://github.com/P880-dev/proprietary_vendor_lge
devs: laufersteppenwolf

endeavoru (HTC One X)
https://github.com/CyanogenMod/android_device_htc_endeavoru
enrc2b (HTC One X+ (international))
https://github.com/cyanogenmod/android_device_htc_enrc2b
https://github.com/CyanogenMod/android_device_htc_tegra3-common
devs: Lloir, thoemy


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

Working GPS combo's:
tf700 gpsconfig.xml gps.tegra.so and kai glgps

Patches
frameworks/native
commit 06e12876cb20d88fa57d3e42eb6ecd0329b555cc
Author: Andrew Dodd <atd7@cornell.edu>
Date:   Fri Feb 20 20:05:25 2015 +0100

    DisplayDevice: Backwards compatibility with old EGL
    
    From 4.1 to 4.2, the display subsystem was reworked to
    use SurfaceTextureClient/BufferQueue instead of
    FramebufferNativeWindow for the framebuffer itself.
    
    Unfortunately, some legacy EGL libraries make assumptions
    that any framebuffer device will be FramebufferNativeWindow.
    
    These EGL libraries will fail when used in 4.2 as if the
    framebuffer is not FramebufferNativeWindow, they will
    try to dequeue more than one buffer at a time, which
    will cause a hang of the graphics subsystem.
    
    This allows use of FramebufferNativeWindow to keep
    legacy EGL implementations happy.  Confirmed EGL
    implementations that need this include but are
    not limited to:
    
    Set BOARD_EGL_NEEDS_FNW to use
    
    Tegra2/3 ICS EGL
    Mali400 ICS EGL (Allwinner A10)
    Mali400 Jellybean (4.1) EGL (Samsung Exynos4)
    Adreno Jellybean (4.1) EGL (legacy qcom devices using PMEM)
    
    Original implementation by OndraOrg of XDA:
    http://forum.xda-developers.com/showpost.php?p=34469675&postcount=19
    
    Change-Id: Iafbfe82edeb1638dae269e4cf5e7ef57a610da23
    Andrew Dodd <atd7@cornell.edu>
    
    (cherry picked from commit 43116b059b874bd37f124b322176ee40ceab6078)

commit 3daf764f603b71e12621f72e0e76c5690b769f4d
Author: Ricardo Cerqueira <cyanogenmod@cerqueira.org>
Date:   Tue Aug 6 16:11:06 2013 +0100

    libgui: Bring back support for mHeap-based screenshots
    
    Older graphics libraries throw a hissy fit when trying to lock
    buffers for Surface-based screenshots, on at least Tegra2/3 and
    Exynos4 hardware.
    
    This patch depends on the BOARD_USE_MHEAP_SCREENSHOT board flag
    and requires the ro.bq.gpu_to_cpu_unsupported property set to 1
    in order to work.
    
    [pawitp: port to Lollipop]
    
    Change-Id: I7db955e2cdd120018e349c14290e975788e70ed3
    (cherry picked from commit d2e77f9e9a130830db134956851f1b5499251332)
    (cherry picked from commit 8d311f69d0e88b7946ef514030292f186ebb1cb9)

commit f4fac7e93f4d5be175c95a795ffed0edabb456f7
Author: Ricardo Cerqueira <cyanogenmod@cerqueira.org>
Date:   Sat Oct 26 03:43:03 2013 +0100

    Support forcing all screenshots into a CPU consumer
    
    Looks like a full GPU path is less efficient on some GPU
    drivers that we're still using, and CPU is reliably faster...
    (there's probably a locking condition going on somewhere, this
    needs to be looked into)
    
    Change-Id: I8878796a117d65bf2324507cf8755cadce49f6dc

commit ff59fbd8198f72fc251677cce4b4d9379318e921
Author: Pawit Pornkitprasan <p.pawit@gmail.com>
Date:   Sat Nov 2 23:02:15 2013 -0700

    libEGL: allow devices to workaround Google bug 10194508
    
    Most older blobs don't have the EGL_KHR_gl_colorspace
    extension and need this workaround.
    
    Change-Id: Ifc5d097c1a0b68275d23c2d191976ac96631b695

commit ce45ceee1b25333286ba46dfb696d4b1ff452405
Author: Ricardo Cerqueira <cyanogenmod@cerqueira.org>
Date:   Fri Feb 20 17:09:49 2015 +0100

    hax: Add back the SURFACE_SKIP_FIRST_DEQUEUE legacy EGL workaround
    
    Set BOARD_EGL_SKIP_FIRST_DEQUEUE to use
    
    Change-Id: Id362e4a557f4ad167cc4774160767813192d0815
    (cherry picked from commit ca0c135723b9af840f31c5de372969d533ebe61f)
    (cherry picked from commit 7d62cf2251cc6b35b419ac0b3fd48046282080c6)

commit e4df02386b32985018fcf60bcd93ae75667581ff
Author: Steve Kondik <shade@chemlab.org>
Date:   Fri Feb 20 17:35:44 2015 +0100

    libgui: squashed update for readding ICS and JB_MR0 support
    
    Squash of the following commits:
    
     - SurfaceComposerClient: bring back getDisplayWidth, Height & Orientation
       enable it with either ICS_CAMERA_BLOB or MR0_CAMERA_BLOB CFLAG       Author: Steve Kondik
     - Add setOrientation back
       this is needed for some tegra ICS and JB_MR0 prebuilts
       Author: Steve Kondik
     - libgui: Add ICS/MR0-compatible client::createSurface constructors
       Author: Steve Kondik
    
    Change-Id: I35abe8e6a2984024935dc9f28a3af9d30695f27a
    (cherry picked from commit 7efec2dec0c4086b7be2a5d4e7d2f850c0e0fcb2)
    (cherry picked from commit bb78952ea4fc993f5e75604dd9f584fb8b0a747c)

commit fd1fb639a1dd9325a9bebb0cd3ca6ebd7d48931d
Author: Pawit Pornkitprasan <p.pawit@gmail.com>
Date:   Tue Nov 18 08:38:33 2014 +0700

    Bring back support for glReadPixels screenshot path
    
    Squashed commit of the following:
    
    commit 012d3fe41d1d6cd38a0858b59145e9a4447641fa
    Author: Hashcode <hashcode0f@gmail.com>
    Date:   Sun Dec 8 19:36:50 2013 +0000
    
        sf: Always use opengles for screen capture
    
        Go back to the usage of GRALLOC_USAGE_HW_TEXTURE and GRALLOC_USAGE_HW_RENDERER
        in captureScreenImplLocked regardless of useReadPixels value
    
        This fixes the EGL_NO_IMAGE_KHR error returned from
        eglCreateImageKHR (blank images returned from screenshot path)
    
        Change-Id: I62fe90a081607b9e89c67f3dcfd34c84efc89d35
    
    commit 4866ddf98ac98d8e22a1cd6a21894bb17f274588
    Author: Ricardo Cerqueira <cyanogenmod@cerqueira.org>
    Date:   Thu Oct 31 03:53:39 2013 +0000
    
        Revert "remove support for glReadPixels screenshot path"
    
        This reverts commit 3ca76f416bc8665a97636ca8a2d0128b9da9d92c.
    
        Conflicts:
            include/gui/ISurfaceComposer.h
            libs/gui/ISurfaceComposer.cpp
            libs/gui/SurfaceComposerClient.cpp
            services/surfaceflinger/SurfaceFlinger.cpp
            services/surfaceflinger/SurfaceFlinger.h
    
        Change-Id: I8c239e533757af770e418dbb198f5a86c736961f
    
    Change-Id: I8c239e533757af770e418dbb198f5a86c736961f


11-04 18:48:39.181   329   329 D NvOsDebugPrintf: NVMEM_IOC_GET_ID failed: Operation not permitted
11-04 18:48:39.193  3125  3188 D AudioFlinger: mixer(0xad8ba008) throttle end: throttle time(7)
11-04 18:48:39.225  2522  2522 D WebViewTimersControl: onBrowserActivityPause
11-04 18:48:39.225  2522  2522 D WebViewTimersControl: Pausing webview timers, view=com.android.browser.BrowserWebView{e6537a VFEDHVCL. .F...... 0,0-1280,664}
11-04 18:48:39.344   810   820 I art     : Background partial concurrent mark sweep GC freed 5478(358KB) AllocSpace objects, 6(396KB) LOS objects, 33% free, 9MB/13MB, paused 8.798ms total 150.937ms
11-04 18:48:41.475   810  1325 D ConnectivityService: notifyType CAP_CHANGED for NetworkAgentInfo [WIFI () - 100]
11-04 18:48:41.901  3125  3188 D AudioFlinger: mixer(0xad8ba008) throttle end: throttle time(6)
11-04 18:48:42.162   810  1439 I ActivityManager: START u0 {act=android.intent.action.MAIN cat=[android.intent.category.HOME] flg=0x10200000 cmp=com.cyanogenmod.trebuchet/com.android.launcher3.Launcher} from uid 10021 
on display 0
11-04 18:48:42.827  1907  2058 W OpenGLRenderer: Incorrectly called buildLayer on View: ShortcutAndWidgetContainer, destroying layer...
11-04 18:48:44.237   810  1396 I ActivityManager: START u0 {act=android.intent.action.MAIN cat=[android.intent.category.LAUNCHER] flg=0x10200000 cmp=com.android.browser/.BrowserActivity bnds=[704,669][817,745] (has 
extras)} from uid 10020 on display 0
11-04 18:48:44.280  2522  2522 D WebViewTimersControl: onBrowserActivityResume
11-04 18:48:44.280  2522  2522 D WebViewTimersControl: Resuming webview timers, view=com.android.browser.BrowserWebView{e6537a VFEDHVCL. .F...... 0,0-1280,664}
11-04 18:48:46.358   810   851 I ActivityManager: START u0 {act=com.android.systemui.recents.SHOW_RECENTS flg=0x10804000 cmp=com.android.systemui/.recents.RecentsActivity} from uid 10021 on display 0
11-04 18:48:46.374   329   329 W SurfaceFlinger: captureScreen: fence wait timed out
11-04 18:48:46.375   329   329 E gralloc : NvGrAddFence: array overflow, dropping fence 22

Correct screenshot:
11-06 20:15:11.912   777  3172 I OpenGLRenderer: Initialized EGL, version 1.4
11-06 20:15:11.966   917   917 D PhoneStatusBar: disable: < EXPAND* icons alerts system_info back home recent clock search quick_settings >
11-06 20:15:14.752   777   803 W InputMethodManagerService: Window already focused, ignoring focus gain of: com.android.internal.view.IInputMethodClient$Stub$Proxy@a3abff6 attribute=null, token = 
android.os.BinderProxy@bfe9c8b
11-06 20:15:14.756   917   917 D PhoneStatusBar: disable: < expand* icons alerts system_info back home recent clock search quick_settings >
11-06 20:15:15.786   344   344 W SurfaceFlinger: captureScreen: fence wait timed out
11-06 20:15:15.788   344   344 E gralloc : NvGrAddFence: array overflow, dropping fence 22


Failed screenshot:
11-06 20:16:14.299   777  3172 I OpenGLRenderer: Initialized EGL, version 1.4
11-06 20:16:14.466   917   917 D PhoneStatusBar: disable: < EXPAND* icons alerts system_info back home recent clock search quick_settings >
11-06 20:16:14.713   777  1940 D NetlinkSocketObserver: NeighborEvent{elapsedMs=3774158, 10.0.0.187, [003018A048E1], RTM_NEWNEIGH, NUD_REACHABLE}
11-06 20:16:16.696   917   917 D PhoneStatusBar: disable: < expand* icons alerts system_info back home recent clock search quick_settings >
11-06 20:16:16.722   777   976 W InputMethodManagerService: Window already focused, ignoring focus gain of: com.android.internal.view.IInputMethodClient$Stub$Proxy@8e1b918 attribute=null, token = 
android.os.BinderProxy@57b8a40
11-06 20:16:17.712   344   344 D NvOsDebugPrintf: NVMEM_IOC_GET_ID failed: Operation not permitted
11-06 20:16:17.792 17135 17150 I OpenGLRenderer: Initialized EGL, version 1.4

