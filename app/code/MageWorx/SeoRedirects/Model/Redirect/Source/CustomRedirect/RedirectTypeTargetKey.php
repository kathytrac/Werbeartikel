<?php
/**
 * Copyright © 2017 MageWorx. All rights reserved.
 * See LICENSE.txt for license details.
 */
namespace MageWorx\SeoRedirects\Model\Redirect\Source\CustomRedirect;

use MageWorx\SeoRedirects\Model\Redirect\CustomRedirect;

class RedirectTypeTargetKey extends \MageWorx\SeoAll\Model\Source
{
    const URL_TARGET_IDENTIFIER      = 'target_url';
    const PRODUCT_TARGET_IDENTIFIER  = 'target_product_id';
    const CATEGORY_TARGET_IDENTIFIER = 'target_category_id';
    const PAGE_TARGET_IDENTIFIER     = 'target_page_id';

    /**
     * Return array of options as value-label pairs
     *
     * @return array Format: array(array('value' => '<value>', 'label' => '<label>'), ...)
     */
    public function toOptionArray()
    {
        return [
            [
                'value' => CustomRedirect::REDIRECT_TYPE_CUSTOM,
                'label' => self::URL_TARGET_IDENTIFIER,
            ],
            [
                'value' => CustomRedirect::REDIRECT_TYPE_PRODUCT,
                'label' => self::PRODUCT_TARGET_IDENTIFIER,
            ],
            [
                'value' => CustomRedirect::REDIRECT_TYPE_CATEGORY,
                'label' => self::CATEGORY_TARGET_IDENTIFIER,
            ],
            [
                'value' => CustomRedirect::REDIRECT_TYPE_PAGE,
                'label' => self::PAGE_TARGET_IDENTIFIER,
            ],
        ];
    }
}
