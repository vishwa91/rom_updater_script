# Makefile to create the B2G ROM

B2G = /home/praveen/Programs/intern/totoro-B2G
DEVICE = totoro
OUT = ./rom_out

SRC = $(OUT)/system $(OUT)/data $(OUT)/boot.img

# Create the out directory to hold the temporary files

b2g.rom: $(OUT) $(SRC) updater-script update-binary
	cp cdpp $(OUT)/cdpp
	mkdir -p $(OUT)/META-INF/com/google/android
	
	cp update-binary $(OUT)/META-INF/com/google/android/update-script
	cp updater-script $(OUT)/META-INF/com/google/android/updater-script
	
	cd $(OUT) && zip -r b2g.zip .
	echo "Created b2g.zip in $(OUT)"

$(OUT):
	mkdir $(OUT)

$(OUT)/system:
	cp -r $(B2G)/out/target/product/$(DEVICE)/system $(OUT)

$(OUT)/data:
	cp -r $(B2G)/out/target/product/$(DEVICE)/data $(OUT)
	
$(OUT)/boot.img:
	cp $(B2G)/out/target/product/$(DEVICE)/boot.img $(OUT)
	
