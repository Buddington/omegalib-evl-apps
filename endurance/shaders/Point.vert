#version 150 compatibility
#extension GL_ARB_gpu_shader5 : enable

uniform float unif_Alpha;

uniform float unif_MaxDepth;
uniform float unif_MinDepth;

uniform float unif_W1;
uniform float unif_W2;
uniform float unif_W3;
uniform float unif_W4;

void main(void)
{
    // return projection position
    gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
	
	vec3 w = vec3(unif_W1, unif_W2, unif_W3);
	
	float depth = (dot(w.rgb, gl_Color.rgb) - unif_MinDepth) / (unif_MaxDepth - unif_MinDepth);
	
	gl_FrontColor.rgb = mix(vec3(0.2, 0.2, 1.0), vec3(1.0, 0.2, 0.2), depth);
	gl_FrontColor.rgb = mix(gl_FrontColor.rgb, gl_FrontMaterial.diffuse.rgb, unif_W4);
    gl_FrontColor.a = unif_Alpha;
}
