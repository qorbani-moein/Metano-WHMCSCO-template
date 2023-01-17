<div class="card">
    <div class="card-body">
        <form role="form" method="post" action="{routePath('download-search')}">
    <div class="input-group input-group-lg kb-search margin-bottom">
        <input type="text" name="search" id="inputDownloadsSearch" class="form-control font-weight-light" placeholder="{lang key='downloadssearch'}" />
        <div class="input-group-append">
            <button type="submit" id="btnDownloadsSearch" class="btn btn-primary btn-input-padded-responsive">
                {lang key='search'}
            </button>
        </div>
    </div>
</form>

{if $dlcats}
<div class="container">
    <div class="row">
        {foreach $dlcats as $category}
            <div class="col-xs-12 col-sm-4 col-md-4 tile">
                    <a href="{routePath('download-by-cat', {$category.id}, {$category.urlfriendlyname})}" >
                <div class="card card-body mb-2">
                        <span class="h6 m-0">
                            <i class="fal fa-folder fa-fw"></i>
                            {$category.name}<br>
                            <span class="badge badge-danger">
                                {lang key="downloads.numDownload{if $kbcat.numarticles != 1}s{/if}" num=$category.numarticles}
                            </span>
                        </span>
                </div></a><br>
            </div>
        {/foreach}
    </div>
</div>
{else}
    {include file="$template/includes/alert.tpl" type="info" msg="{lang key='downloadsnone'}" textcenter=true}
{/if}

{if $mostdownloads}
    <div class="card">
        <div class="card-body">
            <h3 class="card-title m-0">
                <i class="fal fa-star fa-fw"></i>
                {lang key='downloadspopular'}
            </h3>
        </div>
        <div class="list-group list-group-flush">
            {foreach $mostdownloads as $download}
                <a href="{$download.link}" class="list-group-item kb-article-item">
                    {$download.type|replace:'alt':' class="pr-1" alt'}
                    {$download.title}
                    {if $download.clientsonly}
                        <div class="float-md-left">
                            <span class="label label-danger">
                                <i class="fas fa-lock fa-fw"></i>
                                ویژه
                            </span>
                        </div>
                    {/if}
                    <hr/>
                    <small>
                        {$download.description}
                        <br>
                        <strong>{lang key='downloadsfilesize'}: {$download.filesize}</strong>
                    </small>
                </a>
            {/foreach}
        </div>
    </div>
           </div>
    </div> 
{/if}
