<!-- Styling -->
<link href="{assetPath file='style.rtl1.css'}?v={$versionHash}" rel="stylesheet">
<link href="{assetPath file='style.rtl2.css'}?v={$versionHash}" rel="stylesheet">
<link href="{assetPath file='style.rtl3.css'}?v={$versionHash}" rel="stylesheet">
<link href="{assetPath file='style.rtl4.css'}?v={$versionHash}" rel="stylesheet">
<link href="{assetPath file='style.rtl5.css'}?v={$versionHash}" rel="stylesheet">
<link href="{$WEB_ROOT}/assets/css/fontawesome-all.min.css" rel="stylesheet">
{assetExists file="custom.css"}
<link href="{$__assetPath__}" rel="stylesheet">
{/assetExists}

<script>
    var csrfToken = '{$token}',
        markdownGuide = '{lang key="markdown.title"}',
        locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
        saved = '{lang key="markdown.saved"}',
        saving = '{lang key="markdown.saving"}',
        whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}",
        requiredText = '{lang key="orderForm.required"}',
        recaptchaSiteKey = "{if $captcha}{$captcha->recaptcha->getSiteKey()}{/if}";
</script>
<script src="{assetPath file='scripts.min.js'}?v={$versionHash}"></script>

{if $templatefile == "viewticket" && !$loggedin}
  <meta name="robots" content="noindex" />
{/if}
