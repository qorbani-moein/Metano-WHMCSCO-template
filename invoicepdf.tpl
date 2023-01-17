<?php

/*!
* www.whmcsco.com
* Persian Whmcs 
* Persian Template & Module for Whmcs
* 09017700463
*/

$pdf->SetFont($pdfFont, '', 11);
$titleColor = '#2b41a1';

/***** begin get logo *****/
$logoFilename = 'placeholder.png';

if (file_exists(ROOTDIR . '/assets/img/logo.png')) {
    $logoFilename = 'logo.png';
} elseif (file_exists(ROOTDIR . '/assets/img/logo.jpg')) {
    $logoFilename = 'logo.jpg';
}

$logoUrl = ROOTDIR . '/assets/img/' . $logoFilename;
/***** end get logo *****/

/***** begin get invoice state *****/
$invoiceState = '';
$invoiceStateColor = '';

switch($status) {
    case 'Draft':
        $invoiceState = $_LANG["invoicesdraft"];
        $invoiceStateColor = '#78909C';
        break;
    case 'Unpaid':
        $invoiceState = $_LANG["invoicesunpaid"];
        $invoiceStateColor = '#d32f2f';
        break;
    case 'Paid':
        $invoiceState = $_LANG["invoicespaid"];
        $invoiceStateColor = '#00C853';
        break;
    case 'Cancelled':
        $invoiceState = $_LANG["invoicescancelled"];
        $invoiceStateColor = '#CFD8DC';
        break;
    case 'Refunded':
        $invoiceState = $_LANG["invoicesrefunded"];
        $invoiceStateColor = '#E64A19';
        break;
    case 'Collections':
        $invoiceState = $_LANG["invoicescollections"];
        $invoiceStateColor = '#E64A19';
        break;
    default:
        $invoiceStateColor = '#78909C';
        break;
}
/***** end get invoice state *****/

/***** begin set invoice state html *****/
$invoiceStatusHtml = '';
if($status == 'Paid') {
    
    $invoiceStatusHtml = '<span style="display: block; direction: rtl; margin: 0; color:' . $invoiceStateColor . ';">'. $invoiceState . '</span>
                        <br />
                        <span style="display: block; direction: rtl; margin: 0; color:' . $invoiceStateColor . '; font-size: 8px;">' . $_LANG["paymentstodate"] . ': ' . $datepaid . '</span>';
    
} else {
    
    $invoiceStatusHtml = '<span style="display: block; direction: rtl; margin: 0; color:' . $invoiceStateColor . ';">'. $invoiceState . '</span>
                        <br />
                        <span style="display: block; direction: rtl; margin: 0; color:' . $invoiceStateColor . '; font-size: 8px;">' . $_LANG["invoicesdatedue"] . ': ' . $duedate . '</span>';
    
}
/***** end set invoice state html *****/

/***** begin header *****/
$html = '<table dir="rtl" style="direction: rtl; width: 100%">
            <tbody>
                <tr>
                    <td style="text-align: left;">
                        <p style="display: inline-block; text-align: center;">
                            <span style="direction: rtl; margin: 0; padding: 0; line-height: 1.2;">'. $_LANG["invoicenumber"] . $invoicenum . '</span>
                            <br />
                            '.$invoiceStatusHtml.'
                        </p>
                    </td>
                    <td></td>

                    <td style="text-align: left;">
                        <img src="' . $logoUrl . '" style="height: 100px;" />
                    </td>
                </tr>
            <tbody>
        </table>
        <hr />';
                
$pdf->writeHTML($html, true, false, true, false, '');
/***** end header *****/

/***** begin payment to *****/
$companyAddressDetails = '';

foreach($companyaddress as $key => $val) {
    $companyAddressDetails .= '<span>' . $val . '</span>';
}

$paymentToHtml = '<p style="text-align: right; direction: rtl; color:' . $titleColor . ';">'. $_LANG['invoicespayto'] .'</p>
                    <table style="width: 100%; font-size: 11px;">
                        <tbody>
                            <tr>
                                <td style="text-align: right;">
                                    <span style="direction: rtl;">' . $companyname  . '</span>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    '. $companyAddressDetails .'
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    <a href="' . $companyurl . '"><span style="direction: ltr;">' . $companyurl . '</span></a>
                                </td>
                            </tr>
                        <tbody>
                    </table>';
/***** end payment to *****/

/***** begin client *****/
$customerCustomFields = '';

foreach($clientsdetails['customfields'] as $key => $val) {
    $customerCustomFields .= '<tr>
                                <td style="text-align: right;">
                                    <span style="direction: rtl;">' . $key . ': ' . $val . '</span>
                                </td>
                            </tr>';
}

