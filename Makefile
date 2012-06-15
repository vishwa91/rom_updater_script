# Makefile to create the B2G ROM

B2G = /home/vishwanath/Documents/Files/B2G
DEVICE = u8150
OUT = ./rom_out

SRC = $(OUT)/system $(OUT)/data $(OUT)/boot.img

# Create the out directory to hold the temporary files

b2g.rom: $(OUT) $(SRC) updater-script update-binary
	cp cdpp $(OUT)/cdpp
	mkdir -p $(OUT)/META-INF/com/google/android
	
	cp update-binary $(OUT)/META-INF/com/google/android
	cp updater-script $(OUT)/META-INF/com/google/android
	
	cd $(OUT) && zip -r b2g.zip .
	@echo "Created b2g.zip in $(OUT)"

$(OUT):
	mkdir $(OUT)

$(OUT)/system:
	cp -r $(B2G)/out/target/product/$(DEVICE)/system $(OUT)

$(OUT)/data:
	cp -r $(B2G)/out/target/product/$(DEVICE)/data $(OUT)
	
$(OUT)/boot.img:
	cp $(B2G)/out/target/product/$(DEVICE)/boot.img $(OUT)

.PHONY: clean
clean:
	rm -rf ./rom_out
	@echo removed rom_out
