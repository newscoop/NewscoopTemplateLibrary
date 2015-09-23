{{ extends file="layout.tpl" }}

{{block snippet_capture_rendition}}
{{ list_articles length="10" ignore_issue="true" ignore_section="true" constraints="type is news" order="bypublishdate desc" }}
{{ if $gimme->current_list->index gte 5 }}
{{ include file="_snippets/capture-rendition.tpl" }}
{{ /if }}
{{ /list_articles }}
{{/block}}