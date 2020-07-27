
workdir=$(pwd)
if [[ -d "$workdir"/lineage ]]; then
# apply builtins.cpp patches if it is LineageOS
cd system/core/init || return
if [[ ! -f builtins.cpp.orig ]]; then
cp -rf builtins.cpp builtins.cpp.orig
git reset -q --hard
patch --merge -sNp1 -i "$workdir"/device/xiaomi/lavender/patches/system-core-init-builtins.cpp.patch
fi ; fi
cd "$workdir" || return

# clone /vendor/qcom/opensource/commonsys (only omni)
if [[ ! -d "$workdir"/lineage ]]; then
if [[ ! -d "$workdir"/vendor/qcom/opensource/commonsys ]]; then
git clone --depth=1 https://github.com/omnirom/android_vendor_qcom_opensource_commonsys.git -b android-9.0 "$workdir"/vendor/qcom/opensource/commonsys
fi ; fi

# clone magisk-prebuilt
if [[ ! -d "$workdir"/external/magisk-prebuilt ]]; then
git clone --depth=1 https://github.com/TeamWin/external_magisk-prebuilt.git -b master "$workdir"/external/magisk-prebuilt
fi

if [[ ! -d "$workdir"/lineage ]]; then
add_lunch_combo omni_lavender-eng
else
add_lunch_combo lineage_lavender-eng
fi