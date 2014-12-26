all:
	git submodule update --init
	cd Adafruit_Python_DHT && python ./setup.py build
