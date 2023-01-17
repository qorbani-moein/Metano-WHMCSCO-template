{if !$invalidTicketId}
    <div class="card">
        <div class="card-body p-3">
            <h3 class="card-title">
                <h1 class="text-primary"><i class="fa fa-quote-right"></i> {$subject}</h1>
                <div class="ticket-actions float-sm-left mt-3 mt-sm-0">
                    <a class="btn btn-success btn-sm" data-toggle="modal" data-target="#modal-ticket-add-reply">
                        <span>{$LANG.supportticketsreply}</span>
                        <i class="fas fa-comment-plus"></i>
                    </a>

                    {if $closedticket}
                        <button class="btn btn-danger btn-sm" disabled="disabled">
                            <i class="fas fa-times fa-fw"></i>
                        </button>
                    {else}
                        <button class="btn btn-danger btn-sm" onclick="window.location='?tid={$tid}&amp;c={$c}&amp;closeticket=true'">
                            <i class="fas fa-times fa-fw"></i>
                        </button>
                    {/if}
                </div>
            </h3>
            <p>
                شماره تیکت: <strong> {$tid}#</strong><br>
                وضعیت: {$status}<br>
                اهمیت:<strong> {$priority}</strong><br>
                دپارتمان پشتیبانی:<strong> {$department}</strong><br>
                تاریخ ثبت درخواست: <strong>{$date}</strong><br>
            </p>
{if $invalidTicketId}
    {include file="$template/includes/alert.tpl" type="danger" title="{lang key='thereisaproblem'}" msg="{lang key='supportticketinvalid'}" textcenter=true}
{else}
    {if $closedticket}
        {include file="$template/includes/alert.tpl" type="warning" msg="{lang key='supportticketclosedmsg'}" textcenter=true}
    {/if}

    {if $errormessage}
        {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
    {/if}
{/if}
        </div>
    </div>


{* ************ begin ticket replies ***************** *}
<div class="ticket-replies">
    {assign var="allAdmins" value=\WHMCS\User\Admin::get()} {foreach from=$descreplies key=num item=reply} {assign var="adminFlag" value="0"} {assign var="replyadmin" value=""} {assign var="attachmentsCount" value=count($reply.attachments)} {if $reply.admin} {foreach from=$allAdmins key=adminNum item=adminItem} {if $adminFlag eq "0"} {if ($adminItem->fullName|trim) eq ($reply.name|trim)} {assign var="adminFlag" value="1"} {assign var="replyadmin" value=$adminItem} {/if} {/if} {/foreach} {assign var="md5Email" value=$replyadmin->email|@md5} {else} {assign var="md5Email" value=$reply.email|@md5} {/if}

            <div class="replies-{if $reply.admin}admin{else}client{/if} reply">
                <div class="replies-user-info">
                    <img class="replies-user-image" src="https://www.gravatar.com/avatar/{$md5Email}" />
                    <span class="replies-user-title">
                            <span>{$reply.name}</span>
                    </span>
                    <span class="replies-user-type">
                            <span>
                            {if $reply.admin}
                                {$LANG.supportticketsstaff}
                            {elseif $reply.contactid}
                                {$LANG.supportticketscontact}
                            {elseif $reply.userid}
                                {$LANG.supportticketsclient}
                            {else}
                                {$reply.email}
                            {/if}
                            </span>
                    </span>
                        <span class="replies-date">
                                    <span>{$reply.date}</span>
                        </span>
            </div>
            <div class="replies-info">
                <div class="replies-content">
                    {$reply.message}
                                {if $reply.attachments}
                    <hr>
                <div class="attachments">
                    <strong>{$LANG.supportticketsticketattachments} ({$reply.attachments|count})</strong>
                    {if $reply.attachments_removed}({lang key='support.attachmentsRemoved'}){/if}
                    <ul>
                        {foreach from=$reply.attachments key=num item=attachment}
                            {if $reply.attachments_removed}
                                <li>
                                    <i class="far fa-file-minus"></i>
                                    {$attachment}
                                </li>
                            {else}
                                <li>
                                    <i class="far fa-file"></i>
                                    <a href="dl.php?type={if $reply.id}ar&id={$reply.id}{else}a&id={$id}{/if}&i={$num}">
                                        {$attachment}
                                    </a>
                                </li>
                            {/if}

                        {/foreach}
                    </ul>
                </div>
            {/if}

                </div>
            </div>
</div>
{/foreach}
{* ************ end ticket replies ***************** *}
    </div>
    

    <div class="modal fade ticket-modals" id="modal-ticket-add-reply" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="ticket-add-reply">
        <div class="modal-content">
            
        <div class="card-body">

            <form method="post" action="{$smarty.server.PHP_SELF}?tid={$tid}&amp;c={$c}&amp;postreply=true" enctype="multipart/form-data" role="form" id="frmReply">

                <div class="form-group">
                    <label for="inputMessage">متن پیام</label>
                    <textarea name="replymessage" id="inputMessage" rows="6" class="form-control markdown-editor" data-auto-save-name="ctr{$tid}">{$replymessage}</textarea>
                </div>

                <div class="form-group">
                    <label for="inputAttachments">{lang key='supportticketsticketattachments'}</label>
                    <button class="btn btn-info" type="button" id="btnTicketAttachmentsAdd"><i class="fas fa-plus"></i></button><br><br>
                    <div class="input-group mb-1 attachment-group">
                        <div class="custom-file">
                            <label class="custom-file-label text-truncate" for="inputAttachment1" data-default="Choose file">
                                انتخاب فایل
                            <input type="file" class="custom-file-input" name="attachments[]" id="inputAttachment1">
                        </div>
                    </div>
                    <div class="file-upload w-hidden">
                        <div class="input-group mb-1 attachment-group">
                            <div class="custom-file">
                                <label class="custom-file-label text-truncate">
                                    انتخاب فایل ...
                                </label>
                                <input type="file" class="custom-file-input" name="attachments[]">
                            </div>
                        </div>
                    </div>
                    <div id="fileUploadsContainer"></div>
                    <br>
                    <div class="text-muted">
                        <div class="alert alert-warning">{lang key='supportticketsallowedextensions'}: {$allowedfiletypes}</div>
                    </div>
                </div>

                <div class="modal-footer">
                    <input class="btn btn-success" type="submit" name="save" value="ارسال پاسخ" />
                    <button type="button" class="btn btn-danger" data-dismiss="modal">بستن</button>
                </div>
            </form>
        </div>
        
        </div>
    
    </div>
    </div>
    

{/if}
