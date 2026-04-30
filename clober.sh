repo init -u https://github.com/The-Clover-Project/manifest.git -b 16-qpr2 --git-lfs

rm -rf .repo/local_manifests
git clone https://github.com/15168142/local_manifests.git --depth 1 -b clober .repo/local_manifests

rm -rf kernel/xiaomi/sm8250
/opt/crave/resync.sh
git -C kernel/xiaomi/sm8250 submodule update --init --recursive

export TZ='Asia/Ho_Chi_Minh'
source build/envsetup.sh

export BUILD_USERNAME='いろは'
export KBUILD_BUILD_USER='いろは'
export BUILD_HOSTNAME='月読'
export KBUILD_BUILD_HOST='月読'

lunch clover_alioth-bp4a-user
mka installclean
mka clover