$customerHtml = '<p style="text-align: right; direction: rtl; color:' . $titleColor . ';">'. $_LANG['invoicesinvoicedto'] .'</p>
                    <table style="width: 100%; font-size: 11px;">
                        <tbody>
                            <tr>
                                <td style="text-align: right;">
                                    <span style="direction: rtl;">' . $clientsdetails["companyname"] . '</span>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    <span style="direction: rtl;">' . $clientsdetails["firstname"] . ' ' . $clientsdetails["lastname"] . '</span>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                     <span style="direction: rtl;">' . $clientsdetails["country"] . '-' . $clientsdetails["state"] . '-' . $clientsdetails["city"] . '</span><br />' . 
                                    '<span style="direction: rtl;">' . $clientsdetails["address1"] . '</span><br />' . 
                                    '<span style="direction: rtl;">' . $clientsdetails["address2"] . '</span><br />' . 
                                    '<span style="direction: rtl;">' . $clientsdetails["postcode"] . '</span>
                                </td>
                            </tr>
                        <tbody>
                    </table>';
/***** end client *****/


/***** begin drow paymentTo and Customer *****/
$html = '<table>
            <tbody>
                <tr>
                    <td width="45%">' . $customerHtml . '</td>
                    <td width="10%"></td>
                    <td width="45%">' . $paymentToHtml . '</td>
                </tr>
            </tbody>
        </table>';

$pdf->writeHTML($html, true, false, true, false, '');
/***** end drow paymentTo and Customer *****/


/***** begin items *****/
$invoiceItemsHtml = '<table width="100%" bgcolor="#efefef" cellspacing="1" cellpadding="2" border="0">
                        <tr height="50" bgcolor="#fafafa" style="font-weight:bold;text-align:center;">
                            <td width="20%" style="color:' . $titleColor . ';">' . Lang::trans('quotelinetotal') . '</td>
                            <td width="80%" style="text-align: center; color:' . $titleColor . ';">' . Lang::trans('invoicesdescription') . '</td>
                        </tr>';
                        
foreach ($invoiceitems as $item) {
    
    $itemAmountArray = explode(' ', $item['amount']);
    $amount = '';
    $unit = '';
    
    foreach($itemAmountArray as $key => $val) {
        
        if($key == 0) {
            $amount = $val;
        } else if($val != ' ' && $val != '' && $val != '  ') {
            $unit = $val;
        }
        
    }
    
    $invoiceItemsHtml .= '
    <tr bgcolor="#fff">
        <td align="center" style="font-size: 10px;">
            <span style="display: inline-block; direction: ltr;">' . $unit .'</span>
            <span style="display: inline-block; direction: ltr;">' . $amount . '</span>
        </td>
        <td align="right" style="font-size: 10px;">' . nl2br($item['description']) . '<br /></td>
    </tr>';
}

/** begin subtotal **/
$subtotalArray = explode(' ', $subtotal);
$subtotalAmount = '';
$subtotalUnit = '';

foreach($subtotalArray as $key => $val) {
    
    if($key == 0) {
        $subtotalAmount = $val;
    } else if($val != ' ' && $val != '' && $val != '  ') {
        $subtotalUnit = $val;
    }
    
}
/** end subtotal **/

$invoiceItemsHtml .= '
                    <tr height="50" bgcolor="#fafafa" style="font-weight:bold;">
                        <td align="center" style="font-size: 10px;">
                            <span style="display: inline-block;">' . $subtotalUnit . '</span>
                            <span style="display: inline-block; direction: ltr;">' . $subtotalAmount . '</span>
                        </td>
                        <td align="left" style=" color:' . $titleColor . ';">' . Lang::trans('invoicessubtotal') . '</td>
                    </tr>';
                    
if ($taxname) {
        $invoiceItemsHtml .= '
                            <tr height="50" bgcolor="#fafafa" style="font-weight:bold;">
                                <td align="center" style="font-size: 10px;">' . $tax . '</td>
                                <td align="left" style=" color:' . $titleColor . ';">' . $taxrate . '% ' . $taxname . '</td>
                            </tr>';
}

if ($taxname2) {
    $invoiceItemsHtml .= '
                        <tr height="50" bgcolor="#fafafa" style="font-weight:bold;">
                            <td align="center" style="font-size: 10px;">' . $tax2 . '</td>
                            <td align="left" style=" color:' . $titleColor . ';">' . $taxrate2 . '% ' . $taxname2 . '</td>
                        </tr>';
}




/** begin credit **/
$creditArray = explode(' ', $credit);
$creditAmount = '';
$creditUnit = '';

foreach($creditArray as $key => $val) {
    
    if($key == 0) {
        $creditAmount = $val;
    } else if($val != ' ' && $val != '' && $val != '  ') {
        $creditUnit = $val;
    }
    
}
/** end credit **/

