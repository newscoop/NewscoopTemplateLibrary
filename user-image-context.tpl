{{ extends file="layout.tpl" }}

{{block snippet_video_embed}}

{{ list_playlist_articles id="2" length="1" }}

{{ include file="_snippets/user-image.tpl" }}

{{ /list_playlist_articles }}

{{/block}}    