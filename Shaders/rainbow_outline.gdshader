shader_type canvas_item;

uniform float outline_size : hint_range(1.0, 10.0) = 2.0;
uniform vec4 outline_color : source_color = vec4(0.0, 0.0, 0.0, 1.0);

void fragment() {
    vec4 tex = texture(TEXTURE, UV);

    if (tex.a < 0.1) {
        float outline = 0.0;

        // sample in 8 directions
        outline += texture(TEXTURE, UV + vec2(outline_size, 0.0) * TEXTURE_PIXEL_SIZE).a;
        outline += texture(TEXTURE, UV + vec2(-outline_size, 0.0) * TEXTURE_PIXEL_SIZE).a;
        outline += texture(TEXTURE, UV + vec2(0.0, outline_size) * TEXTURE_PIXEL_SIZE).a;
        outline += texture(TEXTURE, UV + vec2(0.0, -outline_size) * TEXTURE_PIXEL_SIZE).a;

        outline += texture(TEXTURE, UV + vec2(outline_size, outline_size) * TEXTURE_PIXEL_SIZE).a;
        outline += texture(TEXTURE, UV + vec2(-outline_size, outline_size) * TEXTURE_PIXEL_SIZE).a;
        outline += texture(TEXTURE, UV + vec2(outline_size, -outline_size) * TEXTURE_PIXEL_SIZE).a;
        outline += texture(TEXTURE, UV + vec2(-outline_size, -outline_size) * TEXTURE_PIXEL_SIZE).a;

        if (outline > 0.0) {
            COLOR = outline_color;
        } else {
            COLOR = tex;
        }
    } else {
        COLOR = tex;
    }
}
