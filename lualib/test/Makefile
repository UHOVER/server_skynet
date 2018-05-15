CC ?= gcc  
CFLAGS = -g -O2 -Wall -I$(LUA_INC)  
SHARED := -fPIC --shared  

TARGET = myLualib.so  
LUA_CLIB_PATH = ./


#引入lua头文件(根据你安装Lua库时的目录而定)

# LUA_INC ?= /usr/local/src/lua-5.3.0/src
LUA_INC ?= /root/skynet1/skynet/3rd/lua

start: $(TARGET)  

$(TARGET) : ./mylib.c
    $(CC) $(CFLAGS) $(SHARED) $^ -o $@

clean:  
    rm -fr $(TARGET)  

$(LUA_CLIB_PATH) :  
    mkdir $(LUA_CLIB_PATH)