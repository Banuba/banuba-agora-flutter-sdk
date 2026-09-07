#include <bnb/glsl.vert>
#include <bnb/decode_int1010102.glsl>
#include <bnb/matrix_operations.glsl>

BNB_LAYOUT_LOCATION(0)
BNB_IN vec3 attrib_pos;
BNB_LAYOUT_LOCATION(3)
BNB_IN vec2 attrib_uv;

BNB_OUT(0) vec4 var_uv_bg_uv;

invariant gl_Position;

void main()
{
    gl_Position = bnb_MVP * vec4(attrib_pos, 1.);
    vec2 bg_uv = (gl_Position.xy / gl_Position.w) * 0.5 + 0.5;
    var_uv_bg_uv = vec4(attrib_uv, bg_uv);

    #ifdef BNB_VK_1
    var_uv_bg_uv.w = 1. - var_uv_bg_uv.w;
    #endif
}