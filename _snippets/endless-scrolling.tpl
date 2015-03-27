<div class="loadMore  scroll">

{{ list_articles length="5" ignore_issue="true" ignore_section="true" constraints="type is news" }}

{{* here we introduce another code snippet that generates article teasers *}}
{{ include file="_snippets/news-teaser.tpl" }}

{{ if $gimme->current_list->at_end }}
	{{* here we check if list has more elements, and if so, we create a link for 
	loading next bunch of articles *}}					
	{{ if $gimme->current_list->has_next_elements }}				
		<!--see more-->
		<div class="seemore">
			 <a href="{{ unset_section }}{{ url options="next_items" }}">Load more</a>
		</div>
	{{ /if }}
{{ /if }}		
{{ /list_articles }}

</div><!-- /.loadMore -->

{{* And this is the solution we used: https://github.com/pklauzinski/jscroll *}}

<script type="text/javascript">
$(document).ready(function() {

$('.scroll').jscroll({
    autoTrigger: false,
    nextSelector: 'a:last',
    loadingHtml	:'<div class="seemore"><img src="{{ url static_file="assets/img/loading.gif" }}" /></div>',
    contentSelector: '.loadMore'
});

});
</script>

<script src="{{ url static_file="assets/js/jscroll-master/jquery.jscroll.js" }}"></script>