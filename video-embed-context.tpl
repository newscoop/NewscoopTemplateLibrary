{{ extends file="layout.tpl" }}

{{block snippet_video_embed}}

{{ list_playlist_articles id="2" }}

{{ include file="_snippets/video-embed.tpl" }}

{{ /list_playlist_articles }}

{{/block}}    