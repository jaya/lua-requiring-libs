#include <stdlib.h>
#include <stdio.h>
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

int main(int argc, const char *argv[])
{
	lua_State *L = luaL_newstate();

	luaL_openlibs(L);


	luaL_dofile(L, "root/main.lua");
	
	lua_close(L);

}
