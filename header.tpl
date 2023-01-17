<!doctype html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
    {include file="$template/includes/head.tpl"}
    {$headoutput}
</head>
<body class="primary-bg-color" data-phone-cc-input="{$phoneNumberInputStyle}">

    {$headeroutput} 
    {if $templatefile != 'login' && $templatefile != 'logout' && $templatefile != 'pwreset' && $templatefile != 'password-reset-container' && $templatefile != 'clientregister'} 
    
        <header id="header" class="header">

        <div class="navbar navbar-light">
            <div class="container">
                    <li class="nav-item ml-1 d-xl-none">
                        <button class="btn nav-link" type="button" data-toggle="collapse" data-target="#mainNavbar">
                            <span class="fas fa-bars fa-fw"></span>
                        </button>
                    </li>
                    
                <a class="navbar-brand mr-3" href="{$WEB_ROOT}/index.php">
                    {if $assetLogoPath}
                        <img src="{$assetLogoPath}" alt="{$companyname}" class="logo-img">
                    {else}
                        {$companyname}
                    {/if}
                </a>

                <form method="post" action="{routePath('knowledgebase-search')}" class="form-inline ml-auto">
                    <div class="input-group search d-none d-xl-flex">
                        <div class="input-group-prepend">
                            <button class="btn btn-default" type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                        <input class="form-control appended-form-control font-weight-light" type="text" name="search" placeholder="{lang key="searchOurKnowledgebase"}...">
                    </div>
                </form>

                <ul class="navbar-nav toolbar form-inline ml-auto">
                    <li class="nav-item ml-1">
                        <a class="btn nav-link text-primary" href="tel:123456789">
                            <i class="fas fa-phone"></i>
                        </a>
                    </li>
                    <li class="nav-item ml-1">
                        <a class="btn nav-link text-primary" href="{$WEB_ROOT}/cart.php?a=view">
                            <i class="fas fa-shopping-cart"></i>
                        </a>
                    </li>
                    
                     {* begin if client is login *} 
                     {if $client} 
                     {assign var=allNotifications value=($clientsstats.numactivetickets + $clientsstats.numunpaidinvoices + ($clientsstats.productsnumtotal - $clientsstats.productsnumactive))} 
                    <button id="notifications" class="btn nav-link text-primary" data-toggle="modal" data-target="#myModal">
                      <i class="far fa-flag"></i>
                      <span class="client-top-access-item-count">
                      {if count($clientAlerts) > 0}
                                    {count($clientAlerts)}
                                {else}
                                    <span class="d-sm-none">0</span>
                                {/if}
                      </span>
                    </button>
                    
                    <!-- Modal -->
                    <div id="myModal" class="modal fade" role="dialog">
                      <div class="modal-dialog modal-lg">
                        <!-- Modal content-->
                        <div class="modal-content">
                          <div class="modal-body">
                            <li>
                                {foreach $clientAlerts as $alert}
                                <a href="{$alert->getLink()}">
                                <span class="icon">
                                            <i class="fas fa-fw fa-{if $alert->getSeverity() == 'danger'}exclamation-circle{elseif $alert->getSeverity() == 'warning'}exclamation-triangle{elseif $alert->getSeverity() == 'info'}info-circle{else}check-circle{/if}"></i>
                                </span>
                                <span class="notification-content">
                                  <span class="notification-title">{$alert->getMessage()}</span>
                                </span>
                                </a> 
                                {foreachelse}

                              </a><div class="alert alert-info margin-5 padding-5 text-center"> هیچ پیامی وجود ندارد </div><br>
                                {/foreach}
                            </li>
                              <button type="button" class="btn btn-danger btn-sm light float-right" data-dismiss="modal">بستن</button>
                          </div>
                        </div>
                      </div>
                    </div>
                    {/if} {* end if client is login *}

                    <li class="nav-item ml-1">
                        <a class="btn nav-link text-primary">
                            <i class="fas fa-user"></i>
                        </a>
                    </li>
                </ul>
                    <div class="navlog">
                        {include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar rightDrop=true}
                    </div>
                

            </div>
                    <div class="navmin">
                        {include file="$template/includes/navbarmin.tpl" navbar=$secondaryNavbar rightDrop=true}
                    </div>
        </div>
        <div class="navbar navbar-expand-xl main-navbar-wrapper">
            <div class="container">
                <div class="collapse navbar-collapse" id="mainNavbar">
                    <form method="post" action="{routePath('knowledgebase-search')}" class="d-xl-none">
                        <div class="input-group search w-100 mb-2">
                            <div class="input-group-prepend">
                                <button class="btn btn-default" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                            <input class="form-control prepended-form-control" type="text" name="search" placeholder="{lang key="searchOurKnowledgebase"}...">
                        </div>
                    </form>
                    <ul id="nav" class="navbar-nav mr-auto">

                {if $loggedin}
                    {include file="$template/whmcsco/tpl/nav-logedin.tpl"}
                    {else}
                    {include file="$template/whmcsco/tpl/nav-logedout.tpl"}
                {/if}
                </ul>

                    <ul class="navbar-nav ml-auto">
                        <a class="btn btn-sm btn-inline hidden-xs hidden-md" href="https://eightco.org/contact-us/">تماس با ما</a>
                        <a class="btn bg-color-blue btn-sm btn-inline" href="{$WEB_ROOT}/submitticket.php">ارسال تیکت</a>

                     </ul>

                </div>
            </div>
        </div>
    </header>

    {/if} 
    
    {include file="$template/includes/network-issues-notifications.tpl"}

    {include file="$template/includes/verifyemail.tpl"}


{if $templatefile != 'homepage' && $templatefile != 'clientareahome'}
{if $templatefile != 'login' && $templatefile != 'logout' && $templatefile != 'pwreset' && $templatefile != 'password-reset-container' && $templatefile != 'clientregister'}

    <section id="main-body">
        <div class="{if !$skipMainBodyContainer}container{/if}">
            <div class="row">

            {if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
                <div class="col-lg-4 col-xl-3">
                    <div class="sidebar">
                        {include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
                    </div>
                    {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                        <div class="d-none d-lg-block sidebar">
                            {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                        </div>
                    {/if}
                </div>
            {/if}
            <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}col-lg-8 col-xl-9{else}col-12{/if} primary-content">

{/if}
{/if}

{if $templatefile == 'clientareahome'}
    <section id="main-body">
        <div class="{if !$skipMainBodyContainer}container{/if}">
            <div class="row">
            <div class="col-12 primary-content">

{/if}
