#
# Copyright (C) 2014 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_PACKAGES := \
    gralloc.minigbm_msm \
    android.hardware.graphics.allocator@4.0-service.minigbm_msm \
    android.hardware.graphics.mapper@4.0-impl.minigbm_msm

PRODUCT_PROPERTY_OVERRIDES := \
    ro.hardware.gralloc=minigbm_msm
