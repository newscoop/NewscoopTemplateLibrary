{{ extends file="layout.tpl" }}
{{block most_commented_articles}}
{{ list_articles ignore_issue="true" ignore_section="true" length="5" order="bycomments desc" constraints="type is news" }}
{{ if $gimme->current_list->at_beginning }}
<ul>
{{ /if }}
  <li>{{ $gimme->article->name }}, {{ $gimme->article->comment_count }} comment{{ if $gimme->article->comment_count ne 1 }}s{{ /if }}</li>
{{ if $gimme->current_list->at_end }}
</ul>
{{ /if }}  
{{ /list_articles }}
{{/block}}