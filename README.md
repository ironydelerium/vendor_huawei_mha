Blobs go here.

proprietary/mali/ contains the self-extractor for the Mali drivers.

proprietary/encoders/ contains the self-extractor for the Kirin video acceleration blobs.

proprietary/firmware/ contains a firmware dump (the contents of /vendor/firmware) from
a Mate 9 - MHA-L29C567B371, at the moment.

The Mali driver package and Kirin encoder package are both sourced from:
https://developers.google.com/android/drivers:

Mali:     https://dl.google.com/dl/android/aosp/arm-hikey960-OPR-cf4e0c80.tgz
Encoders: https://dl.google.com/dl/android/aosp/hisilicon-hikey960-OPR-3c243263.tgz

Before building, run the self-extrators in proprietary/mali and proprietary/encoders.

