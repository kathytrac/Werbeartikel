<?php
/**
 * Copyright © 2017 MageWorx. All rights reserved.
 * See LICENSE.txt for license details.
 */
namespace MageWorx\SeoCrosslinks\Model\Crosslink\Source\Crosslink;

use MageWorx\SeoCrosslinks\Model\Crosslink;

class CrosslinkTypeKey extends \MageWorx\SeoAll\Model\Source
{
    const URL_REQUEST_IDENTIFIER      = 'ref_url';
    const PRODUCT_REQUEST_IDENTIFIER  = 'ref_product_sku';
    const CATEGORY_REQUEST_IDENTIFIER = 'ref_category_id';

    /**
     * Return array of options as value-label pairs
     *
     * @return array Format: array(array('value' => '<value>', 'label' => '<label>'), ...)
     */
    public function toOptionArray()
    {
        return [
            [
                'value' => Crosslink::REFERENCE_TO_STATIC_URL,
                'label' => self::URL_REQUEST_IDENTIFIER
            ],
            [
                'value' => Crosslink::REFERENCE_TO_PRODUCT_BY_SKU,
                'label' => self::PRODUCT_REQUEST_IDENTIFIER
            ],
            [
                'value' => Crosslink::REFERENCE_TO_CATEGORY_BY_ID,
                'label' => self::CATEGORY_REQUEST_IDENTIFIER
            ],
        ];
    }
}
