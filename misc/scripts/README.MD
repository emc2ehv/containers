# How to use these scripts

## Install and run [asciinema](https://asciinema.org/) on Centos 7

```
curl -sSL https://raw.githubusercontent.com/emc2ehv/containers/master/misc/scripts/asciinemacentos7.sh | bash
# Make sure locale is UTF-8
export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8
# Run Asciinema
cd asciinema
python3.6 -m asciinema
```
