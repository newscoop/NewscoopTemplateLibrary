{{ if $gimme->article->vimeo_url|strip !== "" }}
      {{ assign var="vimeocode" value=$gimme->article->vimeo_url|replace:"http://vimeo.com/":"" }}
      <iframe src="http://player.vimeo.com/video/{{ $vimeocode }}?title=0&amp;byline=0&amp;portrait=0&amp;color=e20020" width="555" height="370" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>
{{ /if }}
 
{{ if !($gimme->article->youtube_shortcode == "") }}
      {{ assign var="youtubecode" value=$gimme->article->youtube_shortcode|replace:"http://youtu.be/":"" }}
      <iframe title="YouTube video player" width="555" height="370" src="http://www.youtube.com/embed/{{ $youtubecode }}?rel=0 frameborder="0" allowfullscreen></iframe>
{{ /if }}  