# initial

```bash
sudo apt-get install \
  net-tools \
  curl \
  gcc \
  xclip \
  jq \
  build-essential \
  ripgrep 
```

```bash
gsettings \
  set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"
```

## i3vm

```bash
sudo apt-get install \
  cmake \
  urlview \
  unclutter \
  feh \
  i3blocks \
  nm-applet \
  ctags
```

# solarized

```bash
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized
```

# kafka

config.properties

```bash
security.protocol=SASL_SSL
sasl.mechanism=PLAIN
sasl.jaas.config=org.apache.kafka.common.security.plain.PlainLoginModule required username="..." password="...";
```

```bash
./kafka-topics.sh --bootstrap-server localhost:9092 --command-config config.properties --create --partitions 100 --topic 
./kafka-topics.sh --bootstrap-server localhost:9092 --command-config config.properties --delete --topic 

./kafka-consumer-groups.sh --bootstrap-server localhost:9092 --command-config config.properties --group --describe

./kafka-consumer-groups.sh --bootstrap-server localhost:9092 --command-config config.properties --group --topic --reset-offsets --to-earliest --execute
```
