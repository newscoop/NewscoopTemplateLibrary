{{* working with array of authors here *}}

      {{ $userArray=[] }}     
{{ $userArray['A']=[] }}{{ $userArray['B']=[] }}{{ $userArray['C']=[] }}{{ $userArray['D']=[] }}{{ $userArray['E']=[] }}{{ $userArray['F']=[] }}{{ $userArray['G']=[] }}{{ $userArray['H']=[] }}{{ $userArray['I']=[] }}{{ $userArray['J']=[] }}{{ $userArray['K']=[] }}{{ $userArray['L']=[] }}{{ $userArray['M']=[] }}{{ $userArray['N']=[] }}{{ $userArray['O']=[] }}{{ $userArray['P']=[] }}{{ $userArray['Q']=[] }}{{ $userArray['R']=[] }}{{ $userArray['S']=[] }}{{ $userArray['T']=[] }}{{ $userArray['U']=[] }}{{ $userArray['V']=[] }}{{ $userArray['W']=[] }}{{ $userArray['X']=[] }}{{ $userArray['Y']=[] }}{{ $userArray['Z']=[] }}

        {{* Associative array of arrays - keys are alphabet letters, values are arrays of users whose names start with that letter *}}
        
        {{* list_users filter="editors" editor_groups="8" length="100" *}}
	{{* As can be seen in the example above, list can be further filtered out to specific user type - for example if you create custom user type 'bloggers' in backend (and there you can check id of that type) with option editor_groups="<user_type_id>" you can limit the list to specific type of users *}}

	{{ list_users filter="editors" length="100" }}
          {{ if $gimme->list_user->isAuthor() }}{{* only users that have author profile assigned *}}
            {{ $firstLetter=$gimme->list_user->author->last_name|truncate:1:""|upper }}
            {{ $userArray[$firstLetter][] = $gimme->list_user}}
          {{ /if }}               
        {{ /list_users }}
        
        {{ foreach $userArray as $value }}
        {{ if $value|@count > 0 }}
              <h2>{{ $value@key }}</h2>
            {{ foreach $value as $userValue }}    
                      
                    <article{{ if $userValue['is_featured'] == 1 }} class="featured"{{ /if }}>
		    {{* class 'featured' is used to highlight 'featured' users (if for some reason you need that in logic of your users presentation. This switch exists in user profile in backend *}}
                        <header>                        
              {{ $escapedName=str_replace(" ", "+", $userValue->author->name) }}
              {{ $escapedNameForList=str_replace(" ", "\ ", $userValue->author->name) }}
                        <a href="/author/{{ $escapedName }}">
                        {{ if $userValue->author->picture->imageurl }}
                        	<img src="{{ $userValue->author->picture->getimageurl(90, 90, 'crop') }}" alt="Author" title="Author" style="float: left; margin: 0 20px 0 0" />
                      	{{ else }}
                        	<img src="{{ url static_file="assets/img/user-thumb.jpg" }}" alt="Colunista" title="Colunista" width="90" height="90" style="float: left; margin: 0 20px 0 0" />
                        {{ /if }}
                        </a>
                            <hgroup>
                                <h3>{{ if $userValue->author->defined }}<a href="/author/{{ $escapedName }}">{{ $userValue->author->first_name }} {{ $userValue->author->last_name }}</a>{{ else }}User: {{ $userValue->name }}{{ /if }}</h3>

				{{* If, next to user/author profile you want to show last article published by that user, you can uncomment next piece of smarty code *}}
                		{{* list_articles ignore_issue="true" ignore_section="true" constraints="author is `$escapedNameForList`"  order="ByPublishDate desc" length="1"  }}                                
                                <p><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a>, {{ $gimme->article->publish_date|camp_date_format:"%e/%m/%Y" }}</p>
                                {{ /list_articles *}}
                            </hgroup>
                        </header>
                        <p>{{ $userValue->author->biography->text|strip_tags:false }}</p>
                    </article>
                    
              {{ /foreach }}
        {{ /if }}
        {{ /foreach }}

