{{ extends file="layout.tpl" }}

{{block snippet_article_comment_form}}
{{ list_articles length="1" ignore_issue="true" ignore_section="true" order="byLastComment desc" }}
{{ include file="_snippets/article-comment-form.tpl" }}
{{ /list_articles }}
{{/block}}