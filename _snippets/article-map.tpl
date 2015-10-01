<!-- In order to use display maps you must include jQuery in the header of your document -->

{{ if $gimme->article->has_map }}
<h4>Article: {{ $gimme->article->name }}</h4>
<div>
	{{ map show_original_map="true" show_reset_link="true" show_locations_list="false" width="100%" height="250" }}
</div>
{{ if $gimme->map->name|strip !== "" }}
    <p>Map Name: {{ $gimme->map->name }}</p>
{{ /if }}
{{ /if }}

  {{ list_article_locations }}
    {{ if $gimme->location->enabled }}
            <p>location #{{ $gimme->current_list->index }} name: {{ $gimme->location->name }}</p>
            <ul>
            <li>latitude/longitude: {{ $gimme->location->latitude }}/{{ $gimme->location->longitude }}</li>
            {{ if $gimme->location->text|strip !== "" }}
            <li>location text: {{ $gimme->location->text }}</li>
            {{ /if }}
            {{ if $gimme->location->content|strip !== "" }}
            <li>location content: {{ $gimme->location->content }}</li>
            {{ /if}}

            {{ foreach $gimme->location->multimedia as $multimediaitem }}
            {{ if $smarty.foreach.multimediaitem.first }}
            <li>Multimedia:</li>
              <ul>
            {{ /if }}
                  <li>src: {{ $multimediaitem->src }}</li>
                  <li>type: {{ $multimediaitem->type }}</li>
                  <li>spec: {{ $multimediaitem->spec }}</li>
                  <li>width: {{ $multimediaitem->width }}</li>
                  <li>height: {{ $multimediaitem->height }}</li>
			{{ if $smarty.foreach.multimediaitem.last }}   
			  </ul>
			{{ /if }}
            {{ /foreach }}
            </ul>

    {{ /if }}
  {{ /list_article_locations }}

</ul>
