<?php
/**
 * Copyright © 2017 MageWorx. All rights reserved.
 * See LICENSE.txt for license details.
 */
namespace MageWorx\SeoRedirects\Model\Redirect\Source\CustomRedirect;

use MageWorx\SeoRedirects\Model\Redirect\CustomRedirect;

class RedirectTypeIdentifierFragment extends \MageWorx\SeoAll\Model\Source
{
    const CUSTOM_ENTITY_IDENTIFIER_FRAGMENT        = '';
    const PRODUCT_ENTITY_IDENTIFIER_FRAGMENT       = 'product/';
    const CATEGORY_ENTITY_IDENTIFIER_FRAGMENT      = 'category/';
    const PAGE_ENTITY_IDENTIFIER_FRAGMENT          = '';

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
                'label' => self::CUSTOM_ENTITY_IDENTIFIER_FRAGMENT,
            ],
            [
                'value' => CustomRedirect::REDIRECT_TYPE_CATEGORY,
                'label' => self::CATEGORY_ENTITY_IDENTIFIER_FRAGMENT,
            ],
            [
                'value' => CustomRedirect::REDIRECT_TYPE_PRODUCT,
                'label' => self::PRODUCT_ENTITY_IDENTIFIER_FRAGMENT,
            ],
            [
                'value' => CustomRedirect::REDIRECT_TYPE_PAGE,
                'label' => self::PAGE_ENTITY_IDENTIFIER_FRAGMENT,
            ],
        ];
    }
}
