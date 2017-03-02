/* 
 * Copyright (C) 2015 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <system/window.h>
#include <ui/PixelFormat.h>
#include <ui/Rect.h>
#include <gui/SurfaceControl.h>

namespace android {
extern "C" {
// ---------------------------------------------------------------------------

    /* status_t SurfaceControl::setLayer */
    //Needed by libnvwinsys.so //libgui
    status_t _ZN7android14SurfaceControl8setLayerEj( uint32_t layer);
    status_t _ZN7android14SurfaceControl8setLayerEi( int32_t layer) {
        return _ZN7android14SurfaceControl8setLayerEj( (uint32_t)layer);
    }

    /* status_t SurfaceControl::setPosition */
    //Needed by libnvwinsys.so //libgui
    status_t _ZN7android14SurfaceControl11setPositionEff(float x, float y);
    status_t _ZN7android14SurfaceControl11setPositionEii(int32_t x, int32_t y) {
        return _ZN7android14SurfaceControl11setPositionEff((float)x, (float)y);
    }
// ---------------------------------------------------------------------------

    //Needed by libnvcap.so //libbinder
    // Backwards compatibility for libdatabase_sqlcipher (http://b/8253769).
    void _ZN7android10MemoryBaseC1ERKNS_2spINS_11IMemoryHeapEEEij(void*, void*, ssize_t, size_t);
    void _ZN7android10MemoryBaseC1ERKNS_2spINS_11IMemoryHeapEEElj(void* obj, void* h, long o, unsigned int size) {
        _ZN7android10MemoryBaseC1ERKNS_2spINS_11IMemoryHeapEEEij(obj, h, o, size);
    }
// ---------------------------------------------------------------------------

} // extern "C"
}; // namespace android
