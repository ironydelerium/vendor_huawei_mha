#!/bin/bash

P=`realpath $0`;
P=`dirname $P`;
pushd $P

mkdir _tmp
pushd _tmp

$P/extract-hisilicon-hikey960.sh

if [ $? -eq 0 ]; then
	mkdir ../lib
	mkdir ../lib64
	mv vendor/linaro/hikey960/hisilicon/proprietary/*.so ../lib
	mv vendor/linaro/hikey960/hisilicon/proprietary/lib64/*.so ../lib64

	R=vendor/huawei/mha/proprietary/encoders

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

TARGET_HISI_CODEC_VERSION := 1

PRODUCT_COPY_FILES  += \\
	$R/lib/libOMX.hisi.video.decoder.so:\$(TARGET_COPY_OUT_VENDOR)/lib/libOMX.hisi.video.decoder.so \\
	$R/lib/libOMX.hisi.vdec.core.so:\$(TARGET_COPY_OUT_VENDOR)/lib/libOMX.hisi.vdec.core.so \\
	$R/lib/libOMX_Core.so:\$(TARGET_COPY_OUT_VENDOR)/lib/libOMX_Core.so \\
	$R/lib/libstagefrighthw.so:\$(TARGET_COPY_OUT_VENDOR)/lib/libstagefrighthw.so \\
	$R/lib/libc_secshared.so:\$(TARGET_COPY_OUT_VENDOR)/lib/libc_secshared.so \\
	$R/lib/libhilog.so:\$(TARGET_COPY_OUT_VENDOR)/lib/libhilog.so \\
	$R/lib/libhiion.so:\$(TARGET_COPY_OUT_VENDOR)/lib/libhiion.so \\
    $R/lib64/libOMX.hisi.video.decoder.so:\$(TARGET_COPY_OUT_VENDOR)/lib64/libOMX.hisi.video.decoder.so \\
    $R/lib64/libOMX.hisi.vdec.core.so:\$(TARGET_COPY_OUT_VENDOR)/lib64/libOMX.hisi.vdec.core.so \\
    $R/lib64/libOMX_Core.so:\$(TARGET_COPY_OUT_VENDOR)/lib64/libOMX_Core.so \\
    $R/lib64/libstagefrighthw.so:\$(TARGET_COPY_OUT_VENDOR)/lib64/libstagefrighthw.so \\
    $R/lib64/libc_secshared.so:\$(TARGET_COPY_OUT_VENDOR)/lib64/libc_secshared.so \\
    $R/lib64/libhilog.so:\$(TARGET_COPY_OUT_VENDOR)/lib64/libhilog.so \\
    $R/lib64/libhiion.so:\$(TARGET_COPY_OUT_VENDOR)/lib64/libhiion.so

__EOF__

fi

popd
rm -rf _tmp
popd

