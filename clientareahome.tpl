<section class="widget-box">
	<div class="container">
		<div class="row">
			<div class="widget-box-item">
				<a href="{$WEB_ROOT}/clientarea.php?action=services">
					<div class="bg-icon">
						<i class="fa fa-server"></i>
					</div>
				</a>
				<div class="widget-box-item-content">
					<a href="{$WEB_ROOT}/clientarea.php?action=services">
						<h5>سرویس&zwnj;ها</h5>
					</a>
					<div>
						<span>{$clientsstats.productsnumactive}</span> فعال
						<span class="widget-box-item-content-divider"></span>
						<span>{$clientsstats.productsnumtotal}</span> کل
					</div>
				</div>
			</div>
			
			<div class="widget-box-item pr_40">
				<a href="{$WEB_ROOT}/clientarea.php?action=domains">
					<div class="bg-icon">
						<i class="fas fa-globe"></i>
					</div>
				</a>
				<div class="widget-box-item-content">
					<a href="{$WEB_ROOT}/clientarea.php?action=domains">
						<h5>دامنه&zwnj;ها</h5>
					</a>
					<div>
						<span>{$clientsstats.numactivedomains}</span> فعال
						<span class="widget-box-item-content-divider"></span>
						<span>{$clientsstats.numdomains}</span> کل
					</div>
				</div>
			</div>
			
			<div class="widget-box-item pr_40">
				<a href="{$WEB_ROOT}/supporttickets.php">
					<div class="bg-icon">
						<i class="fas fa-comments"></i>
					</div>
				</a>
				<div class="widget-box-item-content">
					<a href="{$WEB_ROOT}/supporttickets.php">
						<h5>تیکت&zwnj;ها</h5>
					</a>
					<div>
						<span>{$clientsstats.numactivetickets}</span> جاری
						<span class="widget-box-item-content-divider"></span>
						<span>{$clientsstats.numtickets}</span> کل
					</div>
				</div>
			</div>
			
			<div class="widget-box-item pr_40">
				<a href="{$WEB_ROOT}/clientarea.php?action=invoices">
					<div class="bg-icon">
						<i class="fa fa-credit-card"></i>
					</div>
				</a>
				<div class="widget-box-item-content">
					<a href="{$WEB_ROOT}/clientarea.php?action=invoices">
						<h5>صورت حساب&zwnj;ها</h5>
					</a>
					<div>
						<span>{$clientsstats.numdueinvoices}</span> پرداخت نشده
						<span class="widget-box-item-content-divider"></span>
						<span>{$clientsstats.creditbalance}</span> موجودی
					</div>
				</div>
			</div>
			
		</div>
	</div>
</section>


{include file="$template/whmcsco/tpl/clents-slider.tpl"}

<div class="alert alert-primary"> <i class="fab fa-telegram"></i> با عضویت در کانال تلگرامی ما <a href="https://t.me/IDTELEGRAM" target="_blank">IDTelegram@</a> از آخرین اطلاعیه ها و تخفیف‌های سایت همیشه مطلع شوید.</div>
</br>
{foreach $addons_html as $addon_html}
    <div>
        {$addon_html}
    </div>
{/foreach}

<div class="client-home-cards">
    <div class="row">
<div class="col-sm-12 col-xs-12" >
   <div class="card">
    <div class="card-body">
            <h3 class="card-title m-0">
                <i class="fa fa-external-link"></i> 
                تیکت های اخیر
                <a class="btn btn-primary float-left" href="{$WEB_ROOT}/submitticket.php">ارسال تیکت</a>
            </h3>
            <br>
            <div class="table-responsive">
                <table class="table table-list dataTable no-footer">
                    <thead>
                        <tr>
                            <th class="text-right">شماره تیکت</th>
                            <th class="text-right">{$LANG.supportticketssubject}</th>
                            <th>{$LANG.supportticketsdepartment}</th>
                            <th>{$LANG.supportticketsubmitted}</th>
                            <th>{$LANG.supportticketsticketlastupdated}</th>
                            <th>{$LANG.supportticketsstatus}</th>
                            <th class="text-center">عملیات</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $tickets as $key => $ticket}
                            <td>#{$ticket.tid}</td>
                            <td>{if $ticket.unread}<strong>{/if}{$ticket.subject}{if $ticket.unread}</strong>{/if}</td>
                            <td>{$ticket.department}</p></td>
                            <td class="text-center text-danger">{$ticket.date}</td>
                            <td class="text-center text-primary">{$ticket.lastreply}</td>
                            <td class="text-center"><span class="btn bg-color-blue btn-sm">{$ticket.status}</span></td>
                            <td class="text-left"><a class="btn btn-info" href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}">{$LANG.supportticketsviewticket}</a></td>
                        </tr>
                        {foreachelse}
                        <tr>
                            <td colspan="7">هیچ تیکت پشتیبانی برای نمایش وجود ندارد.</td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>

            </div>

      </div>
   </div>
</div>

        <div class="col-md-6 col-lg-12 col-xl-6">

            {function name=outputHomePanels}
                <div menuItemName="{$item->getName()}" class="card card-accent-{$item->getExtra('color')}{if $item->getClass()} {$item->getClass()}{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
                    <div class="card-header">
                        <h3 class="card-title m-0"> 
                        <i class="fa fa-external-link"></i> 
                            {if $item->getExtra('btn-link') && $item->getExtra('btn-text')}
                                <div class="float-left">
                                    <a href="{$item->getExtra('btn-link')}" class="btn bg-color-{$item->getExtra('color')} btn-sm">
                                        {$item->getExtra('btn-text')} 
                                    </a>
                                </div>
                            {/if}
                            {$item->getLabel()}
                            {if $item->hasBadge()}&nbsp;<span class="badge">{$item->getBadge()}</span>{/if}
                        </h3>
                    </div>
                    {if $item->hasBodyHtml()}
                        <div class="card-body">
                            {$item->getBodyHtml()}
                        </div>
                    {/if}
                    {if $item->hasChildren()}
                        <div class="list-group{if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}">
                            {foreach $item->getChildren() as $childItem}
                                {if $childItem->getUri()}
                                    <a menuItemName="{$childItem->getName()}" href="{$childItem->getUri()}" class="list-group-item list-group-item-action{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}"{if $childItem->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if} id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                        {$childItem->getLabel()}
                                        {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                                    </a>
                                {else}
                                    <div menuItemName="{$childItem->getName()}" class="list-group-item list-group-item-action{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()}"></i>&nbsp;{/if}
                                        {$childItem->getLabel()}
                                        {if $childItem->hasBadge()}&nbsp;<span class="badge">{$childItem->getBadge()}</span>{/if}
                                    </div>
                                {/if}
                            {/foreach}
                        </div>
                    {/if}
                    <div class="card-footer">
                        {if $item->hasFooterHtml()}
                            {$item->getFooterHtml()}
                        {/if}
                    </div>
                </div>
            {/function}

            {foreach $panels as $item}
                {if $item@iteration is odd}
                    {outputHomePanels}
                {/if}
            {/foreach}

        </div>
        <div class="col-md-6 col-lg-12 col-xl-6">

            {foreach $panels as $item}
                {if $item@iteration is even}
                    {outputHomePanels}
                {/if}
            {/foreach}

        </div>
    </div>
</div>
