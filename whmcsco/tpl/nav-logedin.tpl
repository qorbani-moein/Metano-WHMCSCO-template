<ul id="nav" class="navbar-nav mr-auto w-auto">
    <li class="d-block no-collapse" id="Primary_Navbar-Home">
        <a class="" href="{if $loggedin}{$WEB_ROOT}/clientarea{else}index{/if}.php"><i class="fa fa-home" aria-hidden="true"></i></a>
    </li>

    <li class="d-block dropdown no-collapse">
        <a class=" dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">خدمات<b class="caret"></b></a>

        <ul class="dropdown-menu">
            <li class="dropdown-item">
                <a class="dropdown-item px-2 py-0" href="{$WEB_ROOT}/clientarea.php?action=products"> <i class="fa fa-angle-left" aria-hidden="true"></i> {$LANG.clientareanavservices}</a>
            </li>
            {if $condlinks.pmaddon}
            <li class="dropdown-item">
                <a class="dropdown-item px-2 py-0" href="{$WEB_ROOT}/index.php?m=project_management"> <i class="fa fa-angle-left" aria-hidden="true"></i> {$LANG.clientareaprojects}</a>
            </li>
            {/if}
            <li class="dropdown-item">
                <a class="dropdown-item px-2 py-0" href="{$WEB_ROOT}/cart.php"> <i class="fa fa-angle-left" aria-hidden="true"></i> {$LANG.navservicesorder}</a>
            </li>
            <li class="dropdown-item">
                <a class="dropdown-item px-2 py-0" href="{$WEB_ROOT}/cart.php?gid=addons"> <i class="fa fa-angle-left" aria-hidden="true"></i> {$LANG.clientareaviewaddons}</a>
            </li>
        </ul>
    </li>

    {if $condlinks.domainreg || $condlinks.domaintrans}
    <!--
    <li class="d-block dropdown no-collapse">
        <a class=" dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">دامنه&zwnj;ها<b class="caret"></b></a>

        <ul class="dropdown-menu">
            <li class="dropdown-item">
                <a class="dropdown-item px-2 py-0" href="{$WEB_ROOT}/clientarea.php?action=domains"> <i class="fa fa-angle-left" aria-hidden="true"></i> {$LANG.clientareanavdomains}</a>
            </li>
            
            {if $condlinks.domainreg}
            <li class="dropdown-item">
                <a class="dropdown-item px-2 py-0" href="{$WEB_ROOT}/cart.php?a=add&domain=register"> <i class="fa fa-angle-left" aria-hidden="true"></i> {$LANG.navregisterdomain}</a>
            </li>
            {/if}
            
            {if $condlinks.domaintrans}
            <li class="dropdown-item">
                <a class="dropdown-item px-2 py-0" href="{$WEB_ROOT}/cart.php?a=add&domain=transfer"> <i class="fa fa-angle-left" aria-hidden="true"></i> {$LANG.navtransferdomain}</a>
            </li>
            {/if}
            
            {if $enomnewtldsenabled}
            <li class="dropdown-item">
                <a class="dropdown-item px-2 py-0" href="{$WEB_ROOT}{$enomnewtldslink}"> <i class="fa fa-angle-left" aria-hidden="true"></i> {$LANG.clientareanavdomains}</a>
            </li>
            {/if}
            
        </ul>
    </li>
    -->
    {/if}
    
    <li class="d-block dropdown no-collapse">
        <a class=" dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">مالی<b class="caret"></b></a>

        <ul class="dropdown-menu">
            <li class="dropdown-item">
                <a class="dropdown-item px-2 py-0" href="{$WEB_ROOT}/clientarea.php?action=invoices"> <i class="fa fa-angle-left" aria-hidden="true"></i> {$LANG.invoices}</a>
            </li>
            
            {if $condlinks.addfunds}
            <li class="dropdown-item">
                <a class="dropdown-item px-2 py-0" href="{$WEB_ROOT}/clientarea.php?action=addfunds"> <i class="fa fa-angle-left" aria-hidden="true"></i> {$LANG.addfunds}</a>
            </li>
            {/if}
            
            {if $condlinks.masspay}
            <li class="dropdown-item">
                <a class="dropdown-item px-2 py-0" href="{$WEB_ROOT}/clientarea.php?action=masspay&all=true"> <i class="fa fa-angle-left" aria-hidden="true"></i> {$LANG.masspaytitle}</a>
            </li>
            {/if}

        </ul>
    </li>
    
    <li class="d-block dropdown no-collapse">
        <a class=" dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">تیکت&zwnj;ها<b class="caret"></b></a>

        <ul class="dropdown-menu">
            <li class="dropdown-item">
                <a class="dropdown-item px-2 py-0" href="{$WEB_ROOT}/supporttickets.php"> <i class="fa fa-angle-left" aria-hidden="true"></i> {$LANG.navtickets}</a>
            </li>
            
            <li class="dropdown-item">
                <a class="dropdown-item px-2 py-0" href="{$WEB_ROOT}/download"> <i class="fa fa-angle-left" aria-hidden="true"></i> مرکز دانلود</a>
            </li>

            <li class="dropdown-item">
                <a class="dropdown-item px-2 py-0" href="{$WEB_ROOT}/serverstatus.php"> <i class="fa fa-angle-left" aria-hidden="true"></i> وضعیت سرور</a>
            </li>
            
        </ul>
    </li>
    
    <!--
    <li class="d-block no-collapse">
        <a class="" href="{$WEB_ROOT}/announcements.php"> اخبار</a>
    </li>
    -->

    <li class="d-block no-collapse">
        <a class="" href="https://eightco.org/blog/">{$LANG.knowledgebasetitle}</a>
    </li>
    
    <li class="d-block no-collapse">
        <a class="" href="{$WEB_ROOT}/affiliates.php">همکاری&zwnj;در&zwnj;فروش</a>
    </li>
    
    
</ul>
