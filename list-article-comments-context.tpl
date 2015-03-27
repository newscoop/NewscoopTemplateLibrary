{{ extends file="layout.tpl" }}

{{block snippet_article_comments}}
{{ list_articles length="1" ignore_issue="true" ignore_section="true" order="byLastComment desc" }}
{{ include file="_snippets/list-article-comments.tpl" }}
{{ /list_articles }}
{{/block}}