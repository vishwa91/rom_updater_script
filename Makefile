# Makefile to create the B2G ROM

B2G = /home/vishwanath/Document/Files/B2G
DEVICE = totoro
OUT = ./rom_out

SRC = $(OUT)/system $(OUT)/data $(OUT)/boot.img

# Create the out directory to hold the temporary files

b2g.rom: $(SRC) updater-script update-binary
	mkdir $(OUT)
	cp cdpp $(OUT)/cdpp
	mkdir $(OUT)/META-INF
	mkdir $(OUT)/META-INF/com
	mkdir $(OUT)/META-INF/com/google
	mkdir $(OUT)/META-INF/com/google/android
	
	cp update-binary $(OUT)/META-INF/com/google/android/update-script
	cp updater-script $(OUT)/META-INF/com/google/android/updater-script
	
	cd $(OUT) && zip -r . b2g.zip
	echo "Created b2g.zip in $(OUT)"

$(OUT)/system:
	cp -r $(B2G)/out/target/product/$(DEVICE)/system $(OUT)/system

$(OUT)/data:
	cp -r $(B2G)/out/target/product/$(DEVICE)/data $(OUT)/data
	
$(OUT)/boot.img:
	cp $(B2G)/out/target/product/$(DEVICE)/boot.img $(OUT)/boot.img
	
