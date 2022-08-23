# Tibbo/SunPlus Buildroot Layers

Tibbo/SunPlus Linux BuildRoot layers for SoC

Plus1 (sp7021): [A Linux Chip for IoT and Industrial Control Applications](https://tibbo.com/store/plus1.html)

## Before build (do once)

```
brv="2021.02"
// or latest stable BuildRoot release
// brv="2022.05.1"
git clone git@github.com:tibbotech/br2_external.git
wget https://buildroot.org/downloads/buildroot-${brv}.tar.gz
tar -xvf ./buildroot-${brv}.tar.gz
rsync -a --exclude=.git ./buildroot-${brv}/ ./br2_external/br.a5/
rsync -a --exclude=.git ./buildroot-${brv}/ ./br2_external/br.a7/
```

## Building OS for main CPU (A-Chip)
```
cd ./br2_external/
curdir=`pwd`
cd ./br.a7/
make BR2_EXTERNAL=${curdir}/br.LTPPxG2 LTPPxG2_defconfig && make && cd ${curdir}
```

## Building bootloader and arm926 test code for co-processor (B-Chip, optional)
```
cd ./br2_external/
curdir=`pwd`
cd ./br.a5/
make BR2_EXTERNAL=${curdir}/br.LTPPxG2 LTPPxG2a5_defconfig && make && cd ${curdir}
cp ./br.a5/output/images/xboot.bin ./br.a7/output/images/
cp ./br.a5/output/images/a926*.bin ./br.a7/output/images/
```

## Generating ISPBOOOT image
```
cd ./br2_external/br.a7/output/images/;
make -f ./sp_make.mk
```
On success you'll get the ISPBOOOT.BIN at ./br2_external/br.a7/output/images/sp_out/
