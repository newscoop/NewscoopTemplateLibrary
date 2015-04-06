<section class="clearfix">
{{* Image output - rendition must be defined in theme.xml
file in theme's root folder. Here we use 'topfront' rendition 
for top positioned news, and 'square' for all other news *}}            
            
{{ image rendition=$imageRendition }}
	<figure{{ if $imageRendition == "square" }} class="thumb"{{ /if }}>
  		<a href="{{ url options="article" }}">
			<img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" rel="resizable" style="max-width: 100%" alt="{{ $image->caption }} {{ if $image->photographer|trim }}(photo: {{ $image->photographer }}){{ /if }}" />
		</a>
    		<figcaption>
      			<em>{{ $image->caption }} {{ if $image->photographer|trim }}(Photo: {{ $image->photographer }}){{ /if }}</em>
    		</figcaption>
  	</figure>
{{ /image }} 
          
  	<div class="fourcol last">
              
	{{* Basic article information - title, link to full article,
	 publish date, and section in which article is published *}}              
    		<header>
     			<hgroup>
      				<h2><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></h2>
      				<p class="article-info"><em>Published on {{ $gimme->article->publish_date|camp_date_format:"%M %e, %Y" }} in <a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></em></p>
    			</hgroup>
  		</header>
  	<div id="topstory-intro">
		{{* If field 'deck' is left empty, first 150 characters of 'full_text' field are shown, followed by '...' *}}
    		<p>{{ if $gimme->article->deck|strip !== "" }}{{ $gimme->article->deck }}{{ else }}{{ $gimme->article->full_text|truncate:150:"..." }}{{ /if }}</p>
                  
		{{* Next list generates list of authors of the article. 
		Before last name, instead of comma, word 'and' is put. 
		Also, is author  *}}
    		<p><em>{{ list_article_authors }}{{ if $gimme->current_list->at_beginning }}By {{ /if }}{{ if $gimme->current_list->at_end }}{{ if $gimme->current_list->index > 1 }} and {{ /if }}{{ else }}{{ if $gimme->current_list->index > 1 }}, {{ /if }}{{ /if }}{{ if $gimme->author->user->defined }}<a href="{{ url options="author" }}">{{ /if }}{{ $gimme->author->name }}{{ if $gimme->author->user->defined }}</a>{{ /if }}{{ if $gimme->current_list->at_end }}. {{ /if }}{{ /list_article_authors }}</em></p>
	</div>
              
	{{* To show list of related articles, use this list. 
	Here we firstly check if list starts - meaning if it has 
	at least one element - and if so, open <ul>. Also at the end 
	of the list code, we check if list is at end, to properly 
	close it with </ul> *}}  
              
	{{ list_related_articles }}
	{{ if $gimme->current_list->at_beginning }}
	<ul>
	{{ /if }}
        	<li><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></li>
        {{ if $gimme->current_list->at_end }}
        </ul>
        {{ /if }}
	{{ /list_related_articles }}                
                
       	</div>
</section>   