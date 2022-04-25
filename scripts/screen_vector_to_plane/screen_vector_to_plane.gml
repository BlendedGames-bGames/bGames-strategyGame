// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function screen_vector_to_plane(l0x, l0y, l0z,  lx, ly, lz, p0x, p0y, p0z, nx, ny, nz){
	///@desc screen_vector_to_plane(l0x, l0y, l0z,  lx, ly, lz, p0x, p0y, p0z, nx, ny, nz)
	///@param l0x
	///@param l0y
	///@param l0z
	///@param lx
	///@param ly
	///@param lz
	///@param p0x
	///@param p0y
	///@param p0z
	///@param nx
	///@param ny
	///@param nz
	
	var t = dot_product_3d(p0x-l0x, p0y-l0y, p0z-l0z, nx, ny, nz)/dot_product_3d(lx, ly, lz, nx, ny, nz);
	return [l0x+t*lx, l0y+t*ly, l0z+t*lz];
}