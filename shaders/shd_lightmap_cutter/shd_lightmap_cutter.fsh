//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform sampler2D u_sLightMap;
//uniform float u_fLayerDepth;
//uniform vec3 FogColor;
//uniform vec3 ambient;
uniform float u_fLightAlpha;



void main()
{
	vec4 Color=texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 Color_lightmap = texture2D( u_sLightMap, v_vTexcoord );
	//Color.rgb = ((Color_tile.rgb * u_fLightAlpha + 1. - u_fLightAlpha) * Color.rgb);
	//Color.rgb = mix(Color.rgb,FogColor,max(u_fLayerDepth/160.,0.));
	
	Color.rgb = (Color_lightmap.rgb * Color.rgb);
    gl_FragColor = v_vColour * Color;

}
