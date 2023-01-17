<div class="card">
    <div class="card-body extra-padding">
        <div class="mb-4">
            <h3 class="card-title">{lang key="createNewSupportRequest"}</h3>
            <p class="text-muted mb-0">{lang key='supportticketsheader'}</p>
        </div>

<div class="row">
    <div class="col-sm-12">
        <div class="row">
            {foreach from=$departments key=num item=department}
                <div class="col-md-6 margin-bottom">
                    <div class="depa">
                        <strong>
                            <h6><a href="{$smarty.server.PHP_SELF}?step=2&amp;deptid={$department.id}">
                                <i class="fas fa-envelope"></i>
                                &nbsp;{$department.name}
                            </a></h6>
                        </strong>
                    {if $department.description}
                        {$department.description}
                    {/if}
                    </div>
                </div>
                {if $num % 2 == true}
                    <div class="clearfix"></div>
                {/if}
            {foreachelse}
                {include file="$template/includes/alert.tpl" type="info" msg=$LANG.nosupportdepartments textcenter=true}
            {/foreach}
        </div>
    </div>
</div>
    </div>
</div>
