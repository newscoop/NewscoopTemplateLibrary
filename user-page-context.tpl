{{ extends file="layout.tpl" }}

{{block snippet_profile_page}}
{{ list_users length="1" search="humbo" }}
	{{ assign var="imageRendition" value="square" }}
	{{ include file="_snippets/user-page.tpl" imageRendition=$imageRendition user=$gimme->list_user }}
{{ /list_users }}
{{/block}}