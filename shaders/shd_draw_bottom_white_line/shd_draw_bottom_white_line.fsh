//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 Color1 = texture2D( gm_BaseTexture, v_vTexcoord );
	float value = max(0.,v_vTexcoord.y-.82);
	Color1.rgb = mix(Color1.rgb,vec3(1.),value*30.);
    gl_FragColor = v_vColour * Color1; 
}
