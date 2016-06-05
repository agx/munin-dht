<!-- -*- mode: markdown; -*- -->

A munin plugin to measure temperature and humidity using DHT11, DHT22, or
AM2302 using e.g. a Rapsberry Pi. It relies on Adafruit_Python_DHT to do the
dirty work. Therefore it doesn't need any external binary callouts.

To build an run from the source tree just do a:

    sudo apt-get install python-setuptools python-dev git build-essential
    git clone git://honk.sigxcpu.org/git/munin-dht.git
    make

In case you want to monitor room foo do a

    ln -s $PWD/dht_ /etc/munin/plugins/dht_foo

and put the necessary config to /etc/munin/plugin-conf.d/dht:

    [dht_*]
    user root
    # GIO pin used
    env.pin 4
    # Detailed description of foo
    env.where Foo Room
    # Sensor type (one of DHT11, DHT22, AM2302)
    env.sensor AM2302

You can then check if it's working via

    munin-run dht_foo

Restart the munin node afterwards to get the results reported to the server:

    service munin-node restart


