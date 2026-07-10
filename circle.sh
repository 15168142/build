repo init -u https://github.com/ProjectCiRCLE-ROM/manifest.git -b 16.2 --git-lfs --depth=1
/opt/crave/resync.sh

source build/envsetup.sh
export BUILD_USERNAME='いろは'
export BUILD_HOSTNAME='月読'
export CIRCLE_BUILDTYPE=OFFICIAL
export WITH_GMS=true
lunch circle_alioth-bp4a-userdebug
m installclean
m live
git clone https://github.com/ProjectCiRCLE-ROM/OTA.git
chmod +x OTA/createjson.sh
. OTA/createjson.sh
