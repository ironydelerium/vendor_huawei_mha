# Copyright 2016 Chris Vnadomelen (irony.delerium@gmail.com)
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

LOCAL_PATH=device/huawei/mha/proprietary

$(call inherit-product-if-exists, $(LOCAL_PATH)/firmware/device-partial.mk)
$(call inherit-product-if-exists, $(LOCAL_PATH)/mali/device-partial.mk)
$(call inherit-product-if-exists, $(LOCAL_PATH)/encoders/device-partial.mk)



