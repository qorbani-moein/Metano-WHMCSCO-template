{include file="$template/includes/tablelist.tpl" tableName="TicketsList" filterColumn="2"}

<script>
    jQuery(document).ready(function () {
        var table = jQuery('#tableTicketsList').show().DataTable();
        {if $orderby == 'did' || $orderby == 'dept'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'subject' || $orderby == 'title'}
            table.order(1, '{$sort}');
        {elseif $orderby == 'status'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'lastreply'}
            table.order(3, '{$sort}');
        {/if}
        table.draw();
        jQuery('#tableLoading').hide();
    });
</script>

<div class="table-container table-responsive clearfix">
        <div class="panel-heading"><h5 class="text-primary">پشتیبانی</h5><p>راه ارتباطی اصلی با مشتریان سیستم تیکت می&zwnj;باشد.</p></div>
    <table id="tableTicketsList" class="table table-list w-hidden">
        <thead>
            <tr>
                <th>{lang key='supportticketsdepartment'}</th>
                <th>{lang key='supportticketssubject'}</th>
                <th>{lang key='supportticketsstatus'}</th>
                <th>بروزرسانی</th>
            </tr>
        </thead>
        <tbody>
            {foreach $tickets as $ticket}
                <tr onclick="window.location='viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}'">
                    <td style="width: 20%;">
                        {$ticket.department}
                    </td>
                    <td style="width: 50%;">
                        <a href="viewticket.php?tid={$ticket.tid}&amp;c={$ticket.c}" class="border-left">
                            <span class="ticket-number">#{$ticket.tid}</span> - 
                            <span class="ticket-subject{if $ticket.unread} unread{/if}">{$ticket.subject}</span>
                        </a>
                    </td>
                    <td class="text-center" style="width: 15%;">
                        <span class="label status {if is_null($ticket.statusColor)}status-{$ticket.statusClass}"{else}status-custom" style="background-color:{$ticket.statusColor}"{/if}>
                            {$ticket.status|strip_tags}
                        </span>
                    </td>
                    <td class="text-center text-danger" style="width: 15%;">
                        <span class="w-hidden">{$ticket.normalisedLastReply}</span>
                        {$ticket.lastreply}
                    </td>
                </tr>
            {/foreach}
        </tbody>
    </table>
    <div class="text-center" id="tableLoading">
        <p><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</p>
    </div>
</div>
