repo init -u https://github.com/ProjectCiRCLE-ROM/manifest.git -b 16.2 --git-lfs

rm -rf .repo/local_manifests
git clone https://github.com/15168142/local_manifests.git --depth 1 -b circle .repo/local_manifests

/opt/crave/resync.sh

cd system/core
curl -fsSL https://github.com/15168142/system_core-clover/commit/c38a7c093901dc1a21c67a5f65923219b5ca3328.patch | git apply
cd ../..
cd packages/modules/Connectivity
curl -fsSL https://github.com/15168142/packages_modules_Connectivity-clover/commit/bd6119bb29670a45ef30fbf1cb875f49f2713ee2.patch | git apply
curl -fsSL https://github.com/15168142/packages_modules_Connectivity-clover/commit/bc441e1ef1d88dc4b8aa7567ef88ecaba63e0b8c.patch | git apply
curl -fsSL https://github.com/15168142/packages_modules_Connectivity-clover/commit/d309b602387a6726b318cad127283e718c772193.patch | git apply
curl -fsSL https://github.com/15168142/packages_modules_Connectivity-clover/commit/378018c5a9668f2ef210e60fcccbf6dbacd656cd.patch | git apply
cd ../../..
sed -i '8,10d' vendor/circle/config/version.mk

export TZ='Asia/Ho_Chi_Minh'
TZ='Asia/Ho_Chi_Minh' source build/envsetup.sh
export BUILD_USERNAME='いろは'
export KBUILD_BUILD_USER='いろは'
export BUILD_HOSTNAME='月読'
export KBUILD_BUILD_HOST='月読'
TZ='Asia/Ho_Chi_Minh' lunch circle_alioth-bp4a-userdebug
TZ='Asia/Ho_Chi_Minh' mka live
