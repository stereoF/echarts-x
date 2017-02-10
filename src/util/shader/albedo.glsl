@export ecgl.albedo.vertex

uniform mat4 worldViewProjection : WORLDVIEWPROJECTION;
uniform vec2 uvRepeat: [1, 1];

attribute vec2 texcoord : TEXCOORD_0;
attribute vec3 position: POSITION;

#ifdef VERTEX_COLOR
attribute vec4 a_Color : COLOR;
varying vec4 v_Color;
#endif

varying vec2 v_Texcoord;

void main()
{
    gl_Position = worldViewProjection * vec4(position, 1.0);
    v_Texcoord = texcoord * uvRepeat;

#ifdef VERTEX_COLOR
    v_Color = a_Color;
#endif
}

@end

@export ecgl.albedo.fragment

uniform sampler2D diffuseMap;
uniform vec3 color : [1.0, 1.0, 1.0];
uniform float alpha : 1.0;

#ifdef VERTEX_COLOR
varying vec4 v_Color;
#endif

varying vec2 v_Texcoord;

void main()
{
    gl_FragColor = vec4(color, alpha);

#ifdef VERTEX_COLOR
    gl_FragColor *= v_Color;
#endif
#ifdef DIFFUSEMAP_ENABLED
    vec4 tex = texture2D(diffuseMap, v_Texcoord);
    gl_FragColor *= tex;
#endif
}
@end