sudo rm -rf /etc/localtime
sudo ln -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
echo "Asia/Ho_Chi_Minh" | sudo tee /etc/timezone

repo init -u https://github.com/15168142/manifest-pos.git -b seventeen --git-lfs --depth=1

rm -rf .repo/local_manifests
git clone https://github.com/15168142/local_manifests.git --depth 1 -b pissel .repo/local_manifests

rm -rf prebuilts/gcc
/opt/crave/resync.sh

git clone https://github.com/LineageOS/scripts.git
mkdir -p vendor/lineage-priv
mv scripts/lineage-priv-template vendor/lineage-priv/keys
rm -rf scripts
cd vendor/lineage-priv/keys
sed -i 's|/C=US/ST=California/L=Mountain View/O=Android/OU=Android/CN=Android/emailAddress=android@android.com|/C=VN/ST=Ho Chi Minh/L=Ho Chi Minh/O=Nhu/OU=Nhu/CN=Nhu/emailAddress=nhu@waifu.club|g' make_key.sh
./keys.sh
cd ../../..

source build/envsetup.sh
export BUILD_USERNAME='いろは'
export BUILD_HOSTNAME='月読'
lunch alioth-cp2a-userdebug
m installclean
m pixelos
