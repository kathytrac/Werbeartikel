<?php
/**
 * Copyright © 2017 MageWorx. All rights reserved.
 * See LICENSE.txt for license details.
 */
namespace MageWorx\SeoRedirects\Plugin;

use Magento\UrlRewrite\Model\UrlPersistInterface;
use Magento\CmsUrlRewrite\Model\CmsPageUrlPathGenerator;
use Magento\CmsUrlRewrite\Model\CmsPageUrlRewriteGenerator;

use MageWorx\SeoRedirects\Model\Redirect\CustomRedirect;
use Magento\UrlRewrite\Service\V1\Data\UrlRewrite;
use Magento\UrlRewrite\Model\UrlFinderInterface;
use Magento\CatalogUrlRewrite\Model\ProductUrlRewriteGenerator;
use MageWorx\SeoRedirects\Model\Redirect\CustomRedirect\RedirectWizardByDeletedUrlFactory;

/**
 * Before save and around delete plugin for \Magento\Cms\Model\ResourceModel\Page:
 * - autogenerates url_key if the merchant didn't fill this field
 * - remove all url rewrites for cms page on delete
 */
class CmsPagePlugin extends \Magento\CmsUrlRewrite\Plugin\Cms\Model\ResourceModel\Page
{
    /**
     * @var \Magento\CmsUrlRewrite\Model\CmsPageUrlPathGenerator
     */
    protected $cmsPageUrlPathGenerator;

    /**
     * @var UrlPersistInterface
     */
    protected $urlPersist;

    /**
     * @var UrlFinderInterface
     */
    protected $urlFinder;

    /**
     * @var RedirectWizardByDeletedUrlFactory
     */
    protected $redirectWizardByDeletedUrlFactory;

    /**
     * @var \MageWorx\SeoRedirects\Helper\CustomRedirect\Data
     */
    protected $helperData;

    /**
     * CmsPagePlugin constructor.
     * @param CmsPageUrlPathGenerator $cmsPageUrlPathGenerator
     * @param UrlPersistInterface $urlPersist
     * @param UrlFinderInterface $urlFinder
     * @param RedirectWizardByDeletedUrlFactory $redirectWizardByDeletedPageUrl
     */
    public function __construct(
        CmsPageUrlPathGenerator $cmsPageUrlPathGenerator,
        UrlPersistInterface $urlPersist,
        \Magento\UrlRewrite\Model\UrlFinderInterface $urlFinder,
        RedirectWizardByDeletedUrlFactory $redirectWizardByDeletedUrlFactory,
        \MageWorx\SeoRedirects\Helper\CustomRedirect\Data $helperData
    ) {
        parent::__construct($cmsPageUrlPathGenerator, $urlPersist);
        $this->urlFinder = $urlFinder;
        $this->helperData = $helperData;
        $this->redirectWizardByDeletedUrlFactory = $redirectWizardByDeletedUrlFactory;
    }

    /**
     * On delete handler to remove related url rewrites
     *
     * @param \Magento\Cms\Model\ResourceModel\Page $subject
     * @param \Closure $proceed
     * @param \Magento\Framework\Model\AbstractModel $page
     * @return \Magento\Cms\Model\ResourceModel\Page
     */
    public function aroundDelete(
        \Magento\Cms\Model\ResourceModel\Page $subject,
        \Closure $proceed,
        \Magento\Framework\Model\AbstractModel $page
    ) {
        if (!$this->helperData->isKeepUrlsForDeletedEntities()) {
            return parent::aroundDelete($subject, $proceed, $page);
        }

        $result = $proceed($page);

        if ($page->isDeleted()) {
            $currentUrlRewrites = $this->urlFinder->findAllByData(
                [
                    UrlRewrite::ENTITY_ID => $page->getId(),
                    UrlRewrite::ENTITY_TYPE => CmsPageUrlRewriteGenerator::ENTITY_TYPE,
                ]
            );

            if ($currentUrlRewrites) {
                $redirectWizardByDeletedUrl = $this->redirectWizardByDeletedUrlFactory->create(CustomRedirect::REDIRECT_TYPE_PAGE);
                $redirectWizardByDeletedUrl->process($page->getId(), $currentUrlRewrites);

                $this->urlPersist->deleteByData(
                    [
                        UrlRewrite::ENTITY_ID => $page->getId(),
                        UrlRewrite::ENTITY_TYPE => CmsPageUrlRewriteGenerator::ENTITY_TYPE,
                    ]
                );
            }
        }

        return $result;
    }
}
