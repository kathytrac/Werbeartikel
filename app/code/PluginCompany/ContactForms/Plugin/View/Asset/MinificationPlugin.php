<?php
/**
 * Created by:  Milan Simek
 * Company:     Plugin Company
 *
 * LICENSE: http://plugin.company/docs/magento-extensions/magento-extension-license-agreement
 *
 * YOU WILL ALSO FIND A PDF COPY OF THE LICENSE IN THE DOWNLOADED ZIP FILE
 *
 * FOR QUESTIONS AND SUPPORT
 * PLEASE DON'T HESITATE TO CONTACT US AT:
 *
 * SUPPORT@PLUGIN.COMPANY
 */
namespace PluginCompany\ContactForms\Plugin\View\Asset;

use Magento\Framework\View\Asset\Minification;

class MinificationPlugin
{
    private $result;

    public function aroundGetExcludes(
        Minification $subject,
        callable $proceed,
        $contentType
    ) {
        $this->result = $proceed($contentType);
        if ($contentType == 'js') {
            return $this->getJsExcludes();
        }
        return $this->getCssExcludes();
    }

    public function getJsExcludes()
    {
        $excludes = [
            '.*frontend.*PluginCompany_ContactForms.*lib.*',
            '.*frontend.*PluginCompany_ContactForms.*form.*',
            '.*backend.*PluginCompany_ContactForms.*CodeMirror.*',
        ];
        return array_merge($this->result, $excludes);
    }

    public function getCssExcludes()
    {
        $excludes = [
          '.*backend.*PluginCompany_ContactForms.*',
          '.*frontend.*PluginCompany_ContactForms.*'
        ];
        return array_merge($this->result, $excludes);
    }
}