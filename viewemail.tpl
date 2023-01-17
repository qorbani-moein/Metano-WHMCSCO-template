<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>{lang key='clientareaemails'} - {$companyname}</title>

    {include file="$template/includes/head.tpl"}

</head>
<body id="popup-backdrop">
    <div class="card bg-default">
        <div class="card-header">
            <h2 class="popup-header-padding text-primary">{$subject} <i class='far fa-envelope'>&nbsp;</i></h2>
        </div>
        <div class="card-body">
            <iframe width="100%" height="680" frameborder="0" srcdoc="{$message|escape}"></iframe>
        </div>
    </div>
</body>
</html>
