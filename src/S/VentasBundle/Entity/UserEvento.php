<?php

namespace S\VentasBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * UserEvento
 *
 * @ORM\Table(name="user_evento", uniqueConstraints={@ORM\UniqueConstraint(name="user_evento_id_user_id_evento_key", columns={"id_user", "id_evento"})}, indexes={@ORM\Index(name="user_evento_id_user_idx", columns={"id_user"}), @ORM\Index(name="user_evento_id_evento_idx", columns={"id_evento"})})
 * @ORM\Entity(repositoryClass="S\VentasBundle\Repository\UserEventoR")
 */
class UserEvento
{
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="SEQUENCE")
     * @ORM\SequenceGenerator(sequenceName="user_evento_id_seq", allocationSize=1, initialValue=1)
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="roles", type="string", length=45, nullable=true)
     */
    private $roles;

    /**
     * @var \Eventos
     *
     * @ORM\ManyToOne(targetEntity="Eventos")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_evento", referencedColumnName="id")
     * })
     */
    private $idEvento;

    /**
     * @var \FosUser
     *
     * @ORM\ManyToOne(targetEntity="FosUser")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_user", referencedColumnName="id")
     * })
     */
    private $idUser;



    /**
     * Set roles
     *
     * @param string $roles
     *
     * @return UserEvento
     */
    public function setRoles($roles)
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * Get roles
     *
     * @return string
     */
    public function getRoles()
    {
        return $this->roles;
    }

    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set idEvento
     *
     * @param \S\VentasBundle\Entity\Eventos $idEvento
     *
     * @return UserEvento
     */
    public function setIdEvento(\S\VentasBundle\Entity\Eventos $idEvento = null)
    {
        $this->idEvento = $idEvento;

        return $this;
    }

    /**
     * Get idEvento
     *
     * @return \S\VentasBundle\Entity\Eventos
     */
    public function getIdEvento()
    {
        return $this->idEvento;
    }

    /**
     * Set idUser
     *
     * @param \S\VentasBundle\Entity\FosUser $idUser
     *
     * @return UserEvento
     */
    public function setIdUser(\S\VentasBundle\Entity\FosUser $idUser = null)
    {
        $this->idUser = $idUser;

        return $this;
    }

    /**
     * Get idUser
     *
     * @return \S\VentasBundle\Entity\FosUser
     */
    public function getIdUser()
    {
        return $this->idUser;
    }
}
