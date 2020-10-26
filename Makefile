CC = clang
CFLAGS = `pkgconf --cflags libavcodec libavformat libavfilter libavutil`
LIBS = `pkgconf --libs libavcodec libavformat libavfilter libavutil`

all: nvtx

$(objects): %.o: %.c
	$(CC) -c $(CFLAGS) $<

nvtx: nv_transcode.o
	$(CC) -o $@ $< $(LIBS)

.PHONY: clean
clean:
	rm -rf *.o nvtx