/** begin total **/
$totalArray = explode(' ', $total);
$totalAmount = '';
$totalUnit = '';

foreach($totalArray as $key => $val) {
    
    if($key == 0) {
        $totalAmount = $val;
    } else if($val != ' ' && $val != '' && $val != '  ') {
        $totalUnit = $val;
    }
    
}
/** end total **/

$invoiceItemsHtml .= '
    <tr height="50" bgcolor="#fafafa" style="font-weight:bold;">
        <td align="center" style="font-size: 10px;">
            <span style="display: inline-block;">' . $creditUnit . '</span>
            <span style="display: inline-block; direction: ltr;">' . $creditAmount . '</span>
        </td>
        <td align="left" style=" color:' . $titleColor . ';">' . Lang::trans('invoicescredit') . '</td>
    </tr>
    <tr height="50" bgcolor="#fafafa" style="font-weight:bold;">
        <td align="center" style="font-size: 10px;">
            <span style="display: inline-block;">' . $totalUnit . '</span>
            <span style="display: inline-block; direction: ltr;">' . $totalAmount . '</span>
        </td>
        <td align="left" style=" color:' . $titleColor . ';">' . Lang::trans('invoicestotal') . '</td>
    </tr>
</table>';

$html = '<p style="text-align: right; direction: rtl; color:' . $titleColor . ';">'. $_LANG['invoicelineitems'] .'</p>'
        . $invoiceItemsHtml;
        
                
$pdf->writeHTML($html, true, false, true, false, '');
/***** end items *****/


/***** begin transactions *****/
$invoiceTransactionsHtml = '<table width="100%" bgcolor="#efefef" cellspacing="1" cellpadding="2" border="0">
    <tr height="50" bgcolor="#fafafa" style="font-weight:bold;text-align:center;">
        <td width="20%" style="font-size: 11px; color:' . $titleColor . ';">' . Lang::trans('invoicestransamount') . '</td>
        <td width="30%" style="font-size: 11px; color:' . $titleColor . ';">' . Lang::trans('invoicestransid') . '</td>
        <td width="25%" style="font-size: 11px; color:' . $titleColor . ';">' . Lang::trans('invoicestransgateway') . '</td>
        <td width="25%" style="font-size: 11px; color:' . $titleColor . ';">' . Lang::trans('invoicestransdate') . '</td>
    </tr>';

if (!count($transactions)) {
    $invoiceTransactionsHtml .= '
    <tr bgcolor="#fff">
        <td colspan="4" align="center">' . Lang::trans('invoicestransnonefound') . '</td>
    </tr>';
} else {
    
    foreach ($transactions AS $trans) {
        
        $transAmountArray = explode(' ', $trans['amount']);
        $amount = '';
        $unit = '';
        
        foreach($transAmountArray as $key => $val) {
            
            if($key == 0) {
                $amount = $val;
            } else if($val != ' ' && $val != '' && $val != '  ') {
                $unit = $val;
            }
            
        }
        
        $invoiceTransactionsHtml .= '
        <tr bgcolor="#fff">
            <td align="center" style="font-size: 10px;">
                <span style="display: inline-block; direction: ltr;">' . $unit .'</span>
                <span style="display: inline-block; direction: ltr;">' . $amount . '</span>
            </td>
            <td align="center" style="font-size: 10px;">' . $trans['transid'] . '</td>
            <td align="center" style="font-size: 10px;">' . $trans['gateway'] . '</td>
            <td align="center" style="font-size: 10px;">' . $trans['date'] . '</td>
        </tr>';
    }
}


/** begin balance **/
$balanceArray = explode(' ', $balance);
$balanceAmount = '';
$balanceUnit = '';

foreach($balanceArray as $key => $val) {
    
    if($key == 0) {
        $balanceAmount = $val;
    } else if($val != ' ' && $val != '' && $val != '  ') {
        $balanceUnit = $val;
    }
    
}
/** end balance **/


$invoiceTransactionsHtml .= '
    <tr height="50" bgcolor="#efefef" style="font-weight:bold;">
        <td align="center">
            <span style="dispalay: inline-block;">' . $balanceUnit . '</span>
            <span style="display: inline-block; direction: ltr;">' . $balanceAmount . '</span>
        </td>
        <td colspan="3" align="left" style=" color:' . $titleColor . ';">' . Lang::trans('invoicesbalance') . '</td>
    </tr>
</table>';

$html = '<p style="text-align: right; direction: rtl; color:' . $titleColor . ';">'. $_LANG['invoicestransactions'] .'</p>'
        . $invoiceTransactionsHtml;
        
$pdf->writeHTML($html, true, false, true, false, '');
/***** end transactions *****/