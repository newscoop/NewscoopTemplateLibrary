{{ extends file="layout.tpl" }}

{{block snippet_profile_page}}
{{ list_playlist_articles id="1" length="1" }}
	{{ assign var="imageRendition" value="square" }}
	{{list_article_authors length="1"}}
	{{ include file="_snippets/profile-page.tpl" imageRendition=$imageRendition }}
	{{ /list_article_authors }}       
{{ /list_playlist_articles }}
{{/block}}