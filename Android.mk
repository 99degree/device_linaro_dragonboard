#
# Copyright (C) 2015 The Android Open-Source Project
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

# WARNING: Everything listed here will be built on ALL platforms,
# including x86, the emulator, and the SDK.  Modules must be uniquely
# named (liblights.panda), and must build everywhere, or limit themselves
# to only building on ARM if they include assembly. Individual makefiles
# are responsible for having their own logic, for fine-grained control.

ifneq ($(filter db845c rb5 linaro_swr, $(TARGET_BOARD_PLATFORM)),)

LOCAL_PATH := $(call my-dir)

$(eval $(call declare-1p-copy-files,device/linaro/dragonboard,.conf))
$(eval $(call declare-1p-copy-files,device/linaro/dragonboard,.kl))
$(eval $(call declare-1p-copy-files,device/linaro/dragonboard,.policy))
$(eval $(call declare-1p-copy-files,device/linaro/dragonboard,.rc))
$(eval $(call declare-1p-copy-files,device/linaro/dragonboard,.sh))
$(eval $(call declare-1p-copy-files,device/linaro/dragonboard,.xml))
$(eval $(call declare-1p-copy-files,device/linaro/dragonboard,fstab.db845c))
$(eval $(call declare-1p-copy-files,device/linaro/dragonboard,fstab.rb5))

# If some modules are built directly from this directory (not subdirectories),
# their rules should be written here.

include $(call all-makefiles-under,$(LOCAL_PATH))
endif
