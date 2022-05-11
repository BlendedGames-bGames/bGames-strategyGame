//
// Simple passthrough fragment shader
//uniform float u_vCamera[4]; // 0 = view_x, 1 = view_y, 2 = width, 3 = height, normalized


uniform vec2 u_vLightCoord;
uniform float u_fLightRadius;
varying vec4 v_vColour;
varying vec2 pos;

void main()
{
	
	//if (v_vTexcoord.x < u_vCamera[0] || v_vTexcoord.x > (u_vCamera[0]+u_vCamera[2]) || (1.0-v_vTexcoord.y) < u_vCamera[1] ||  (1.0-v_vTexcoord.y) > (u_vCamera[1]+u_vCamera[3]) ) discard;
	
	
	vec2 dis = pos - u_vLightCoord;
	
	float strength = 1. /(sqrt(dis.x*dis.x + dis.y*dis.y + u_fLightRadius*u_fLightRadius)-u_fLightRadius);

	gl_FragColor = v_vColour*vec4(vec3(strength),1.0);
}
