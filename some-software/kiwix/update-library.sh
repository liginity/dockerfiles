mkdir /tmp/output-1
podman run --rm -v /srv/files/kiwix-zim-files/:/kiwix-zim-files:ro -v /tmp/output-1:/output kiwix-tools-pod bash -c 'kiwix-manage /output/zim-files-library.xml add /kiwix-zim-files/*'

find . -type f -name '*.zim' -print0 | xargs -0 kiwix-manage zim-files-library.xml add
