<?php
/**
 * Copyright © 2017 MageWorx. All rights reserved.
 * See LICENSE.txt for license details.
 */
namespace MageWorx\SeoRedirects\Model\Redirect\Source;

use MageWorx\SeoRedirects\Model\Redirect\CustomRedirect;

class RedirectTypeEntity extends \MageWorx\SeoAll\Model\Source
{
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
                'label' => __('Custom URL')
            ],
            [
                'value' => CustomRedirect::REDIRECT_TYPE_PRODUCT,
                'label' => __('Product')
            ],
            [
                'value' => CustomRedirect::REDIRECT_TYPE_CATEGORY,
                'label' => __('Category')
            ],
            [
                'value' => CustomRedirect::REDIRECT_TYPE_PAGE,
                'label' => __('Page')
            ],
        ];
    }
}
