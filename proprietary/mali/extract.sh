#!/bin/bash

P=`realpath $0`;
P=`dirname $P`;
pushd $P

mkdir _tmp
pushd _tmp

$P/extract-arm-hikey960.sh

if [ $? -eq 0 ]; then
	mkdir ../lib
	mkdir ../lib64
	mv vendor/linaro/hikey960/arm/proprietary/libGLES_mali.so ../lib/libGLES_mali.so
	mv vendor/linaro/hikey960/arm/proprietary/lib64/libGLES_mali.so ../lib64/libGLES_mali.so
	
	cat <<__EOF__ >../device-partial.mk
# Copyright 2016 The Android Open Source Project
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

# These blobs are sourced from the HiKey960 development board.
PRODUCT_COPY_FILES := \\
    vendor/huawei/mha/proprietary/mali/lib64/libGLES_mali.so:system/lib64/egl/libGLES_mali.so:linaro \\
    vendor/huawei/mha/proprietary/mali/lib/libGLES_mali.so:system/lib/egl/libGLES_mali.so:linaro \\
    vendor/huawei/mha/proprietary/mali/lib64/libGLES_mali.so:system/vendor/lib64/hw/vulkan.hikey960.so:linaro \\
    vendor/huawei/mha/proprietary/mali/lib/libGLES_mali.so:system/vendor/lib/hw/vulkan.hikey960.so:linaro
__EOF__

fi

popd
rm -rf _tmp
popd

