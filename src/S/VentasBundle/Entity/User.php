<?php

namespace S\VentasBundle\Entity;

use FOS\UserBundle\Model\User as BaseUser;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity
 * @ORM\Table(name="fos_user")
 */
class User extends BaseUser
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;

    public function __construct()
    {
        parent::__construct();
        // your own logic
    }
    /**
     * @var integer
     *
     * @ORM\Column(name="user_father", type="integer", length=11, nullable=false)
     */
    private $userFather;
    
    /**
     * Set userFather
     *
     * @param string $userFather
     */
    public function setUserFather($userFather)
    {
        $this->userFather = $userFather;

        return $this;
    }

    /**
     * Get userFather
     *
     * @return integer 
     */
    public function getUserFather()
    {
        return $this->$userFather;
    }
}
