#include <bnb/glsl.frag>
#include <bnb/lut.glsl>

BNB_IN(0) vec4 var_uv_bg_uv;
BNB_DECLARE_SAMPLER_2D(0, 1, bnb_BACKGROUND);

void main()
{
    bnb_FragColor = vec4(BNB_TEXTURE_2D(BNB_SAMPLER_2D(bnb_BACKGROUND), var_uv_bg_uv.zw).xyz, 1.);
}