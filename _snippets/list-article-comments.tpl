{{ if $gimme->article->comments_enabled || $gimme->article->comments_locked  }}

<div id="comments">

    {{ list_article_comments order="bydate desc"  }}
    {{ if $gimme->current_list->at_beginning }}
    <ol>
    {{ /if }}
            
        {{assign var="user" value=$gimme->comment->user }}
		<li class="comment-content">
    	{{ if $user->identifier }}
        	{{ if $user->is_active }}
            	<a href="{{ $view->url(['username' => $user->uname], 'user') }}">
            	{{ strip }}
                	{{ include file="_snippets/user-image.tpl" size="small" inline user=$gimme->comment->user }}
            	{{ /strip }}
            	</a>
        	{{ /if }}
    	{{ else }}
        	<img src="{{ url static_file='assets/img/user-thumb-small-default.jpg' }}" alt="" />
    	{{ /if }}

    	<h5>{{ $gimme->comment->subject }} </h5>
    	<time>
    	{{ if $user->identifier }}
        	{{ if $user->is_active }}
            	<a href="{{ $view->url(['username' => $user->uname], 'user') }}">
            	{{ strip }}
				{{ if $user->is_active }}
    				{{ $user->uname|escape }}
				{{ else }}
    				Inactive user
				{{ /if }}
				{{ /strip }}
            	</a>
        	{{ /if }}
    	{{ else }}
        	{{ $gimme->comment->nickname }}
    	{{ /if }} on {{ $gimme->comment->submit_date|camp_date_format:"%e.%m.%Y %H:%i" }}
    	</time>
    	<p>{{ $gimme->comment->content|create_links|nl2br }}</p>
		</li>            
    {{ if $gimme->current_list->at_end }}
    </ol>
    {{ /if }}
    {{ /list_article_comments }}

    {{* include file="_snippets/article-comments-form.tpl" *}}

</div>

{{ /if }}