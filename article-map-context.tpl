{{ extends file="layout.tpl" }}

{{block snippet_article_map}}
{{ list_playlist_articles length="1" name="Front page" }}
{{ include file="_snippets/article-map.tpl" }}
{{ /list_playlist_articles }}
{{/block}}