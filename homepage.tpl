	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
<form method="post" action="{routePath('login-validate')}" class="login100-form validate-form" role="form">
    <div class="mw-540 mb-md-4 mt-md-4">
            <div class="logos">
                <a href="{$WEB_ROOT}/index.php">
                    {if $assetLogoPath}
                        <img src="{$assetLogoPath}" alt="{$companyname}" class="logo-img">
                    {else}
                        {$companyname}
                    {/if}
                </a>
            </div>
            <div class="mb-4">
                
                <p class="text-muted mb-0  text-right">لطفا نام کاربری (ایمیل) و رمز عبور خود را وارد کنید.<br>
                در صورتی که که هنوز در سایت ثبت نام نکردید، می توانید با عضویت در سایت به جمع ما بپیوندید</p>
            </div>
            {include file="$template/includes/flashmessage.tpl"}
            <div class="form-group">
                <div class="input-group input-group-merge">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                    </div>
                    <input type="email" class="form-control" name="username" id="inputEmail" placeholder="name@example.com" autofocus>
                </div>
            </div>
            <div class="form-group mb-4 focused">
                <div class="input-group input-group-merge">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                    </div>
                    <input type="password" class="form-control pw-input" name="password" id="inputPassword" placeholder="{lang key='clientareapassword'}" autocomplete="off">
                    <div class="input-group-append">
                        <button class="btn btn-default btn-reveal-pw" type="button" tabindex="-1">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>
                <div class="d-flex align-items-center justify-content-between">
                    <div class="mb-2">
                        <br><a href="{routePath('password-reset-begin')}" class="small text-muted" tabindex="-1">{lang key='forgotpw'}</a>
                    </div>
                </div>
            </div>
            {if $captcha->isEnabled()}
                {include file="$template/includes/captcha.tpl"}
            {/if}
            <div class="float-right">
            <button id="login" type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)}">{lang key='loginbutton'}</button>
            <a href="{$WEB_ROOT}/register.php" class="btn btn-large btn-success">عضویت در سایت</a>

            </div>
            <div class="text-left">
                <label>
                    <input type="checkbox" name="rememberme" /> 
                    {lang key='loginrememberme'}
                </label>
            </div>
        </div>

</form>

{include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true}
				<div class="login100-more" style="background-image: url('{$WEB_ROOT}/templates/{$template}/whmcsco/img/Frame 708.svg');">
				</div>
			</div>
		</div>
	</div>