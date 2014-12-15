#version 150

uniform mat4 modelViewProjectionMatrix;
uniform mat4 normalMatrix;
uniform mat4 modelViewMatrix;

layout(triangles) in;
layout(triangle_strip, max_vertices = 3) out;

in vec4 vertex[3];

out vec4 color;

vec4 blinnPhongReflection(vec4 position, vec3 normal);

void main(void) {
	// compute face normal
	vec3 edge1= vec3(vertex[1] - vertex[0]);
	vec3 edge2= vec3(vertex[2] - vertex[0]);
	vec3 faceNormal= cross(edge1, edge2);
	faceNormal= normalize(faceNormal);

	vec4 centerOfGravity= 1.0/3.0*(vertex[0]+vertex[1]+vertex[2]);

	color = blinnPhongReflection(centerOfGravity, faceNormal);

  gl_Position = gl_in[0].gl_Position;
  EmitVertex();

 
  gl_Position= gl_in[1].gl_Position;
  EmitVertex();


  gl_Position= gl_in[2].gl_Position;
  EmitVertex();
  
  EndPrimitive();
}
