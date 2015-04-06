{{ strip }}
    {{ if empty($size) }}
        {{ $size = "" }}
    {{ /if }}

	{{ if $size == "xbig" }}
        {{ $box = 200 }}
    {{ elseif $size == "big" }}
        {{ $box = 113 }}
    {{ elseif $size == "small" }}
        {{ $box = 35 }}
    {{ else }}
        {{ $box = 64 }}
        {{ $size = "mid" }}
    {{ /if }}

    {{ if empty($class) }}
        {{ $class = "" }}
    {{ /if }}

    {{ if $user->is_active && $user->image($box, $box, crop) }}
    <img alt="{{ $user->uname|escape }}" src="{{ $user->image($box, $box, crop) }}" style="max-width: 100%" />
    {{ else }}
    <img alt="{{ $user->uname|escape }}" src="{{ url static_file="assets/img/user-thumb-`$size`-default.jpg" }}" class="{{ $class|escape }}" style="max-width: 100%" />
    {{ /if }}
{{ /strip }}
