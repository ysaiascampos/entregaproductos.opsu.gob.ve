<?php

namespace S\VentasBundle;

use Symfony\Component\HttpKernel\Bundle\Bundle;

class SVentasBundle extends Bundle
{
    public function getParent()
    {
        return 'FOSUserBundle';
    }
}
