{{ extends file="layout.tpl" }}
{{block snippet_html_slider}}
{{* We use <a href="http://jquery.malsup.com/">cycle2 jquery plugin</a> 
to demonstrate how newscoop, html, css and javascript can be combined 
to achieve sliding effect. *}}

<!-- include Cycle2 -->
<script src="{{ url static_file="assets/js/jquery.cycle2.min.js" }}"></script>

{{* This example cycles news intros that we already showcased in news-teaser.tpl *}}

<div>
    <!-- prev/next links -->
    <div class=center>
        <span id=prev>&lt;&lt;Prev </span>
        <span id=next> Next&gt;&gt;</span>
    </div>
</div>    

<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-timeout="5000" data-cycle-slides="> div" data-cycle-prev="#prev" data-cycle-next="#next">
{{ list_playlist_articles id="1" length="3" }}
	<div class="slide">
    {{ include file="_snippets/news-teaser.tpl" imageRendition="square" }}
    </div>
{{ /list_playlist_articles }}    
</div>

<hr />

{{* This example shows how videos added to articles can be cycled. 
(working with videos is explained in video-embed.tpl *}}

<div>
    <!-- prev/next links -->
    <div class=center>
        <span id=prev1>&lt;&lt;Prev </span>
        <span id=next1> Next&gt;&gt;</span>
    </div>
</div>    

<div class="cycle-slideshow" data-cycle-fx="scrollHorz" data-cycle-timeout="7500" data-cycle-slides="> div" data-cycle-prev="#prev1" data-cycle-next="#next1">
{{ list_playlist_articles id="2" }}
	<div class="slide">
    	{{ include file="_snippets/video-embed.tpl" }}
    </div>
{{ /list_playlist_articles }}    
</div>
{{/block}}