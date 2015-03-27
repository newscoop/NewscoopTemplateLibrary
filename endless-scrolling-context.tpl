{{ extends file="layout.tpl" }}

{{block snippet_endless_scrolling}}

{{ assign var="imageRendition" value="square" }}

{{ include file="_snippets/endless-scrolling.tpl" imageRendition=$imageRendition }}       

{{/block}}