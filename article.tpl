{{ assign var="fileName" value="{{ $gimme->article->snippet_name|strip }}" }}
{{ if $gimme->article->contextual }}
	
{{* 'Contextual' is custom article switch which directs this template to open context template, instead of opening snippet template directly; usually this is useful when snippet needs to be placed in some list, and same snippet is necessary for some other examples. Ie. video-embed snippet, or news-teaser snippet - they both are included in html-slider snippet *}}

	{{ assign var="fileName" value="{{ $fileName|replace:".tpl":"-context.tpl" }}" }}
{{ else }}
	{{ assign var="fileName" value="_snippets/{{ $fileName }}" }}
{{ /if }}	
{{ render file="{{ $fileName }}" }}