sudo rm -rf /etc/localtime
sudo ln -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
echo "Asia/Ho_Chi_Minh" | sudo tee /etc/timezone

repo init -u https://github.com/15168142/manifest-pos.git -b seventeen --git-lfs --depth=1

rm -rf .repo/local_manifests
git clone https://github.com/15168142/local_manifests.git --depth 1 -b pissel .repo/local_manifests

/opt/crave/resync.sh

source build/envsetup.sh
export BUILD_USERNAME='いろは'
export BUILD_HOSTNAME='月読'
lunch alioth-cp2a-userdebug
m installclean
m pixelos
