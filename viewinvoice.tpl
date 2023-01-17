{include file="$template/header.tpl"}
    <link href="{assetPath file='invoice-sina.css'}?v={$versionHash}" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/assets/css/fontawesome-all.min.css" />
	<div class="card card-body">
    <div class="container-fluid invoice-container top">
    {if $invalidInvoiceIdRequested}
        {include file="$template/includes/panel.tpl" type="danger" headerTitle=$LANG.error bodyContent=$LANG.invoiceserror bodyTextCenter=true}
    {else}
        <div class="row">
            <div class="col-xs-12 col-sm-6 text-right float-right">
                {if $status eq "Paid" OR $status eq "Payment Pending"}
                    <span>{$LANG.invoicespaid} ({$datepaid})</span>
                {/if}
                
                {$gateway}
                
                {if $status eq "Unpaid" && $allowchangegateway}
                <form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}" class="form-inline form-payment-method">
                    <span>{$LANG.paymentmethod} </span>{$gatewaydropdown}
                    <input type="hidden" name="pay" value="{$LANG.makepayment}" />
                </form>
                
                <div class="paymentbutton">
                {$paymentbutton}
                </div>
                {/if}
            </div>
            <div class="col-xs-12 col-sm-6 text-left float-left">
                <p class="invoice-status-top">
                {if $status eq "Draft"}
                    <span class="draft">{$LANG.invoicesdraft}</span>
                {elseif $status eq "Unpaid"}
                    <span class="unpaid">{$LANG.invoicesunpaid}</span>
                {elseif $status eq "Paid"}
                    <span class="paid">{$LANG.invoicespaid}</span>
                {elseif $status eq "Refunded"}
                    <span class="refunded">{$LANG.invoicesrefunded}</span>
                {elseif $status eq "Cancelled"}
                    <span class="cancelled">{$LANG.invoicescancelled}</span>
                {elseif $status eq "Collections"}
                    <span class="collections">{$LANG.invoicescollections}</span>
                {elseif $status eq "Payment Pending"}
                    <span class="paid">{$LANG.invoicesPaymentPending}</span>
                {/if}
                </p>
            </div>
        </div>
    </div>
    
    {if $manualapplycredit}
    <div class="invoice-details apply-credit">
        <div class="invoice-info">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xs-12">
                        
                        <p>{$LANG.invoiceaddcreditapply}</p>
                        <form method="post" action="{$smarty.server.PHP_SELF}?id={$invoiceid}">
                            <input type="hidden" name="applycredit" value="true" />
                            <p>
                            {$LANG.invoiceaddcreditdesc1} <strong>{$totalcredit}</strong>. {$LANG.invoiceaddcreditdesc2}. {$LANG.invoiceaddcreditamount}:
                            <br />
                            <br />
                            </p>
                            <div class="row">
                                <div class="col-xs-8 col-xs-offset-2 col-sm-4 col-sm-offset-4">
                                    <div class="input-group">
                                        <input type="text" name="creditamount" value="{$creditamount}" class="form-control" />
                                        <span class="input-group-btn">
                                            <input type="submit" value="{$LANG.invoiceaddcreditapply}" class="btn btn-success" />
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {/if}
    
    <div class="container-fluid invoice-container">
        <div class="row">     
            <div class="col-xs-12 col-sm-12 col-md-6 pull-right">
                <div class="personal bordered">
                    <div class="personal-title">
                        {$LANG.invoicesinvoicedto}
                    </div>
                    <div class="personal-details">
                        <p>{$clientsdetails.companyname}</p>
                        <p>{$clientsdetails.fullname}</p>
                        <p>{$clientsdetails.address1}</p>
                        <p>{$clientsdetails.state} ,{$clientsdetails.city} ,{$clientsdetails.postcode}</p>
                        <p>{$clientsdetails.country}</p>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 pull-right">
                <div class="personal">
                    <div class="personal-title">
                        {$LANG.invoicespayto}
                    </div>
                    <div class="personal-details">
                        <p>{$payto}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div class="invoice-details">
                    <div class="invoice-info">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-xs-12 col-sm-4 text-center">{$LANG.invoicenumber}{$invoiceid}</div>
                                <div class="col-xs-12 col-sm-4 text-center">{$LANG.invoicesdatecreated}: {$date}</div>
                                <div class="col-xs-12 col-sm-4 text-center">{$LANG.invoicesdatedue}: {$datedue}</div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xs-12 no-padding">
                                <div class="table-responsive">
                                    <table class="table invoice-items">
                                        <tbody>
                                            <tr>
                                                <td class="text-right">{$LANG.invoicesdescription}</th>
                                                <td width="150px" class="text-center">{$LANG.invoicesamount}</th>
                                            </tr>
                                            {foreach from=$invoiceitems item=item}
                                                <tr>
                                                    <td class="text-right">{$item.description}{if $item.taxed eq "true"} *{/if}</td>
                                                    <td class="text-center">{$item.amount}</td>
                                                </tr>
                                            {/foreach}
                                            <tr>
                                                <td class="text-right">{$LANG.invoicessubtotal}</td>
                                                <td class="text-center">{$subtotal}</td>
                                            </tr>
                                            {if $taxrate}
                                                <tr>
                                                    <td class="text-right">{$taxrate}% {$taxname}</td>
                                                    <td class="text-center">{$tax}</td>
                                                </tr>
                                            {/if}
                                            {if $taxrate2}
                                                <tr>
                                                    <td class="text-right">{$taxrate2}% {$taxname2}</td>
                                                    <td class="text-center">{$tax2}</td>
                                                </tr>
                                            {/if}
                                            <tr>
                                                <td class="text-right">{$LANG.invoicescredit}</td>
                                                <td class="text-center">{$credit}</td>
                                            </tr>
                                            <tr class="total-row">
                                                <td class="text-right">{$LANG.invoicestotal}</td>
                                                <td class="text-center">{$total}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xs-12 transactions-title"><span>{$LANG.invoicestransactions}</span></div>
                            <div class="col-xs-12 no-padding">
                                <div class="table-responsive">
                                    <table class="table transactions-table">
                                        <tbody>
                                            <tr>
                                                <td class="text-center">{$LANG.invoicestransdate}</th>
                                                <td class="text-center">{$LANG.invoicestransgateway}</th>
                                                <td class="text-center">{$LANG.invoicestransid}</th>
                                                <td width="150px" class="text-center">{$LANG.invoicestransamount}</th>
                                            </tr>
                                            {foreach from=$transactions item=transaction}
                                                <tr>
                                                    <td class="text-center">{$transaction.date}</td>
                                                    <td class="text-center">{$transaction.gateway}</td>
                                                    <td class="text-center">{$transaction.transid}</td>
                                                    <td class="text-center">{$transaction.amount}</td>
                                                </tr>
                                            {foreachelse}
                                                <tr>
                                                    <td class="text-center" colspan="4">{$LANG.invoicestransnonefound}</td>
                                                </tr>
                                            {/foreach}
                                            <tr>
                                                <td class="text-right" colspan="3">{$LANG.invoicesbalance}</td>
                                                <td class="text-center">{$balance}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    {if $notes}
                    <div class="container-fluid">
                        <div class="row">   
                            <div class="col-xs-12 transactions-title"><span>{$LANG.invoicesnotes}</span></div>
                            <div class="col-xs-12">
                                <p>
                                {$notes}
                                </p>
                            </div>
                        </div>
                    </div>
                    {/if}
                    
                </div>    
            </div>
        </div>
    </div>

    <div class="container-fluid invoice-container">

            

        {/if}

    </div>
    
    <div class="invoice-details invoice-btns">
        <p class="text-center hidden-print">
            <a href="javascript:window.print()" class="btn btn-warning"><i class="fa fa-print"></i> {$LANG.print}</a>
            <a href="dl.php?type=i&amp;id={$invoiceid}" class="btn btn-success"><i class="fa fa-download"></i> {$LANG.invoicesdownload}</a>
        </p>
    </div>
</div>
{include file="$template/footer.tpl"}