{{ extends file="layout.tpl" }}

{{block snippet_news_teaser}}
{{ list_playlist_articles id="1" length="5" }}
{{ if $gimme->current_list->index == 1 }}
	{{ assign var="imageRendition" value="topfront" }}
{{ else }}
	{{ assign var="imageRendition" value="square" }}
{{ /if }}
{{ include file="_snippets/news-teaser.tpl" imageRendition=$imageRendition }}       
{{ /list_playlist_articles }}
{{/block}}