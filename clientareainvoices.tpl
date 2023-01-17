{include file="$template/includes/tablelist.tpl" tableName="InvoicesList" filterColumn="4"}

<script>
    jQuery(document).ready(function() {
        var table = jQuery('#tableInvoicesList').show().DataTable();

        {if $orderby == 'default'}
            table.order([4, 'desc'], [2, 'asc']);
        {elseif $orderby == 'invoicenum'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'date'}
            table.order(1, '{$sort}');
        {elseif $orderby == 'duedate'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'total'}
            table.order(3, '{$sort}');
        {elseif $orderby == 'status'}
            table.order(4, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').hide();
    });
</script>

<div class="table-container table-responsive clearfix">
        <h5 class="text-primary">گردش حساب</h5>
        <p>سابقه مالی شما بصورت کامل در این بخش قابل مشاهده می&zwnj;باشد.</p>
	    موجودی حساب: <span class="text-success">{$clientsstats.creditbalance}</span> | 
		قابل پرداخت: <span class="text-danger float">{$clientsstats.dueinvoicesbalance}</span> 
        <hr>
    <table id="tableInvoicesList" class="table table-list w-hidden text-center">
        <thead>
            <tr>
                <th>{lang key='invoicestitle'}</th>
                <th>{lang key='invoicesdatecreated'}</th>
                <th>{lang key='invoicesdatedue'}</th>
                <th>{lang key='invoicestotal'}</th>
                <th>{lang key='invoicesstatus'}</th>
            </tr>
        </thead>
        <tbody>
            {foreach $invoices as $invoice}
                <tr onclick="clickableSafeRedirect(event, 'viewinvoice.php?id={$invoice.id}', false)">
                    <td class="text-primary">{$invoice.invoicenum}</td>
                    <td><span class="w-hidden">{$invoice.normalisedDateCreated}</span>{$invoice.datecreated}</td>
                    <td class="text-danger"><span class="w-hidden">{$invoice.normalisedDateDue}</span>{$invoice.datedue}</td>
                    <td data-order="{$invoice.totalnum}">{$invoice.total}</td>
                    <td class="text-left"><span class="label status status-{$invoice.statusClass}">{$invoice.status}</span></td>
                </tr>
            {/foreach}
        </tbody>
    </table>
    <div class="text-center" id="tableLoading">
        <p><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</p>
    </div>
</div>
