{{ include file="_tpl/_html-head.tpl" }}

  <body>

{{ include file="_tpl/header.tpl" }}

  <div class="container">
	 <div class="row">
	 
		<div class="col-md-12">
			<h2>{{ $gimme->article->name }}</h2>		
			{{ $gimme->article->description }}
		</div>
	 
		<div class="col-md-6"> 
		<h3>Generated output</h3> 	

		{{block snippet_news_teaser}}{{/block}}		
		
		{{block snippet_video_embed}}{{/block}}	
		
		{{block snippet_html_slider}}{{/block}}	
		
		{{block snippet_article_comments}}{{/block}}
		
		{{block snippet_article_comment_form}}{{/block}}
		
		{{block most_commented_articles}}{{/block}}
		
		{{block snippet_endless_scrolling}}{{/block}}

		{{block snippet_associative_arrays}}{{/block}}
		
		{{block snippet_profile_page}}{{/block}}

		</div><!-- /.col-md-6 -->
		
		<div class="col-md-6">
			<h3>Template code</h3>

			{{ $gimme->article->gist }}
	
		</div><!-- /.col-md-6 -->			
	</div><!-- /.row -->
  </div><!-- /.container -->

{{ include file="_tpl/_html-foot.tpl" }}
