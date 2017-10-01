CFLAGS += -Wall -std=c++11

INSTDIR = $(prefix)/usr/bin
INSTMODE = 0755
INSTOWNER = root
INSTGROUP = root

OBJ = cvserver.o
OBJ_UBUS = cvclient.o
LIB = -lm -lopencv_core -lopencv_highgui \
	-lopencv_imgcodecs -lopencv_videoio -lopencv_imgproc
%.o: %.cpp
	$(CXX) $(CFLAGS) -c -o $@ $<
compile: $(OBJ) $(OBJ_UBUS)
	$(CXX) -o cvserver $(LDFLAGS) $(LIB) $(OBJ)
	$(CXX) -o cvclient $(LDFLAGS) $(LIB) $(OBJ_UBUS)
clean:
	rm -f *.o *.so ws-mirror-server ws-mirror-server-cmd ws-mirror-server-ubus
