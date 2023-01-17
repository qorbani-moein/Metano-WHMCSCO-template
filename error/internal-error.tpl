<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>سایت با مشکل روبرو می باشد</title>
    <style>
        body {
            margin: 30px 40px;
            background-color: #f6f6f6;
        }
        .error-container {
            padding: 50px 40px;
            font-family: Tahoma;
            font-size: 14px;
        }
        h1 {
            margin: 0;
            font-size: 48px;
            font-weight: 400;
        }
        h2 {
            margin: 0;
            font-size: 26px;
            font-weight: 300;
        }
        a {
            color: #336699;
        }
        p.back-to-home {
            margin-top: 30px;
        }
        p.debug{
            padding: 20px 0px;
            font-family: Tahoma;
            font-size: 14px;
        }
        .info {
            border: solid 1px #999;
            padding: 5px;
            background-color: #d9edf7;
        }
    </style>
</head>
<body>
    <div class="card">
    <div class="card-body">
<div class="error-container">
    <h1>متاسفیم !</h1>
    <h2>سایت با مشکل روبرو شده</h2>
    <p>بزودی این مشکل را حل می کنیم</p>
    <p>در صورت نیاز می توانید با ما از طریق ایمیل <a href="mailto:{{email}}">سایت</a> در ارتباط باشید</p>
    <p class="back-to-home"><a href="{{systemurl}}">&laquo; بازگشت به صفحه اصلی سایت</a></p>
    {{environmentIssues}}
    <p class="debug">{{adminHelp}}<br/>{{stacktrace}}</p>
</div></div></div>
</body>
</html>