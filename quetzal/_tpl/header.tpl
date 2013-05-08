        <!-- HEADER -->
        <header role="banner">
            
            <div class="container">
                <!-- TOPBAR NAV -->
                <nav id="topnav" class="navbar">
                    <div class="navbar-inner user-top-lef-links">
                        <div class="pull-left welcome hidden-phone">
                            <span class="red-text">{{ #welcome# }}</span> {{$smarty.now|date_format:"%d/%m/%Y"}} 
                        </div>
                        {{ if !$gimme->user->logged_in}}
                        <a href="{{ $view->url(['controller' => 'auth', 'action' =>'index'], 'default') }}" class="pull-left white-text visible-phone login-link">
                            <i class="icon-user icon-white"></i> {{ #login# }} 
                        </a>
                        {{ else }}
                        <a href="{{ $view->url(['controller' => 'auth', 'action' =>'logout'], 'default') }}" class="pull-left white-text visible-phone login-link">
                            <i class="icon-user icon-white"></i> {{ #logout# }}
                        </a>
                        {{ /if }}
                        <a href="/user" class="pull-left white-text visible-phone">&nbsp;|&nbsp;{{ #community# }}</a>                         
                        <ul class="nav pull-right social-buttons">
                          <li class="visible-desktop"><a href="#" class="fb">{{ #beOurFan# }}</a></li>
                          <li class="visible-desktop"><a href="#" class="tw">{{ #followUs# }}</a></li>
                          <li class="visible-desktop"><a href="/en/static/rss" class="rss">{{ #rssFeed# }}</a></li>
                          <li class="visible-tablet"><a href="#" class="fb">Facebook</a></li>
                          <li class="visible-tablet"><a href="#" class="tw">Twitter</a></li>
                          <li class="visible-tablet"><a href="#" class="rss">{{ #rssFeed# }}</a></li>
                          <li class="visible-phone"><a href="#" class="fb">&nbsp;</a></li>
                          <li class="visible-phone"><a href="#" class="tw">&nbsp;</a></li>
                          <li class="visible-phone"><a href="#" class="rss">&nbsp;</a></li>
                        </ul>
                    </div>                    
                </nav>
                <!-- TOPBAR NAV END -->

                <!-- BANNER & SEACH -->
                <div class="row logo-search">
                    <div class="span7">                        
                        <a href="/">
                            <img class="logo pull-left" src="{{ url static_file='_img/logo.png'}}" alt="{{$gimme->publication->name}}">
                        </a> 

                        <!-- NAVIGATION FOR PHONE -->                       
                        <ul class="nav visible-phone pull-right phone-nav">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle btn btn-red" data-toggle="dropdown">
                                    {{ #sections# }}
                                </a>
                                <ul class="dropdown-menu">
                                    {{ list_sections }}
                                    <li class="pull-left"><a class="btn" href="{{ uri option="section"}}">{{ $gimme->section->name}}</a></li>
                                    {{ /list_sections }}
                                </ul>
                            </li>
                        </ul>
                        <!-- END NAVIGATION FOR PHONE-->
                        <div class="clearfix"></div>

                    </div>
                    <div class="span5">
                        <form id="seachform" name="search_articles" action="/{{ $gimme->language->code }}/{{ $gimme->issue->url_name }}/" method="POST">
                            <div class="input-append pull-right">
                                <input type="hidden" name="tpl" value="7">
                                <input type="search" placeholder="Search" name="f_search_keywords">
                                <button class="btn" type="submit" name="f_search_articles"><i class="icon-search"></i></button>
                            </div>
                            <div class="clearfix"></div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- MAIN NAV -->
            <nav role="navigation" class="container navbar navbar-inverse visible-desktop">    
                <div class="navbar-inner">
                    <ul class="nav">
                        {{ list_sections }}
                        <li>
                            <a href="{{ uri option="section"}}">
                                {{ $gimme->section->name }}
                            </a>
                        </li>
                        {{ /list_sections }}
                    </ul>
                    
                    <ul class="nav pull-right login-nav">
                        <li class="dropdown">
                            <a href="/user" class="white-text">{{ #community# }}</a>
                            {{ if !$gimme->user->logged_in }}
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                {{ #login# }} <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- LOGIN FORM TWITTER STYLE -->
                                <form style="margin: 0px" accept-charset="UTF-8" action="{{ $view->url(['controller' => 'auth', 'action' =>'index'], 'default') }}" method="post">
                                    <fieldset class='textbox' style="padding:10px">
                                        <input name="email" id="email" style="margin-top: 8px" type="text" placeholder="Email" />
                                        <input name="password" id="password" style="margin-top: 8px" type="password" placeholder="Passsword" />
                                        <button class="btn btn-danger" name="submit" type="submit">{{ #login# }}</button>
                                        or <a href="{{ $view->url(['controller' => 'register', 'action' => 'index']) }}" class="red-text negrita-weight">{{ #signUp# }}</a>
                                        <br>
                                        <a class="red-text negrita-weight pull-right"href="{{ $view->url(['controller' => 'auth', 'action' => 'password-restore']) }}">Forgot password?</a>
                                        </span>
                                    </fieldset>
                                </form>
                            </ul>
                            {{ else }}
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                Hi {{$gimme->user->uname}} <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu profile-dropdown">
                                <li><a href='{{ $view->url(['username' => $gimme->user->uname], 'user') }}'>{{ #profile# }}</a></li>
                                <li><a href='/dashboard'>Edit Profile</a></li>
                                <li><a href='{{ $view->url(['controller' => 'auth', 'action' => 'logout'], 'default') }}?t={{ time() }}'>{{ #logout# }}</a></li>
                            </ul>
                            {{ /if }}
                        </li>
                    </ul>
                </div>
            </nav>  

            <!-- MAIN NAV TABLET -->                                     
            <ul class="nav visible-tablet pull-left phone-nav tablet-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle btn btn-red" data-toggle="dropdown">
                        {{ #sections# }}
                    </a>
                    <ul class="dropdown-menu">
                        {{ list_sections }}
                        <li class="pull-left"><a class="btn" href="{{ uri option="section"}}">{{ $gimme->section->name}}</a></li>
                        {{ /list_sections }}
                    </ul>
                </li>
            </ul>

            <ul class="nav visible-tablet pull-right login-nav login-nav-tablet">
                <li class="dropdown">
                    {{ if !$gimme->user->logged_in }}
                    <a href="#" class="dropdown-toggle btn btn-gray pull-left" data-toggle="dropdown">
                        <i class="icon-user icon-white"></i> {{ #login# }}
                    </a>
                    <ul class="dropdown-menu">                        
                        <form style="margin: 0px" accept-charset="UTF-8" action="{{ $view->url(['controller' => 'auth', 'action' =>'index'], 'default') }}" method="post">
                            <fieldset class='textbox' style="padding:10px">
                                <input name="email" id="email" style="margin-top: 8px" type="text" placeholder="Email" />
                                <input name="password" id="password" style="margin-top: 8px" type="password" placeholder="Passsword" />
                                <button class="btn btn-danger" name="submit" type="submit">{{ #login# }}</button>
                                or <a href="{{ $view->url(['controller' => 'register', 'action' => 'index']) }}" class="red-text negrita-weight">{{ #signUp# }}</a>
                                <br>
                                <a class="red-text negrita-weight pull-right" href="{{ $view->url(['controller' => 'auth', 'action' => 'password-restore']) }}">Forgot password?</a>
                            </fieldset>
                        </form>
                    </ul>

                    {{ else }}
                    <a href="#" class="dropdown-toggle btn btn-gray pull-left" data-toggle="dropdown">
                        <i class="icon-user icon-white"></i> {{ #hi# }} {{ $gimme->user->uname }} 
                    </a>
                    <ul class="dropdown-menu profile-dropdown">
                        <li><a href='{{ $view->url(['username' => $gimme->user->uname], 'user') }}'>Profile</a></li>
                        <li><a href='/dashboard'>Edit Profile</a></li>
                        <li><a href='{{ $view->url(['controller' => 'auth', 'action' => 'logout'], 'default') }}?t={{ time() }}'>{{ #logout# }}</a></li>
                    </ul>
                    {{ /if }} 
                    <a href="/user" class="btn btn-gray pull-left">
                         {{ #community# }}
                    </a>
                </li>
            </ul>            
            <div class="clearfix visible-tablet"></div>
            <!--  END MAIN NAV TABLET -->
        </header>       
